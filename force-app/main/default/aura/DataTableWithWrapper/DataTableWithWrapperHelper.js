({
    fetchData : function(component, event, helper) {
        var action = component.get('c.dataTableWrapper');
        action.setCallback(this, function(response) {
            var state, returnedValues;
            state = response.getState();
            if (state == 'SUCCESS') {
                returnedValues = response.getReturnValue();
                console.log('UnModified list is ' + JSON.stringify(returnedValues));
                for(var x in returnedValues) {
                    console.log('xxxxx is ' + x);
                    returnedValues[x].AccountName = returnedValues[x].accObj.Name;
                    returnedValues[x].AccountId = '/' + returnedValues[x].accObj.Id;
                  //  returnedValues[x].AccountId = '/one/one.app?#/sObject/' + returnedValues[x].accObj.Id + '/view';
                  //  returnedValues[x].AccountId = 'https://ajeetshekhawat-dev-ed.lightning.force.com/lightning/r/Account/' + returnedValues[x].accObj.Id + '/view';
                }
                console.log('Modified list is ' + JSON.stringify(returnedValues));
                component.set('v.data', returnedValues);
            }
        });
        $A.enqueueAction(action);
    }
})