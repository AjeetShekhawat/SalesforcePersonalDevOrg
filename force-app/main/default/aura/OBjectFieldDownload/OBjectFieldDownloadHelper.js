({
	getObjectNames : function(component,event,heper) {
		var action = component.get('c.getObjectNames');
        /*action.setParams({
            'objectName' : component.get();
        });*/
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var result = response.getReturnValue();
                var tempList = [];
                for(var x in result){
                    var temp = {
                        "label" : result[x],
                        "value" : result[x]
                    }
                    tempList.push(temp);
                }
                component.set('v.options',tempList);
            }
        });
        $A.enqueueAction(action);
	},
    downloadObjectFieldsReport : function(component,event,helper){
        var action= component.get('c.getObjectFields');
        action.setParams({
            "objectName" : component.get('v.selectedObject')
        });
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var result = response.getReturnValue();
                var tempList = [];
                for(var x in result){
                    var temp = {
                        "label" : result[x],
                        "value" : result[x]
                    }
                    tempList.push(temp);
                }
                helper.downloadCSVHelper(component,event,helper,result);
                //component.set('v.options',tempList);
            }
        });
        $A.enqueueAction(action);
    },
    downloadCSVHelper : function(component,event,helper,data){
        debugger;
            var stockData = data;
            var csv = helper.convertArrayOfObjectsToCSV(component,stockData);   
            if (csv == null){return;} 
        debugger;
            var hiddenElement = document.createElement('a');
            hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
            hiddenElement.target = '_self'; // 
            hiddenElement.download = component.get('v.selectedObject')+' Field Report.csv';  // CSV file Name* you can change it.[only name not .csv] 
            document.body.appendChild(hiddenElement); // Required for FireFox browser
            hiddenElement.click(); // using click() js function to download csv file
            component.set("v.isOpen", false);
            history.go(-1);
    },
    convertArrayOfObjectsToCSV : function(component,objectRecords){
        debugger;
        var csvStringResult, counter, keys, columnDivider, lineDivider,keysToLoop;
        if (objectRecords == null || !objectRecords.length) {
            return null;
        }
        var objectcName = component.get('v.selectedObject');
        console.log(JSON.stringify(objectRecords));
        columnDivider = ',';
        lineDivider =  '\n';
        keys = ['Object Name','Object Label','Label','Api','Type'];
        csvStringResult = '';
        csvStringResult += keys.join(columnDivider);
        csvStringResult += lineDivider;
        for(var i=0; i < objectRecords.length; i++){   
            csvStringResult += objectcName+','+objectcName+','+objectRecords[i]["fieldName"]+','+objectRecords[i]['fieldApi']+','+objectRecords[i]['fieldType']+'\n';
        }
        return csvStringResult;        
    },
})