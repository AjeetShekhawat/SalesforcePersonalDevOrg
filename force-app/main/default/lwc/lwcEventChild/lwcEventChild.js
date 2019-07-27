import { LightningElement } from 'lwc';

export default class LwcEventChild extends LightningElement {
    
    handlePrevious() {
        const previousEvent = new CustomEvent('previous');
        this.dispatchEvent(previousEvent);
    }
    
    handleNext() {
        const nextEvent = new CustomEvent('next');
        this.dispatchEvent(nextEvent);
    }
}