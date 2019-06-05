# cordova-test-plugin
Test plugin for Cordova / Outsystems

Run
`cordova add plugin`

Then add the following code to your cordova application where you'd like the alert dialog to show!
```
window.plugins.testPlugin.show('Welcome to our application!', 5, function() {
          console.log('Success!');
	}, function(err) {
	      console.log('Uh oh... ' + err);
});
```	