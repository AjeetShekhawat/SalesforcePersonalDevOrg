/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';

export default class DynamicRowLwc extends LightningElement {
    @track dynamicRowArray = [{'Name' : ''}];
    
    addRow() {
        console.log(this.dynamicRowArray.length);
        this.dynamicRowArray.length++;
        let tempArray = [];
        for (let index = 0; index < this.dynamicRowArray.length; index++) {
            tempArray.push({'Name' : ''});
        }
        this.dynamicRowArray = tempArray;
    }
    deleteRow() {
        this.dynamicRowArray.length--;
        let tempArray = [];
        for (let index = 0; index < this.dynamicRowArray.length; index++) {
            tempArray.push({'Name' : ''});
        }
        this.dynamicRowArray = tempArray;
    }
}