trigger BaseDeveloper on Developer__c (after insert, after update) {
    if(Trigger.isInsert){
        DeveloperTriggerHandler.createEquipmentLevelUp(null, Trigger.new, true);
    }
    else if(Trigger.isUpdate){
        DeveloperTriggerHandler.createEquipmentLevelUp(Trigger.oldMap, Trigger.new, false);
    }
}