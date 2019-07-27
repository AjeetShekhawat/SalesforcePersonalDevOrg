public class CalculationController {
    
    private Integer xvalue{get;set;}
    private Integer yvalue{get;set;}
    private Integer result{get;set;}
    
    public PageReference add() {
        result = xvalue + yvalue;
        return null;
    }
    public PageReference sub() {
        result = xvalue - yvalue;
        return null;
    }
    public PageReference mul() {
        result = xvalue * yvalue;
        return null;
    }
}
/*
public class CalculationController {
   public Account getAccount() {
        return [SELECT Id, Name FROM Account
                WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
    }
} 
*/