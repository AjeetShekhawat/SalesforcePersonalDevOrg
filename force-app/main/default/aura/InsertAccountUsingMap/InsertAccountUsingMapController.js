({
    SaveRecords : function(component, event, helper) {
        var action, result;
        result = component.get('v.accountList');
        console.log('doinit');
        console.log('account data is ' + JSON.stringify(component.get('v.accountList')));
        console.log('account data is1111 ' + result.Name);
        action = component.get('c.saveAccount');
        action.setParams({'accountList' : result});
        action.setCallback(this, function(response) {
            console.log('success');
        });    
        $A.enqueueAction(action);
    }
})