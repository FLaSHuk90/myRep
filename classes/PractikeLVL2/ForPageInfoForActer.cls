public with sharing class ForPageInfoForActer {

    List<Contract1__c> contractAll = new List<Contract1__c>();
    List<Payment__c> paymentAll = new List<Payment__c>();
    Map<String, List<Contract1__c>> mapContractSortDate = new Map<String, List<Contract1__c>>();
    Set<String> KeysValues = new Set<String>();
    String year {get;set;}
    Map<String, List<Contract1__c>> mapContractFinishMap = new Map<String, List<Contract1__c>>();
    public List <Contract1__c> lstContract {get;set;}
    public Decimal sumAmount {get;set;}


    public ForPageInfoForActer(apexPages.standardController std) {
        contractAll = [
                SELECT ContactReleated__c,name, MovieReleated__c, MovieReleated__r.StudioReleated__c, (SELECT Payment_Date__c, ContractReleated__c,name FROM Payments__r), Start_Date__c, End_Date__c, Amount__c
                FROM Contract1__c
                WHERE ContactReleated__c = :ApexPages.CurrentPage().getParameters().get('id')];
        paymentAll = [SELECT Payment_Date__c, name, ContractReleated__c, ContractReleated__r.ContactReleated__c FROM Payment__c ORDER BY Payment_Date__c ASC];
        mapContractFinishMap = getMapContract();
        sumAmount = 0;
    }
    public Map <String, List<Contract1__c>> getMapContract() {
        for (Payment__c pay : paymentAll) {
            System.debug(pay.ContractReleated__r.id);
            System.debug('eeeee' + ApexPages.CurrentPage().getParameters().get('id'));
            if(pay.ContractReleated__r.ContactReleated__c == ApexPages.CurrentPage().getParameters().get('id')) {
                KeysValues.add(String.valueOf(pay.Payment_Date__c.Year()));
            }
            }

        for (String dat : KeysValues) {
            List <Contract1__c> lst = new List<Contract1__c>();
            for (Contract1__c contr : contractAll) {
                for (Integer i = 0; i < contr.Payments__r.size(); i++) {
                    System.debug(i+'    ' + contr.Payments__r.size());
                    if (dat == String.valueOf(contr.payments__r[i].payment_date__c.year()) && contr.id == contr.payments__r[i].ContractReleated__c) {
                        lst.add(contr);
                        System.debug('лист в форе ' + lst);
                    }
                }
            }
            mapContractSortDate.put(dat, lst);
            System.debug('mapka ' + mapContractSortDate);
        }
        return mapContractSortDate;
    }
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        for(String str : KeysValues){
            options.add(new SelectOption(str,str));
        }
        return options;
    }
    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
    public void getListContractForYear(){
        sumAmount = 0;
        lstContract = mapContractFinishMap.get(year);
        System.debug('listInGoD' + lstContract);
        for(Contract1__c contr: lstContract){
            sumAmount = contr.amount__c + sumAmount ;
            System.debug('aaaaaaa ' + contr.amount__c);
            System.debug(sumAmount);
        }


    }



}