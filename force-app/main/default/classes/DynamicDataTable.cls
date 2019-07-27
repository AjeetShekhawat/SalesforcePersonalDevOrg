public class DynamicDataTable {
    @AuraEnabled
    public static List<String> fetchFieldSetRecords(String objectTypeName, String fieldSetName) {
        Schema.SObjectType sObj = Schema.getGlobalDescribe().get(objectTypeName);
        List<String> fieldSetList = new List<String>();
        FOR(Schema.FieldSet FS : sObj.getDescribe().fieldSets.getMap().values()){
            fieldSetList.add(fs.getName() +'####'+fs.getLabel());
        }
        System.debug('field set is ' + fieldSetList);
        return fieldSetList;
        
        
    }
}