({
	accountHelper : function(component, event, helper) {
     //   alert('helper called');
		var action = component.get("c.findAccoundName");
        let name = 'Ajeet';
        action.setParams({'name':name});
        action.setCallback(this, function(response){
            var result = response.getReturnValue();
            component.set("v.accountName", result);
        });
        $A.enqueueAction(action);      
	}
    
})