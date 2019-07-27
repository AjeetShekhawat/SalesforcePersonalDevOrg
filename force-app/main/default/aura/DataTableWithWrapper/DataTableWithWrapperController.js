({
    init: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Welcome Message', fieldName: 'welcomeMessage', type: 'text'},
            {label: 'Account Id', fieldName: 'AccountId', type: 'url', typeAttributes: { label: 'View Record' }},
            {label: 'Account Name', fieldName: 'AccountName', type: 'text'},
            {label: 'User Name', fieldName: 'UserName', type: 'text'}
        ]);

        helper.fetchData(component, event, helper);
    }
})