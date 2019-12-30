/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';

export default class GetterFunction extends LightningElement {
    @track property = '';
   // property = '';
    handleChange(event) {
        console.log(event.target.value);        
        this.property = event.target.value;
    }

    get upperClass() {
        console.log('in getter upper');      
        return this.property.toUpperCase(); // whenever this reactive property changed, component will load again and it will call getter method in JS. 
    }
    get lowerClass() {
        console.log('in getter lower');      
        return this.property.toLowerCase();
    }
}