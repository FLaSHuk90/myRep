/**
 * Created by User on 08.01.2019.
 */

public with sharing class ActionForPageGetSizeRelatedCmpController {
    @AuraEnabled
    public static String getSizeList(String RecordId) {
        System.debug('RecordId: ' + RecordId);
        Contact myContact = [SELECT name, AccountId FROM Contact WHERE Id =:  RecordId LIMIT 1];
        List<Contact> allContacts = [SELECT name,AccountId FROM Contact WHERE AccountId =: myContact.AccountId];

        System.debug('V apexe size : ' + allContacts.size());
        return JSON.serialize(String.valueOf(allContacts.size()));
    }

}