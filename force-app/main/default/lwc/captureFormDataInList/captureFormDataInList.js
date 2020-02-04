/* eslint-disable no-console */
import { LightningElement } from 'lwc';
//import doInit from '@salesforce/apex/AccountsController.doInit';

export default class CaptureFormDataInList extends LightningElement {
    captureTempData = {'firstName' : '', 'lastName' : '', 'Id' : ''};
    captureData = [];

    captureData1 = [];

    connectedCallback() {
        this.doInit();
    }

    doInit() {
        for (let index = 0; index < 3; index++) {
            this.captureData.push(this.captureTempData);
        }
        console.log('captureData list ', JSON.stringify(this.captureData));     
    }
    

    handleChange(event) {
        const field = event.target.name;
        
        if (field === 'firstName') {
            let targetId = event.target.dataset.targetfirstname; 
            console.log('targetId 1== ', targetId);
         //   this.captureData[targetId].firstName = event.target.value;
            this.captureData1.push({'firstName' : event.target.value, 'lastName' : ''});
        } else if (field === 'lastName') {
            let targetId = event.target.dataset.targetlastname; 
            console.log('targetId 2== ', targetId);
        //    this.captureData[targetId].lastName = event.target.value;
            this.captureData1.push({'firstName' : '', 'lastName' : event.target.value});
        }
    }

    showListData() {
        console.log('captureData ', JSON.stringify(this.captureData1));     
    }
}