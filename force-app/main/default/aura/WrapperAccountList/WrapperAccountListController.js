// WrapperAccountListController

({
	doInit : function(component, event, helper) {
        component.set('v.objName','Account');
        var fieldList = ['Id', 'Name', 'Phone'];
        component.set('v.fieldList', fieldList);
		helper.readRecord(component, event, helper);
	}
})