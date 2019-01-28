/**
 * Created by User on 14.01.2019.
 */

public with sharing class WorkbenchLightController {
    @AuraEnabled
    public static List<String> getObjectNameList() {
        List <String> objectListName = new List<String>();
        for (Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()) {
            if (objTyp.getDescribe().isCustom() && objTyp.getDescribe().isAccessible()) {
                objectListName.add(objTyp.getDescribe().getName());
            }
        }
        System.debug('objectListName: ' + objectListName);
        List<String> objects = new List<String>{
                'Account', 'Activity', 'Asset', 'AssetRelationship', 'Campaign', 'CampaignMember', 'Case', 'Contact', 'ContentVersion', 'Contract', 'DandBCompany',
                'DuplicateRecordItem', 'DuplicateRecordSet', 'EmailMessage', 'Event', 'Lead', 'Macro', 'Opportunity', 'OpportunityLineItem', 'Order', 'OrderItem', 'Pricebook2',
                'PricebookEntry', 'Product2', 'QuickText', 'Scorecard', 'ScorecardAssociation', 'ScorecardMetric', 'SocialPersona', 'Task', 'User', 'UserProvisioningRequest'
        };
        objectListName.addAll(objects);
        objectListName.sort();
        return objectListName;
    }

    @auraEnabled
    public static List<String> getFieldsForObject (String nameObject) {
        System.debug('nameObject ' + nameObject);
        List<String> fieldsForObject = new List<String>();
        Map<String, Schema.SObjectType> mapAllobject;

        mapAllobject = Schema.getGlobalDescribe();
        Schema.SObjectType sobjType = mapAllobject.get(NameObject);
        Schema.DescribeSObjectResult describeResult = sobjType.getDescribe();
        Map<String, Schema.SObjectField> fieldsMap = describeResult.fields.getMap();

        for (Schema.SObjectField str : fieldsMap.values()) {
                fieldsForObject.add(str.getDescribe().getName());
        }
        System.debug('list fields : ' + fieldsForObject);
        return fieldsForObject;
    }

    @auraEnabled
    public static List<Object> requestForOrg (String finalQuery) {
        return Database.query(finalQuery);
    }
}
