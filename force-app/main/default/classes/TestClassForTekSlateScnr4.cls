@isTest
public class TestClassForTekSlateScnr4 {
    static testMethod void leadFieldChange() {
        Lead leadInstance = new Lead();
        leadInstance.FirstName = 'Raj';
        leadInstance.LastName = 'ajay';
        leadInstance.Company = 'kvp';
        leadInstance.Status = 'Closed - Converted';
        insert leadInstance;
        leadInstance.FirstName = 'Raju';
        update leadInstance;
    }
}