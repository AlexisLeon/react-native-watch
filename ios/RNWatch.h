#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface RNWatch : RCTEventEmitter <RCTBridgeModule, WCSessionDelegate>

@property (nonatomic, strong) WCSession* session;
@property (nonatomic, strong) NSMutableDictionary* replyHandlers;

+ (RNWatch*) shared;

@end
