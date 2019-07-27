// helperDemoComponentHelper

({
	helperMethod : function() {
        document.getElementById('method2').innerHTML = 'from helperDemoComponentHelper';
	//	alert('this is helperDemoComponentHelper');
	},
    
    helperAccountMethod : function(component, event, helper) {
        debugger;
        var action = component.get("c.fetchAccount");
        action.setCallback(this, function(response){
            debugger;
            component.set("v.name", response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    
    helperAccountName : function(component, event, helper) {
        var action = component.get("c.fetchAccountName");
        action.setCallback(this, function(response){
            component.set("v.accounts", response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})