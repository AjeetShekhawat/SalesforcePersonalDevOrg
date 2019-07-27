({
	helperMethod : function(component, event, helper) {
        this.intervalCall(component, event, helper);
		/*
        window.setInterval(
            $A.getCallback(function() { 
                helper.intervalCall(component, event, helper);
            }), 5000
        );*/
	},
    intervalCall : function(component, event, helper) {
        var action = component.get("c.refreshAfterFixedTime");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS') {
                var count = {};
                count = response.getReturnValue();
                console.log('coming****** ' + count['accountCount']);
                console.log('coming+++++++ ' + count['contactCount']);
                component.set("v.dispalyAccountRecords", count['accountCount']);
                component.set("v.dispalyContactRecords", count['contactCount']);
            }
            
        });
        $A.enqueueAction(action);
    }
})