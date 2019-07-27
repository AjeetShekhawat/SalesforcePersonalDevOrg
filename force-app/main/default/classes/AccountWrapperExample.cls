/******************************************
 * Created By  : Ajeet Singh Shekhawat
 * Created On  : 25 jul 2018
 * Modified By : 
 * Modified On : 25 jul 2018
 * Description : to find total contact and return account list using wrapper class.                         
******************************************/ 
public class AccountWrapperExample {
    @AuraEnabled
    public static Model.ActionResult readRecord(String jsonObject) {
        Model.ActionResult actionResult = new Model.ActionResult();
        Model.InputClass accWr = (Model.InputClass) JSON.deserialize(jsonObject, Model.InputClass.Class);
        System.debug(accWr);
        String objName = accWr.objName;
        List<String> fieldList = accWr.fieldList;
        Integer limitRecord = accWr.limitRecord;
        String query = 'SELECT ' + joinList(fieldList, ',') + ' FROM ' + objName + ' LIMIT ' + limitRecord;
        System.debug('Query ' + query);
        List<sObject> sObjList = Database.query(query);
        Integer totalContact = sObjList.size();
        actionResult.sObjList = sObjList;
        actionResult.totalContact = totalContact;
        return actionResult;
    }
    Public static String joinList(LIST<String> strList, String delimiter) {
        String s = '';
        if(!strList.isEmpty()) {
            s = String.join(strList, delimiter);
        } else {
            s = 'id';
        }
        return s;
    }
}