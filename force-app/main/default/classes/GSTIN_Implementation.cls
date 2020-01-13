/***************************************************
**Class Name:GSTIN_Implementation
**Created By:Vineet Kumar
**Created Date:09/10/2019
**Description:This class is to search GST Holder from GST Portal and then creation of new account  
*****************************************************/
public class GSTIN_Implementation {
    /*
    //   public  static Account       acc {get;set;}
    public  Account       acc {get;set;} // will hold the reference of record from StandardController (stdc)
  //  public  boolean       isClicked  {get;set;}
    public  String        gstin  {get;set;}  // will hold gst number
    public  List<Account> accList  {get;set;}  // will hold duplicate account record that is already there in the system
    public  boolean       duplicateFlag {get;set;}  // will hold flag for duplicate if true the will show duplicate block table
    public  boolean       newRecordBlockFlag {get;set;} 
    public  boolean       proprietorshipFlag {get;set;} // if Constitution_of_Business__c (from GST Service) equals to Proprietorship then show
    public  static boolean       errorFlag {get;set;}  // used to show error if no data retrieved from GST Portal
    public  ApexPages.StandardController std;
    public  String         recordTypeName {get;set;} // will hold name of the record type for the new record, will be used in visualforce page
 

    public GSTIN_Implementation() {
        
    }

    //Constructor
    public GSTIN_Implementation(ApexPages.StandardController stdc)
    {
        Id i = stdc.getId();
        if( i== null)  // in this case if id equals to null , it means that it's a new account creation
        {
            // get the record type name
            if(((Account)stdc.getRecord()).recordTypeId!=null)
            {
                // get the record type id if it is selected by user
                recordTypeName=[SELECT id,name FROM RecordType WHERE id=:((Account)stdc.getRecord()).recordTypeId].name;
            }
            else  
            {
                // get the default record type assigned to user in case if only one record type is assigned to user that is also default  
                // and user will not select any record type at account creation level (in this case we cant get record type id from standard controller)
                List<Schema.RecordTypeInfo> infos = Schema.SObjectType.Account.RecordTypeInfos;
                Id defaultRecordTypeId;
                //check each one
                for (Schema.RecordTypeInfo info : infos) {
                    if (info.DefaultRecordTypeMapping) {
                        defaultRecordTypeId = info.RecordTypeId;
                    }
                }
                recordTypeName=[SELECT id,name FROM RecordType WHERE id=:defaultRecordTypeId].name;
            } 
        }
        else // on edit account record
        {
            recordTypeName=[SELECT id,name FROM RecordType WHERE id=:((Account)stdc.getRecord()).recordTypeId].name;
            System.debug('recordTypeName ' + recordTypeName);
        }
        
        std=stdc;
        this.acc = (Account)stdc.getRecord();    // get the reference of new record from standard controller and assign to acc
        duplicateFlag = false; // initially while new creation page we are making duplicateFlag as false
        proprietorshipFlag = false;
        errorFlag = false;
        newRecordBlockFlag = true;
    }
    
    
    // This method is being called on click of gst search button
    // Description : if there is any duplicate record with the entered gst number in the system then fetch the record and show to the user  
    //  and if there is no duplicate record then fetch the data from GST Portal
    public void getData(){ 
        System.debug('Inside callApex');
        accList = [SELECT id,name,gstin__C,owner.name FROM Account WHERE gstin__C =: gstin];
        if(accList.size() > 0)
        {
            errorFlag = false;
            duplicateFlag = true;
            gstin = null;     
        }
        else
        {             
            mapGstData(acc, gstin); // call gst method to map received GST Portal values to GST section field
        }
    }

    // This method is being called on clicking Ignore Alert button, will fetch the data from GST Portal (hitting GST service)
    public void getDataOnIgnore(){
        System.debug('Inside callApexOnIgnore ' + acc);
        duplicateFlag = false;
        mapGstData(acc, gstin); // call gst method to map received GST Portal values to GST section field
    }

    public void mapGstData(Account acc, String gstin) {
        System.debug('accRef ' + acc + ' gstin ' + gstin);
        fromJSON gstResponse = GSTIN_Implementation.callGstService(gstin);  //  callGstService() will call Webservice        
        if (gstResponse != null) {
            result rs =  gstResponse.result; // fetching list of gst section field from GST Portal JSON data
        //    System.debug('ccccccc ' + rs.pradr.addr.bnm + ' ' + rs.pradr.addr.lg + ' @');
            if (rs != null) {
                if (rs.gstin != null && rs.gstin != '') {
                    acc.GSTIN__c = rs.gstin;
                }
                if (rs.lgnm != null && rs.lgnm != '') {
                    acc.Legal_Name_of_Business__c = rs.lgnm;
                    acc.Name = rs.lgnm; // Map Legal business Name to Account Name and  Account will be in ecit mode.
                }
                System.debug('rs.pradr ' + rs.pradr);
                if (rs.pradr != null) {
                    if (rs.pradr.addr != null) {
                        acc.Principal_Place_of_Business__c = rs.pradr.addr.bnm + ' ' +
                                                            rs.pradr.addr.st + ' ' +
                                                            rs.pradr.addr.loc + ' ' +
                                                            rs.pradr.addr.bno + ' ' +
                                                            rs.pradr.addr.dst + ' ' +
                                                            rs.pradr.addr.stcd + ' ' +
                                                            rs.pradr.addr.city + ' ' +
                                                            rs.pradr.addr.flno + ' ' +
                                                            rs.pradr.addr.lt + ' ' +
                                                            rs.pradr.addr.pncd + ' ' +
                                                            rs.pradr.addr.lg;
                    }
                }
                System.debug('rs.adadr ' + rs.adadr);
                if (rs.adadr != null) {
                    if (rs.adadr[0].addr != null) { 
                        acc.Additional_Place_of_Business__c = rs.adadr[0].addr.bnm + ' ' +
                                                                rs.adadr[0].addr.bnm + ' ' +
                                                                rs.adadr[0].addr.st + ' ' +
                                                                rs.adadr[0].addr.loc + ' ' +
                                                                rs.adadr[0].addr.bno + ' ' +
                                                                rs.adadr[0].addr.dst + ' ' +
                                                                rs.adadr[0].addr.stcd + ' ' +
                                                                rs.adadr[0].addr.city + ' ' +
                                                                rs.adadr[0].addr.flno + ' ' +
                                                                rs.adadr[0].addr.lt + ' ' +
                                                                rs.adadr[0].addr.pncd + ' ' +
                                                                rs.adadr[0].addr.lg;
                    }
                }
                if (rs.rgdt != null && rs.rgdt != '') {
                    acc.Date_of_Registration__c = Date.parse(rs.rgdt);
                }
                if (rs.ctb != null && rs.ctb != '') {
                    acc.Constitution_of_Business__c = rs.ctb;
                    if (rs.ctb == 'Proprietorship') {
                        proprietorshipFlag = true;
                    }
                }
                if (rs.sts != null && rs.sts != '') {
                    acc.GSTN_Status__c = rs.sts;
                }
            }
        }
    }
    
    
    // This method will call GST Portal API.
    public static fromJSON callGstService (String gstin)
    {
        
        string endPointURL = Label.GST_EndPoint_URL + gstin;   // GST_EndPoint_URL : https://gsp.adaequare.com/test/enriched/commonapi/search?action=TP&gstin=       
        string method ='GET';       
        string accessToken='';       
        
        if(!test.isRunningTest())
            accessToken = getAccessToken();
        
        String authorizationHeader = 'Bearer '+accessToken;
        System.debug('-----authorizationHeader--'+authorizationHeader);
        
        // Map to create Header to call api
        map<string,string> headerMap = new Map<string,string>();
        headerMap.put('Content-Type','application/json' );
        headerMap.put('Authorization',authorizationHeader );
        
    //    try{
            
            HttpResponse response = new HttpResponse();   
            response = HttpUtility.sendHTTPRequest(endPointURL,method,120000,null,headerMap);  
            
            fromJSON obj = (fromJSON) System.JSON.deserialize(response.getBody(), fromJSON.class); // map GST Portal data to wrapper class data
            system.debug('----obj--'+obj.success+'----'+obj.status);
            fromJSON returnGSTData;
            if(obj.success == true){       	    
                returnGSTData = obj;
                System.debug('returnGSTData '+ returnGSTData);
                errorFlag = false;
            } 
            else {
                errorFlag = true;
            }
        //}
        // catch(Exception ex){
        //     System.debug('Exception in future ' + ex.getMessage());
        //     System.debug('Exception in future ---- ' + ex);
        // }  
        return returnGSTData;
    }
    
    // This method is used to get Access Token using CLient Id and Client secret.  
    public static string getAccessToken(){
        
        string returnAccessToken='';
        string endPoint = Label.GST_Token_Access_URL; // GST_Token_Access_URL : https://gsp.adaequare.com/gsp/authenticate?grant_type=token
        string method ='POST';
        
        string appid = Label.GSTAppId;
        string appSecret = Label.GSTAppSecret;
        
        // Map to hold apiId(Client Key) and apiSecret(CLient Secret) 
        map<string,string> headerMap = new Map<string,string>();
        headerMap.put('gspappid',appid);
        headerMap.put('gspappsecret',appSecret);
        
        HttpResponse response = new HttpResponse(); 
        
        response = HttpUtility.sendHTTPRequest(endPoint,method,120000,null,headerMap);         
        system.debug('----response--'+response.getBody());
        
        Map<string,string> resultMap = new Map<string,string>();
        resultMap  = (Map<string,string>)JSON.deserialize(response.getBody(), Map<string,string>.class);        
        system.debug('----resultMap--'+resultMap);
        
        returnAccessToken = resultMap.get('access_token');
        
        System.debug('returnAccessToken --- ' + returnAccessToken);
        
        return returnAccessToken;
        
    }
    
    public class fromJSON{
        public boolean success;
        public String message;	//Search taxpayer is completed successfully
        public result result;
        public Integer status;	//200
        public String errorCode;	//1000
        
    } 
    public class result{
        public String stjCd;	
        public String dty;	
        public String lgnm;	
        public String stj;	
        public String cxdt;	
        public String gstin;	
        public String lstupdt;	
        public String ctb;	
        public String rgdt;	
        public String ctjCd;	
        public String tradeNam;	
        public String sts;	
        public String ctj;	
        public pradr pradr;
        public List<adadr> adadr;
    }
    
    public class pradr{
        public address addr;
        public string ntr;
    }

    public class adadr {
		public address addr;
        public string ntr;
	}
    
    public class address{
        public String bnm;	
        public String st;	
        public String loc;	
        public String bno;	
        public String dst;	
        public String stcd;	
        public String city;	
        public String flno;	
        public String lt;	
        public String pncd;	
        public String lg;	    
    }
    */
}