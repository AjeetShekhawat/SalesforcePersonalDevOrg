import { LightningElement, api } from 'lwc';

export default class DesignAttributes extends LightningElement {
    @api pickListValues;
    @api stringValue;
    @api numberValue;
}