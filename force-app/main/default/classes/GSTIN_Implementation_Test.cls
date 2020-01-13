@isTest
global with sharing class GSTIN_Implementation_Test {
    global GSTIN_Implementation_Test() {

    }
    global GSTIN_Implementation_Test(Account acc) {

    }
/*
    @isTest static void gstTestMethod3() {
        
        Account acc = new Account();
        acc.Name = 'GST';
        acc.GSTIN__c = '33GSPTN9771G3ZL';
        acc.Phone = '9898989898';
        acc.Industry_Type_for_ChannelPartners__c = 'Battery Plant';
        
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        GSTIN_Implementation gst = new GSTIN_Implementation(sc);
        
    }
    
    @isTest static void gstTestMethod2() {
        Id RecordTypeIdAccount = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Retail Outlet').getRecordTypeId();
        
        Account acc = new Account();
        acc.Name = 'GST';
        acc.GSTIN__c = '33GSPTN9771G3ZL';
        acc.Phone = '9898989898';
        acc.Industry_Type_for_ChannelPartners__c = 'Battery Plant';
        acc.RecordTypeId = RecordTypeIdAccount;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        GSTIN_Implementation gst = new GSTIN_Implementation(sc);
        
        Insert acc;
        System.debug('acc ' + acc);
        
        Account acc1 = new Account();
        acc1.Name = 'GST1';
        acc1.GSTIN__c = '33GSPTN9771G3ZL';
        acc1.Phone = '9898989448';
        acc1.Industry_Type_for_ChannelPartners__c = 'Battery Plant';
        acc1.RecordTypeId = RecordTypeIdAccount;
        Insert acc1;

        GSTIN_Implementation gstClassIns = new GSTIN_Implementation();
        gstClassIns.gstin = '33GSPTN9771G3ZL';

        gstClassIns.getData();
    }

    @isTest static void gstTestMethod() {
        Id RecordTypeIdAccount = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Retail Outlet').getRecordTypeId();
        
        Account acc = new Account();
        acc.Name = 'GST';
        acc.GSTIN__c = '33GSPTN9771G3ZL';
        acc.Phone = '9898989898';
        acc.Industry_Type_for_ChannelPartners__c = 'Battery Plant';
        acc.RecordTypeId = RecordTypeIdAccount;
        Insert acc;
        System.debug('acc ' + acc);

        GSTIN_Implementation gstClassIns = new GSTIN_Implementation();

        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        GSTIN_Implementation gst = new GSTIN_Implementation(sc);

        gstClassIns.gstin = '33GSPTN9771G3ZP';

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new GstHttpCalloutMock()); 
        String gstin = '33GSPTN9771G3ZP';
        GSTIN_Implementation.callGstService(gstin);
        Test.stopTest();
        
		gstClassIns.acc = acc;
        gstClassIns.getData();
        gstClassIns.getDataOnIgnore();
        GSTIN_Implementation.getAccessToken();
        System.debug('RecordTypeIdAccount ' + RecordTypeIdAccount);
    }
    
    */
}