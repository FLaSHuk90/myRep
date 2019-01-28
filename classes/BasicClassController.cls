/**
 * Created by User on 12.10.2018.
 */

public with sharing class BasicClassController {

    public String frstName {get;set;}
    public String lstName {get;set;}
    public String UserID {get;set;}
    public String currencyOrg {get;set;}
    public String Email {get;set;}
    public String FrName {get;set;}
    public Date today {get;set;}
    public Integer countQ {get;set;}


    public BasicClassController(){

         frstName = UserInfo.getFirstName();
         lstName = UserInfo.getLastName();
         UserId = UserInfo.getUserId();
         currencyOrg = UserInfo.getDefaultCurrency();
         Email =UserInfo.getUserEmail();
         FrName = UserInfo.getOrganizationName();
         today = System.today();
         countQ = Limits.getLimitQueries();
    }
    public void lala(){
        System.debug(lstName);
    }
}