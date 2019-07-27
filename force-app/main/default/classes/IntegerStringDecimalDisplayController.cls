public class IntegerStringDecimalDisplayController {
    public LIST<DataWrapper> dataTypeList{get;set;}
    
    public IntegerStringDecimalDisplayController() {
       dataTypeList = new LIST<DataWrapper>();
       displayData();
    }
    public void displayData() {
        
        for(Integer i = 0; i < 5; i++) {
         	DataWrapper dwrap = new DataWrapper();
            dwrap.str = 'ajay' + i;
            dwrap.inte = i;
            dwrap.deci= 1000.0 + i;
            dataTypeList.add(dwrap);
            
        }
        System.debug('hi');
	}
    public class DataWrapper {
        public Integer inte{get;set;}
	    public String str{get;set;}
    	public Decimal deci{get;set;}
    }
}