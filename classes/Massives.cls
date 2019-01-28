/**
 * Created by User on 31.10.2018.
 */

public with sharing class Massives {

    public static List<Integer> RandomList(){
        List<Integer> mass = new List<Integer>();
        for(Integer i = 0; i < 100; i++) {
            Decimal a = (Math.random() * 100);
            mass.add(Integer.valueOf(a));
        }
        return mass;
    }

    public static List<Integer> exchangeForAverage (Integer a, List <Integer> lst) {
        Decimal sred =0;
        for (Integer listR : lst) {
             sred += listR;
            }
        System.debug('sred ' + sred);

        sred = sred/lst.size();
        System.debug('sred2 ' + sred);


        for (Integer i =0; i < lst.size(); i++){
            if(lst[i] > a){
                lst[i] = Integer.valueOf(sred);
            }
}
        System.debug(lst);
        return lst;
    }

    public static List<Integer> exchangeSmallerItemOnFirstItem (List <Integer> lst) {
        System.debug(lst);
        System.debug(lst[lst.size() - 1]);
       for(Integer i = 0; i < lst.size(); i++){
           if(lst[i] < lst[lst.size()-1]){
               lst[i] = lst[0];
           }
       }
        System.debug(lst);
        return lst;
    }

    public static List<Integer> swapLargerAndSmaller (List <Integer> lst) {
        Integer larger = 0;
        Integer smaller = lst[0];
        Integer countLarg = 0;
        Integer countSmall = 0;
        System.debug(lst);

        for(Integer i = 0; i < lst.size(); i++) {
            if(lst[i] > larger) {
                larger = lst[i];
                countLarg = i;
            }
            if(lst[i] < smaller) {
                smaller = lst[i];
                countSmall = i;
            }
        }
        System.debug('smal ' + smaller );
        System.debug('Large ' + larger );
        Integer timeInt = lst[countLarg];
        lst[countLarg] = smaller;
        lst[countSmall] = larger;
        System.debug(lst);
        return lst;
    }

    public static List<Integer> changeEvenAndOddItem (List <Integer> lst) {
        System.debug(lst);
        Integer countLarge = 0;
        Integer countSmall = lst[0];

      for(Integer i = 0 ; i < lst.size(); i++){
          if(lst[i] > lst[countLarge] && Math.mod(lst[i],2) == 0){
              countLarge = i;
          }
          if(lst[i] < lst[countSmall] && Math.mod(lst[i],2) !=0){
              countSmall = i;
          }
      }
        System.debug('indexLarg ' + countLarge + ' item ' + lst[countLarge]);
        System.debug('indexSmall ' + countSmall + ' item ' + lst[countSmall]);
        Integer timeInt = lst[countSmall];
        lst[countSmall] = lst[countLarge];
        lst[countLarge] = timeInt;
        System.debug(lst);
        return lst;




    }

    public static List<Integer> swapEventItemOnLeftItem (List <Integer> lst) {
        System.debug(lst);
        for(Integer i = 0; i < lst.size(); i++) {
            if(Math.mod(i,2) == 0 && i !=0 ){
                lst[i] = lst[i-1];
            }
        }
        System.debug(lst);
        return lst;
    }

    public static List<Integer> deleteFirstAndEndItem (List <Integer> lst) {
        System.debug(lst);
        System.debug(lst[lst.size()-1]);
        lst.remove(0);
        lst.remove(lst.size()-1);
        System.debug('new ' + lst);
        System.debug('newlast ' + lst[lst.size()-1]);
     return lst;
    }

    public static List<Integer> deleteItemWhichRepeatedMore2Times (List <Integer> lst) {
        Set<Integer> lstDelete = new Set<Integer>();

        Integer count = 0;
        for(Integer lst1: lst){
            count = 0;
            for(Integer lst2 : lst){
                if(lst1 == lst2){
                    count++;
                }
            }
            if(count > 3){
                lstDelete.add(lst1);
            }
        }
        System.debug('deletelist' + lstDelete);
        System.debug('delSeize ' + lstDelete.size());
        for(Integer del : lstDelete) {
            for(Integer i = 0; i < lst.size(); i++) {
                if(del == lst[i]){
                    lst.remove(i);
                }
            }
        }
        System.debug(lst);
        System.debug('size ' + lst.size());
         return lst;
    }

    public static List<Integer> deleteSerialDublecatedItem (List <Integer> lst) {
        System.debug(lst);
        for(Integer i = 0; i < lst.size()-1; i++){

            if(lst[i] == lst[i+1]) {
                lst.remove(i+1);
                i--;
                System.debug(lst[i] + 'count -' + i);
            }
        }
        System.debug(lst);
        System.debug(lst.size());
        return lst;
    }

    public static List<Integer> deleteSerialLargerItem (List <Integer> lst, Integer item) {
        System.debug(lst);
        for(Integer i = 0; i < lst.size(); i++) {
            if(i == 0 && lst[i] > item){
                lst.remove(i);
            }
            if(lst[i] > item){
                lst.remove(i);
                if(i != 0 ) {
                    i--;
                }
            }
        }
        System.debug(lst);
        System.debug('size ' + lst.size());
        return lst;
    }

    public static List<Integer> deleteSerialLargerItem (List <Integer> lst) {

        List <Integer> nList = new List<Integer>();
        for( Integer i = lst.size()-1; i < lst.size(); i--) {
            nList.add(lst[i]);
            if(i == 0){
                break;
            }
        }
        System.debug(lst);
        System.debug(nList);
        return nList;
    }
}