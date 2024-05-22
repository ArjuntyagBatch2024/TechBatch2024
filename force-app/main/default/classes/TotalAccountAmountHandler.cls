public with sharing class TotalAccountAmountHandler {
    
    public static void TotalAccountAmountHandler3(List<Opportunity> opp,Map< Id, Opportunity > oMap)
    {
        Set<Id> ParentId = new Set<Id>();
        for(Opportunity op: opp)
        {
            if(op.AccountId != oMap.get(op.Id).AccountId)
            {
                ParentId.add(op.AccountId);
                ParentId.add(oMap.get(op.Id).accountId);
            }
            else
            {
                ParentId.add(op.AccountId);
            }
        }
        List<AggregateResult> aggList = [SELECT AccountId ids, Sum(Amount) Totalsum from Opportunity where AccountId IN: ParentId Group By AccountId];
        Map<id,Account> mp = new Map<id,Account>();
        for(AggregateResult agg: aggList)
        {
            Account acc = new Account();
            acc.id = (id)agg.get('ids');
            acc.Total_Opportunity_Amount__c = (decimal)agg.get('Totalsum');
            mp.put(acc.id, acc);

        }
        update mp.values();
    }
    public static void TotalAccountAmountHandler2(List<Opportunity> opp) {
        Set<Id> ParentId = new Set<Id>();
       
        for(Opportunity op: opp)
        {
            ParentId.add(op.AccountId);
        }
        List<AggregateResult> aggList = [SELECT AccountId ids, Sum(Amount) Totalsum from Opportunity where AccountId IN: ParentId Group By AccountId];
        Map<id,Account> mp = new Map<id,Account>();
        for(AggregateResult agg: aggList)
        {
            Account acc = new Account();
            acc.id = (id)agg.get('ids');
            acc.Total_Opportunity_Amount__c = (decimal)agg.get('Totalsum');
            mp.put(acc.id, acc);

        }
        update mp.values();
    
    }
    public static void TotalAccountAmountHandler4(List<Opportunity> opp) {
        Set<Id> ParentId = new Set<Id>();
        for(Opportunity op : opp)
        {
            ParentId.add(op.AccountId);
        }
        List<AggregateResult> aggList = [SELECT AccountId ids, Sum(Amount) Totalsum from Opportunity where AccountId IN: ParentId Group By AccountId];
        System.debug(aggList);
        Map<id,Account> mp = new Map<id,Account>();
        System.debug('Starting ');


        if(aggList.size() == 0)
        {
            for(Id accId : ParentId)
            {
                Account acc = new Account();
                acc.id = accId;
                acc.Total_Opportunity_Amount__c = 0;
                mp.put(acc.id, acc);    
            }

        }
        else
        {
            for(AggregateResult agg: aggList)
            {
                Account acc = new Account();
                acc.id = (id)agg.get('ids');
                acc.Total_Opportunity_Amount__c = (decimal)agg.get('Totalsum');
                
                mp.put(acc.id, acc);
                System.debug('Inside for loop');
    
            }
        }
       

        update mp.values();
        System.debug(mp);
    }

    
}