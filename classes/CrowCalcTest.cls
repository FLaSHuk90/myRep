@IsTest
public with sharing class CrowCalcTest {
    
    @testSetup
    static void setup(){
        CrowCalcTest.ListCrows();
    }
    @isTest
    public static void testAddCrows() {

        Integer initialCrows = [SELECT COUNT() FROM Crow__c];
        Boolean addCrowsResult = CrowCalc.addCrows(10);
        Integer crowsAfter = [SELECT COUNT() FROM Crow__c] - initialCrows;
        System.assert(crowsAfter == 10, 'Wrong answer!');
        System.assert(addCrowsResult, 'Success addition not "true"');
        Integer integerTest;
        Boolean addCrowsResultLimit = CrowCalc.addCrows(integerTest);
        System.assert(addCrowsResultLimit == false, 'Success addition not "false"');

    }
    @isTest
    public static void testSubtractCrows() {
        Integer initialCrows = CrowCalcTest.sizeCountCrows();
        Boolean SubtractCrowsResult = CrowCalc.subtractCrows(6);
        Integer afterCrows = CrowCalcTest.sizeCountCrows();
        System.debug('initialCrows' + initialCrows);
        System.debug('afterCrows' + afterCrows);
        System.assert(afterCrows == (initialCrows - 6),'Wrong answer!');
        System.assert(SubtractCrowsResult, 'Success addition not "true"');
        Integer integerTest;
        Boolean addCrowsResultLimit = CrowCalc.subtractCrows(integerTest);
        System.assert(addCrowsResultLimit == false, 'Success addition not "false"');
    }
    @isTest
    public static void testGetTotal() {
        Integer initialCrows = CrowCalcTest.sizeCountCrows();
        CrowCalcTest.ListCrows();
        CrowCalc.getTotal();
        Integer afterCrows = CrowCalcTest.sizeCountCrows();
        System.assert(afterCrows == initialCrows +10);
    }
    @isTest
    public static void testResetCalc() {
        CrowCalcTest.ListCrows();
        CrowCalc.ResetCalc();
        integer sizeList = CrowCalcTest.sizeCountCrows();
        System.assert(sizeList == 0, 'Wrong answer');
    }
    @isTest
    public static void testALotItem() {
        Integer sizeBefore = sizeCountCrows();
        CrowCalc.addCrows(1000);
        Integer sizeAfter = sizeCountCrows();
        System.assert(sizeBefore == sizeAfter-1000);

    }

    public static void ListCrows() {
        List<Crow__c> lstCrow = new List<Crow__c>();
        for (Integer i =0; i<10; i++) {
            lstCrow.add(new Crow__c());
    }
        insert lstCrow;
    }
    public static Integer sizeCountCrows(){
        return [SELECT name FROM crow__c].size();
    }

}