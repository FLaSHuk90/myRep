/**
 * Created by User on 15.10.2018.
 */

public with sharing class ContactTestHandler {
    static Boolean ll = true;
    public void CreateCont() {
        List <Contact> ccc = new List<Contact>();
        for (integer i = 0; i < 2; i++) {
            Contact nn = new Contact(LastName = 'XXX');
            ccc.add(nn);
        }
        insert ccc;
    }
    public static void ContTest(List<Contact> lst) {

        List<Contact> nList = new List<Contact>();

        if (ll == true) {
            for (Contact cc : lst) {
                Contact cont = new Contact(LastName = cc.LastName + 'Test');
                nList.add(cont);
            }
        }
        System.debug('AAA' + nList);
        ll = false;
        insert nList;


    }
}