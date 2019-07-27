/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
    
    @track greeting = 'Welcome to LWC World';
    changeHandler(event) {
        this.greeting = event.target.value;
    }
}