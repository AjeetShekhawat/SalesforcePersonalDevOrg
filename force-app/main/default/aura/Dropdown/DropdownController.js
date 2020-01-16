({
	toggle: function (component, event, helper) {
         var sel = component.find("mySelect");
         var nav =	sel.get("v.value");
         if (nav == "INDIA") {     
              component.set("v.toggleGer", true);
         }
         if(nav == "USA"){
            component.set("v.toggleGer", false);
            component.set("v.toggleEng", false);
         }
	 	if(nav == "GERMAN"){
            component.set("v.toggleGer", false);
            component.set("v.toggleEng", true);
         }
    },

    update : function (component, event, helper) {
      // Get the new hash from the event
      var loc = event.getParam("token");
      console.log('loc ' + loc);
      
      // Do something else
   },

   handleDestroy : function (component, event, helper) {
      var val = event.getParam("value");
      console.log('val ' + JSON.stringify(val));
      // Do something else here
   },

   onRender : function (component, event, helper) {
      console.log('val coming ');
   },

   
})