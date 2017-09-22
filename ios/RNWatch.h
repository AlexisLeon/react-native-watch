#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif
#if __has_include(<React/RCTEventEmitter.h>)
#import <React/RCTEventEmitter.h>
#else
#import "RCTEventEmitter.h"
#endif

@import WatchConnectivity;

@interface RNWatch : RCTEventEmitter <RCTBridgeModule, WCSessionDelegate>

@property (nonatomic, strong) WCSession* session;

@end
