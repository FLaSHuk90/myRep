/**
 * Created by User on 15.11.2018.
 */

/*BatchTest frst = new BatchTest();
Database.executeBatch(frst, 50);*/

public with sharing class BatchTest implements Database.Batchable<SObject>{
    //3 обязательных метода

    public Database.QueryLocator start (Database.BatchableContext cont) {
        String str = 'FirstJob';

        return Database.getQueryLocator ('SELECT Name,Title FROM Contact WHERE FirstName = :str');
    }

    public void execute(Database.BatchableContext cont,List<Contact> lst){
        for(Contact contac: lst){
            contac.Title = 'Async Apex';
        }
        update lst;

    }
    public void finish (Database.BatchableContext cont){
    }


}