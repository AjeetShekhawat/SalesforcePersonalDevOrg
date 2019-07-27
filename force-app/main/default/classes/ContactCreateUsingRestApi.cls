@RestResource(urlMapping='/ContactCreateUsingRestApi/*')
global class ContactCreateUsingRestApi {
	
/*    @httpPost
    global static String doCreateContact(String Name, String Phone) {
        Account con = new Account();
        con.Name = Name;
        con.Phone = Phone;
        insert con;
        return con.Id;
    }	*/
    
    @httpPost
    global static AccountWrapper doCreateContact(AccountWrapper accWrapper) {
        
        return accWrapper;
     
    }
    global class AccountWrapper {
        public String Name{get;set;}
        public Decimal Phone{get;set;}
        //public static String Name{get;set;}
        //public transient Decimal Phone{get;set;}
    }
}