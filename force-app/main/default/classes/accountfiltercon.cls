public class accountfiltercon {
    public String enterText{get;set;}
  //  public List<String> searchName{get;set;}
    public String accList{get;set;}
    public List<String> accountName{get;set;}
    public accountfiltercon() {
        accountName = new List<String>();
        getsearchName();
    }
    public List<String> getsearchName() {
        accList = 'select name from account where name LIKE \''+enterText+'%\''; 
        accountName.add(accList);
        return accountName;
    }
}