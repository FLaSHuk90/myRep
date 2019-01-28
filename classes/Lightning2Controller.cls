/**
 * Created by User on 26.12.2018.
 */

public with sharing class Lightning2Controller {
    @AuraEnabled
    public static String getContacts () {
        List<Contact>allContacts = [SELECT Firstname, LastName, Birthdate FROM Contact];
        return JSON.serialize(allContacts);
    }

    @AuraEnabled
    public static String getOneContactForId (String nameIdController) {

        List<Contact> contact = [SELECT Firstname, LastName, Birthdate,SadMorty__c,Phone,Fax,Email FROM Contact WHERE Id =: nameIdController LIMIT 1 ];
        return  JSON.serialize(contact);

    }

}