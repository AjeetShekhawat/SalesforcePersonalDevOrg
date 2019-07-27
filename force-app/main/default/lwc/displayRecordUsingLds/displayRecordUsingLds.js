import { LightningElement, api } from 'lwc';

export default class DisplayRecordUsingLds extends LightningElement {
    // Expose a recordId property.
    @api recordId;
}