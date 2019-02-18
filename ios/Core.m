
#import "Core.h"
#import "Handshake/Handshake.h"

@implementation RNHandshakeChat

- (dispatch_queue_t)methodQueue
{
   return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(NewDefaultSession:(NSString *)password
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSError *error;
    HandshakeSession *session = HandshakeNewDefaultSession(password, &error);
    if (error) {
        reject(@"no_events", @"There were no events", error);
    }
    resolve(session);
}

RCT_EXPORT_METHOD(NewGenesisProfile:(NSString*)password
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSError *error;
    HandshakeNewDefaultSession(password, &error);
    if (error) {
        reject(@"no_events", @"There were no events", error);
    }
    resolve(@"");
}

RCT_EXPORT_METHOD(Version:(NSString*)dummy
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve(HandshakeVersion);
}

@end
