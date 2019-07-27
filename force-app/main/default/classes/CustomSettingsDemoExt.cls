public with sharing class CustomSettingsDemoExt {
public boolean Enable{get;set;}

    public CustomSettingsDemoExt () {
        Id profileId = UserInfo.getProfileId();
        String profileName = [Select Name from Profile where Id =:profileId].name;  // Get the current user profile Name
        
        Map<string,DisplayPanel__c> DisplayMap = DisplayPanel__c.getAll();  
        Enable = DisplayMap.get(profileName).Enabled__c; // display the permission for current profile
    }
}