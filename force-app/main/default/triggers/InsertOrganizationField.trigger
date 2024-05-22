trigger InsertOrganizationField on Developer__c(before insert) {
  
    InsertionMirketa.InsertionMirketaHandler(trigger.new);


}