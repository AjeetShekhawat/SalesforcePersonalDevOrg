import { LightningElement, wire, track } from 'lwc';
import fetchAccount from '@salesforce/apex/InteractionWithLWC.fetchAccount';
import fetchContact from '@salesforce/apex/InteractionWithLWC.fetchContact';
import fetchAccountWithParams from '@salesforce/apex/InteractionWithLWC.fetchAccountWithParams';
export default class AccountInfoDisplay extends LightningElement {
    // 1st way
    //@wire(fetchAccount) accountReocrds;

    @track accountReocrds;
    @track contactReocrds;
    @track accountFilterRecords;
    @track errorMessage;
    @track searchKey;

    @wire(fetchAccount)
    displayAccount({ data, error }) {
        if(data) {
            this.accountReocrds = data;
            /* eslint-disable no-console */
            console.log('data is ' + JSON.stringify(data));
        }
        if(error) {
            this.errorMessage = error;
            /* eslint-disable no-console */
            console.log('error is ' + JSON.stringify(error));
        }
    }

    // call Apex method from UI
    handleClick() {
        fetchContact().then(result => {
            this.contactReocrds = result;
            /* eslint-disable no-console */
            console.log('handleClick response success ' + JSON.stringify(result));
        })
        .catch(error => {
            /* eslint-disable no-console */
            console.log('handleClick response error ' + JSON.stringify(error));
        })
    }

    @wire(fetchAccountWithParams, {name : '$searchKey'}) 
    filteredAccount({ data, error }) {
        if(data) {
            this.accountFilterRecords = data; 
            console.log('accountFilterRecords ' + JSON.stringify(this.accountFilterRecords));
        }
        if(error) {
            console.log('accountFilterRecords error ' + JSON.stringify(error));
        }
    }

    handleClickForFilteredData(event) {
        var searchAccountKey = event.target.value;
        /* eslint-disable no-console */
        console.log('searchAccountKey *** ' + searchAccountKey);
        fetchAccountWithParams({name : searchAccountKey}).then(result => {
            this.accountFilterRecords = result;
            /* eslint-disable no-console */
            console.log('handleClickForFilteredData response success ' + JSON.stringify(result));
        })
        .catch(error => {
            /* eslint-disable no-console */
            console.log('handleClickForFilteredData response error ' + JSON.stringify(error));
        })
    }

}