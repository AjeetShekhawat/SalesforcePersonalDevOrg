/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
import Id from '@salesforce/user/Id';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class FirstWebCmp extends LightningElement {
    
    @track name = 'Hi Mr. XYZ';
    userId = Id;
    dummyVar = 'LWC Is Awesome';
    showName = 'Ajeet this string is without wire ';

    connectedCallback() {
        console.log('Hi You are in connectedCallback ');
    }

    
    callJsMethod() {
        /* eslint-disable no-alert */
        var tenure = prompt("Please enter preferred tenure in years", "15");

        if (tenure != null) {
            /* eslint-disable no-alert */
            alert("You have entered " + tenure + " years");
        }

        console.log('Hi You are name ' + this.name);
        console.log('Hi You are userId ' + this.userId);
        console.log('Hi You are string ', this.dummyVar);
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'prompt take data successfully',
                variant: 'success',
            }),
        );
    }

}