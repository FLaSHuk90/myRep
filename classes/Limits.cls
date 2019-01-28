/**
 * Created by User on 12.12.2018.
 */

public with sharing class Limits {
    public void task1() {
        List<Contact> firstContacts = [SELECT Name FROM Contact LIMIT 200];
        System.debug(firstContacts.size());
    }

    public void task2() {
        Contact cnt;
        for (Integer i = 0; i < 200; i++) {
             cnt = new Contact(lastName = 'test', firstName = 'test' + i);
        }
        Insert cnt;
    }

    public void task3() {
        Set<String> allNames = new Set<String>();
        List<Contact> allContacts = [SELECT firstName FROM Contact limit 50000];
        for (Contact contactItem : allContacts) {
            allNames.add(contactItem.firstName);
        }

    }
}
   // Trigger:
/*

trigger agentSmithTrigger on Contact (before update) {
    if(Trigger.isBefore && Trigger.isUpdate {
    agentSmithTriggerHandler.infect(Trigger.new);
}
}
//Handler:
    public with sharing class agentSmithTriggerHandler {
    public static void infect(List<Contact> target) {
        List<Contact> lstContacts = [SELECT Id FROM Contact WHERE id IN:target];
        for(Contact cont:lstContacts) {
        target.infectedBy = cont.id;
}
}
}*/