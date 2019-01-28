/**
 * Created by User on 18.10.2018.
 */

public with sharing class MovieTreiggerHandler {
   /* static Id recordTypeForPercent = Schema.SObjectType.Contract1__c.getRecordTypeInfosByName().get('Percent').getRecordTypeId();
    static Id recordTypeForBoth = Schema.SObjectType.Contract1__c.getRecordTypeInfosByName().get('Both').getRecordTypeId();*/

    public static void StatusMovieAndCreateNewPayment(List <Movie__c> triggerNewList ) {

        List <Contract1__c> ContractListPercent = [SELECT Id, name, MovieReleated__c, percent__c FROM Contract1__c  WHERE RecordType.name = 'Both' OR RecordType.name = 'Percent'];
        List <Payment__c> PaymentListForFinishedMovies = new List<Payment__c>();
     for(Contract1__c contract : ContractListPercent) {
            for(Movie__c movie: triggerNewList) {
                if(movie.Status__c == 'Finished' && movie.id == contract.MovieReleated__c ) {
                    Payment__c newPayment = new Payment__c(name = contract.name + 'FilmFinish', ContractReleated__c = contract.id, Amount__c = (contract.Percent__c * movie.Gross__c), Payment_Date__c = Date.today() );
                    PaymentListForFinishedMovies.add(newPayment);
            }
        }
      }
        insert PaymentListForFinishedMovies;
    }
}