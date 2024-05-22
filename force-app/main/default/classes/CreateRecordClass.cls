public class CreateRecordClass {
    public void caller(String cName, string cEmail , string cPhone)
    {
		Candidate__c can = new Candidate__c(Name= cName, Email__c= cEmail, Phone__c = cPhone ); 		
        insert can;  
        candidateee(cName, cEmail, cPhone);
    }
    
    @future(callout = true)
    public static void candidateee(String cName,String cEmail,String cPhone){
        calloutMethod call = new calloutMethod();
        call.calloutMethodCan(cName, cEmail, cPhone);
    }
    
   
    
    
    
    
    

      /*  system.debug(response.getStatusCode());
        if(response.getStatusCode()==200){
            System.debug(response);
            System.debug(response.getBody());
        }
        else
        {
            System.debug()
        }
    */
        
}