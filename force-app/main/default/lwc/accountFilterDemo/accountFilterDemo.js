/* eslint-disable no-console */
import { LightningElement,track,wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getListUi1 } from 'lightning/uiListApi';
import Type_FIELD from '@salesforce/schema/Account.Rating';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class AccountFilterDemo extends LightningElement {
    @track value = 'inProgress';
    @track count = 0;
    @track dateValue = new Date();
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo;

    @wire(getListUi1, { objectApiName: ACCOUNT_OBJECT, listViewApiName: 'MyAccounts' })
    propertyOrFunction;

    
    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: Type_FIELD})
    TypePicklistValues;

    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD})
    IndustryPicklistValues;

    handleChange(event) {
    //    this.value = event.detail.value; // detail and target both are same.
        this.value = event.target.value;
        console.log(this.value);
        console.log('^^^^^6 ', JSON.stringify(this.propertyOrFunction));
    }

    handleClick(event) {

        event.preventDefault();
        this.count += 1;
    }
}