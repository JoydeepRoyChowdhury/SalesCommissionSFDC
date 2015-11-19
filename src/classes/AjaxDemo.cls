public class AjaxDemo {

    private static String currTime;
    
    @RemoteAction
    public static String getCurrTime()
    {
        return currTime;
    }
    
    @RemoteAction
    public static void setCurrTime()
    {
        currTime = System.now().format('EEEE, MMMM d, yyyy - hh:mm:ss');
    }
}