({
    showNoticeInfo : function(component, event, helper) {
        component.find('notifLib').showNotice({
            "variant": "info",
            "header": "Something has gone wrong!",
            "message": "Unfortunately, there was a problem updating the record.",
        });
    },
    
    showNoticeError : function(component, event, helper) {
        component.find('notifLib').showNotice({
            "variant": "error",
            "header": "Something has gone wrong!",
            "message": "Unfortunately, there was a problem updating the record.",
        });
    },
    
    showNoticeWarning : function(component, event, helper) {
        component.find('notifLib').showNotice({
            "variant": "warning",
            "header": "Something has gone wrong!",
            "message": "Unfortunately, there was a problem updating the record.",
        });
    },
    
    showToastInfo : function(component, event, helper) {
        component.find('notifLib').showToast({
            "variant": "info",
            "title": "Notif library Info!",
            "message": "The record has been updated successfully."
        });
    },
    
    showToastWarning : function(component, event, helper) {
        component.find('notifLib').showToast({
            "variant": "warning",
            "title": "Notif library Warning!",
            "message": "The record has been updated successfully."
        });
    },
    
    showToastSuccess : function(component, event, helper) {
        
        component.find('notifLib').showToast({
            "variant": "success",
            "title": "Notif library Success!",
            "message": "The record has been updated successfully."
        });
    },
    
    showToastError : function(component, event, helper) {
        component.find('notifLib').showToast({
            "variant": "error",
            "title": "Notif library Error!",
            "message": "The record has been updated successfully."
        });
    },
})