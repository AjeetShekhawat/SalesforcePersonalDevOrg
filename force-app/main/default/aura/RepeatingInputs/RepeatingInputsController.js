({
    doInit : function(component, event, helper) {
        component.set('v.fileShares', {'label': 'Enter Path', 'value': '0','id': 'fileShare1'});
        var fileShares = component.get("v.fileShares");
        console.log('init length ' + fileShares.length);
        console.log('init fileShares ' + JSON.stringify(fileShares));
        
    },

    addMoreShareHandler : function(component, event, helper){
        event.preventDefault();
        var inputs = component.get("v.fileShares");
        var id = inputs.length+1;
     
        var obj = {
            'label': '',
            'value': '0',
            'id': 'fileShare'+id}
     
            inputs.push(obj);
            console.log('addMoreShareHandler length ' + inputs.length);
            component.set("v.fileShares", inputs);
     
    },

    removeShareHandler : function(component, event, helper){
		event.preventDefault();
		var selectedItem = event.currentTarget;
        var idtoremove = selectedItem.dataset.idtoremove;
		var inputs = component.get("v.fileShares");
        console.log('removeShareHandler length ' + inputs.length);
		for(var i=0;i<inputs.length;i++){
            var obj = inputs[i];
            console.log('obj *** ' + JSON.stringify(obj));
            
			if(obj.id == idtoremove){
				inputs.splice(i,1)
			}
        }
        console.log('inputs ' + JSON.stringify(inputs));
        console.log('removeShareHandler length333 ' + inputs.length);
		component.set("v.fileShares", inputs);
 
	}
})