/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
import doInit from '@salesforce/apex/AccountsController.doInit';
export default class DoInitMethod extends LightningElement {
    @track messageDisplay;
    @track errorMessage;

    connectedCallback() {
        console.log('Inside connectedCallback');
        this.callDoInit();
    }
    disconnectedCallback() {
        console.log('Inside disconnectedCallback');
    }

    // same as doInit in lightning component.
    callDoInit() {
        doInit()
        .then(result => {
            this.messageDisplay = result;
            this.errorMessage = undefined;
            console.log('result is ' + result);
        })
        .catch(error => {
            this.messageDisplay = undefined;
            this.errorMessage = error;
            console.log('error is ' + error);
        });
    }
}