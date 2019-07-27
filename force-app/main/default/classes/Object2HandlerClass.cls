public class Object2HandlerClass {
    
    // This method will call when inserting record in Object2
    public static void sumOfObject2(List<Object2__c> obje2List) {
        Decimal totalCount = 0;
        Id idVar; // declare ID variable to store object1 id value.
        for(Object2__c obj2 : obje2List) {
            idVar = obj2.Object1__c; // getting id of object1 from Object2 in idVar.
        }
        LIST<Object1__c> obj1ListUpdate = new LIST<Object1__c>();
        set<id> IdsOfObject2 = new Set<id>();       
        Object1__c object1Instance = new Object1__c(); // instance of object1.
		
        // SOQl query to get all child(Object2) records of Object1. 
        for(Object2__c obj2Records : [select id, Sum2__c from Object2__c where Sum2__c != null AND Object1__c =: idVar]) {
            IdsOfObject2.add(obj2Records.Id); // adding all id of object2 in set.
            totalCount += obj2Records.Sum2__c; // count sum of object2 sum2 field. 
        }
        // SOQl query to get all child(Object3) records of Object2. 
        for(Object3__c obj3Records : [select id, Sum2__c, Sum3__c from Object3__c where Sum2__c != null AND Sum3__c != null AND Object2__c IN :IdsOfObject2]) {
            totalCount += obj3Records.Sum2__c + obj3Records.Sum3__c;
        }
        object1Instance.Id = idVar; // initialize object1 instance with its id.
        object1Instance.Sum__c = totalCount; // assign total sum of sum2 and sum3 field from all lookup relation.
        obj1ListUpdate.add(object1Instance); // adding object1 instance into list. 
        if(!obj1ListUpdate.isEmpty() && obj1ListUpdate.size() > 0) { // null checking
            update obj1ListUpdate; // updating sum field of object1.
        } 
    }
    
    // This method will call when inserting record in Object3
    public static void sumOfObject3(List<Object3__c> obje3List) {
        Decimal totalCount = 0;
        Id idVar, object1Id; 
        for(Object3__c obj3 : obje3List) {
            idVar = obj3.Object2__c; // getting id of object2 from Object3.
        }
        for(Object2__c obj2 : [select id, Object1__c from Object2__c where id =: idvar]) {
            object1Id = obj2.Object1__c; // getting id of object1 from Object2.
        }
        LIST<Object1__c> obj1ListUpdate = new LIST<Object1__c>();
        set<id> IdsOfObject2 = new Set<id>(); 
        Object1__c object1Instance = new Object1__c();
		
        // SOQl query to get all child(Object2) records of Object1. 
        for(Object2__c obj2Records : [select id, Sum2__c from Object2__c where Sum2__c != null AND Object1__c =: object1Id]) {
            IdsOfObject2.add(obj2Records.Id); // adding all id of object2 in set.
            totalCount += obj2Records.Sum2__c; // count sum of object2 sum2 field. 
        }
        // SOQl query to get all child(Object3) records of Object2.
        for(Object3__c obj3Records : [select id, Sum2__c, Sum3__c from Object3__c where Sum2__c != null AND Sum3__c != null AND Object2__c IN :IdsOfObject2]) {
            totalCount += obj3Records.Sum2__c + obj3Records.Sum3__c;
        }
        object1Instance.Id = object1Id; // initialize object1 instance with its id.
        object1Instance.Sum__c = totalCount; // assign total sum of sum2 and sum3 field from all lookup relation.
        obj1ListUpdate.add(object1Instance); // adding object1 instance into list. 
        if(!obj1ListUpdate.isEmpty() && obj1ListUpdate.size() > 0) { // null checking
            update obj1ListUpdate; // updating sum field of object1.
        } 
    }
    
    // This method will call when updating record in Object3
    public static void sumOfObject2AfterUpdate(List<Object3__c> obje3List) {
        Decimal sumField = 0, updateSumField = 0;
        Id idVar, object1Id;
        for(Object3__c obj3 : obje3List) {
            idVar = obj3.Object2__c; // getting id of object2 from Object3.
        }
        for(Object2__c obj2 : [select id, Object1__c from Object2__c where id =: idvar]) {
            object1Id = obj2.Object1__c; // getting id of object1 from Object2.
        }
        LIST<Object1__c> obj1ListUpdate = new LIST<Object1__c>();       
        Object1__c object1Instance = new Object1__c();

        for(Object3__c obj3Records : obje3List) { // accessing data of sum1 field of object3 into variables.
            sumField = obj3Records.Sum1__c; 
            updateSumField = obj3Records.Sum1__c/2;
        }
        object1Instance.Id = object1Id; // initialize object1 instance with its id.
        object1Instance.Sum__c = sumField; // assign updated value of sum1 into sum field of Object1.
        object1Instance.UpdateSum__c = updateSumField;
        obj1ListUpdate.add(object1Instance); // adding object1 instance into list. 
        if(!obj1ListUpdate.isEmpty() && obj1ListUpdate.size() > 0) { // null checking
            update obj1ListUpdate; // updating sum field of object1.
        } 
    }
}