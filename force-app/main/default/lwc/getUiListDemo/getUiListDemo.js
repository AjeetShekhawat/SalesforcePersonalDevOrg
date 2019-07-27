// // Code to fetch picklist according to object name, so will return all picklist list one that object.
import { LightningElement, wire, track } from 'lwc';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import State__FIELD from '@salesforce/schema/SaleExecutive__c';
export default class GetUiListDemo extends LightningElement {
    @track stateList;
    @wire(getPicklistValuesByRecordType, { recordTypeId: '0127F000001F2BwQAK', objectApiName: State__FIELD })
    propertyOrFunction({ data, error}) {
        if(data) {
            this.stateList = data;
            // eslint-disable-next-line no-console
            console.log('stateList ', JSON.stringify(this.stateList));
            
        } else {
            // eslint-disable-next-line no-console
            console.log('stateList error ', JSON.stringify(this.stateList));
            this.stateList = error;
        }
    }
}
/*
User1 :0127F000001F2BwQAK 
User2 : 0127F000001F2CLQA0
*/

// Code to fetch picklist according to particular field name, so will return only one picklist.
/*
import { LightningElement, wire, track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import State__FIELD from '@salesforce/schema/SaleExecutive__c.District__c';
// import State__FIELD from '@salesforce/schema/SaleExecutive__c.State__c';
export default class GetUiListDemo extends LightningElement {
    @track stateList;
    @wire(getPicklistValues, { recordTypeId: '0127F000001F2CLQA0', fieldApiName: State__FIELD })
    propertyOrFunction({ data, error}) {
        if(data) {
            this.stateList = data;
            // eslint-disable-next-line no-console
            console.log('stateList ', JSON.stringify(this.stateList));
            
        } else {
            // eslint-disable-next-line no-console
            console.log('stateList error ', JSON.stringify(this.stateList));
            this.stateList = error;
        }
    }
}

*/