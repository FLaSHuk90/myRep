/**
 * Created by User on 02.01.2019.
 */
@IsTest
public with sharing class WebServiceApiRestTest {
    @IsTest
    public static void isInvaitedTest() {
        guest__c guest = new guest__c(name='Password', password__c = 'testpass');
        insert guest;
        Guest__c newGuest = new guest__c(name= 'Vasya');
        insert newGuest;
        guest__c vasyaGuest = [SELECT id FROM guest__c WHERE name='Vasya' LIMIT 1];
        String idGuest = vasyaGuest.id;
        String answerMethod = WebServiceApiRest.isInvaited('Vasya','testpass');
        System.assertEquals(idGuest,answerMethod);
        answerMethod = WebServiceApiRest.isInvaited('Vasya','invalid');
        System.assertEquals(WebServiceApiRest.MESSAGE_INVALID_PASS,answerMethod);
        answerMethod = WebServiceApiRest.isInvaited('NotPerson','testpass');
        System.assertEquals('error: invalid guest',answerMethod);

    }
    @IsTest
    public static void putListGuestTest(){
        List<guest__c> newguest = new List<guest__c>();
        List<String> names = new List<String>();
        newguest.add(new guest__c(name='test'));
        newguest.add(new guest__c(name='test2'));
        newguest.add(new guest__c(name='test3'));
        newguest.add(new guest__c(name='Password',
                                    password__c = 'testpass'
        ));
        System.debug('newguest ' + newguest);

        names.add('test');
        names.add('test2');
        names.add('test3');
        System.debug('names ' + names);
        insert newguest;
        String answerMethods = WebServiceApiRest.putListGuest(names,'testpass');
        System.assertEquals('duplicate guest: '+ String.join(names, ','), answerMethods);
        names.clear();
        names.add('test4');
        answerMethods = WebServiceApiRest.putListGuest(names,'testpass');
        System.assertEquals('ok', answerMethods);
        answerMethods = WebServiceApiRest.putListGuest(names,'uncor');
        System.assertEquals(WebServiceApiRest.MESSAGE_INVALID_PASS, answerMethods);
    }
    @IsTest
    public static void getGuestForParametersTest() {
        RestRequest request = new RestRequest();
        request.requestUri =
                'https://flashuk-dev-ed.my.salesforce.com/services/apexrest/Guest/';
        request.httpMethod = 'GET';
        request.params.put('pass', 'testpass');
        RestContext.request = request;
        List<guest__c> guests = new List<guest__c>();
        guests.add(new guest__c(name='Password',
                password__c = 'testpass',isInvated__c = true));
        guests.add(new guest__c(name ='val'));
        insert guests;
        String answermethod = WebServiceApiRest.getGuestForParameters();
        request.params.put('name','val');
        request.params.put('notInvated', 'true');
        RestContext.request = request;
        guest__c guestVal= [SELECT id FROM guest__c WHERE name = 'val'];
        answermethod = WebServiceApiRest.getGuestForParameters();
        System.assertEquals('val: Guest__c:{Name=val, isInvated__c=false, Id=' + guestVal.id + '} Not Invated person: val' ,answermethod);
        guestVal.isInvated__c = true;
        update guestVal;
        answermethod = WebServiceApiRest.getGuestForParameters();
        System.assertEquals('val: Guest__c:{Name=val, isInvated__c=true, Id=' + guestVal.id + '}',answermethod);
        request.params.put('pass','dada');
        RestContext.request = request;
        answermethod = WebServiceApiRest.getGuestForParameters();
        System.assertEquals(WebServiceApiRest.MESSAGE_INVALID_PASS,answermethod);
    }
    @IsTest
    public static void getPasswordTest() {
        guest__c guest = new guest__c(name='Password');
        insert guest;
        String answerMethod = WebServiceApiRest.getPassword('FLaSH');
        guest__c newGuest = [SELECT password__c FROM guest__c ];
        System.assertEquals(newGuest.password__c,answerMethod);
        System.assertEquals('idi n...',WebServiceApiRest.getPassword('uncorrect'));
    }

}