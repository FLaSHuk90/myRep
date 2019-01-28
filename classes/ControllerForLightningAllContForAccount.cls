/**
 * Created by User on 08.01.2019.
 */

public with sharing class ControllerForLightningAllContForAccount {

    @AuraEnabled
    public static String getContacts(String recordId) {
        System.debug('V apexe ' + RecordId);

        List<Contact>allContacts = [SELECT name,AccountId FROM Contact WHERE AccountId =: recordId ];
        System.debug('ololol ' + allContacts);
    return JSON.serialize(allContacts);
    }

}