trigger TotalAccountAmount on Opportunity (after insert, after update, after delete) {
    
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete))
    {
        TotalAccountAmountHandler.TotalAccountAmountHandler2(trigger.new);
       
    }
    if(trigger.isAfter && trigger.isUpdate )
    {
        TotalAccountAmountHandler.TotalAccountAmountHandler3(trigger.new,trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isDelete)
    {
        TotalAccountAmountHandler.TotalAccountAmountHandler4(trigger.old);
    }


}