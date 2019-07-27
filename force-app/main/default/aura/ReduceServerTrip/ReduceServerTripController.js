({
	doInit : function(component, event, helper) {
     //   debugger;
		var action = component.get("c.fetchRecords");
        action.setCallback(this, function(response) {
            var response1 = response.getState();
            if(response1 == 'SUCCESS') {
                var wrapperList = response.getReturnValue();
                component.set("v.accList", wrapperList[0].accWrapper);
                component.set("v.conList", wrapperList[0].conWrapper);
                console.log('Returned list is ' + JSON.stringify(wrapperList));
                console.log('Returned Account list is ' + JSON.stringify(wrapperList[0].accWrapper[0]));
              //  debugger;
                console.log('Returned Contact list is ' + JSON.stringify(wrapperList[0].conWrapper));
                
            } else if(response1 == 'ERROR') {
                
            } 
        });
        $A.enqueueAction(action);
        
        // console log hacks
      /*  var persons = [
            { name : 'Marthas', company : 'Cognizant', country : 'USA' },
            { name : 'John Doe', company : 'Cognizant', country : 'India' },
        ];
        console.group('Public group');
        console.log('jsonList is ' + JSON.stringify(persons));
        console.log(persons);
        console.log('jsonList is 1');
        console.log('jsonList is 2');
        console.log('jsonList is 3');
        console.log('jsonList is 4');
        console.dir(persons);
        console.assert(4 == 4);
        console.groupEnd('Public group End');*/
	},
    
    CallController : function(component, event, helper) {
        var name = 'Ajay';
        debugger;
		helper.callHelper(component, name, event, helper);
        
	}
    
})