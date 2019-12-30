/* eslint-disable no-console */
import { LightningElement, api } from 'lwc';
import getAccountData from '@salesforce/apex/AccountDetailLightning.findAccoundName';

export default class JsonProcess extends LightningElement {
    displayData = true;
    @api selectVal = 'Hot';
    message; 
    error;
    @api leaveValue;

    // get is same as getter so when 'isSelectHot' is encountered in html, component will find 'isSelectHot' property with 
    // get keyword and then return some value.
    get isSelectHot() {
        return this.selectVal === "Hot";
    }
    get isSelectWarm() {
        return this.selectVal === "Warm";
    }
    get isSelectCold() {
        return this.selectVal === "Cold";
    }

    connectedCallback() {
        getAccountData()
        .then(result => {
            this.message = result;
            this.error = undefined;
            console.log('message is 1 ', this.message);
            console.log('error is 1 ', this.error);
        })
        .catch(error => {
            this.message = undefined;
            this.error = error;
            console.log('message is 2 ', this.message);
            console.log('error is 2 ', this.error);
        });
    }

    handleChange(event) {
        this.leaveValue = event.target.value;
        console.log('selected value of checkbox ', this.leaveValue);       
    }

    // When we hover mouse on checkbox it will give number of count of hover.
    mouseOutEvent(event) {
        console.log('selected value of checkbox mouse ', event.detail);       
    }

    jsonData = {
        "glossary": {
            "title": "example glossary",
            "GlossDiv": {
                "title": "S",
                "GlossList": {
                    "GlossEntry": {
                        "ID": "SGML",
                        "SortAs": "SGML",
                        "GlossTerm": "Standard Generalized Markup Language",
                        "Acronym": "SGML",
                        "Abbrev": "ISO 8879:1986",
                        "GlossDef": {
                            "para": "A meta-markup language, used to create markup languages such as DocBook.",
                            "GlossSeeAlso": ["GML", "XML"]
                        },
                        "GlossSee": "markup"
                    }
                }
            }
        }
    }
}