({
	helperMethod : function(component, event, helper) {
		//var AccountName = component.get("v.AccountName");
       // var Rating = component.get("v.Rating");
       // var Phone = component.get("v.Phone");
        alert('acc ' + AccountName);
        var action = component.get("c.readRecord");
        var obj = {"AccountName":"", "Rating":"", "Phone":""};
        obj.AccountName = component.get('v.AccountName');
        obj.Rating = component.get('v.Rating');
        obj.Phone = component.get("v.Phone");
        action.setParams({
            'jsonObject': JSON.stringify(obj)
        });
    /*    action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS') {
                //var result = response.getReturnValue();
                //console.log(result);
                alert('Record Saved');              
            }
        }); */
        $A.enqueueAction(action);
	}
})