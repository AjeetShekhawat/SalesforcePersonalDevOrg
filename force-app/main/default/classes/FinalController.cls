/******************************************
 * Created By  : Ajeet Singh Shekhawat
 * Created On  : 12-jul-2018
 * Modified By : 
 * Modified On : 12-jul-2018
 * Description :                          
*/ 
public class FinalController {
    
	List<User> acclistFilter = new List<User>();
    List<User> acclistFilter1 = new List<User>();
    set<user> userSet = new set<user>();
    set<user> userSet1 = new set<user>();
    // define setter getter
    public String search{get;set;}
    public String count{get;set;}
    public String count1{get;set;}
    public List<SelectOption> numberOfQuestions;
    public List<SelectOption> numberOfQuestions1;
    
    public FinalController() {
        acclistFilter = [select Username, city, Department from user];
    }
    // for picklist1
    public List<SelectOption> getnumberOfQuestions() 
    {
    	List<User> userList = [select city from user where city != null];
        userSet.addAll(userList);
        numberOfQuestions = new List<SelectOption>();
        numberOfQuestions.add(new SelectOption('All City','All City'));
        for(user usr : userSet) {
            System.debug('usr ' +usr.City);
	        numberOfQuestions.add(new SelectOption(usr.city, usr.city));    
        }
        return numberOfQuestions;
    }
    
     // for picklist2
    public List<SelectOption> getnumberOfQuestions1()
    {
        List<User> userList1 = [select Department from user where Department != null];
        userSet1.addAll(userList1);
        System.debug('userList1 ' + userList1);
        numberOfQuestions1 = new List<SelectOption>();
        numberOfQuestions1.add(new SelectOption('All Department','All Department'));
        for(user usr : userSet1) {
            numberOfQuestions1.add(new SelectOption(usr.Department, usr.Department));
        }
        return  numberOfQuestions1;
    }
    public void showQuestions() {
     /*   String s1 = 'select Username, city, Department from user where city LIKE \''+count+'%\''; 
        String s2 = 'select Username, city, Department from user where Department LIKE \''+count1+'%\''; 
        acclistFilter = Database.query(s1);
        acclistFilter1 = Database.query(s2); */
        System.debug('count ' +count);
        System.debug('count1 ' +count1);
        System.debug('acclistFilter of show' + acclistFilter);
        if(count != 'All City' && count1 == 'All Department') {
            //acclistFilter = [select Username, city, Department from user];
        }
        if(count == 'All City' && count1 != null) {
            System.debug('inside if1 count ' +count);
        	System.debug('inside if1 count1 ' +count1);
            String s = 'select Username, city, Department from user where Department LIKE \''+count1+'%\'';
            acclistFilter = Database.query(s);
            System.debug('inside acclistFilter ' +acclistFilter);
        }
        if(count != null && count1 == 'All Department') {
            System.debug('inside if2 count ' +count);
        	System.debug('inside if2 count1 ' +count1);
            String s = 'select Username, city, Department from user where city LIKE \''+count+'%\'';
            acclistFilter = Database.query(s);
        }
        if(count != null && count1 != null) {
            System.debug('inside if3 count ' +count);
        	System.debug('inside if3 count1 ' +count1);
            String s = 'select Username, city, Department from user where city LIKE \''+count+'%\'';
            acclistFilter = Database.query(s);
        }
    }
    public PageReference afterSearch() {
        if(search != null) {
            String s = 'select Username, city, Department from user where Username LIKE \''+search+'%\'';
        	acclistFilter = Database.query(s);
        }
        return null;
    }
    public List<User> getacclistFilter() {
        System.debug('acclistFilter of getter' + acclistFilter);
        return acclistFilter;
    }
}