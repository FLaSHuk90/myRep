public with sharing class ControllerForComponent {
    public Id conContactId {get;set;}


    public Contact getParametr(){
        return [SELECT Account.Name, Account.phone, Account.AccountNumber,Account.BillingStreet, Account.BillingCity, Account.Type FROM Contact WHERE id =: conContactId];
    }

}