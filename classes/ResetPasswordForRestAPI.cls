/**
 * Created by User on 02.01.2019.
 */

public with sharing class ResetPasswordForRestAPI implements  Schedulable{
        public void execute(SchedulableContext context) {
            guest__c guest = [SELECT password__c FROM guest__c WHERE name=:'Password'];
            guest.password__c = '';
            update guest;
    }
}