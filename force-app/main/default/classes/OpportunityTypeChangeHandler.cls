/******************************************
* Created By  : Ajeet Singh Shekhawat
* Created On  : 27 jun 2019
* Modified By : Ajeet Singh Shekhawat
* Modified On : 29 jun 2019
* Test Class  : OpportunityTypeChangeHandlerTest
* Description : 1. Update 'Type' field of opportunity if this is the 1st opportunity in particular account.
2. Assign 'FSM' based on account billing country and user profile is FSM and User region should match with billing country.
3. Create Master charge code
4. Create New 'Contact' For Economic Buyer/Technical Buyer against that opportunity Account whenever new opportunity is created and create 'contact role' for that opportunity.
5. Delete old master product when there is change in Product or currency and create new 'oportunity Product' with new master product.
6. Fetch Competitors records from Lead and display them under opportunity of that Lead.
7. Method to check one of EB/TB set is not blank then make EBTBTrigger__c field to true.
8. Method to create Opportunity Products based on Currency and Product and tag PriceBook to that particular opportunity.                         
******************************************/
public with sharing class OpportunityTypeChangeHandler {
    /*
public OpportunityTypeChangeHandler() {
        
    }
    // Variable to stop recursion 
    public static boolean stopRecursion = true;
    public static boolean stopRecursionDel = true;
    public static boolean stopRecursionCon = true;
    public static boolean stopRecursionCom = true;
    public static boolean stopRecursionPriceBook = true;
    public static boolean stopRecursionChargeCodeMaster = true;
    
    // method to update 'Type' field and 'FSM' assignment on opportunity. If this is the 1st opportunity for Account then value of 'Type' will be 'New Logo'.
    public static void changeLeadBasedOnOpportunity(List<Opportunity> oppoList) {
        if (OpportunityTypeChangeHandler.stopRecursion) {
            OpportunityTypeChangeHandler.stopRecursion = false;
            
            Set<Id> accountIdSet = new Set<Id>();
            Set<Id> productIdSet = new Set<Id>();
            Set<String> opportunityLocationSet = new Set<String>();
            Map<Id,Integer> countMap = new Map<Id,Integer>();
            Map<String,Id> userLocationMap = new Map<String,Id>();
            Map<Id,String> billingCountryMap = new Map<Id,String>();
            
            try {
                System.debug('oppoList ' + oppoList);
                
                if(oppoList.size() > 0) {
                    for (Opportunity opp : oppoList) {
                        accountIdSet.add(opp.accountId);
                        productIdSet.add(opp.product__c);
                    }
                }
                String MultiPickLitV ='';
                Integer i=0;
                if(accountIdSet.size() > 0) {
                    for (Account acc : [SELECT Id, Region__c FROM Account WHERE Id IN: accountIdSet]) {
                        opportunityLocationSet.add(acc.Region__c);
                        if(i==0){
                        MultiPickLitV +='(\''+acc.Region__c+';';
                        }else if(i==accountIdSet.size()-1){
                          MultiPickLitV += acc.Region__c;
                        }else{
                          MultiPickLitV += acc.Region__c+';';
                        } 
                       
                        billingCountryMap.put(acc.Id, acc.Region__c);
                    }
                }
                MultiPickLitV +='\')';
                
                
                System.debug('MultiPickLitV ' + MultiPickLitV );
               // System.debug(String.valueOf(opportunityLocationSet).replace('{','(').replace('}',')'));
               // String opp = String.valueOf(opportunityLocationSet).replace('{','(').replace('}',')');
                String profileFromCustomLabel = Label.AssignmentProfile;    // fetching User Profile from 'AssignmentProfile' custom label.
                String query = 'SELECT Id, Region__c FROM User WHERE Region__c includes '+MultiPickLitV +' AND  Region__c != null AND Profile.Name =: profileFromCustomLabel LIMIT 1';
                system.debug('-----query-------'+query);
                
                for (User usr : Database.query(query )) { 
                                    for(String each : usr.Region__c.split(';')) {
                                        userLocationMap.put(each, usr.Id);
                                    }
                                     
                }
                
                System.debug('accountIdSet ' + accountIdSet);
                System.debug('userLocationMap ' + userLocationMap); 
                
                List<AggregateResult> oppoAgrList = [SELECT count(Id) opportunityCount, accountId FROM Opportunity
                                                     WHERE accountId IN: accountIdSet GROUP BY accountId];   // Getting count of opportunity against each account
                System.debug('oppoAgrList ' + oppoAgrList);     
                
                
                
                if(oppoAgrList.size() > 0) {
                    for (AggregateResult agrOppo : oppoAgrList) {
                        countMap.put((Id)agrOppo.get('accountId'), Integer.valueOf(agrOppo.get('opportunityCount'))); 
                    }
                }
                System.debug('countMap ' + countMap);
                
                if(oppoList.size() > 0) {
                    for (Opportunity op : oppoList) {
                        
                        // Update FSM field based on Account billing country and User profile which is 'FSM'
                        
                        
                        op.FSM__c = userLocationMap.get(billingCountryMap.get(op.AccountId));
                        
                        // Logic to update 'Type' field
                        if (countMap.get(op.accountId) > 0) {
                            // If account has more than 1 opportunity then do nothing
                        } else {
                            op.Type = 'New logo';
                        }
                    }
                }
                System.debug('oppoList after update ' + oppoList);
            } catch (Exception ex) {
                System.debug('Exception in changeLeadBasedOnOpportunity ' + ex);
            }
        }
    }
    
    // Create charge code master when opportunity stage is Verbal Commitment. If there are n number of 'Sub-Product' then n number of 'chargeCodeMastar' will be created.
    public static void chargeCodeMasterCreation(List<Opportunity> oppoList) {
        if (OpportunityTypeChangeHandler.stopRecursionChargeCodeMaster) {
            OpportunityTypeChangeHandler.stopRecursionChargeCodeMaster = false;
            
            Set<Id> accountIdSet = new Set<Id>();
            Set<Id> productIdSet = new Set<Id>();
            Map<Id,Integer> countMap = new Map<Id,Integer>();
            Map<Id, List<String>> subProductsMap = new Map<Id, List<String>>(); 
            Map<Id,String> accountClientCodeMap = new Map<Id,String>();
            List<Charge_Code_Master__c> chargeCodeMasterInsertList = new List<Charge_Code_Master__c>();
            List<Opportunity> opportunityChargeCodeCheckboxUpdate = new List<Opportunity>();
            
            try {
                System.debug('oppoList 111 ' + oppoList);
                if(oppoList.size() > 0) {
                    for (Opportunity opp : oppoList) {
                        accountIdSet.add(opp.accountId);
                        productIdSet.add(opp.product__c);
                        
                    }
                }
                if(accountIdSet.size() > 0) {
                    List<Account> accList = [SELECT Id,Client_Code__c FROM Account WHERE Id IN: accountIdSet];
                    System.debug('---accList---'+accList);
                    if(accList.size() > 0) {
                        for (Account acc : accList) {
                            accountClientCodeMap.put(acc.ID, acc.Client_Code__c);
                        }
                    }  
                }
                
                System.debug('accountIdSet 111' + accountIdSet);
                
                List<AggregateResult> oppoAgrList = [SELECT count(Id) opportunityCount, accountId FROM Opportunity
                                                     WHERE accountId IN: accountIdSet GROUP BY accountId];   // Getting count of opportunity against each account
                
                System.debug('oppoAgrList 111 ' + oppoAgrList);
                
                if(oppoAgrList.size() > 0) {
                    for (AggregateResult agrOppo : oppoAgrList) {
                        countMap.put((Id)agrOppo.get('accountId'), Integer.valueOf(agrOppo.get('opportunityCount'))); 
                    }
                }             
                
                List<Sub_Product__c> subProducts = [SELECT name,Alias__c,Product__c FROM Sub_Product__c WHERE Product__c IN: productIdSet];
                System.debug('subProducts 111 ' + subProducts);
                
                if(subProducts.size()>0)
                {
                    for(Sub_Product__c subProduct : subProducts)
                    {   
                        If(!subProductsMap.isEmpty() && subProductsMap.containsKey(subProduct.product__c) && subProductsMap.get(subProduct.product__c) != null)
                        {
                            subProductsMap.get(subProduct.product__c).add(subProduct.Alias__c);
                        }
                        else
                        {
                            subProductsMap.put(subProduct.product__c, new List<String>{subProduct.Alias__c});
                        }
                    }
                }
                else
                {
                    List<Product2> Products = [SELECT Id,Name,ProductCode FROM Product2 WHERE Id IN: productIdSet]; 
                    for(Product2 Prod : Products)
                    {   
                        If(!subProductsMap.containsKey(Prod.Id))
                        {
                            subProductsMap.put(Prod.Id, new List<String>{Prod.ProductCode});
                        }
                    }
                }
                System.debug('subProductsMap 111 ' + subProductsMap);
                
                //vineet- Charge Code Assignment for  Opportunities
                for(Opportunity opp:oppoList)
                {
                    
                    System.debug('trtrytry1');
                    // Charge_Code_Master_Stage = Verbal Commitment
                    if(opp.StageName == Label.Charge_Code_Master_Stage && opp.Charge_Code_Creation__c == false)
                    {
                        System.debug('try2tyr2');
                        if(countMap.get(opp.accountId)>0)
                        {
                            System.debug('yrty3');
                            if(Integer.valueof(countMap.get(opp.accountId)) > 0 && Integer.valueof(countMap.get(opp.accountId)) < 10)
                            {
                                System.debug('yrtyrt4');
                                if(subProductsMap.get(opp.Product__c)!=null)
                                {
                                    Integer value=countMap.get(opp.accountId);
                                    System.debug('if111 ' + value + ' ***length**** ' + subProductsMap.get(opp.Product__c).size());
                                    
                                    for (Integer i = 0; i < subProductsMap.get(opp.Product__c).size(); i++) {
                                        List<String> aliasValue = subProductsMap.get(opp.Product__c);
                                        Charge_Code_Master__c chargeCodeMastar = new Charge_Code_Master__c();
                                        chargeCodeMastar.Name = accountClientCodeMap.get(opp.AccountId) + '-00' + value + '-' + aliasValue[i];
                                        chargeCodeMastar.Opportunity__c = opp.Id;
                                        chargeCodeMasterInsertList.add(chargeCodeMastar);
                                    }
                                }
                            }
                            else if(Integer.valueof(countMap.get(opp.accountId)) > 9 && Integer.valueof(countMap.get(opp.accountId)) < 100)
                            {
                                if(subProductsMap.get(opp.Product__c)!=null)
                                {
                                    Integer value=countMap.get(opp.accountId); 
                                    System.debug('if222 ' + value + ' ***length**** ' + subProductsMap.get(opp.Product__c).size());   
                                    
                                    for (Integer i = 0; i < subProductsMap.get(opp.Product__c).size(); i++) {
                                        List<String> aliasValue = subProductsMap.get(opp.Product__c);
                                        Charge_Code_Master__c chargeCodeMastar = new Charge_Code_Master__c();
                                        chargeCodeMastar.Name = accountClientCodeMap.get(opp.AccountId) + '-0' + value + '-' + aliasValue[i];
                                        chargeCodeMastar.Opportunity__c = opp.Id;
                                        chargeCodeMasterInsertList.add(chargeCodeMastar);
                                    }
                                    
                                }
                            }
                            else
                            {
                                if(subProductsMap.get(opp.Product__c)!=null)
                                {
                                    Integer value=countMap.get(opp.accountId);
                                    System.debug('if333 ' + value + ' ***length**** ' + subProductsMap.get(opp.Product__c).size());
                                    
                                    for (Integer i = 0; i < subProductsMap.get(opp.Product__c).size(); i++) {
                                        List<String> aliasValue = subProductsMap.get(opp.Product__c);
                                        Charge_Code_Master__c chargeCodeMastar = new Charge_Code_Master__c();
                                        chargeCodeMastar.Name = accountClientCodeMap.get(opp.AccountId) + '-' + value + '-' + aliasValue[i];
                                        chargeCodeMastar.Opportunity__c = opp.Id;
                                        chargeCodeMasterInsertList.add(chargeCodeMastar);
                                    }
                                }
                            }
                        }
                        else
                        {
                            if(subProductsMap.get(opp.Product__c)!=null)
                            {
                                System.debug('if444 ' + subProductsMap.get(opp.Product__c).size());
                                
                                for (Integer i = 0; i < subProductsMap.get(opp.Product__c).size(); i++) {
                                    List<String> aliasValue = subProductsMap.get(opp.Product__c);
                                    Charge_Code_Master__c chargeCodeMastar = new Charge_Code_Master__c();
                                    chargeCodeMastar.Name = accountClientCodeMap.get(opp.AccountId) + '-001-' + aliasValue[i];
                                    chargeCodeMastar.Opportunity__c = opp.Id;
                                    chargeCodeMasterInsertList.add(chargeCodeMastar);
                                }
                            }
                        }
                        // Update 'Charge Code Creation' to true so if user again update opportunity, it will stop duplicate Charge Code Creation.
                        Opportunity oppChargeCode = new Opportunity();
                        oppChargeCode.Id = opp.Id;
                        oppChargeCode.Charge_Code_Creation__c = true;
                        opportunityChargeCodeCheckboxUpdate.add(oppChargeCode);
                    }                  
                }  
                
                System.debug('countMap 111 ' + countMap);
                System.debug('chargeCodeMasterInsertList 111' + chargeCodeMasterInsertList);
                
                if (chargeCodeMasterInsertList.size() > 0) {
                    Insert chargeCodeMasterInsertList;
                }

                if (opportunityChargeCodeCheckboxUpdate.size() > 0) {
                    Update opportunityChargeCodeCheckboxUpdate;
                }
                
            } catch (Exception ex) {
                System.debug('Exception in chargeCodeMasterCreation ' + ex);
            }
        }    
    } 
    
    
    // Method to create New 'Contact' For Economic Buyer/Technical Buyer against that opportunity Account whenever new opportunity is created and create 'contact role' for that opportunity.
    public static void createAdditionalContact(List<Opportunity> newOppoListForContact) {
        if (OpportunityTypeChangeHandler.stopRecursionCon) {
            OpportunityTypeChangeHandler.stopRecursionCon = false;
            try {
                List<Contact> conListEBInsert = new List<Contact>();
                List<Contact> conListTBInsert = new List<Contact>();
                List<OpportunityContactRole> OppConRoleListToInsert = new List<OpportunityContactRole>();
                List<Opportunity> makeEBCheckboxTrue = new List<Opportunity>();
                List<Opportunity> makeTBCheckboxTrue = new List<Opportunity>();

                Map<Id, Id> oppConRoleMap = new Map<Id, Id>();
                
                if (newOppoListForContact.size() > 0) {
                    for (Opportunity opp : newOppoListForContact) {
                        if(opp.EB_Created__c == false || opp.TB_Created__c == false) {
                            oppConRoleMap.put(opp.AccountId, opp.Id);
                            
                            // Check for Contact Mandatory fields 'Last Name' and 'AccountId'.
                            if(opp.Name_of_EB_TB__c != null && opp.Email_of_EB_TB__c != null && opp.EB_Location__c != null && opp.AccountId != null && opp.EB_Created__c == false && opp.EB_Contact__c != null) {
                                Contact conEB = new Contact();
                                conEB.LastName = opp.Name_of_EB_TB__c;
                                conEB.Email = opp.Email_of_EB_TB__c;
                                conEB.Location__c = opp.EB_Location__c;
                                conEB.AccountId = opp.AccountId;
                                conListEBInsert.add(conEB);
                            }
                            
                            if(opp.Name_of_TB__c != null && opp.Email_of_TB__c != null && opp.TB_Location__c != null && opp.AccountId != null && opp.TB_Created__c == false && opp.TB_Contact__c != null) {
                                Contact conTB = new Contact();
                                conTB.LastName = opp.Name_of_TB__c;
                                conTB.Email = opp.Email_of_TB__c;
                                conTB.Location__c = opp.TB_Location__c;
                                conTB.AccountId = opp.AccountId;
                                conListTBInsert.add(conTB);
                            }                                                                                                           
                        }
                    }   
                }
                
                
                System.debug('conListEBInsert 123 ' + conListEBInsert);
                if (conListEBInsert.size() > 0 && conListEBInsert != null) {
                    Insert conListEBInsert; // Creating New Contact for newly created Opportunity.

                    /* 1st time EB_Created__c will be false so it will create contact and contactrole for insert and update(If EB set available then make EB_Created__c to true),
                        so that on next update of opportunity it will prevent to create duplicate records. Starts Here 

                    for (Opportunity oprData : newOppoListForContact) {
                        Opportunity oprInst = new Opportunity();
                        oprInst.Id = oprData.Id;
                        oprInst.EB_Created__c = true;
                        makeEBCheckboxTrue.add(oprInst);
                    }

                    if (makeEBCheckboxTrue.size() > 0) {
                        Update makeEBCheckboxTrue;
                    }
                    

                }
                
                if (conListTBInsert.size() > 0 && conListTBInsert != null) {
                    Insert conListTBInsert; // Creating New Contact for newly created Opportunity.

                    /* 1st time TB_Created__c will be false so it will create contact and contactrole for insert and update(If TB set available then make TB_Created__c to false),
                        so that on next update of opportunity it will prevent to create duplicate records. Starts Here 

                    for (Opportunity oprData : newOppoListForContact) {
                        Opportunity oprInst = new Opportunity();
                        oprInst.Id = oprData.Id;
                        oprInst.TB_Created__c = true;
                        makeTBCheckboxTrue.add(oprInst);
                    }

                    if (makeTBCheckboxTrue.size() > 0) {
                        Update makeTBCheckboxTrue;
                    }
                    
                }

                // Logic to create OpportunityContactRole when Contact is created for EB section.
                if (conListEBInsert.size() > 0) {
                    for (Contact con : conListEBInsert) {
                        OpportunityContactRole opConRole = new OpportunityContactRole();
                        opConRole.ContactId = con.Id;
                        opConRole.OpportunityId = oppConRoleMap.get(con.AccountId);
                        OppConRoleListToInsert.add(opConRole);
                    }
                }
                // Logic to create OpportunityContactRole when Contact is created for TB section.
                if (conListTBInsert.size() > 0) {
                    for (Contact con : conListTBInsert) {
                        OpportunityContactRole opConRole = new OpportunityContactRole();
                        opConRole.ContactId = con.Id;
                        opConRole.OpportunityId = oppConRoleMap.get(con.AccountId);
                        OppConRoleListToInsert.add(opConRole);
                    }
                }
                
                System.debug('OppConRoleListToInsert 456 ' + OppConRoleListToInsert);
                if (OppConRoleListToInsert.size() > 0 && OppConRoleListToInsert != null) {
                    Insert OppConRoleListToInsert; // Creating New OpportunityContactRole for newly created Opportunity.
                }
                
            } catch (Exception ex) {
                System.debug('Exception in createAdditionalContact ' + ex);
            }
        }
    }
    
    // Method to delete old master product when there is change in Product or currency and create new 'oportunity Product' with new master product.
    public static void deleteOldOpporProduct(Map<Id,Opportunity> oldOppoMap, List<Opportunity> newOppoList) {
        
        if (OpportunityTypeChangeHandler.stopRecursionDel) {
            OpportunityTypeChangeHandler.stopRecursionDel = false;
            try {
                List<OpportunityLineItem> oppLineItemList = new List<OpportunityLineItem>();
                List<OpportunityLineItem> opProdLineList = new List<OpportunityLineItem>();
                Set<Id> product2IdSet = new Set<Id>();
                Set<Id> product2IdSetToDelete = new Set<Id>();
                Map<Id, Id> priceBookMap = new Map<Id, Id>();
                
                if (newOppoList.size() > 0) {
                    for (Opportunity opp : newOppoList) {
                        product2IdSetToDelete.add(opp.Id); // whenever opportunity is updated this code will run
                        /*   if ((opp.Product__c != oldOppoMap.get(opp.Id).Product__c) || (opp.CurrencyIsoCode != oldOppoMap.get(opp.Id).CurrencyIsoCode)) {
product2IdSetToDelete.add(opp.Id);
}
                    } 
                }
                if (product2IdSetToDelete.size() > 0) {
                    opProdLineList = [SELECT Id FROM OpportunityLineItem WHERE OpportunityId IN: product2IdSetToDelete AND Product2.Master_Product__c = true];
                }
                
                System.debug('opProdLineList ' + opProdLineList);
                if (opProdLineList.size() > 0 && !opProdLineList.isEmpty()) {
                    Delete opProdLineList;
                }
                
                System.debug('product2IdSetToDelete ' + product2IdSetToDelete + ' *** ' + product2IdSetToDelete.size());
                
                // Process logic only if product are differnet after opportunity update.
                if (product2IdSetToDelete.size() > 0 && !product2IdSetToDelete.isEmpty()) {
                    priceBookMethod(newOppoList);   // Method to create Opportunity Products based on Currency and Product and tag PriceBook to that particular opportunity.
                }
                
            } catch (Exception ex) {
                System.debug('Exception in deleteOldOpporProduct ' + ex);
            }
        }
    }
    
    // Method to fetch Competitors records from Lead and display them under opportunity of that Lead.
    public static void createCompetitors(List<Opportunity> newOppoList) {
        
        if (OpportunityTypeChangeHandler.stopRecursionCom) {
            OpportunityTypeChangeHandler.stopRecursionCom = false;
            try {
                Set<Id> leadIdSet = new Set<Id>();
                Map<Id, List<Competitor__c>> cmpetitorMap = new Map<Id, List<Competitor__c>>();
                List<Competitor__c> cmpListToInsert = new List<Competitor__c>();
                
                if (newOppoList.size() > 0) {
                    for (Opportunity opp : newOppoList) {
                        if (opp.Lead_Id__c != null) {
                            leadIdSet.add(opp.Lead_Id__c);  // Getting Id of Lead so we can fetch Competitors(child of Lead)
                        }
                    } 
                }
                System.debug('leadIdSet ' + leadIdSet);
                /*  fetching Competitors list for all Lead records 
                List<Competitor__c> competitorList = [SELECT Id, Name, Competition_Details__c, Lead__c FROM Competitor__c WHERE Lead__c IN: leadIdSet];
                
                System.debug('competitorList ' + competitorList);
                
                /*  In cmpetitorMap we are putting list of Competitors as value and Lead Id as key 
                if (competitorList.size() > 0) {
                    for (Competitor__c cmpIteration : competitorList) {
                        if(!cmpetitorMap.isEmpty() && cmpetitorMap.containsKey(cmpIteration.Lead__c) && cmpetitorMap.get(cmpIteration.Lead__c) != null) {
                            cmpetitorMap.get(cmpIteration.Lead__c).add(cmpIteration);
                        } else {
                            cmpetitorMap.put(cmpIteration.Lead__c, new List<Competitor__c>{cmpIteration});
                        }
                    } 
                }
                
                System.debug('cmpetitorMap ' + cmpetitorMap);
                
                if (newOppoList.size() > 0 && !cmpetitorMap.isEmpty()) {
                    for(Opportunity opp : newOppoList) {                        
                        for(Competitor__c cmpetitor : cmpetitorMap.get(opp.Lead_Id__c)) {
                            Competitor__c cmp = new Competitor__c();    // New instance of Competitors so we can update with using Opportunity Id so it will be in related list of Opportunity. 
                            cmp.Id = cmpetitor.Id;
                            cmp.Opportunity__c = opp.Id;
                            cmpListToInsert.add(cmp);
                        }
                    } 
                }
                
                System.debug('cmpListToInsert ' + cmpListToInsert);
                
                if (cmpListToInsert.size() > 0 && cmpListToInsert != null) {
                    Update cmpListToInsert; // Updating existing Competitors record with Opportunity Id.
                }
                
            } catch (Exception ex) {
                System.debug('Exception in createCompetitors ' + ex);
            }
        }
    }
    

    // Method to create Opportunity Products based on Currency and Product and tag PriceBook to that particular opportunity.
    public static void priceBookMethod(List<Opportunity> opportunityTriggerList) {
        if (OpportunityTypeChangeHandler.stopRecursionPriceBook) {
            OpportunityTypeChangeHandler.stopRecursionPriceBook = false;
            
            Set<String> clientCodeSet = new Set<String>();
            Set<Id> accountIdSet = new Set<Id>();
            Set<Id> priceBookIdSet = new Set<Id>();
            Set<String> productSet = new Set<String>();
            Set<String> currencySet = new Set<String>();
            
            List<Pricebook2> priceBookList = new List<Pricebook2>();
            List<PricebookEntry> priceBookEntryList = new List<PricebookEntry>();
            List<Account> accountList = new List<Account>();
            List<Account> accountListToUpdate = new List<Account>();
            List<Opportunity> opportunityListToUpdate = new List<Opportunity>();
            List<Opportunity> opportunityListToUpdateWithPB = new List<Opportunity>();
            List<Opportunity> opportunityListToUpdateCheckbox = new List<Opportunity>();
            List<OpportunityLineItem> oppLineItemListToInsert = new List<OpportunityLineItem>();
            
            Map<String, Id> priceBookEntryMap = new Map<String, Id>();
            Map<Id, Decimal> priceBookListPriceMap = new Map<Id, Decimal>();
            try {
                if (opportunityTriggerList.size() > 0) {
                    for (Opportunity opp  : opportunityTriggerList) {
                        accountIdSet.add(opp.AccountId);
                        productSet.add(opp.Product__c);
                        currencySet.add(opp.CurrencyIsoCode);
                    }
                    // Logic to make 'PriceBook Product Available' field as true so we can use it in validation rule to prevent user proceed further without entering pricebook and produt entry. 
                    // Start Here
                    for (Opportunity opIns : opportunityTriggerList) {
                        Opportunity oppData = new Opportunity();
                        oppData.Id = opIns.Id;
                        oppData.PriceBook_Product_Available__c = true; // This field is used in Opportunity validation.
                        opportunityListToUpdateCheckbox.add(oppData);
                    }
                    if (opportunityListToUpdateCheckbox.size() > 0) {
                        Update opportunityListToUpdateCheckbox;
                    }   // End Here
                    
                    if (accountIdSet.size() > 0) {
                        accountList = [SELECT Id, Name, Client_Code__c FROM Account WHERE ID IN: accountIdSet];
                        if (accountList.size() > 0) {
                            for (Account acc : accountList) {
                                clientCodeSet.add(acc.Client_Code__c);
                            }
                            System.debug('clientCodeSet ***** ' + clientCodeSet); 
                            
                            if (clientCodeSet.size() > 0) {
                                priceBookList = [SELECT Id, Name, Unique_Client_code__c FROM Pricebook2 WHERE Unique_Client_code__c IN: clientCodeSet LIMIT 1];
                            }
                            System.debug('priceBookList ***** ' + priceBookList);
                            
                            // if block to tag pricebook to particular opportunity. start here
                            if (priceBookList.size() > 0) {
                                for (Opportunity oprt : opportunityTriggerList) {
                                    Opportunity oppIns = new Opportunity();
                                    oppIns.Id = oprt.Id;
                                    oppIns.PriceBook2Id = priceBookList[0].Id; // Tagged selected pricebook to Particular opportunity, now on 'quotelineitem' this is the deafult pricebook.
                                    opportunityListToUpdateWithPB.add(oppIns);
                                }
                            }
                            
                            if (opportunityListToUpdateWithPB.size() > 0) {
                                Update opportunityListToUpdateWithPB;
                            }
                            // if block to tag pricebook to particular opportunity. end here
                            
                            // If PriceBook found based on client code then proceed further else display message on Account.
                            if (priceBookList.size() > 0) {
                                // If Pricebook is available for client code of account then blank the value of 'Price book Message'. starts from here 
                                for (Account accData : accountList) {
                                    Account accInstance = new Account();
                                    accInstance.Id = accData.Id;
                                    accInstance.Price_Book_Message__c = '';
                                    accountListToUpdate.add(accInstance);
                                }
                                if (accountListToUpdate.size() > 0) {
                                    Update accountListToUpdate;
                                }
                                System.debug('222accountListToUpdate222 ' + accountListToUpdate);
                                // If Pricebook is available for client code of account then blank the value of 'Price book Message'. End here 
                                
                                for (Pricebook2 pBook : priceBookList) {
                                    priceBookIdSet.add(pBook.Id);
                                }
                                
                                System.debug('priceBookIdSet 1  ***** ' + priceBookIdSet);
                                System.debug('productSet 2 ***** ' + productSet);
                                System.debug('currencySet 3 ***** ' + currencySet);
                                
                                // If product in PriceBook found based on Product and currency then Insert Opportunity Product else display message on opportunity
                                if (productSet.size() > 0 && currencySet.size() > 0 && priceBookIdSet.size() > 0) {
                                    priceBookEntryList = [SELECT Id, Name, Product2Id, CurrencyIsoCode, UnitPrice FROM PricebookEntry WHERE 
                                                          Pricebook2Id IN: priceBookIdSet AND Product2Id IN: productSet AND 
                                                          CurrencyIsoCode IN: currencySet];
                                }

                                System.debug('priceBookEntryList ***** ' + priceBookEntryList);
                                
                                /* If products found for selected 'Product' and 'Currency' in pricebook which have matching account's 'client code' /
                                if (priceBookEntryList.size() > 0) {
                                    /* If product is available for selected pricebook the blank the value of 'Product Availability'. starts from here /
                                    for (Opportunity opr : opportunityTriggerList) {
                                        Opportunity op = new Opportunity();
                                        op.Id = opr.Id;
                                        op.Product_Availability__c = '';
                                        opportunityListToUpdate.add(op);
                                    }
                                    if (opportunityListToUpdate.size() > 0) {
                                        Update opportunityListToUpdate;
                                    }
                                    System.debug('333opportunityListToUpdate333 ' + opportunityListToUpdate);
                                    /* If product is available for selected pricebook the blank the value of 'Product Availability'. End from here /
                                    
                                    for (PricebookEntry priceEntryBook : priceBookEntryList) {
                                        priceBookEntryMap.put(priceEntryBook.Product2Id, priceEntryBook.Id);   // Mapping price book id to Product Id.
                                        priceBookListPriceMap.put(priceEntryBook.Product2Id, priceEntryBook.UnitPrice); // Storing List Price on ProductId.
                                    }
                                    System.debug('priceBookEntryMap ***** ' + priceBookEntryMap);
                                    System.debug('priceBookListPriceMap ***** ' + priceBookListPriceMap);
                                    
                                    if (!priceBookEntryMap.isEmpty() && !priceBookListPriceMap.isEmpty()) {
                                        for (Opportunity opp : opportunityTriggerList) {
                                            OpportunityLineItem opLineItemInstance = new OpportunityLineItem();
                                            opLineItemInstance.OpportunityId = opp.Id;
                                            opLineItemInstance.Product2Id = opp.Product__c;
                                            opLineItemInstance.PricebookEntryId = priceBookEntryMap.get(opp.Product__c);
                                            opLineItemInstance.Quantity = 1;
                                            opLineItemInstance.TotalPrice = priceBookListPriceMap.get(opp.Product__c);
                                            oppLineItemListToInsert.add(opLineItemInstance);
                                        }
                                    }
                                    
                                    System.debug('oppLineItemListToInsert 123 ' + oppLineItemListToInsert);
                                    if (oppLineItemListToInsert.size() > 0 && oppLineItemListToInsert != null) {
                                        Insert oppLineItemListToInsert; // Creating Opportunity Product for newly created Opportunity.
                                    }
                                    
                                } else {
                                    for (Opportunity opr : opportunityTriggerList) {
                                        Opportunity op = new Opportunity();
                                        op.Id = opr.Id;
                                        op.Product_Availability__c = Label.Product_Availability;
                                        opportunityListToUpdate.add(op);
                                    }
                                    if (opportunityListToUpdate.size() > 0) {
                                        Update opportunityListToUpdate;
                                    }
                                    System.debug('444opportunityListToUpdate444 ' + opportunityListToUpdate);
                                }
                            } else {
                                for (Account accData : accountList) {
                                    Account accInstance = new Account();
                                    accInstance.Id = accData.Id;
                                    accInstance.Price_Book_Message__c = Label.Price_Book_Message;
                                    accountListToUpdate.add(accInstance);
                                }
                                if (accountListToUpdate.size() > 0) {
                                    Update accountListToUpdate;
                                }
                                System.debug('555accountListToUpdate555 ' + accountListToUpdate);
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                System.debug('Exception in priceBookMethod ' + ex);
            }
        }
    }

    */
}