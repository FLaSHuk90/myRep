@isTest
public with sharing class CalloutJSControllerTest {

    @isTest
     static void getCurrencyRateForDateTest() {
        CalloutJSController calls = new CalloutJSController();
        Date myDate = System.today();
        calls.exchangeCurrentDate = myDate;
        Test.setMock(HttpCalloutMock.class, new CalloutJSHTTPControllerMock());
        calls.getCurrencyRateForDate();
        HttpResponse response = calls.getResponse();
        String actualValue = response.getBody();
        String expectedValue = '[{"Cur_ID":170,"Date":"2018-12-17T00:00:00","Cur_Abbreviation":"AUD","Cur_Scale":1,"Cur_Name":"Австралийский доллар","Cur_OfficialRate":1.5205}]';
        System.assertEquals(expectedValue,actualValue);

        List<SelectOption> nameCurrency = calls.getnameCurrencyForExchange();
        System.assert(nameCurrency.size() - 1 == calls.listRate.size());
                }
    @isTest
    static void CurrencyWrapperTest() {
        CalloutJSController.CurrencyWrapper cc = new CalloutJSController.CurrencyWrapper('name',4,'abbrevation',3);
        System.assertEquals(cc.Cur_Name, 'name');
        System.assertEquals(cc.Cur_OfficialRate, 4);
        System.assertEquals(cc.Cur_Abbreviation, 'abbrevation');
        System.assertEquals(cc.Cur_Scale, 3);
    }

}