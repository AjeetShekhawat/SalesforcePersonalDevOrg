public with sharing class HttpUtility {
   /* public HttpUtility() {

    }

    public static HttpResponse sendHTTPRequest(String endpoint, String method,String body){
        return sendHTTPRequest(endpoint,method,null,body,null);
    }*/
    
    public static HttpResponse sendHTTPRequest(String endpoint, String method, Integer timeOut,String body,Map<String,String> headerMap){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest(); 
        
        if(timeOut!=null){
            req.setTimeout(timeOut);
        }
		else{
            req.setTimeout(120000);
        }
        req.setEndpoint(endpoint);
        req.setMethod(method);
        System.debug('body::: ' + body);
        if(body != null){
            req.setBody(body);
        }
        System.debug('headerMap:::: '+ headerMap);
        //Header Map to populate html headers
        if(headerMap != null){
            for(String key: headerMap.keySet()){
                req.setHeader(key,headerMap.get(key));
            }
        }
        System.debug('req in HTTP Utility::: ' + req);
        HttpResponse res = http.send(req);
        System.debug('response in HTTP Utility::: ' + res);
        return res;
    }
}