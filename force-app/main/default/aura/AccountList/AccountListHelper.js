({
      // Fetch the accounts from the Apex controller
      getAccountList: function(component) {
        var action = component.get('c.getAccounts');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
          console.log('total records ', actionResult.getReturnValue().length);
          
         component.set('v.accounts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
      }
    })