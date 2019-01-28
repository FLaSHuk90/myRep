/**
 * Created by User on 12.10.2018.
 */

public with sharing class MyTestException extends Exception{

        public void oneMethod () {

            ////list exeption
            try{
                List<Integer> lstint = new List<Integer>();
                lstint.add(1);
                integer ee =lstint[2];
            }
            catch (ListException e){
                System.debug('mess ' + e.getMessage());
            }

            //// dmlException
            try{
                Account acc = new Account();
                insert acc;

            }catch(DmlException ex){
                System.debug ('message ' + ex.getMessage());
            }
            //// SOBject
            try{
                Contact cont = [SELECT name FROM Contact LIMIT 1];
                String aaa = cont.Email;
            }catch(SObjectException exx){
                System.debug('messag3 ' + exx.getMessage());
            }

            try{
                String a;
                a.equals('aa');

            }catch(NullPointerException exxx){
                System.debug('messag4 ' + exxx.getMessage());
            }
        }

        public void OnlyDMlExcept() {
            List <Contact> lstc = new List<Contact>();
            Contact ac = new Contact(LastName = 'yyce');
            lstc.add(ac);
            for (integer i = 0; i < 3; i++) {
                Contact cc = new Contact();
                lstc.add(cc);
            }
            try {
                Account acc = new Account();
                insert acc;

            }

            catch(DmlException es) {
                integer numb = es.getNumDml();
                System.debug(numb);
                for(Integer i =0 ; i<numb; i++) {
                    System.debug('2 ' + es.getDmlFields(i));
                    System.debug('3 ' + es.getDmlId(i));
                    System.debug('4 ' + es.getDmlIndex(i));
                    System.debug('5 ' + es.getDmlStatusCode(i));
                    System.debug('6 ' + es.getDmlType(i));
                    System.debug('7 ' + es.getDmlMessage(i));
                }
            }
        }

        public void MyExcep (List<Account> acc) {
            try {
                Boolean bol;
                for (Account cc : acc) {
                    if (String.valueOf(cc.NumberOfEmployees) == null) {
                        bol = false;
                    }
                }
                if(bol == false) {
                    throw new MyTestException('Бяда');
                }
            }
            Catch(MyTestException e) {
                System.debug('Message111 ' + e.getMessage());
            }

        }


}