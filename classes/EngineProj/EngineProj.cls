/**
 * Created by User on 02.10.2018.
 */

public with sharing class EngineProj {


    public List <Engine__c>  fillingInEngine (){
        List <Engine__c> englist = new List <Engine__c> ();

        for(integer i =0; i<101; i++) {
            Engine__c engs = new Engine__c (Name='Engine__c ' + i);
            englist.add(engs);
        }
        insert englist;
        return englist;

    }
    public List <car__c> fillingInCars(){
        List <car__c> carlist = new List <car__c>();

        for(integer i =0; i< 500; i++){
            car__c cars = new car__c(name ='Car ' +i);
            carlist.add(cars);
        }
        insert carlist;
        return carlist;
    }

    public List <parts__c> fillingInParts(){
        List <parts__c> partslist = new List <parts__c>();

        for(integer i =0; i< 400; i++){
            parts__c partss = new parts__c(name ='Part ' +i);
            partslist.add(partss);
        }
        insert partslist;
        return partslist;

    }
    /// вяжем Двигатели с Машинами
    public void bindingEngineAndCars (List <engine__c> lst1, List <car__c> lst2){
       integer j = 0, c = 0;

      for(integer i =0; i < 100; i++){
        for(j =0; j < 5; j++){
            lst2[c].engine__c = lst1[i].id;
            c++;
        }
        j=0;
      }
        update lst2;
    }
///  вяжем Двигатели с запчастями
    public void bindingEngineAndParts (List <engine__c> lst1, List <parts__c> lst2) {
        integer j = 0, c = 0;

        for (integer i = 0; i < 100; i++) {
            for (j = 0; j < 4; j++) {
                lst2[c].engine__c = lst1[i].id;
                c++;
            }
            j = 0;

        }
        update lst2;
    }
 /// вяжем Авто с Запчастями
    public void bindingCarsAndParts (List <car__c> lst1, List <parts__c> lst2) {
        integer j = 0, c = 0;

        for (integer i = 0; i < 500; i++) {
            for (j = 0; j < 2; j++) {
                lst2[c].carRelated__c = lst1[i].id;
                c++;
            }
            j = 0;
        }
        update lst2;
    }

}