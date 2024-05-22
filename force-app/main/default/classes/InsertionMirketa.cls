public with sharing class InsertionMirketa {
    public static void InsertionMirketaHandler(List<Developer__c> l1) {
        List<String> devList = new List<String>();
        devList.add('Developer__c');

        
        List<Schema.DescribeSObjectResult> developerObjResult = Schema.describeSObjects(devList);
        Map<String, Schema.SObjectField> fieldMap = developerObjResult[0].fields.getMap();
        if (fieldMap.containsKey('Organization__c')) {
            for (Developer__c dev : l1) {
                dev.Organization__c = 'Mirketa'; 	
            } 
        }



    }
}