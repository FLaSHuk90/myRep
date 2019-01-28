/**
 * Created by User on 19.10.2018.
 */

public with sharing class PaymentTriggerHandler {

    public static void putsCheckBoxForCreatePayment(List<Payment__c > ListPaymentsWithTrigger) {
        List<Contract1__c> listContract1s = [SELECT name, Paid__c, Id FROM Contract1__c];
        for (Contract1__c contract : listContract1s) {
            for (Payment__c payment : ListPaymentsWithTrigger) {
                if (payment.ContractReleated__c == contract.id) {
                    contract.Paid__c = true;
                }
            }
        }
        update listContract1s;


/*     System.debug('lal' + MapPaymentsWithTrigger.keySet());
        List<Contract1__c> listContract1s = [SELECT name, Paid__c FROM Contract1__c WHERE ContactReleated__c IN : MapPaymentsWithTrigger.values().];
        System.debug(listContract1s);
        for(Contract1__c contract : listContract1s){
            contract.Paid__c = true;
        }
        update listContract1s;

    }*/
    }
}