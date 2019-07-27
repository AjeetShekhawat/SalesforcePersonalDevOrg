({
	doInit : function(component, event, helper) {
        
        var action = component.get("c.fetchItems");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                component.set("v.item", response.getReturnValue());
                var c = component.get("v.item");
                console.log('value is ' + JSON.stringify(c));
            }
        });
        $A.enqueueAction(action);
	},
    
    packItem : function(component, event, helper) {
        var listofCamp = component.get("v.item");
        console.log('value is ***  +++++++');
        listofCamp[0].Packed__c = true;
        component.get("v.item", listofCamp);
        console.log('value is ***  ' + JSON.stringify(listofCamp));
        var evt = event.getSource();
        evt.set("v.disabled",true);
	}
})