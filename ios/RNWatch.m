#import "RNWatch.h"
#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#else
#import "RCTConvert.h"
#endif

static const NSString* EVENT_RECEIVE_MESSAGE = @"WatchReceiveMessage";

@implementation RNWatch

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents
{
  return @[ EVENT_RECEIVE_MESSAGE ];
}

- (instancetype)init {
  self = [super init];
  if ([WCSession isSupported]) {
    WCSession* session = [WCSession defaultSession];
    session.delegate = self;
    self.session = session;
    [session activateSession];
  }
  return self;
}

/*
 * @method sendMessage
 */
RCT_EXPORT_METHOD(sendMessage:(NSDictionary *) message replyCallback:(RCTResponseSenderBlock) replyCallback error:(RCTResponseErrorBlock) errorCallback)
{
  [self.session sendMessage:message replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
    replyCallback(@[replyMessage]);
  } errorHandler:^(NSError * _Nonnull error) {
    errorCallback(error);
  }];
}

// didReceiveMessage
- (void)session:(WCSession *) session didReceiveMessage:(NSDictionary<NSString *,id> *) message {
  NSLog(@"sessionDidReceiveMessage %@", message);
  [self dispatchEventWithName:EVENT_RECEIVE_MESSAGE body:message];
}

// didReceiveMessage
- (void)session:(WCSession *) session didReceiveMessage:(NSDictionary<NSString *,id> *) message
   replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{

  NSLog(@"sessionDidReceiveMessageReplyHandler %@", message);
  // NSString* messageId = [self uuidString];
  NSMutableDictionary* mutableMessage = [message mutableCopy];
  // mutableMessage[@"id"] = messageId;
  // self.replyHandlers[messageId] = replyHandler;
  [self dispatchEventWithName:EVENT_RECEIVE_MESSAGE body:mutableMessage];
}


/*
 * Helpers
 */

 // dispatchEventWithName
-(void)dispatchEventWithName:(const NSString*) name body:(NSDictionary<NSString *,id> *)body {
  NSLog(@"dispatch %@: %@", name, body);
  [self sendEventWithName:(NSString*)name body:body];
}

// uuidString
// https://stackoverflow.com/questions/14352418/how-to-generate-uuid-in-ios
- (NSString *)uuidString {
  CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
  NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
  CFRelease(uuid);
  return uuidString;
}

@end
