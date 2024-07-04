@isTest
private class DataIngestServiceTest {
    @isTest
    static void testHandleData() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/DataIngest';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf('{"customers":[{"id":48958,"first_name":"Jack","last_name":"Branson","phone":"555-555-5555","email":"jack.b@example.com"}]}');
        RestContext.request = req;

        RestResponse res = new RestResponse();
        RestContext.response = res;

        DataIngestService.handleData();

        List<Data_Ingest__c> records = [SELECT Type__c, Payload__c FROM Data_Ingest__c];
        System.assertEquals(1, records.size());
        System.assertEquals('customers', records[0].Type__c);
    }
}
