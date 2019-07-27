/* eslint-disable no-console */
import { LightningElement, api, track } from 'lwc';

export default class Child extends LightningElement {
    @api reactivePublicProperty;
    @track reactivePrivateProperty;
    nonReactivePrivateProperty;

    handleChange1(event) {
        this.reactivePublicProperty = event.target.value;
        console.log('this.reactivePublicProperty 1 ' + this.reactivePublicProperty);
    }

    handleChange2(event) {
        this.reactivePrivateProperty = event.target.value;
        console.log('this.reactivePrivateProperty 2 ' + this.reactivePrivateProperty);
    }

    handleChange3(event) {
        this.nonReactivePrivateProperty = event.target.value;
        console.log('this.nonReactivePrivateProperty 3 ' + this.nonReactivePrivateProperty);
    }
}