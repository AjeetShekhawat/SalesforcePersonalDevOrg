/* eslint-disable no-console */
import { LightningElement } from 'lwc';
//import doInit from '@salesforce/apex/AccountsController.doInit';

export default class CaptureFormDataInList extends LightningElement {
    
    tempFormList = {'firstName' : '', 'lastName' : '', 'Id' : ''};
    captureData = [];

    connectedCallback() {
        this.doInit();
    }
    
    doInit() {
        for (let index = 0; index < 3; index++) {  
            /* 1st way : here in below line, it will create seperate memory for each tempFormList and then insert it to captureData list. */
           // this.captureData.push(JSON.parse(JSON.stringify(this.tempFormList)));
            
           /* 2nd way :  we are creating new tempList so new memory will be allocated and then inserting it to captureData list. */
            let tempList = {'firstName' : '', 'lastName' : '', 'Id' : ''};
            this.captureData.push(tempList);
        }
        console.log('captureData list ', JSON.stringify(this.captureData));  
    }
    

    handleChange(event) {
        const field = event.target.name; 
        
          
        if (field === 'firstName') {
            let targetId = event.target.dataset.targetfirstname; 
            this.captureData[targetId].firstName = event.target.value;
        } else if (field === 'lastName') {
            let targetId = event.target.dataset.targetlastname; 
            this.captureData[targetId].lastName = event.target.value;
        }
    }

    showListData() {
        console.log('captureData ', JSON.stringify(this.captureData));     
    }
}

/**
 * 

import { LightningElement } from 'lwc';
//import doInit from '@salesforce/apex/AccountsController.doInit';

export default class CaptureFormDataInList extends LightningElement {
    captureTempData = {'firstName' : '', 'lastName' : '', 'Id' : ''};
    // captureData = [{'firstName' : '', 'lastName' : '', 'Id' : ''},
    //                 {'firstName' : '', 'lastName' : '', 'Id' : ''},
    //                 {'firstName' : '', 'lastName' : '', 'Id' : ''}];

    captureData = [];

    connectedCallback() {
        this.doInit();
    }

    doInit() {
        for (let index = 0; index < 3; index++) {
            this.captureData[index] = this.captureTempData;  
        }
        console.log('captureData list ', JSON.stringify(this.captureData));  
    }
    

    handleChange(event) {
        const field = event.target.name; 
        let targetId = event.target.dataset.index; 
          
        if(this.captureData[targetId] != null) {
            
            let captureTempData1 = {'firstName' : '', 'lastName' : '', 'Id' : ''};
            console.log('log 1== ' + captureTempData1);

            if (field === 'firstName') {
                
                console.log('log 1== ' + targetId);
                captureTempData1.firstName = event.target.value;
                captureTempData1.lastName = this.captureData[targetId].lastName; 
            } else if (field === 'lastName') {
                //console.log('log 2== ' + targetId);
                captureTempData1.firstName = this.captureData[targetId].firstName;
                captureTempData1.lastName = event.target.value;                
            }

            this.captureData[targetId] = captureTempData1;
            console.log('log 1== ' + captureTempData1);
            console.log('log 1== ' + JSON.stringify(this.captureData[targetId]));
        }
        console.log('captureData === ', JSON.stringify(this.captureData));     
    }

    showListData() {
        console.log('captureData ', JSON.stringify(this.captureData));     
    }
}
 */