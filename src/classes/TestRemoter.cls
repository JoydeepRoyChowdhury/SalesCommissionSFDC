global with sharing class TestRemoter {
    public String currTime { get; set; }
    public TestRemoter() { } // empty constructor
    @RemoteAction
    global static List<UrlLink> getCurrTime(String searchParam) {
   		HttpResponse res = null;
   		HttpRequest req = null;
		String response;
    	try {
		Http h = new Http();
        req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('http://ajax.googleapis.com/ajax/services/search/web' + '?key=AIzaSyCgqL4wHhHgPuV5q9Bhd7oP7hlIiqAY0ZI&v=1.0&rsz=8&q=' + searchParam);
        res = h.send(req);
          
        res = h.send(req);
        response = res.getBody();
    	}
    	catch (Exception e) {
	        // return new List<String> {e.getMessage()};
    	}
		return parseJSONResponse(response);
    }
    
    public static List<UrlLink> parseJSONResponse(String s) {       

		List<UrlLink> links = new List<UrlLink>{};
		UrlLink link;
        // Parse JSON response to get all the totalPrice field values.
        JSONParser parser = JSON.createParser(s);
		List<String> urlStrings = new List<String>();
        while (parser.nextToken() != null) {
        	System.debug(parser.getText());
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                (parser.getText() == 'url')) {
	           		link = new UrlLink();
    	            // Get the value.
        	        parser.nextToken();
            	    // Compute the grand total price for all invoices.
                	// urlStrings.add(parser.getText());
               		 link.url = parser.getText();
        	        parser.nextToken();
        	        parser.nextToken();
        	        parser.nextToken();
        	        parser.nextToken();
        	        parser.nextToken();
        	        parser.nextToken();
               		 link.title = parser.getText();
        	        parser.nextToken();
        	        parser.nextToken();
        	        parser.nextToken();
        	        parser.nextToken();
               		 link.contents = parser.getText();
               		 
               		 links.add(link);
            }
        }
        return links;
        // return new List<String>{s};
    }  
    
}