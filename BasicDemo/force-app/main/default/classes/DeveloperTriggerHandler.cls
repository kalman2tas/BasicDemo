public class DeveloperTriggerHandler {
	
    public static void createEquipmentLevelUp(Map<Id,Developer__c> developerOldMap, List<Developer__c> developerList, Boolean inserted){
        List<Developer__c> levelUpDevList = null;
        if(inserted){
            levelUpDevList = developerList;
        }
        else{
            levelUpDevList = new List<Developer__c>();
            for(Developer__c dev : developerList){
                if(dev.Level__c != developerOldMap.get(dev.Id).Level__c){
                    levelUpDevList.add(dev);
                }
            }
        }
        List<Equipment__c> equipmentList = new List<Equipment__c>();
        for(Developer__c dev : levelUpDevList){
            Equipment__c eqp = new Equipment__c(Name = dev.Name + '_', Used_Since__c = Date.today(), Developer__c = dev.Id);
            if(dev.Level__c.equals('2')){
                eqp.Name += 'Mouse';
				eqp.Type__c = 'Mouse'; 
            }
            else if(dev.Level__c.equals('3')){  
                eqp.Name += 'Keyboard';
				eqp.Type__c = 'Keyboard';          
            }
            else if(dev.Level__c.equals('4')){ 
                eqp.Name += 'Monitor1';
                eqp.Type__c = 'Monitor';
            }
            else if(dev.Level__c.equals('5')){
                eqp.Name += 'Monitor2';
				eqp.Type__c = 'Monitor';     
            }
            else if(dev.Level__c.equals('6')){
                eqp.Name += 'Laptop2';
				eqp.Type__c = 'Laptop';  
            }
            equipmentList.add(eqp);
        }
        try{
            insert equipmentList;
        }
        catch(Exception se){
            System.debug('Error during equipment insert: ' + se.getMessage() + ' ' + se.getCause() + ' ' + se.getLineNumber() + ' ' + se.getStackTraceString());
        }
    }
    
}