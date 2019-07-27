public class RealTask1Controller {
    public List<wrapperClass> wrapperList{get;set;}
    public List<Account> acclist = new List<Account>();
    public Account act{get;set;}
   
   public RealTask1Controller()
   {
       act = new Account();
       wrapperList = new List<wrapperClass>();
       List<Account> acclist2 = new List<Account>([select Name,Description,Rating,AnnualRevenue from Account]);
       for(Integer i=0;i<acclist2.size();i++)
       {
           wrapperList.add(new wrapperClass(String.ValueOf((i+1)),accList2[i]));
       }
   }
   
   public List<Account> getacclist()
   {
       acclist = [select Name,Description,Rating,AnnualRevenue from Account];
       return acclist;
   }
   public class wrapperClass
   {
       public boolean checkBox{get;set;}
       public String SlNo{get;set;}
       public Account acc{get;set;}
       
 /*      public wrapperClass()
       {
           
       }      
       public wrapperClass(boolean c,String s,Account a)
       {
           this.checkBox=c;
           this.SlNo=s;
           this.acc=a;
       }     */
       public wrapperClass(String s,Account a)
       {
           this.SlNo=s;
           this.acc=a;
           checkBox=false;
       }
   }
}