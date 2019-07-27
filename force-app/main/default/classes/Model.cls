public class Model {
    
    public class InputClass {
        @AuraEnabled public LIST<String> fieldList{get;set;}
        @AuraEnabled public String objName{get;set;}
        @AuraEnabled public Integer limitRecord{get;set;}
    }
    
    public class ActionResult {
        @AuraEnabled public LIST<Sobject> sObjList{get;set;}
        @AuraEnabled public Integer totalContact{get;set;}
    }        
    
    
    @AuraEnabled public String headerName{get;set;}
    
}