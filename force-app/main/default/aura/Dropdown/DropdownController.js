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
    }
})