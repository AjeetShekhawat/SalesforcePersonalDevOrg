({
    showAccountName : function(component, event, helper) {
        //window.open("https://www.salesforce.com", '_blank');
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:AccountData"
        });
        evt.fire();
        
        var evt1 = $A.get("e.force:navigateToComponent");
        evt1.setParams({
            componentDef : "c:Dropdown"
        });
        evt1.fire();
    }
})