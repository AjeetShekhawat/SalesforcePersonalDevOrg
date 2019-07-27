public class RollonAccountUsingVfPage {
    public Integer number1{get;set;}
    public Integer number2{get;set;}
    public Integer result{get;set;}
    public RollonAccountUsingVfPage() {
        
    }
    public void calculateSum() {
        result = number1 + number2;
    }
    public void calculateSub() {
        result = number1 - number2;
    }
    public void calculateMult() {
        result = number1 * number2;
    }
    public void calculateDiv() {
        result = number1 / number2;
    }
    
}