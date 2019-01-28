/**
 * Created by User on 18.10.2018.
 */

trigger MovieTrigger on Movie__c (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        MovieTreiggerHandler.StatusMovieAndCreateNewPayment(Trigger.new);
    }

}