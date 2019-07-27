/* eslint-disable no-console */
import { LightningElement, api } from 'lwc';

export default class AccountInsert extends LightningElement {

    
    @api recordList = {
        sObjectType : 'Account',
        Name : '',
        Phone : ''
    };
    handleClick() {
        console.log('accountList ' + JSON.stringify(this.recordList.Name));
        console.log('recordList ' + this.recordList);
    }
}