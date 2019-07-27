({
    doInit : function(component, event, helper) {
        var action = component.get("c.getInvoiceRecords");
        action.setCallback(this, function(response) {           
            if (response.getState() == "SUCCESS") {      
                component.set("v.invoiceList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})