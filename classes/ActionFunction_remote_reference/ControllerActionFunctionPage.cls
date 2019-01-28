global with sharing class ControllerActionFunctionPage {

    public String nameBut { get; set; }
    public String objectName { get; set; }
    public static List<sObject>sobjList { get; set; }
    public String InPutValue { get; set; }
    public String InPutValue2 { get; set; }
    public Boolean visibleBlock1 { get; set; }
    public Boolean visibleBlock2 { get; set; }
    public Boolean visibleBlock3 { get; set; }
    public List<String> lstBlockName { get; set; }
    String [] BoolValue = new String[]{};

    public ControllerActionFunctionPage() {
        lstBlockName = new List<String>{
                'Block1', 'Block2 ', 'Block3 '
        };
        visibleBlock1 = true;
        visibleBlock2 = true;
        visibleBlock3 = true;
    }
    public String getNameButton() {
        return nameBut;
    }
    // возвращает в переменую имя кнопки из apex:param
    public PageReference WriteNameButton() {
        String param = ApexPages.currentPage().getParameters().get('pamParam');
        nameBut = param;
        System.debug(nameBut);
        return null;
    }
    @RemoteAction
    global static List<sObject> getFieldsForInputObject(String objectName) {
        sobjList = Database.query('SELECT id, name, Phone FROM ' + objectName + ' LIMIT 5');
        System.debug('lis' + sobjList);
        return sobjList;
    }
    public PageReference forButton1() {
        PageReference pageref1 = Page.AllContactsForOrg;
        pageref1.setRedirect(true);
        return pageref1;
    }
    public PageReference forButton2() {
        PageReference pageref2 = Page.BasicClassPage;
        pageref2.setRedirect(true);
        return pageref2;
    }
    public PageReference forButton3() {
        PageReference pageref3 = Page.TemplateForPage;
        pageref3.setRedirect(true);
        return pageref3;
    }
    public PageReference forWebButton1() {
        PageReference pagewebref1 = new PageReference('http://top-radio.ru/web');
        pagewebref1.setRedirect(true);
        return pagewebref1;
    }
    public PageReference forWebButton2() {
        PageReference pagewebref2 = new PageReference('http://www.illuminatedcloud.com/support/faq');
        pagewebref2.setRedirect(true);
        return pagewebref2;
    }
    public PageReference forWebButton3() {
        PageReference pagewebref3 = new PageReference('http://google.com');
        pagewebref3.setRedirect(true);
        return pagewebref3;
    }
    // метод кладёт данные в урл страницы
    public PageReference setParamsForPage() {
        PageReference pageSetParametrs = Page.ActionFunctionPage;
        pageSetParametrs.getParameters().put(InPutValue, InPutValue2);
        pageSetParametrs.setRedirect(true);
        return pageSetParametrs;
    }
    //  render видимость блоков на странице
    public List <SelectOption> getCheckBoxMetod() {
        List <SelectOption> selectionCheckBoxList = new List<System.SelectOption>();
        selectionCheckBoxList.add(new SelectOption('block1', 'block1'));
        selectionCheckBoxList.add(new SelectOption('block2', 'block2'));
        selectionCheckBoxList.add(new SelectOption('block3', 'block3'));
        return selectionCheckBoxList;
    }
    public String[] getBoolItem() {
        return BoolValue;
    }
    public void setBoolItem(String[] BoolValue) {
        this.BoolValue = BoolValue;
    }
    public PageReference refPage(){
        visibleBlock1 = false;
        visibleBlock2 = false;
        visibleBlock3 = false;
        for(String stringItemForBox : BoolValue) {
            if(stringItemForBox == 'block1') {
                visibleBlock1 = true;
            }
            if(stringItemForBox == 'block2') {
                visibleBlock2 = true;
            }
            if(stringItemForBox == 'block3') {
                visibleBlock3 = true;
            }
        }
        return null;
    }
}