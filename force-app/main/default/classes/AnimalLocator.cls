// 'Apex Integration Services' trailhead for superbadge
public class AnimalLocator {
    public static String getAnimalNameById(Integer IdValue) {
        String strResp = '';
        Http httpIns = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + IdValue);
        req.setMethod('GET');
        HttpResponse response = httpIns.send(req);
        System.debug('response + ' + response.getBody());
        if(response.getStatusCode() == 200) {
            Map<String, Object> responseFromServer = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('responseFromServer + ' + responseFromServer);
            Map<string,object> animals = (map<string,object>) responseFromServer.get('animal');
            System.debug('Received the following animals:' + animals );
            strResp = string.valueof(animals.get('name'));
            System.debug('strResp >>>>>>' + strResp );
            
        }
        return strResp;
    }
}