({
    getLabel : function(component, event, helper) {
        var myLabel = component.find("button1").get("v.label");
        var defined = $A.util.isUndefined(myLabel);
        console.log('defined ' + defined);
        
        component.set("v.buttonLabel", myLabel);
        var dateString = "2017-01-15"; 
        var now = new Date();
        console.log($A.localizationService.formatDate(dateString));
        console.log($A.localizationService.formatDate(now));
        console.log($A.localizationService.formatDate(dateString, "yyyy MM dd"));
        console.log($A.localizationService.formatDate(now, "MMMM dd yyyy, hh:mm:ss a"));
        console.log($A.localizationService.formatDate(now, "MMM dd yyyy, hh:mm:ss a"));

        var body = component.get("v.body");
        console.log('body ********* ' + body);
    },

    doSomething: function(component, event, helper) {
        var body = component.get("v.body");
        console.log('body ------- ' + body);
    }
})