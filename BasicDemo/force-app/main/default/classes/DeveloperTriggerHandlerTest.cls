@isTest
private class DeveloperTriggerHandlerTest {
	
    @testSetup
    private static void setup(){
        Developer__c dev1 = new Developer__c();
        dev1.Name = 'Test1';
        dev1.Level__c = '1';
        dev1.Skill_set__c = 'C;Java';
        insert dev1;        
    }
    
    @isTest
    private static void integrationTest(){
        User testUser = createTestUser();
        Developer__c dev1 = [SELECT Name,Level__c FROM Developer__c LIMIT 1];
        dev1.Level__c = '2';
        
        Test.startTest();
        System.runAs(testUser){
			update dev1;
        	insert new  Developer__c(Name = 'Test2', Level__c = '3', Skill_set__c = 'C#');            
        }
        Test.stopTest();
        
        System.assertEquals(1, [SELECT count() FROM Equipment__c WHERE Name LIKE '%Mouse%']);
        System.assertEquals(1, [SELECT count() FROM Equipment__c WHERE Name LIKE '%Keyboard%']);
    }
    
    @isTest
    private static void unitTest(){
        User testUser = createTestUser();
        Developer__c dev1 = [SELECT Name,Level__c FROM Developer__c LIMIT 1];
        Developer__c dev2 = dev1.clone(true,true);
        dev2.Level__c = '2';
        Developer__c dev3 = new  Developer__c(Name = 'Test2', Level__c = '3', Skill_set__c = 'C#');
        
        Test.startTest();
        System.runAs(testUser){
            DeveloperTriggerHandler.createEquipmentLevelUp(new Map<Id,Developer__c>{dev1.Id => dev1}, new List<Developer__c>{dev2}, false);
            DeveloperTriggerHandler.createEquipmentLevelUp(null, new List<Developer__c>{dev3}, true);
        }
        Test.stopTest();
        
        System.assertEquals(1, [SELECT count() FROM Equipment__c WHERE Name LIKE '%Mouse%']);
        System.assertEquals(1, [SELECT count() FROM Equipment__c WHERE Name LIKE '%Keyboard%']);
    }
    
    private static User createTestUser(){
        Id adminProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1].Id;
        User testUser = new User(LastName = 'TestUser', ProfileId = adminProfileId, Username = 'user@na.me', Email = 'user@na.me', 
                                 Alias = 'TestAl', TimeZoneSidKey = 'America/Los_Angeles', LocaleSidKey = 'en_US', 
                                 EmailEncodingKey = 'ISO-8859-1', LanguageLocaleKey = 'en_US');
        return testUser;
    }
}