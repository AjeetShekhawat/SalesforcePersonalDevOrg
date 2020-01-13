/* eslint-disable no-console */
import { LightningElement,track } from 'lwc';
import doInit from '@salesforce/apex/AccountsController.getAllObjectName';
import fetchFieldInfo from '@salesforce/apex/AccountsController.getFieldsInfo';
import saveRecords from '@salesforce/apex/AccountsController.saveFormRecords';

export default class FormJsonCreate extends LightningElement {
    @track sObjectList = [];
    @track sObjectFieldList = [];
    @track showSaveButton = false;
    @track errorMessage;
    @track value = '';
    @track _selected = [];

    sObjectListTemp = [];
    sObjectFieldListTemp = [];
    fieldKeyMap = [];
    finalJsonFileToSave = {};

    connectedCallback() {
        this.callDoInit();
    }

    // same as doInit in lightning component.
    callDoInit() {
        doInit()
        .then(result => {
            result.forEach(element => {
                this.sObjectListTemp.push({ label: element, value: element});
            });
            this.errosrMessage = undefined;
            console.log('final result is ' + JSON.stringify(this.sObjectListTemp));
            this.sObjectList = this.sObjectListTemp;
        })
        .catch(error => {
            this.sObjectList = undefined;
            this.errorMessage = error;
            console.log('error is ' + error);
        });
    }

    handleChange(event) {
        this.value = event.detail.value;
        this.callBackend(this.value);
    }

    callBackend() {
        fetchFieldInfo({'objectName' : this.value})
        .then(result => {
            console.log('result issss ' + JSON.stringify(result[0].fieldType));
            result.forEach(element => {
                this.sObjectFieldListTemp.push({ label: element.fieldLabel, value: element.fieldName, fieldType: element.fieldType});
                this.fieldKeyMap.push({ value: element.fieldName, element });
            });
            console.log('result all fields ' + JSON.stringify(this.fieldKeyMap));
            this.sObjectFieldList = this.sObjectFieldListTemp;
        })
        .catch(error => {
            console.log('error ' + error);
        });
    }

    get selected() {
        return this._selected.length ? this._selected : 'none';
    }

    handleChangeDualBox(e) {
        this._selected = e.detail.value;
        console.log('len ' + this._selected.length);
        
        if(this._selected.length) {
            this.showSaveButton = true;
        } else {
            this.showSaveButton = false;
        }
        let jsonFileTemp = {};
        let optionsArray = [];
        for (let index = 0; index < this._selected.length; index++) {
            for (let indexInner = 0; indexInner < this.fieldKeyMap.length; indexInner++) {
                if(this.fieldKeyMap[indexInner].value === this._selected[index]) {
                    optionsArray.push({
                        "Label" : this.fieldKeyMap[indexInner].element.fieldLabel,
                        "Field API" : this._selected[index],
                        "Field Type" : this.fieldKeyMap[indexInner].element.fieldType,
                        "Field Option" : "yty"
                    });
                }
            }
        }
        jsonFileTemp['Object API'] = this.value;
        jsonFileTemp.Options = optionsArray;
        jsonFileTemp.WS_URL = "Test";
        this.finalJsonFileToSave = jsonFileTemp;
        console.log('jsonFile ' + JSON.stringify(jsonFileTemp));
    }

    saveData() {
        saveRecords({'jsonFile' : JSON.stringify(this.finalJsonFileToSave)})
        .then(result => {
            console.log('result after save ', result);
        })
        .catch(error => {
            console.log('error after save ' + error);
        });
    }
}