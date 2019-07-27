public with sharing class ClassTypeAttributeLightning {

    @AuraEnabled public String welcomeMessage;
    @AuraEnabled public String userName;
    @AuraEnabled public List<Account> accountList;

    public ClassTypeAttributeLightning() {
        System.debug('ClassTypeAttributeLightning Constructor');
    }
    
    @AuraEnabled
    public static ClassTypeAttributeLightning sendClassData(){
        ClassTypeAttributeLightning clsType = new ClassTypeAttributeLightning();
        clsType.welcomeMessage = 'Welcome to lightning component world';
        clsType.userName = userinfo.getusername();
        clsType.accountList = [SELECT Id, Name FROM Account LIMIT 5];
        System.debug('clsType is ' + clsType);
        return clsType;
    }
}