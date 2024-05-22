trigger NewCaseTrigger on New_Case__e (after insert) {
    
    List<Case> cases = new List<Case>();
   
    for(New_Case__e event : Trigger.new)
    {
        if(event.Status__c == 'New')
        {
            System.debug('Event origin is ' + event.Origin__c);
        }
    }
    
   
 
   
    update cases;
}