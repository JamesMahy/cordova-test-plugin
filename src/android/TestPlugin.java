package com.cevo.cordova.plugin;
// Cordova-required packages
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.CountDownTimer;
import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TestPlugin extends CordovaPlugin {

  @Override
  public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) {
      Boolean result = false;

      if (action.equals("show")) {
          result = this.show(args, callbackContext);
      }
      else{
          callbackContext.error("\"" + action + "\" is not a recognized action.");
      }

      if(result){
          PluginResult pluginResult = new PluginResult(PluginResult.Status.OK);
          callbackContext.sendPluginResult(pluginResult);

      }

      return result;
  }

  private boolean show(JSONArray args, CallbackContext callbackContext){
      String message;
      Integer duration;

      try {
          JSONObject options = args.getJSONObject(0);
          message = options.getString("message");
          duration = options.getInt("duration");
      } catch (JSONException e) {
          callbackContext.error("Error encountered: " + e.getMessage());
          return false;
      }

      Activity activity = cordova.getActivity();

      AlertDialog.Builder builder = new AlertDialog.Builder(activity);
      builder.setMessage(message)
              .setPositiveButton("OK", (dialog, id) -> dialog.dismiss());

      final AlertDialog dialog = builder.create();
      dialog.show();

      if(duration > 0){
          new CountDownTimer(duration * 1000, 1000) {

              @Override
              public void onTick(long millisUntilFinished) {
                  Log.d("Tick","Tock");
              }

              @Override
              public void onFinish() {dialog.dismiss();}
          }.start();
      }
      return true;
  }
}