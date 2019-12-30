/******************************************
* Created By  : Ajeet Singh Shekhawat
* Created On  : 09 july 2019
* Modified By : Ajeet Singh Shekhawat
* Modified On : 
* Description : If new quote is created with same 'Product' and 'Use Case' then fetch previous quote version and update new quote.                         
******************************************/
trigger QuoteTrigger on Quote (before insert, before update,After update) {
    if (trigger.isBefore && trigger.isInsert) {
    //    QuoteApprovalRejectionHandler.updateQuoteVersion(trigger.new);
    }
    if (trigger.isBefore && trigger.isUpdate) {
    //    QuoteApprovalRejectionHandler.commentBoxMandatoryOnApprovalRejection(trigger.new, trigger.oldMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
    //    QuoteApprovalRejectionHandler.updateOpportunityStatus(trigger.new, trigger.oldMap);
    }
}