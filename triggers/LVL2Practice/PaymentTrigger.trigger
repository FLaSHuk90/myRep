/**
 * Created by User on 19.10.2018.
 */

trigger PaymentTrigger on Payment__c (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        PaymentTriggerHandler.putsCheckBoxForCreatePayment(Trigger.new);
    }

}