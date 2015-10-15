

public interface IJSCPlugin  {

	void initPlugin(bool isTest);

    string getURLScheme(string paramKey);

    string TestCall();
}
