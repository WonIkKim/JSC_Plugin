using UnityEngine;

public class AndroidPlugin : IJSCPlugin{
#if UNITY_ANDROID
    private bool isTest;

    public void initPlugin(bool isTest)
    {
        this.isTest = isTest;
    }

    public string getURLScheme(string paramKey)
    {
        using (AndroidJavaClass jc = new AndroidJavaClass("com.jscgames.jscplugin.PluginMain"))
        {
            return jc.CallStatic<string>("getUrlSchemeString",paramKey);
            
        }
    }

    public string TestCall()
    {
        using (AndroidJavaClass jc = new AndroidJavaClass("com.jscgames.jscplugin.PluginMain"))
        {
            return jc.CallStatic<string>("getUrlSchemeString", "test Call");

        }
    }
#else
    public void initPlugin(bool isTest)
    {
    }

    public string getURLScheme(string paramKey)
    {
        return null;
    }

    public string TestCall()
    {
        return null;
    }
#endif
}
