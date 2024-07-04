@RestResource(urlMapping='/DataIngest/*')
global with sharing class DataIngestService {
    @HttpPost
    global static void handleData() {
        RestRequest req = RestContext.request;
        String requestBody = req.requestBody.toString();
        Map<String, Object> dataMap = (Map<String, Object>) JSON.deserializeUntyped(requestBody);

        for (String key : dataMap.keySet()) {
            Data_Ingest__c dataRecord = new Data_Ingest__c();
            dataRecord.Type__c = key;
            dataRecord.Payload__c = JSON.serialize(dataMap.get(key));
            insert dataRecord;
        }
    }
}
