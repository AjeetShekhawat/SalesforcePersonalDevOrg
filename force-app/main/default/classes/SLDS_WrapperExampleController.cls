public class SLDS_WrapperExampleController {
    
    public List<AccWrapper> accList{get;set;}
    public List<Account> selAccList{get;set;}
    public SLDS_WrapperExampleController(){
        accList = new List<AccWrapper>();
        selAccList = new List<Account>();
        doLoadAccountData();
    }   
    public void doLoadAccountData(){
        for(Account acc : [select id,name,industry,rating,type from account]){
   			AccWrapper wrp = new AccWrapper();
            wrp.check = false;
            wrp.acct  =  acc;
            accList.add(wrp);
        }
    }
    
    public void doSelectedRecord(){
       selAccList.clear();
        for(AccWrapper wrap : accList){
            if(wrap.check==true){
                selAccList.add(wrap.acct);
            }else{
                continue;
            }
        }
    }
    
    public class AccWrapper{
        public Boolean check{get;set;}
        public Account Acct{get;set;}
    }
}