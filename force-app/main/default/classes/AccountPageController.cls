// Apex Controller responsible for Entry of Account Records

public class AccountPageController {
	public list <Account> acc {get;set;}
	public String message{get;set;}
	public AccountPageController(){
        string searchquery = 'select name, id from Account Limit 20';
        acc = Database.query(searchquery);
	}
	public PageReference quickUpdat(){
        try {
            update acc;
            return ApexPages.CurrentPage();
        } catch(Exception e){
            message = 'Data Base error during saving...';
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, message));
            return null;
        }
	}
}