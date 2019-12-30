public with sharing class StockPriceCalloutApi {
    public StockPriceCalloutApi() {

    }
    public static void getStockPrice() {
        Http h = new Http();
        HttpRequest hReq = new HttpRequest();
        hReq.setEndpoint('https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=ibm&apikey=M47PP7VKAUI80TSC');
        hReq.setMethod('GET');

        HttpResponse hRes = h.send(hReq);
        
        if (hRes.getStatusCode() == 200) {
            String body = hRes.getBody();
            System.debug(body);
        }
    }
}