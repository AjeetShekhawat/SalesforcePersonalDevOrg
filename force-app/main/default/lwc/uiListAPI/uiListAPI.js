/* eslint-disable no-console */
import { LightningElement, wire, track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getListUi, MRU } from 'lightning/uiListApi';

export default class UiListAPI extends LightningElement {
    @track value = 'inProgress';

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo;

    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD})
    IndustryPicklistValues;

    @wire(getListUi, { objectApiName: ACCOUNT_OBJECT, listViewApiName: 'MyAccounts' })
    getListViewDataFirstWay;

    @wire(getListUi, { listViewId: '00B7F00000C2h3qUAB'})
    getListViewDataSecondWay;

    @wire(getListUi, { objectApiName: ACCOUNT_OBJECT })
    getListViewDataThirdWay;

    @wire(getListUi, { objectApiName: ACCOUNT_OBJECT, listViewApiName: MRU }) // MRU : Most Recently Used
    getListViewDataFourthWay;

    handleChange() {
        console.log(JSON.stringify(this.getListViewDataFirstWay));       
        console.log(JSON.stringify(this.getListViewDataSecondWay));       
        console.log(JSON.stringify(this.getListViewDataThirdWay));       
        console.log(JSON.stringify(this.getListViewDataFourthWay));       
    }
}