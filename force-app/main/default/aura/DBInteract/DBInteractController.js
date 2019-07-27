({
    doInit: function(component, event, helper) {
        var action = component.get("c.getPicklistValues");
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = [];
                allValues = response.getReturnValue();
                component.set("v.pickListValueSet", allValues);
                
            }
        });
        $A.enqueueAction(action);
    },

	handleClick : function(component, event, helper) {
		//getting the candidate information
        var account = component.get("v.accounts");
 		//var acc = JSON.stringify(accounts);
        //alert('ssas:'+acc);
        console.log('account '+account);
        //Calling the Apex Function
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({'accountStr' : JSON.stringify(account)});
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
			console.log('state ' + JSON.stringify(state));
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
		//adds the server-side action to the queue        
        $A.enqueueAction(action); 
    }
    
    
})