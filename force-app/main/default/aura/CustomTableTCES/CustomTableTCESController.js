({
	doInit : function(component, event, helper) {
		var action = component.get("c.fetchFieldSetRecords");
        action.setParams({objectTypeName : 'Account', fieldSetName : 'SALES1'});
        action.setCallback(this, function(response){
            
        });
        $A.enqueueAction(action);
	}
})