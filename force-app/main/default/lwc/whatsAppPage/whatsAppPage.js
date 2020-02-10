/* eslint-disable @lwc/lwc/no-document-query */
/* eslint-disable no-console */
import { LightningElement,track, api } from 'lwc';
import saveRecords from '@salesforce/apex/AccountsController.saveWhatsAppForm';

export default class WhatsAppPage extends LightningElement {
    
    @track errorMessage;
    @track value = '';
    @api recordId;
    
    formData = {"mobileNumber" : "", "message" : "", "sendAt" : "", "sendNow" : ""};

    get acceptedFormats() {
        return ['.pdf', '.png'];
    }

    handleInputChange(event) {
        const nameValue = event.target.name;
        if (nameValue === 'mobile') {
            this.formData.mobileNumber = event.target.value;
        } else if (nameValue === 'message') {
            this.formData.message = event.target.value;
        } else if (nameValue === 'inputCheckboc') {
            this.formData.sendNow = event.target.checked;
        } else if (nameValue === 'inputDate') {
            this.formData.sendAt = event.target.value;
        } else {
            console.log("No. of files uploaded : ");
        }
    }

    handleUploadFinished(event) {
        // Get the list of uploaded files
        const uploadedFiles = event.detail.files;
        console.log("No. of files uploaded : " + uploadedFiles.length);
    }

    submitData() {
        console.log("final data : " + JSON.stringify(this.formData));
        saveRecords({'formData' : JSON.stringify(this.formData)}) 
        .then(result => {
            console.log('result after save ', result);
        })
        .catch(error => {
            console.log('error after save ' + error);
        });
    }
    
}