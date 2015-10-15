using UnityEngine;
using System.Collections;

public class JSCPlugin : MonoBehaviour {

    private static JSCPlugin _instance;
    public static JSCPlugin Instance
    {
        get
        {
            if (!_instance)
            {
                _instance = GameObject.FindObjectOfType(typeof(JSCPlugin)) as JSCPlugin;
                if (!_instance)
                {
                    GameObject container = new GameObject();
                    container.name = "JSCPlugin";
                    _instance = container.AddComponent(typeof(JSCPlugin)) as JSCPlugin;
                }
            }

            return _instance;
        }
    }  

    private IJSCPlugin jscPlugin;
	// Use this for initialization
	void Start ()
    {
#if UNITY_ANDROID
        jscPlugin = new AndroidPlugin();
#else
        jscPlugin = new DefaultPlugin();
#endif
    }

    public void callTest(string param)
    {
        string testCall = jscPlugin.TestCall();
        Debug.Log("test Call : " + testCall);

    }

    public void getURLScheme(string key)
    {
        jscPlugin.getURLScheme(key);
    }
	
	
}
