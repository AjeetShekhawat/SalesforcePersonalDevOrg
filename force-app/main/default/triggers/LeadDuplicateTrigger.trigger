// WarpDrive Question
trigger LeadDuplicateTrigger on Lead (before insert) {
    if(trigger.isInsert && trigger.isBefore) {
      //  LeadDuplicateHandler.preventDuplicateLead(trigger.new);
    }
}