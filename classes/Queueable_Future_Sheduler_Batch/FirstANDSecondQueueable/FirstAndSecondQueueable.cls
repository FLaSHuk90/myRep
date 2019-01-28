public with sharing class FirstAndSecondQueueable implements Queueable{

    public void execute(QueueableContext cont) {
        List<Contact> listNewContacts = new List<Contact>();
        for (Integer i = 0; i < 200; i++) {
            Contact newContact = new Contact(FirstName = 'FirstJob');
            listNewContacts.add(newContact);

        }
        // вызываем второй класс
        System.enqueueJob(new SecondQueueble(listNewContacts));
    }

    //класс дополняет контакты и инсертит их
    public with sharing class SecondQueueble implements Queueable {
        List<Contact>allContacts = new List<Contact>();
        public SecondQueueble(List<Contact> lst){
            allContacts = lst;
        }

        public void execute(QueueableContext con) {
            for (Contact item : allContacts) {
                item.LastName = 'SeconJob';
            }

            insert allContacts;
        }

    }
}