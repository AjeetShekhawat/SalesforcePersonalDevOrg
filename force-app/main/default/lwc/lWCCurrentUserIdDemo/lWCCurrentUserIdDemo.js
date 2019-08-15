import { LightningElement } from 'lwc';
import Id from '@salesforce/user/Id';
export default class LWCCurrentUserIdDemo extends LightningElement {
    userId = Id;
}