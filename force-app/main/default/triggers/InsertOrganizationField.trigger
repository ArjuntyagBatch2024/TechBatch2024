trigger InsertOrganizationField on Developer__c(before insert) {
  //  if(trigger.isInsert()){
    InsertionMirketa.InsertionMirketaHandler(trigger.new);
   // }

}