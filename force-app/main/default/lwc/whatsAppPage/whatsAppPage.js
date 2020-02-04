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

    handleInputMobileChange(event) {
        this.value = event.detail.value;
        this.formData.mobileNumber = this.value;
    }

    handleInputMessageChange(event) {
        this.value = event.detail.value;
        this.formData.message = this.value;
    }

    handleInputCheckboxChange(event) {
        this.value = event.target.checked;
        this.formData.sendNow = this.value;
        console.log('kkkkkkkkkkk ', this.value);
    }

    handleInputSendChange(event) {
        this.value = event.detail.value;
        this.formData.sendAt = this.value;
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