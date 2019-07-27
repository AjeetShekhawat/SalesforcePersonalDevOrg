public class DataListExample {

	List<Account> accounts;

	public List<Account> getAccounts() {
		if(accounts == null) accounts = [SELECT id, Name FROM Account LIMIT 10];
		return accounts;
	}

}