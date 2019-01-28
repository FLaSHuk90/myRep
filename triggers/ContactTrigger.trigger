/**
 * Created by User on 15.10.2018.
 */

trigger ContactTrigger on Contact (after insert, after update, before update, before insert) {
/*
    TESTTEST    TEST    TEST
    if(Trigger.isAfter && Trigger.isInsert){
        ContactTestHandler.ContTest(Trigger.new);
    }
*/


/*   //    1 часть
 if (Trigger.isAfter && Trigger.isInsert) {
        ContactTriggerHandler.CreateMorti(Trigger.new);
    }*/

/*
     // 2 часть
    if (Trigger.isAfter && Trigger.isInsert) {
            ContactTriggerHandler.SecondTask(Trigger.new);
        }
    if(Trigger.isBefore && Trigger.isInsert ){
        ContactTriggerHandler.SecondTaskPart2(Trigger.new);
    }
*/

    // 3 часть
/*    if(Trigger.isInsert && Trigger.isAfter){
        ContactTriggerHandler.ThreeTaskPart2(Trigger.newMap);

    }
    if(Trigger.isBefore && Trigger.isUpdate){
        ContactTriggerHandler.SecondTaskPart2(Trigger.new);
    }*/
 /*   // 4 часть
    if (Trigger.isInsert && Trigger.isAfter) {
        ContactTriggerHandler.Four(Trigger.new);
    }*/

    // часть 5 класс strings

    if (Trigger.isInsert && Trigger.isAfter) {
        Strings.contactTriggerHandlerUpdateFieldDiscount(Trigger.new);


    }
    if (Trigger.isUpdate && Trigger.isAfter) {
        Strings.contactTriggerHandlerUpdateFieldDiscount(Trigger.new);
    }
}