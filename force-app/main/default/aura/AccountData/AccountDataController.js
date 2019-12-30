({
    showAccountName: function (component, event, helper) {
        helper.accountHelper(component, event, helper);
    },
    
    createRecord : function(component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Account"
        });
        createRecordEvent.fire();
    }
})