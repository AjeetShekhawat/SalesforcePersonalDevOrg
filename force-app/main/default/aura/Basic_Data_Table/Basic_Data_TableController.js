({
    doInit : function(component, event, helper) {
        component.set("v.mycolumnsDemo", 'On load of lightning component');		                
        helper.getDataHelper(component, event);
    },
})