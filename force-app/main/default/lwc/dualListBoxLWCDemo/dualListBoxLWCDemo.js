/* eslint-disable no-console */
import {LightningElement, track, wire} from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class DualListBoxLWCDemo extends LightningElement {
    
    @track _selected = []; // this array tracks the seleted values

    // Getting Account Object info using wire service
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo;

    // Getting Pickvalues based on default recordtype using wire service
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD})
    IndustryValues;

    // assigning none if you are not seleted any values
    get selected() {
        console.log('objectInfo ** ' + JSON.stringify(this.objectInfo));
        console.log('IndustryValues ** ' + JSON.stringify(this.IndustryValues));
     //   console.log('_selected ** ' + this._selected);
        return this._selected.length ? this._selected : 'none';
    }

    // Handling the change event
    handleChange(event) {
        let siteName = 'ajeet';
        let urlTest;
        urlTest = '/'+ siteName + '/' + event.detail.value;
        console.log('value changed ** ' + event.detail.value);
        console.log('value changed urlTest ** ' + urlTest);
        this._selected = event.detail.value;
    }
    
}