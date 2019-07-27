// WrapperAccountListHelper
({
	readRecord : function(component, event, helper) {
		var action = component.get("c.readRecord");	// calling apex class readRecord()
        var obj = {"objName":"", "fieldList":[], "limitRecord":10000};
        obj.objName = component.get('v.objName');
        obj.fieldList = component.get('v.fieldList');
        obj.limitRecord = 10000;
        action.setParams({
            'jsonObject': JSON.stringify(obj)
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS') {
                var result = response.getReturnValue();
                console.log(result);
	            component.set("v.wrapperAccountList", result);                
            }
        });
        $A.enqueueAction(action);
	}
})