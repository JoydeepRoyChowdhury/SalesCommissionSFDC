global with sharing class TestRemoter {
    public String currTime { get; set; }
    public TestRemoter() { } // empty constructor
    @RemoteAction
    global static String getCurrTime(String searchParam) {
        return searchParam + System.now().format('EEEE, MMMM d, yyyy - hh:mm:ss');
    }
}
