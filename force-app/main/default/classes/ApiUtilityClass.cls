public with sharing class ApiUtilityClass {
    public ApiUtilityClass() {

    }

    public static HttpResponse utilityMethod(String endPoint, 
                                                String body, 
                                                String methodName, 
                                                Integer timeOut,
                                                Map<String,String> headerMap) {

        Http httpInstance = new Http();                                            
        HttpRequest req = new HttpRequest();
        if (timeOut != null) {
            req.setTimeout(timeOut);
        } else {
            req.setTimeout(120000);
        }

        req.setMethod(methodName);
        req.setEndpoint(endPoint);
        
        if (body != null) {
            req.setBody(body);
        }

        if(headerMap != null) {
            for (String headerKey : headerMap.keySet()) {
                req.setHeader(headerKey, headerMap.get(headerKey));
            }
        }

        HttpResponse res = new Http().send(req); 
        return res;
    }
}