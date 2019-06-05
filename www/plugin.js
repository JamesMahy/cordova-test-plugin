// Empty constructor
function TestPlugin() {}

// The function that passes work along to native shells
// Message is a string, duration is a integer in seconds, 0 = no timeout
TestPlugin.prototype.show = function(message, duration, successCallback, errorCallback) {
  var options = {};
  options.message = message;
  options.duration = duration;
  cordova.exec(successCallback, errorCallback, 'TestPlugin', 'show', [options]);
}

// Installation constructor that binds TestPlugin to window
TestPlugin.install = function() {
  if (!window.plugins) {
    window.plugins = {};
  }
  window.plugins.testPlugin = new TestPlugin();
  return window.plugins.testPlugin;
};
cordova.addConstructor(TestPlugin.install);