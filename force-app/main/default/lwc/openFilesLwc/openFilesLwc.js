import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class OpenFilesLwc extends NavigationMixin(LightningElement) {

    navigateToFiles() {
      this[NavigationMixin.Navigate]({
        type: 'standard__namedPage',
        attributes: {
            pageName: 'filePreview'
        },
        state : {
            recordIds: '0697F00000NylAuQAJ,0697F00000NylAvQAJ,0697F00000NylAwQAJ',
            selectedRecordId:'0697F00000NylAuQAJ'
        }
      })
    }

}