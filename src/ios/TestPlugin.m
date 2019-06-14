#import "TestPlugin.h"
#import <Cordova/CDVPlugin.h>

@implementation TestPlugin

-(void)show:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    NSDictionary* arguments = [command.arguments objectAtIndex:0];
    
    
    NSString* message = [arguments valueForKey:@"message"];
    NSNumber* duration = [arguments valueForKey:@"duration"];
    
    if(message == nil || [message length] <= 0){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }else{
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@""
                                     message: message
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       //Handle your yes please button action here
                                   }];
        
        [alert addAction:okButton];
        
        [self.viewController presentViewController:alert animated:YES completion:nil];
        
        if(duration > 0){
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, [duration integerValue] * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [alert dismissViewControllerAnimated:true completion:nil];
            });
        }
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
