public class AccountContactOppoDisplayController {
    public LIST<WrapperforDisplay> wrapList1 {get;set;}
    public AccountContactOppoDisplayController() {
        wrapList1 = new LIST<WrapperforDisplay>();
        displayInfo();// dgfdgdfgfd
    }
    public void displayInfo() {
        System.debug('Git testing');
        for(Account acco : [select name from Account]) {
            WrapperforDisplay wr = new WrapperforDisplay();
            wr.acc = acco;
            wrapList1.add(wr);
        }
        for(Contact conn : [select name from Contact]) {
            WrapperforDisplay wr = new WrapperforDisplay();
            wr.con = conn;
            wrapList1.add(wr);
        }
        for(Opportunity oppo : [select name from Opportunity]) {
            WrapperforDisplay wr = new WrapperforDisplay();
            wr.opp = oppo;
            wrapList1.add(wr);
        }
    }
    public class WrapperforDisplay {
        public Account acc{get;set;}
        public Contact con{get;set;}
        public Opportunity opp{get;set;}
    }
}