public class TestProgram1 {
    
    public List<AccWrapper> accList{get;set;}
    public List<Account> selAccList{get;set;}
    public TestProgram1(){
        accList = new List<AccWrapper>();
        selAccList = new List<Account>();
        doLoadAccountData();
    }   
    public void doLoadAccountData(){
        for(Account acc : [select id,name,industry,Phone,type from account]){
   			AccWrapper wrp = new AccWrapper();
            wrp.check = false;
            wrp.acct  =  acc;
            accList.add(wrp);
        }
    }
    
    public void doSelectedRecord(){
        for(AccWrapper wrap : accList){
            if(wrap.check==true){
                delete(wrap.acct);              
            }
        }
    }
    
    public class AccWrapper{
        public Boolean check{get;set;}
        public Account Acct{get;set;}
    }
}