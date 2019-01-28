/**
 * Created by User on 11.10.2018.
 */

public with sharing class DMLOperations {


    public void addContacts () {
        List <Contact> lst = new List<Contact>();
        for (integer i = 0; i < 5; i++) {
            Contact cont = new Contact(FirstName = (i+1) + 'Test', LastName = 'Cont');
            lst.add(cont);
        }
        insert lst;
    }
    public void upsateContacts (){
        List <contact> lstcontact = [SELECT id,name, title FROM Contact WHERE LastName =:'Cont'];
        List <contact> newLIst = new List<Contact>();
        for(integer  i = 0; i< lstcontact.size(); i++ ){
            Contact cont = new Contact(FirstName = (i+6) + 'Test', LastName = 'Cont', title = 'Developer');
            newLIst.add(cont);
            lstcontact[i].title = 'Developer';

        }
        List <contact> AllContactsList = new List<Contact>();
        AllContactsList.addAll(lstcontact);
        AllContactsList.addAll(newLIst);
        upsert AllContactsList;
    }

    public void DeleteContacts(){
        List <Contact> contlst = [SELECT LastName, title FROM Contact WHERE title =:'Developer'];
        delete contlst;
    }

    public void UndeleteContacts (){
        List <Contact> contlst = [SELECT LastName, title FROM Contact WHERE title =:'Developer' ALL ROWS ];
        undelete contlst;

    }

    public void DataBasMetod(){
        Savepoint svp = Database.setSavepoint();
        List <Contact> lstc = new List<Contact>();
        Contact cont = new Contact();
        for(integer i = 0; i<20; i++){
            if(i<10){
                cont = new Contact(LastName = 'Lastname' + i);
            }
            else{
                cont = new Contact();
            }
            lstc.add(cont);
        }
        Database.SaveResult[] svrz = Database.insert(lstc, false);
        for(Database.SaveResult svr :svrz) {
            if (svr.success == false) {
                Database.rollback(svp);
            }
        }




    }

}