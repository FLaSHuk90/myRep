/*вызов класса
* ScheduleTest tst = new ScheduleTest();
* String cron = '0 0 12 15 * ?';
* System.schedule('nameSched', cron, tst);

* */


public with sharing class ScheduleTest implements Schedulable {

    public void execute (SchedulableContext context) {
        FirstAndSecondQueueable frstAndscnd = new FirstAndSecondQueueable();
        System.enqueueJob(frstAndscnd);
        //запускаю батч через 20 мин после queueable;
        BatchTest btst = new BatchTest();
        System.scheduleBatch(btst,'nextSced', 20);


    }

}