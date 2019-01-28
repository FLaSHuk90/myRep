@isTest
            global class CalloutJSHTTPControllerMock implements HttpCalloutMock {
    // Implement this interface method
    
    global HTTPResponse respond(HTTPRequest request) {
    // Create a fake response
    HttpResponse response = new HttpResponse();
    response.setHeader('Content-Type', 'application/json');
    response.setBody('[{"Cur_ID":170,"Date":"2018-12-17T00:00:00","Cur_Abbreviation":"AUD","Cur_Scale":1,"Cur_Name":"Австралийский доллар","Cur_OfficialRate":1.5205}]');
    response.setStatus('OK');
    return response;
}
}