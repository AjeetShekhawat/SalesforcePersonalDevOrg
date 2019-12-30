({
	doInit : function(component, event, helper) {
		helper.getObjectNames(component,event,helper);
	},
    handleChange : function(component,event,helper){
        debugger;
        helper.downloadObjectFieldsReport(component,event,helper);
    }
})