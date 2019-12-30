({
    handleLoad : function(component, event, helper) {
        var recUi = event.getParam("recordUi");
        
        if(recUi.record.fields["Password__c"].value > 50) {
            component.set("v.passwordValue", 'aaaaaa');
        }
        if(recUi.record.fields["Password__c"].value < 50) {
            component.set("v.passwordValue", 'bbbbbbbbbbb');
        }
        if(recUi.record.fields["Password__c"].value == 50) {
            component.set("v.passwordValue", 'ccccccccccccc');
        }
    }
})