/**
 * Created by User on 31.10.2018.
 */

public with sharing class Strings {
    static Integer countStat = 0;
    static Boolean updateStop = true;

    public void theSumNumbersOfWords (String str) {
        Integer sum = 0;
        List<String> lst = str.split(' ');
        for(String ll : lst) {
            if(ll.isNumeric()) {
                sum += Integer.valueOf(ll);
            }
        }
        System.debug(sum);

    }

    public void theSpaceSum (String str) {
        List <String> lststr = str.split(' ');
        Integer sum = 1;
        Integer timeSum = 1;
        for (String ll : lststr) {
            if(ll == '') {
                timeSum++;
            }
                else if(sum < timeSum){
                sum = timeSum;
                timeSum = 1;
            }
            else if(ll != ' '){
                timeSum = 1;
            }
        }
        System.debug(sum);
    }

    public void SearchAndDeleteDublicateOfWord(String a, String b) {
        List<String> delList = new List<String>();
        for(Integer i = 0; i < a.length()-1; i++){
            for(Integer j = 0; j < b.length()-1; j++) {
                if(a.substring(i,i+1) == b.substring(j,j+1)) {
                 delList.add(a.substring(i,i+1));
                }
            }
        }
        for(String st1 : delList){
            System.debug(st1.substring(0));
           a = a.remove(st1);
            b = b.remove(st1);
        }
        System.debug(delList);
        System.debug(a);
        System.debug(b);
    }

    public void sortedLenghtStringInMassiv (List<String> lst) {
    List <Integer> listInt = new List<Integer>();
    List <String> newList = new List<String>();
        for(String str : lst ) {
            listInt.add(str.length());
        }
        listInt.sort();
        for(Integer integ: listInt) {
            for(String strng: lst) {
                if(integ == strng.length()) {
                    newList.add(strng);
                }
            }
        }
        System.debug(newList);
    }

    public void sortedForNumberInWord (List <String> lst) {
        List<String> subStrForString = new List<String>();
        List<Integer> countNumberInWord = new List<Integer>();
        List<Integer> sortNumblist = new List<Integer>();
        Set<Integer> sortSet = new set<Integer>();
        List<String> finishList = new List<String>();


        Integer count = 0;
        for(String str: lst){
            for(Integer i = 0; i <str.length(); i++){
                if(str.substring(i,i+1).isNumeric()){
                    count++;
                }
            }
            countNumberInWord.add(count);
            count = 0;
        }
        sortNumblist.addAll(countNumberInWord);
        sortNumblist.sort();
        sortSet.addall(sortNumblist);
        System.debug('noSort ' + countNumberInWord);
        System.debug('sort' + sortNumblist);

        for(Integer setItem: sortSet){
            for(Integer c = 0; c < countNumberInWord.size(); c++){
                if(setItem == countNumberInWord[c]) {
                    finishList.add(lst[c]);
                }
            }
        }
        System.debug(finishList);

    }

    //Дана строка. Заменить все символы 'a' и 'b' на 'A' и 'B' соответственно.

    public void UpperForCauseLetter (String str) {
        str = str.replace('a','A');
        str = str.replace('b','B');
        System.debug(str);
    }

    //Дан текст. Сформировать строку из символов, расположенных между первой и второй запятыми данного текста.

    public void SubStringBetweenSimvol (String str ) {
        List<String> lst = str.split(',');
        String subString = lst[1];
        System.debug(subString);
    }

    //Дана строка. Удалите k-ый символ в ней.

    public void deleteSimvolForIndex (String str, Integer index) {
        String result = str.substring(0,index-1) + str.substring(index ,str.length());
        System.debug(result);
    }

    //Даны две строки. Определите, содержится ли меньшая по длине строка в большей.

    public void equalsOccurrenceSmallerWordInLarger (String str1, String str2) {
        Boolean a = false;
        if(str1.length() > str2.length()){
            if(str1.contains(str2)) {
                a = true;
            }
        }
        else if(str2.length() >= str1.length()) {
            if(str2.contains(str1)) {
                a = true;
            }
        }
        System.debug(a);
    }

    //Даны две строки. Определите, можно ли из некоторых символов первой строки составить вторую строку.

    public void wordConsistOfSecondCharacters (String str1, String str2) {
     List <String> lststr1 = new List<String>();
     List <String> lststr2 = new List<String>();
        Boolean result = false;

        String conWord ='';
        for(Integer i = 0; i<str1.length(); i++){
            lststr1.add(str1.substring(i,i+1));
        }
        for(Integer c = 0; c<str2.length(); c++){
            lststr2.add(str2.substring(c,c+1));
        }

        for(Integer a =0; a<lststr1.size(); a++){
            for(Integer j=0; j<lststr2.size(); j++){
                if(lststr1[a] == lststr2[j]){
                    conWord = conWord + lststr1[a];
                    lststr1.remove(a);
                    lststr2.remove(j);
                    a--;
                    j--;
                    break;
                }
            }
        }
        if(conWord.length() == str2.length()){
            result = true;
        }
        System.debug(lststr1);
        System.debug(conWord);
        System.debug('result: ' + result);
    }

    // Напиши метод который будет выводить в консоль имена 10ти контактов (первых ро алфавиту по имени).
    //При последующем вызове он должен возвращать следующие 10 контактов и так далее.

    public  List <Contact> getContactSortedName () {
        List <Contact> lstcont = Database.query('SELECT Name FROM Contact ORDER BY Name ASC LIMIT 10 OFFSET ' + countStat);
        countStat = countStat +10;
        return lstcont;
   /// 2 Вариант Решения
      /*  List<Contact> listContacts = [SELECT Name FROM Contact ORDER BY Name ASC ];
        System.debug(listContacts);
        List<Contact> listReturnContact = new List<Contact>();
        for(Integer i = countStat; i < countStat+10; i++) {
            listReturnContact.add(listContacts[i]);
        }
        countStat = countStat+10;
        System.debug('countst' + countStat);
        return listReturnContact;*/
    }

    //Напиши метод который возвращает Id всех Риков к которым не привязан ни один Морти.

    public List<Id> getRickNotHaveMorti () {
        List<Id> aloneRick = new List<Id>();
        List <Contact> listContacts = [SELECT Name, id, (SELECT name, id, SadMorty__c, MyRick__c FROM Contacts__r) FROM Contact WHERE LastName = 'Sanches'];
        System.debug('list ' + listContacts);

        for(Contact lst: listContacts) {
            System.debug('size ' + lst.Contacts__r.size());
            if(lst.Contacts__r.size() == 0) {
                aloneRick.add(lst.id);
            }

        }
        return aloneRick;
    }

    //написать метод, который принимает список Id аакаунтов, получает все контакты этих аккаунтов и формирует мапу где ключ это Id аккаунта, а значение это список его контактов

    public Map <Id,List<Contact>> getMapContactsForIdAccount(List <Id> lst){
    Map<Id,List<Contact>> mapContactsForId = new Map<Id, List<Contact>>();
        List<Account> lstAccount = [SELECT id, (SELECT id, name FROM Contacts) FROM Account];
        for(Account acc: lstAccount) {
            if(acc.Contacts.size() != 0) {
                mapContactsForId.put(acc.id,acc.Contacts);
            }
        }
        System.debug(mapContactsForId);
    return mapContactsForId;
            }

    /// хандлер триггера (Сделать такой триггер чтобы если создать или обновить какой-то контакт так, что у него discount больше чем discount какого-то другого контакта - всем контактам у кого discount меньше тоже проставить такой discount чтобы обидно не было.)

    public static void contactTriggerHandlerUpdateFieldDiscount (List <Contact> listContactsNew) {
        Decimal maxDiscound = 0;
        List<Contact> listAllContacts = [SELECT name, discount__c FROM Contact WHERE id NOT IN : listContactsNew];
        System.debug(listAllContacts);
        for(Contact cont: listAllContacts) {
            if(maxDiscound < cont.discount__c) {
                maxDiscound = cont.discount__c;
            }
        }
        Decimal maxDiscoundNew = maxDiscound;
        for(Contact conn: listContactsNew) {
            if(conn.discount__c > maxDiscound) {
                maxDiscoundNew = conn.discount__c;
            }
        }
        if(maxDiscoundNew > maxDiscound) {
            for(Contact conttt: listAllContacts) {
                if(conttt.discount__c < maxDiscoundNew || conttt.discount__c == null) {
                    conttt.discount__c = maxDiscoundNew;
                }
            }
        }
        if(updateStop == true) {
            System.debug('adada');
            updateStop = false;
            update listAllContacts;
        }
    }
}