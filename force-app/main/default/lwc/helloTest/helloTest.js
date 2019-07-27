import { LightningElement, track } from 'lwc';
//import SalesforceDoc from '@salesforce/contentAssetUrl/SalesforceDoc';
import LANG from '@salesforce/i18n/lang';
import thickOfProduct from '@salesforce/label/c.Thickness';
import TRAILHEAD_LOGO from '@salesforce/resourceUrl/trailhead_logo';
import POSITION_OBJECT from '@salesforce/schema/Bank__c';
import NAME_FIELD from '@salesforce/schema/Bank__c.Toll_free_number__c';
export default class HelloWorld extends LightningElement {
    @track greeting = 'Ajeet';
    changeHandler(event) {
        this.greeting = event.target.value;
        /* eslint-disable no-console */
        console.log('SalesforceDoc ', LANG);
        console.log('thickOfProduct ', thickOfProduct);
        console.log('TRAILHEAD_LOGO ', TRAILHEAD_LOGO);
        console.log('POSITION_OBJECT ', POSITION_OBJECT);
        console.log('NAME_FIELD ', NAME_FIELD);
    } 
}