//
//  AtomeManager.h
//  AtomeSDK
//
//  Created by boye on 2020/10/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AtomeManager : NSObject

+ (AtomeManager *)sharedManager;

- (BOOL)isAtomeInstalled;

- (void)handPaymentURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options completionHandler:(void (^ __nullable)(BOOL success))completion;

@end

NS_ASSUME_NONNULL_END
