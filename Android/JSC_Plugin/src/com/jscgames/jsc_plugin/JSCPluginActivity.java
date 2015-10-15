package com.jscgames.jsc_plugin;

import com.unity3d.player.UnityPlayer;
import com.unity3d.player.UnityPlayerActivity;

import android.net.Uri;
import android.os.Bundle;

public class JSCPluginActivity extends UnityPlayerActivity {

	@Override
	protected void onCreate(Bundle bundle) {
		// TODO Auto-generated method stub
		super.onCreate(bundle);
		
		Uri uri = getIntent().getData();
		if(uri != null){
			String eventCode = uri.getQueryParameter("eventcode");
		}
	}
	
	

	
}
