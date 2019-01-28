public with sharing class NewControllerForAllContacts {

  List <Contact> lst = new List<Contact>();


    public NewControllerForAllContacts(){

        lst = [SELECT name, Email, Phone From Contact];
    }

    public List<Contact> getListContacts (){
        return lst;
    }


}