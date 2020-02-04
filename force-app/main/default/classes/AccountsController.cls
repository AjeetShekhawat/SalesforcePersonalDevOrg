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
/***************************************************************************************************** */
/** Used in formJsonCreate lightning web component */
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
    }

/***************************************************************************************************** End */    

    /* Used in whatsAppPage lightning web component */
    @AuraEnabled
    public static Form__c saveWhatsAppForm(String formData) {
        System.debug('formData ' + formData);
        List<FormDataWrapper> formDataWrpList = new List<FormDataWrapper>();
        FormDataWrapper formDataWrp = (FormDataWrapper) JSON.deserialize(formData, FormDataWrapper.class);
        Form__c formRecord = new Form__c();
        if(formDataWrp.mobileNumber != null) {
            formRecord.To__c = formDataWrp.mobileNumber;
        }
        if(formDataWrp.message != null) {
            formRecord.Message__c = formDataWrp.message;
        }
        if(formDataWrp.sendAt != null) {
            formRecord.Sent_At__c = Date.valueOf(formDataWrp.sendAt);
        }
        if(formDataWrp.sendNow != null) {
            formRecord.Send_Now__c = formDataWrp.sendNow;
        }
        System.debug('formRecord --- ' + formRecord);
        Insert formRecord;
        return formRecord;
    }
/***************************************************************************************************** End */ 

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
    public class FormDataWrapper {       
        public String mobileNumber;
        public String message;
        public String sendAt;
        public Boolean sendNow;
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