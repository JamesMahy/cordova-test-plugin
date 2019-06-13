#import "TestPlugin.h"
#import <Cordova/CDVPlugin.h>

@implementation TestPlugin

    -(void)show:(CDVInvokedUrlCommand*)command
    {
        CDVPluginResult* pluginResult = nil;
        NSString* message = [command.arguments objectAtIndex:0];
        NSInteger* duration = [command.arguments objectAtIndex:1];
        
        if(message = nil || [message length] <= 0){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                            message:@"Message"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    

@end
