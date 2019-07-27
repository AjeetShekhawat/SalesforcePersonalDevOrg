trigger AccountAddressTrigger on Account (before insert, before update) {
    if(trigger.isInsert && trigger.isBefore) {
      //  SuperbadgeAssignment.shippingAddress(trigger.new);
    }
    if(trigger.isUpdate && trigger.isBefore) {
     //   SuperbadgeAssignment.shippingAddress(trigger.new);
    }
}