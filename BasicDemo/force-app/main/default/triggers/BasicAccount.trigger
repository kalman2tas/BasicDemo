trigger BasicAccount on Account (before insert, after insert, before update, after update, before delete, after delete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            
        }
        else if(Trigger.isUpdate){
            
        }
        else if(Trigger.isDelete){
            
        }
    }
    else{
        if(Trigger.isInsert){
            
        }
        else if(Trigger.isUpdate){
            
        }
        else if(Trigger.isDelete){
            
        }
    }
}