public with sharing class ContactTriggerHandler {

    public static void DELETEMy() {
        List <Contact> dellist = [SELECT name,id FROM Contact WHERE LastName = :'Sanchez' OR LastName = :'Smith'];
        delete dellist;

    }
    public void CreateRick() {
        List <Contact> lstR = new List<Contact>();
        for (integer i = 0; i < 2; i++) {
            Contact con = new Contact(FirstName = 'Rick', LastName = 'Sanchez');
            lstR.add(con);
        }
        insert lstR;
    }

    // EASYYYYYY
    public static void CreateMorti(List<contact> lst) {

        List<Contact> nlst = new List<Contact>();
        System.debug(lst);
        for (Contact rlst : lst) {
            if (rlst.FirstName.equals('Rick') && rlst.LastName.equals('Sanchez')) {
                Contact cont = new Contact(FirstName = 'Morty  ', LastName = 'Smith');
                nlst.add(cont);
            }
        }
        insert nlst;
    }

    // 2 часть (2 метода)
    public static void SecondTask(List<Contact> lst) {
        List<Contact> nlst = new List<Contact>();
        for (Contact rlst : lst) {
            if (rlst.FirstName == 'Rick' && rlst.LastName == 'Sanchez') {
                Contact cont = new Contact(FirstName = 'Morty', LastName = 'Smith', MyRick__c = rlst.id);
                nlst.add(cont);
            }
        }
        System.debug('После ' + nlst);
        if (nlst.size() > 0) {
            insert nlst;
        }
    }
    Public static void SecondTaskPart2(List<Contact> lst) {
        for (Contact str6 : lst) {
            if (str6.LastName == 'Smith' && str6.MyRick__c == null) {
                str6.SadMorty__c = true;
            }
        }
    }

    // 3 часть
    Public void ThreeTask() {
        List<Contact>nlst = new List<Contact>();
        Double rand;
        for (integer i = 0; i < 200; i++) {
            rand = Math.random();
            if (rand < 0.5) {
                Contact con = new Contact(FirstName = 'Rick', LastName = 'Sanchez');
                nlst.add(con);
            } else {
                Contact cont = new Contact(FirstName = 'Morty', LastName = 'Smith');
                nlst.add(cont);
            }
        }
        insert nlst;
    }
    public static void ThreeTaskPart2(Map<Id, Contact> rickMortyMap) {
        List<Contact>mortyLst = [SELECT id, name, MyRick__C FROM Contact WHERE LastName = :'Smith' AND Id IN :rickMortyMap.keySet()];
        List<Contact>rickLst = [SELECT id, name FROM Contact WHERE LastName = :'Sanchez' AND Id IN :rickMortyMap.keySet()];
        for(Integer i = 0; i < mortyLst.size(); i++ ) {
            mortyLst[i].MyRick__c = rickLst[i].id;
            if(i <= rickLst.size()){
                break;
            }
        }
        update  mortyLst;
        /* List<integer>countRick = new List<Integer>();

        integer R = 0;
        integer M = 0;
        integer r1 = 0;
        integer m1 = 0;
        for (integer i = 0; i < lst.size(); i++) {
            if (lst[i].LastName == 'Smith') {
                m++;
            } else if (lst[i].LastName == 'Sanchez') {
                r++;
                countRick.add(i);
            }
        }
        for (integer j = 0; j < lst.size(); j++) {
            mortyLst[m1].MyRick__c = lst[countRick[r1]].id;
            r1++; m1++;
            if (r1 >= r || m1 >= m) {
                break;
            }
        }
        update mLst;*/
    }
    // 4 часть

    public static void Four(List<Contact> MyList) {
        List<Contact> allList = [SELECT id, Lastname, MyRick__c FROM Contact WHERE LastName = :'Smith' OR LastName = :'Sanchez'];
        List<Contact> lisll = new List<Contact>();
        for (Contact cnt : allList) {

            if (cnt.LastName == 'Smith' && cnt.MyRick__c != null) {
                for (contact rls : allList) {
                    if (rls.id == cnt.MyRick__c) {
                        lisll.add(cnt);
                        lisll.add(rls);
                    }
                }
            }
        }
        if (lisll.size() < allList.size()) {
            List <Contact> nlst = new List<Contact>();
            nlst.addAll(allList);
            integer c = 0;
            for (Contact cnt : allList) {
                for (Contact rls : lisll) {
                    if (cnt == rls) {
                        nlst.remove(c);
                        c--;
                    }
                }
                c++;
            }
            for (Contact cont : nlst) {
                for (Contact allc : allList) {
                    if (allc.LastName == 'Smith' && allc.MyRick__c == null) {
                        allc.MyRick__c = cont.id;
                        break;
                    }
                }
            }
                update allList;
            }
        }
}