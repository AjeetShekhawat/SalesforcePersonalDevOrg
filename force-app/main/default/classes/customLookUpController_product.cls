public class customLookUpController_product {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, string searchfilter) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List < sObject > returnList = new List < sObject > ();
        
        String sQuery='';
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        system.debug('the searchfilter is:'+searchfilter);
        if(searchfilter !=null && searchfilter!='' && searchfilter=='showercub')
        {
            string Product_Category ='Shower Cubicles';
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND Product_Category__c=:Product_Category AND isActive = true AND global_product__c=FALSE AND master_product__c=FALSE order by CreatedDate DESC limit 5';
        }
        else if(searchfilter !=null && searchfilter!='' && searchfilter=='ERP')
        {
            string recordTypeName ='ERP';
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND recordtype.name=:recordTypeName order by CreatedDate DESC limit 5';
            
        }
        else
            if(searchfilter.contains('showercub---'))
        {          
            /******************************************************************  We need to display all Global products. So change the query       

list<string> strlist =  searchfilter.split('---');              
string parentPrdId = strlist[1];
sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND Parent_product__c=:parentPrdId order by createdDate DESC limit 5';
system.debug('the strlist is:' +strlist+'....'+sQuery);
******************************************************************/ 
            
            
            //   sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND global_product__c=TRUE AND isActive = true order by CreatedDate DESC limit 5';
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND master_product__c=TRUE AND external_id__c != null AND isActive = true order by CreatedDate DESC limit 5';
            
        }
        else if(searchfilter=='Inspire+Infinity'){
            set<string> prdCat = new set<string>{'Infinity','Inspire'};
                sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND Product_Category__c in:prdCat AND isActive = true order by CreatedDate DESC limit 5';
            
        }
        else if(searchfilter=='priceRequest-EnqComponent'){
            
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by CreatedDate DESC limit 5';
            
        }
        else if(searchfilter=='priceRequest-customer'){
            
            
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND SAP_Code__c!= null order by CreatedDate DESC limit 5';
            system.debug('The sQuery is :'+sQuery);
        }
        else
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by CreatedDate DESC limit 5';
        
        
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        
        
        return returnList;
    }
    
    // Uncomment this block and replace object name with your org object name
    /*
@AuraEnabled
public static List<Price_Request__c> doFetchPriceRequest(String accId,String proId){
List<Price_Request__c> prcList = new List<Price_Request__c>();
if(accId!=null && proId!=null){
prcList = [select id,name,BOM_Required_Price__c,Discount__c,Price_Type__c,Required_Price__c,
Requested_Quantity__c,Installation_Cost__c,Opportunity_Product__r.Name,Valid_From__c,
Valid_To__c,Product__c,Customer__c,Remarks__c,Approval_Remarks__c,Submitter_Remark__c from Price_Request__c where 
Opportunity_Product__r.Product__c=:proId and 
Opportunity__r.accountId = :accId and Approval_Status__c = 'Approved' ];    
}
return prcList;      
}  */
}