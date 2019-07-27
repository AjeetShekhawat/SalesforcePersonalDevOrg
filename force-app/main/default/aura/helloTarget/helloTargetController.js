({
    init: function(cmp, evt, helper) {
        var myPageRef = cmp.get("v.pageReference");
        var firstname = myPageRef.state.firstname;
        cmp.set("v.firstname", firstname);
    }
})