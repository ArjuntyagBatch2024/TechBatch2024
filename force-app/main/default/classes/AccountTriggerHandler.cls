public class AccountTriggerHandler {
   public static void beforeInsert(List<Account> newList){
        for(Account acc: newList)
        {
            if(acc.Industry != null && acc.Industry == 'Media')
            {
                acc.Rating = 'Hot';
            }
            
        }
    }
    public static void afterInsert(List<Account> newList){
        List<Opportunity> oppToBeInstered = new List<Opportunity>();
        for(Account acc : newList)
        {
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            oppToBeInstered.add(opp);
        }
        if(!oppToBeInstered.isEmpty())
        {
            insert oppToBeInstered;
        }
    }
    
    public static void updatePhoneDescription(List<Account> newAcc, Map<id,Account> oldMap)
    {
        for(Account acc : newAcc)
        {
            if(oldMap != NULL && acc.Phone != oldMap.get(acc.Id).Phone)
            {
                acc.Description = 'Phone is modified on Account';
            }
        }
    }
   

}