/**
*  @Author - Daniluk Alexandr
*  @Date - 2018-12-18
*
*  @Description - Obtains data on the exchange rate for the selected number from https://www.nbrb.by and also converts one currency to another
*/

public with sharing class CalloutJSController {
    public Date exchangeCurrentDate { get; set; }
    public List<CurrencyWrapper> listRate { get; set; }
    public String CurrencyToExchangeRubles { get; set; }
    public String CurrencyToExchangeCurrency { get; set; }
    public String sumCurrencyForConvertInOtherCurrency { get; set; }
    public String OtherToExchangeCurrency { get; set; }


    public CalloutJSController() {
        listRate = new List<CurrencyWrapper>();
    }

/**
* getResponse - forms http request.
*  @param - request - parameters request.
*  @return - response on request.
*/
    public HttpResponse getResponse(String apLink) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apLink);
        request.setMethod('GET');
        request.setTimeout(120000);
        return http.send(request);
    }
/**
  * getCurrencyRateForDate - creates an api query to the website of the exchange rate and places them on a sheet.
  *  @param - dateInFormatString - date chosen by the user in the type of string.
  *  @param - listRate - list Objects CurrencyWrapper received with on request.
  *  @param - apiLink - api query string.
  *  @return - this page.
  */
    public PageReference getCurrencyRateForDate() {
        System.debug('exchangeCurrentDate' + exchangeCurrentDate);
        String dateInFormatString = String.valueOf(exchangeCurrentDate.year()) + '-' + String.valueOf(exchangeCurrentDate.month()) + '-' + String.valueOf(exchangeCurrentDate.day());
        String apiLink = 'http://www.nbrb.by/API/ExRates/Rates?onDate=' + dateInFormatString + '&Periodicity=0';
        System.debug('dateInFormatString' + dateInFormatString);
        HttpResponse response = getResponse(apiLink);
        if (response.getStatus() == 'OK') {
            try {
                listRate = (List<CurrencyWrapper>) System.JSON.deserialize(response.getBody(), List<CurrencyWrapper>.class);
            } catch (Exception e) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING, e.getMessage()));
            }
        }
        return null;
    }

/**
*  getnameCurrencyForExchange - forms a list of currencies.
*  @param - nameCurrencyForExchanged - list currency .
*  @return - list currency.
*/
    public List<SelectOption> getNameCurrencyForExchange() {
        List<SelectOption> nameCurrencyForExchanged = new List<SelectOption>();
        nameCurrencyForExchanged.add(new SelectOption('', ''));
        for (CurrencyWrapper cur : listRate) {
            nameCurrencyForExchanged.add(new SelectOption(cur.Cur_Name, cur.Cur_Name));
        }
        return nameCurrencyForExchanged;
    }

/**
*  @Description - creates a new class for the object
*/
    public class CurrencyWrapper {
        public String Cur_Name { get; set; }
        public Decimal Cur_OfficialRate { get; set; }
        public String Cur_Abbreviation { get; set; }
        public Decimal Cur_Scale { get; set; }

        public CurrencyWrapper(String s, Decimal d, String s1, Decimal d1) {
            Cur_Name = s;
            Cur_OfficialRate = d;
            Cur_Abbreviation = s1;
            Cur_Scale = d1;
        }
    }

}