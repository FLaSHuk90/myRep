/**
 * Created by User on 22.10.2018.
 */

public with sharing class ContractTriggerHandler {
    static Id recordTypeForFixed = Schema.SObjectType.Contract1__c.getRecordTypeInfosByName().get('Fixed').getRecordTypeId();
    static Id recordTypeForBoth = Schema.SObjectType.Contract1__c.getRecordTypeInfosByName().get('Both').getRecordTypeId();

    public static void CreatePaymentForContract(List <Contract1__c> listContractsWithTrigger) {
        List<Contract1__c> listAllContractsWithOrg = [SELECT MovieReleated__r.Budget__c, MovieReleated__r.Status__c, name, Start_Date__c, End_Date__c, Amount__c, ContactReleated__c FROM Contract1__c];
        List<Payment__c> newPayments = new List<Payment__c>();
        Decimal TotalForAmount = 0;


        for(Contract1__c contract : listContractsWithTrigger) {
            if(contract.RecordTypeId == recordTypeForFixed || contract.RecordTypeId == recordTypeForBoth) {
                Payment__c payment = new Payment__c(name = contract.name, ContractReleated__c = contract.id, Amount__c = contract.Amount__c, Payment_Date__c = Date.today());
                newPayments.add(payment);
            }
        }
             // сравниваем даты
        for(Contract1__c contractWithTrigger :listContractsWithTrigger) {
            for(Contract1__c contractWithSOQL :listAllContractsWithOrg) {
                if(contractWithTrigger.ContactReleated__c == contractWithSOQL.ContactReleated__c && contractWithTrigger.id != contractWithSOQL.id &&
                        ((contractWithTrigger.Start_Date__c < contractWithSOQL.Start_Date__c && contractWithTrigger.End_Date__c >= contractWithSOQL.Start_Date__c) ||
                            contractWithSOQL.Start_Date__c < contractWithTrigger.Start_Date__c && contractWithSOQL.End_Date__c >=  contractWithTrigger.Start_Date__c )) {
                    contractWithTrigger.addError('Date reserved');
                }
                if(contractWithTrigger.MovieReleated__c == contractWithSOQL.MovieReleated__c && contractWithTrigger.id != contractWithSOQL.id &&
                        contractWithTrigger.ContactReleated__c == contractWithSOQL.ContactReleated__c){
                    contractWithTrigger.addError('The actor is already filming this movie.');
                }
                if(contractWithTrigger.MovieReleated__c == contractWithSOQL.MovieReleated__c && contractWithTrigger.id != contractWithSOQL.id){
                    TotalForAmount = TotalForAmount + contractWithTrigger.Amount__c;
                    System.debug(contractWithSOQL.MovieReleated__r.Budget__c);
                    if(TotalForAmount > contractWithSOQL.MovieReleated__r.Budget__c){
                        contractWithTrigger.addError('Budget Limits');
                    }
                }
                if(contractWithTrigger.id == contractWithSOQL.id && (contractWithSOQL.MovieReleated__r.Status__c == 'In process' || contractWithSOQL.MovieReleated__r.Status__c == 'Finished')){
                    contractWithTrigger.addError('Contract created only NEW status film');
                }
            }
        }
        insert newPayments;

    }

}