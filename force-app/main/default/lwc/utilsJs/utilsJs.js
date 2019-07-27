import { ShowToastEvent } from 'lightning/platformShowToastEvent';


const showToast = (variant, title, message, mode='sticky') => {
    const eventToast = new ShowToastEvent({
        title: title,
        message: message,
        variant: variant,
        mode : mode
    });
    return eventToast;
}

// eslint-disable-next-line no-alert
const showAlertMessage = () => alert('Hi LWC');
export { showToast, showAlertMessage };