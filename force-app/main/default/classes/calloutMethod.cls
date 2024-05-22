public class calloutMethod {
    public void calloutMethodCan(String cName,String cEmail,String cPhone)
    {
		Http http=new Http();
        HttpRequest request=new HttpRequest();
        System.debug('hloo');
        request.setEndpoint('callout:Connecting_Org/services/apexrest/Student');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"nameB":"' + cName + '","phoneB":"' + cPhone + '","emailB":"' + cEmail + '"}');
        HttpResponse response=http.send(request);
        if(response.getStatusCode() != 200) { 
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()); 
        } 
        else { 
            System.debug(response.getBody()); 
        }
}
}