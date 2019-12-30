// Used in OBjectFieldDownload lightning component
public class ObjectFieldRetrievalController {
    public ObjectFieldRetrievalController(){
        
    }
    @AuraEnabled
    public static List<String> getObjectNames(){
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        List<String> options = new List<String>();
        for(SObjectType f : gd){
            options.add(f.getDescribe().getName());
            options.sort();        
        }
        System.debug('options--->>' + options);
        return options;
    }
	@AuraEnabled
    public static list<wrapperClass> getObjectFields(String objectName){
        List<wrapperClass> fields = new List<wrapperClass>();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        Schema.sObjectType objType = globalDescription.get(objectName);
        map<String,String> tempMap = new map<String,String>();
        Schema.DescribeSObjectResult r1 = objType.getDescribe(); 
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();  
        for(Schema.SObjectField field : mapFieldList.values())  {  
            Schema.DescribeFieldResult fieldResult = field.getDescribe();  
            system.debug(fieldResult);
            
            if(fieldResult.isAccessible()  && fieldResult.isCreateable())  {
                system.debug(fieldResult.getType()+' ddfdfd '+fieldResult.getReferenceTargetField()+' -------  '+fieldResult.getReferenceTo()+' -------  '+fieldResult.getRelationshipOrder()+' -------  '+fieldResult.getLabel());
            system.debug(fieldResult.htmlformatted);
                //tempMap.put(fieldResult.getLabel(),fieldResult.getName());
                fields.add(new wrapperClass(fieldResult.getLabel(),fieldResult.getName(),String.ValueOf(fieldResult.getType())));
            }  
            
        }
        for(String name : tempMap.keySet()){
            //fields.add(new wrapperClass(name,tempMap.get(name)));
        }
        //List<String> so = new List<String>();
        //for(String fs : fields){
           // so.add(fs);
            //fields.sort();
        //} 
        return fields;
    }
    public class wrapperClass{
        @AuraEnabled
        public string fieldName = '';
        @AuraEnabled 
        public string fieldApi = '';
        @AuraEnabled 
        public string fieldType = '';
        public wrapperClass(String fName,String fApiName,String fType){
            fieldName = fName;
            fieldApi = fApiName;
            fieldType = fType;
        }
    }
}