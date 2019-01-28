/**
 * Created by User on 22.10.2018.
 */

trigger ContractTrigger on Contract1__c (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        ContractTriggerHandler.CreatePaymentForContract(Trigger.new);
    }
}