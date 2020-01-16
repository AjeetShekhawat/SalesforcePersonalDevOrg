({
    doInit : function(component, event, helper) {
        console.log('val coming doInit');
    },

    update : function (component, event, helper) {
        // Get the new hash from the event
        var loc = event.getParam("token");
        console.log('loc ' + loc);
    },
  
    handleDestroy : function (component, event, helper) {
        var val = event.getParam("value");
        console.log('val ' + JSON.stringify(val));
        // Do something else here
    },
  
    onRender : function (component, event, helper) {
        console.log('val coming onRender');
    },
})