import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class PageReference extends NavigationMixin(LightningElement) {
    @api heading = 'Page Reference Demo';

    // List
    navigateToList() {
        let pageReference = {
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Car__c",
                actionName: "list"
            },
            state: {
                filterName: "Recent"
            }
        };
        this[NavigationMixin.Navigate](pageReference, true);
    }

    //Record Page
    navigateToRecord() {
        let pageReferenceRecord = {
            type: "standard__recordPage",
            attributes: {
                recordId: "0017F00000gTPwBQAW",
                objectApiName: "Account",
                actionName: "view"
            },
            state: {

            }
        };
        this[NavigationMixin.Navigate](pageReferenceRecord, false);
    }

    // Home Page
    navigateToObjectHome() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Contact",
                actionName: "home"
            }
        });
    }

    // New Record Page
    navigateToNewRecordPage() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: "Account",
                actionName: "new"
            }
        });
    }

    // Edit Page
    navigateToEditPage() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                recordId: "0017F00000gTPwBQAW",
                objectApiName: "Account",
                actionName: "edit"
            }
        });
    }

    // Related List
    navigateToRelatedList() {
        this[NavigationMixin.Navigate]({
            type: "standard__recordRelationshipPage",
            attributes: {
                recordId: "0017F00000gTPwBQAW",
                objectApiName: "Account",
                relationshipApiName: 'Contacts',
                actionName: "view"
            }
        });
    }

    // Tab Page
    navigateToTabPage() {
        this[NavigationMixin.Navigate]({
            type: "standard__navItemPage",
            attributes: {
                apiName : 'Home'
            }
        });
    }

    // Web Page
    navigateToWebPage() {
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
                url: 'https://www.youtube.com/watch?v=2hx8nJQzS2I'
            }
        },
        {
            replace: true
        });
    }
}