({
    loadOptions: function (component, event, helper) {
        
        var opts = [
            { value: "cyan", label: "Cyan" },
            { value: "Red", label: "Red" },
            { value: "Green", label: "Green" },
            { value: "Blue", label: "Blue" }
        ];
        component.set("v.options", opts);
        
    },
    handleClick: function (component, event, helper) {
      //  debugger;
        alert('Input value is ' + component.get("v.inValue"));
        
    }
})