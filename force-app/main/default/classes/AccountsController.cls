public without sharing class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        if (Schema.sObjectType.Account.fields.Type.isAccessible()) {
            return [SELECT Id, name, Type, Industry, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
        } else {
            return [SELECT Id, name, Type,Industry, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
        }
        
    }

    @AuraEnabled
    public static Object saveList(Object listObject) {
        return listObject;
    }

    @AuraEnabled
    public static String doInit() {
        return 'Hi This is from Apex DoInit';
    }

    @AuraEnabled
    public static List<ObjectInfo> getAllObjectName() {
        List<String> SObjectList = new List<String>();
        List<ObjectInfo> objWrapperList = new List<ObjectInfo>();

        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String name = objTyp.getDescribe().getName();
            
            // Exclude all the unwanted Sobjects e.g. History, Share etc..

            // if((!name.containsignorecase('history') && !name.containsignorecase('tag')&&
            //     !name.containsignorecase('share') && !name.containsignorecase('feed')) || 
            //     name.toLowerCase().right(3) ==  '__c') {      
            //     SobjectList.add(name);
            //     System.debug( 'Name : ' + name);
            //     objWrapperList.add(new ObjectInfo(objTyp.getDescribe().getLabel(), 
            //                                     objTyp.getDescribe().getName()));
            // }
            if(name.toLowerCase().right(3) ==  '__c') {      
                objWrapperList.add(new ObjectInfo(objTyp.getDescribe().getLabel(), 
                                                 objTyp.getDescribe().getName()));
                System.debug( 'objWrapperList : ' + objWrapperList);
            }
        }
        return objWrapperList;
    }

    @AuraEnabled
    public static List<FieldInfo> getFieldsInfo(String objectName) {
        System.debug('objectName ' + objectName);
        List<FieldInfo> wrapperList = new List<FieldInfo>();
        List<String> fieldsName = new List<String>();
        Map<String,Schema.DescribeFieldResult> finalMap = new Map<String, Schema.DescribeFieldResult>();
        SObjectType accountType = Schema.getGlobalDescribe().get(objectName);
        Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
        fieldsName.addAll(mfields.keyset());
        for(String field : fieldsName){
            // skip fields that are not part of the object
            if (mfields.containsKey(field)) {
                Schema.DescribeFieldResult dr = mfields.get(field).getDescribe();
                // add the results to the map to be returned
                finalMap.put(field, dr); 
                System.debug('drrrrrr  ' + mfields.get(field).getDescribe().getLabel());
                wrapperList.add(new FieldInfo(mfields.get(field).getDescribe().getLabel(), 
                                                mfields.get(field).getDescribe().getName(),
                                                mfields.get(field).getDescribe().getType())); //mfields.get(field).getDescribe().getType()
                
            }
        }
        System.debug('wrapperList ' + wrapperList);
        return wrapperList;
    }

    @AuraEnabled
    public static void saveFormRecords(String jsonFile) {
        System.debug('jsonFile ' + jsonFile);
        Form__c f = new  Form__c();
        f.JSON_Data__c = jsonFile;
        Insert f;
    }

    public class FieldInfo {
        @AuraEnabled public String fieldLabel;
        @AuraEnabled public String fieldName;
        @AuraEnabled public Schema.DisplayType fieldType;
        public FieldInfo() {

        }
        public FieldInfo(String fieldLabel, String fieldName, Schema.DisplayType fieldType) {//, Schema.DisplayType fieldType
            this.fieldLabel = fieldLabel;
            this.fieldName = fieldName;
            this.fieldType = fieldType;
        }
    }

    public class ObjectInfo {
        @AuraEnabled public String objLabel;
        @AuraEnabled public String ObjName;
        public ObjectInfo() {

        }
        public ObjectInfo(String objLabel, String ObjName) {
            this.objLabel = objLabel;
            this.ObjName = ObjName;
        }
    }
}
/*
String sobjectname = 'forOppo__c' ; //object api name
String fieldapiName = 'currenyonoppo__c'; //Field api name
String fieldTypeName = Schema.getGlobalDescribe().get(sobjectname).getDescribe().fields.getMap().get(fieldApiName).getDescribe().getType().name().toupperCase(); 
String fieldTypeName1 = Schema.getGlobalDescribe().get(sobjectname).getDescribe().fields.getMap().get(fieldApiName).getDescribe().getLabel().toupperCase(); 
String fieldTypeName2 = Schema.getGlobalDescribe().get(sobjectname).getDescribe().fields.getMap().get(fieldApiName).getDescribe().getName().toupperCase(); 

System.debug('*** fieldTypeName type = ' + fieldTypeName);   
System.debug('*** fieldTypeName label = ' + fieldTypeName1);   
System.debug('*** fieldTypeName Name = ' + fieldTypeName2); 
*/