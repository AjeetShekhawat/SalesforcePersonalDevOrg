/* eslint-disable no-console */
import { LightningElement, api } from 'lwc';

export default class LwcEventParent extends LightningElement {
    @api pageNumber = 0;
    @api recordId; // It will fetch current record Id automatically.
    @api objectApiName; // It will fetch current object api name automatically.
    increaseNumber() {
        this.pageNumber += 1;
        console.log('recordId is ', this.recordId);
        console.log('objectApiName is ', this.objectApiName);
        
    }
    decreaseNumber() {
        if(this.pageNumber > 1) {
            this.pageNumber -= 1;
        }
        
    }
}