/**
 * Created by User on 24.10.2018.
 */

public with sharing class ControllerForStudioPage {
    List <Movie__c> ListMovie = new List<Movie__c>();
    public String movId {get;set;}


    public ControllerForStudioPage(ApexPages.standardController std) {

        ListMovie = [SELECT name, StudioReleated__c, status__c FROM Movie__c WHERE status__c = 'In process' AND StudioReleated__c =: ApexPages.CurrentPage().getParameters().get('id')];
        movId = '';
            }

    public List <Movie__c> getListikMovie(){
        return ListMovie;
    }
    public void changeStatusToFinished(){
        movId = System.currentPageReference().getParameters().get('movId');
        System.debug('aaaa' + movId);
        for(Movie__c mov: ListMovie){
            if(mov.id == movId){
                mov.status__c = 'Finished';
            }
        }
        try {
            update ListMovie;
        }catch (Exception ex){
            System.debug('aaa' + ex.getMessage());
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'ERROR : STATUS NOT UPDATE "FILL PHONE FOR ACTER"'));

        }

    }


}