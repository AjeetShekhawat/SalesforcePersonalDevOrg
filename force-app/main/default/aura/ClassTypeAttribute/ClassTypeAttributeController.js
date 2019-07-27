({
    doInit : function(component, event, helper) {
        var action = component.get('c.sendClassData');
        action.setCallback(this, function(response) {
            var state, returnedValues;
            state = response.getState();
            if (state == 'SUCCESS') {
                returnedValues = response.getReturnValue();
                component.set('v.dataFromClass', returnedValues);
            }
        });
        $A.enqueueAction(action);
    }
})