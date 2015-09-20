//
//  ServerManager.h
//  HW45
//
//  Created by Илья Егоров on 24.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerManager : NSObject

+ (ServerManager*) sharedManager;

-(void)getFriendsWithId:(NSInteger)userId
                 Offset:(NSInteger)offset
               andCount:(NSInteger)count
              onSuccess:(void(^)(NSArray* friends)) success
              onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
