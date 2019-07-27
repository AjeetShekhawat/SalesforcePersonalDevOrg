public class TriggerDoubtPractice {
    public static void TriggerDoubtPracticeMethod() {
        System.debug('carList is coming');
        List<Car__c> carList = new List<Car__c>();
        Car__c c = new Car__c();
        c.Name = 'insert';
        c.Hr_Rating__c = '1';
        carList.add(c);
        Insert carList;
        
        System.debug('carList is ' + carList);
    }
    
    public static void TriggerDoubtMapMethod(Map<Id, Car__c> carList) {
        System.debug('carList Map is ' + carList);
    }
}