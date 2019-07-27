({
	accountHelper : function(component, event, helper) {
     //   alert('helper called');
		var action = component.get("c.findAccoundName");
        action.setCallback(this, function(response){
            var result = response.getReturnValue();
            component.set("v.accountName", result);
        });
        $A.enqueueAction(action);      
	}
    
})