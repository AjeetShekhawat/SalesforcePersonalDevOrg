/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
import saveList from '@salesforce/apex/AccountsController.saveList';
export default class ListofObject extends LightningElement {
    @track accountList = {'sObjectType' : 'Account', 'Name' : '', 'Min__c' : ''};
    showList() {
        saveList({'listObject' : this.accountList})
        .then(result => {
            console.log('result ' + JSON.stringify(result));
        })
        .catch(error => {
            console.log('error ' + error);
        });
         console.log('list is 1 ' + JSON.stringify(this.accountList));
         console.log('list is 2 ' + this.accountList);
         console.log('list type 3 ' + typeof(this.accountList));
    } 
}