// helperDemoComponentController
({
	showAlert : function(component, event, helper) {
        document.getElementById('method1').innerHTML = 'from helperDemoComponentController';
	//	alert('this is helperDemoComponentController');
        helper.helperMethod();
	},
    
    showName : function(component, event, helper) {
        debugger;
        helper.helperAccountMethod(component, event, helper);
	},
    
    showAccount : function(component, event, helper) {
        helper.helperAccountName(component, event, helper);
	}
})