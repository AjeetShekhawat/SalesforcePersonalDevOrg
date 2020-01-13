public class accountfiltercon {
    public String Name{get;set;}
    public String test {get; set;}
    public String enterText{get;set;}
    public String accList{get;set;}
    public List<String> accountName{get;set;}
   
    
    public accountfiltercon() {
        System.debug('coming ' + test);
        accountName = new List<String>();
        Name = 'Ajay Test';
        getsearchName();
    }
    public List<String> getsearchName() {
        accList = 'select name from account where name LIKE \''+enterText+'%\''; 
        accountName.add(accList);
        return accountName;
    }
}