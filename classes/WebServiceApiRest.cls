/**
 * Created by User on 31.12.2018.
 */
@RestResource(urlMapping='/Guest/*')
global with sharing class WebServiceApiRest {
    public static final String MESSAGE_INVALID_PASS = 'Invalid password';

    //EASY LVL?!!!!!!!!
/*    @HttpGet
    global static List<guest__c> getRecord() {

    }

*//*
    @HttpPut
    global static Id putGuest(String nam) {
        guest__c guest = new guest__c ();
        guest.Name = nam;
        insert guest;
        return guest.Id;
    }


    @HttpDelete
    global static void deleteGuest () {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String guestName = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Guest__c guest = [SELECT Name FROM guest__c WHERE Name = :guestName];
        delete guest;
    }
*/


    // Medium LVL
    @HttpPatch
    global static String isInvaited(String nam, String pass) {
        guest__c guestForPass = [SELECT password__c,name FROM guest__c WHERE name = 'Password' LIMIT 1];
        if (guestForPass.password__c == pass) {
            List<Guest__c> guest = [SELECT name, isInvated__c FROM guest__c WHERE Name = :nam LIMIT 1];
            if (guest.size() == 0) {
                return 'error: invalid guest';
            } else {
                guest[0].isInvated__c = true;
                update guest;
                return String.valueOf(guest[0].id);
            }
        } else {
            return MESSAGE_INVALID_PASS;
        }
    }
    @HttpPut
    // запрос {
    //  "pass":"",
    //  "names":["Kolya","kroLLIka"]


    //}
    global static String putListGuest(List<String> names, String pass) {
        guest__c guestForPass = [SELECT password__c,name FROM guest__c WHERE name = 'Password' LIMIT 1];
        if (guestForPass.password__c != pass) {
            return MESSAGE_INVALID_PASS;
        } else {
            List<Guest__C> newGuests = new List<Guest__C>();
            List<guest__C> allGuests = [SELECT name FROM guest__c];
            List<String> allCloneGuest = new List<String>();
            Boolean cloneGuest;
            for (String nam : names) {
                for (guest__c guest : allGuests) {
                    if (guest.name == nam) {
                        cloneGuest = false;
                    }
                }
                if (cloneGuest == null) {
                    Guest__c oneGuest = new guest__c(name = nam);
                    newGuests.add(oneGuest);
                } else {
                    allCloneGuest.add(nam);
                }
            }
            if (allCloneGuest.size() == 0) {
                insert newGuests;
                return 'ok';
            } else {
                return 'duplicate guest: ' + String.join(allCloneGuest, ',') ;
            }
        }
    }
    @HttpGet
    global static String getGuestForParameters() {

        guest__c guestForPass = [SELECT password__c FROM Guest__c WHERE name = 'Password' LIMIT 1];

        if (guestForPass.password__c == RestContext.request.params.get('pass')) {
            String paramForGetGuest = '';
            Guest__c oneGuest = new Guest__c();
            List<guest__c> notInvitedPerson = new List<guest__c>();
            List<String>nameNotInvated = new List<String>();

            if (RestContext.request.params.get('notInvated') == null && RestContext.request.params.get('name') == null) {
                List<guest__c> lstGuest = [SELECT name FROM guest__c];
                return JSON.serialize(lstGuest);


            } else {

                if (RestContext.request.params.get('name') != null) {
                    paramForGetGuest = RestContext.request.params.get('name');
                    System.debug('paramForGetGuest: ' + paramForGetGuest);
                    oneGuest = [SELECT name, isInvated__c FROM guest__c WHERE Name = :paramForGetGuest LIMIT 1];
                }

                if (RestContext.request.params.get('notInvated') == 'true') {
                    notInvitedPerson = [SELECT name, isInvated__c FROM guest__c WHERE isInvated__c = false];
                    for (guest__c guest : notInvitedPerson) {
                        nameNotInvated.add(guest.name);
                    }
                }
                if (notInvitedPerson.size() == 0) {
                    return paramForGetGuest + ': ' + oneGuest;
                } else {
                    return paramForGetGuest + ': ' + oneGuest + ' Not Invated person: ' + String.join(nameNotInvated, ',');
                }
            }
        } else {
            return MESSAGE_INVALID_PASS;
        }

    }
    @HttpPost
    global static String getPassword(String key) {
        String password = '';
        if (key == 'FLaSH') {
            password = String.valueOf(Math.random());
            password = password.substring(2);
            guest__c guest = [SELECT password__c FROM guest__c WHERE name = :'Password'];
            guest.password__c = password;
            update guest;
        } else {
            password = 'idi n...';
        }
        Datetime dTame = System.now();
        dTame = dTame.addMinutes(4);


        String day = string.valueOf(dTame.day());
        String month = string.valueOf(dTame.month());
        String hour = dTame.format('HH','America/Los_Angeles')/*string.valueOf(dTame.hour());*/;
        String minute = string.valueOf(dTame.minute());
        String second = string.valueOf(dTame.second());
        String year = string.valueOf(dTame.year());
        String strJobName = 'Job-' + year + '_' + month + '_' + day + '_' + hour + '_' + minute + '_' + second;
        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        System.debug('strSchedule =' + strSchedule);
        System.schedule(String.valueOf(Math.random()), strSchedule, new ResetPasswordForRestAPI());
        return password;
    }


}

