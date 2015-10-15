using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class iOSPlugin : IJSCPlugin
{
#if UNITY_IPHONE || UNITY_IOS
    public void initPlugin(bool isTest)
    {
    }

    [DllImport("__Internal")]
    private static extern string _getUrlScheme(string paramKey);

    public static string getURLScheme(string paramKey)
    {
        if (Application.platform == RuntimePlatform.IPhonePlayer)
            return _getUrlScheme(paramKey);

        return "";

    }

    [DllImport("__Internal")]
    private static extern string _testCall();

    public static string TestCall()
    {
        if (Application.platform == RuntimePlatform.IPhonePlayer)
            return _testCall();
        
        return "";
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
