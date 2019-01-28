/**
 * Created by User on 02.10.2018.
 */

public with sharing class EngineMain {

public void MethodA() {

MethodA

}		



    // вытягиваем списки двигателей\ машин и деталей
    public List <engine__c> engineFullList(){
        List <engine__c> allEngines = [ SELECT id, name FROM engine__c ];
        return allEngines;

    }
    public List <car__c> carsFullList(){
        List <car__c> allCars = [ SELECT id, name, engine__c FROM car__c ];
        return allCars;

    }
    public List <parts__c> partsFullList(){
        List <parts__c> allParts = [ SELECT id, name, engine__c FROM parts__c ];
        return allParts;

    }
    /// лист авто для каждого двигателя
    public List <engine__c> groupCarForEngines (){
        List <Engine__c> fulllist = [SELECT Name,(SELECT name FROM cars__r) FROM engine__c ];
            for(engine__c eng: fulllist){
                List <car__c> lstcar = eng.cars__r;
                System.debug(lstcar);
        }
    return fulllist;

    }

  //// Список Запчастей по ID авто(5)
    Public Map<ID, List<parts__C>> mapReturnListPartsForIdCars(){
        Map <ID, List<parts__C>> mapLst = new Map <ID, List<parts__C>>();
        List <car__c> carList = CarsFullList();
        List <parts__c> partsList = PartsFullList();

        for(car__c carrr: carList){
            List <parts__c> newPartsList = new List<parts__c>();
            for(parts__c partsss : partsList){
                if(carrr.Engine__c == partsss.Engine__c){
                    newPartsList.add(partsss);
                }
                mapLst.put(carrr.Id,newPartsList);
            }
        }
        return mapLst;
    }


  ///// Список авто по имени двигателя (6)

    Public Map <String, List<car__c>> mapReturnListCarsForNameEngine() {
        Map <String, List<car__c>> newMap = new Map <String, List<car__c>>();
        List <engine__c> listengn = EngineFullList();
        List <car__c > listcar = CarsFullList();

       for(engine__c lsteng: listengn){
            List <car__c> newListprts = new List<car__c>();
            for(car__c lstcar: listcar){
              if( lstcar.engine__c == lsteng.id){
                  newListprts.add(lstcar);
              }
                newMap.put(lsteng.name,newListprts);
            }
        }
        System.debug(newMap.get('Engine__c 99'));
     return newMap;
    }

    public void cloneData () {
        List <engine__c > engineList = EngineFullList();
        List <car__c > carList = CarsFullList();
        List <parts__c > partsList = PartsFullList();

        List <car__c> newnewCars = new List<car__c>();
        List <engine__c> newnewEngine = new List<engine__c>();
        List <parts__c> newnewParts = new List<parts__c>();

        for (engine__c eng : engineList) {
            eng.id = null;
            newnewEngine.add(eng);
        }
        insert newnewEngine;

        for (car__c carNewList : carList) {
            carNewList.Id = null;
            newnewCars.add(carNewList);
        }
        insert newnewCars;

            for (parts__c prt : partsList) {
            prt.Id = null;
            newnewParts.add(prt);
        }
        insert newnewParts;
    }

    public void deleteClone() {
        Map<String,engine__c> engineMap = new Map<String,engine__c>();
        Map<String,car__c> carMap = new Map<String,car__c>();
        Map<String,parts__c> partsMap = new Map<String,parts__c>();

        List <engine__c> listEngines = [SELECT name, id, (SELECT  engine__c FROM cars__r) FROM Engine__c];
        List <car__c> listCars = [SELECT name, id, engine__c FROM car__c];
        List <parts__c> listParts = [SELECT name, id, engine__c FROM parts__c];

        List <engine__c> newListEngine = new List<Engine__c>();
        List <car__c> newListCars = new List<car__c>();
        List <parts__c> newListParts = new List<parts__c>();

        for(engine__c eng: listEngines){
            if(engineMap.containsKey(eng.name) ){
                newListEngine.add(eng);
            }
            else{
                engineMap.put(eng.name,eng);
            }
        }
        delete newListEngine;

        for(car__c car: listCars ){
            if(carMap.containsKey(car.name) ){
                newListCars.add(car);
            }
            else {
                carMap.put(car.name, car);
            }
        }
        delete newListCars;

        for(parts__c part: listParts){
            if(partsMap.containsKey(part.name)){
                newListParts.add(part);
            }
            else {
                partsMap.put(part.name, part);
            }
        }
        delete newListParts;
    }
}