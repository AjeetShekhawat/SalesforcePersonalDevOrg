public class MockScenario_Delete {
    public LIST<Account> accList;
    public id AcccId{get;set;}
    public String selectedValue{get;set;}
	public MockScenario_Delete() {
       accList = new LIST<Account>();
    }
    public List<SelectOption> getpicklistValue() {
        List<selectoption> picklistValue = new List<SelectOption>();
        picklistValue.add(new SelectOption('Finance', 'Finance') );
        picklistValue.add(new SelectOption('Energy', 'Energy') );
        picklistValue.add(new SelectOption('Banking', 'Banking') );
        picklistValue.add(new SelectOption('Apparel', 'Apparel') );
        picklistValue.add(new SelectOption('Education', 'Education') );
        picklistValue.add(new SelectOption('Retail', 'Retail') );
        picklistValue.add(new SelectOption('Chemicals', 'Banking') ); 
        return picklistValue;
    }   
    public LIST<Account> getaccList() {
        if(selectedValue != null) {
            accList = [select id, name, industry from Account where industry =: selectedValue];
            System.debug('list is ' + accList);
        }
         return accList;
    }
    public void deleteData() {   
        //ID recordTobeDelete = ApexPages.currentPage().getParameters().get('rowId');
        ID recordTobeDelete = AcccId;
        System.debug('listid is ' + recordTobeDelete);
        if(recordTobeDelete != null) {
            delete [select id from Account where id =: recordTobeDelete]; 
        }       
       
    }  
}