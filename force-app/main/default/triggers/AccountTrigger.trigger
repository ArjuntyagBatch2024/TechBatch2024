trigger AccountTrigger on Account (before insert,after insert, before update , after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore)
        {
            AccountTriggerHandler.beforeInsert(Trigger.new);
        }
        else if(Trigger.isAfter)
        {
            AccountTriggerHandler.afterInsert(Trigger.new);
        }
        
    }
    if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
             AccountTriggerHandler.updatePhoneDescription(Trigger.New,Trigger.oldMap);
        }
        else if(Trigger.isAfter)
        {
            // AccountTriggerHandler.updateRelatedOppPhone(Trigger.new);
        }
    }

}