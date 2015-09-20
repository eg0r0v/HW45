//
//  ServerManager.m
//  HW45
//
//  Created by Илья Егоров on 24.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"
#import "User.h"

@interface ServerManager()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;

@end

@implementation ServerManager

+ (ServerManager*) sharedManager {
    
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    return self;
}

-(void)getFriendsWithId:(NSInteger)userId
                 Offset:(NSInteger)offset
               andCount:(NSInteger)count
              onSuccess:(void(^)(NSArray* friends)) success
              onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @(userId),     @"user_id",
                            @"name",        @"order",
                            @(count),       @"count",
                            @(offset),      @"offset",
                            @"photo_50",    @"fields",
                            @"nom",         @"name_case",   nil];
    
    [self.requestOperationManager
     GET:@"friends.get"
     parameters:params
     success:^void(AFHTTPRequestOperation * __nonnull operation, id __nonnull responseObject) {
         // NSLog(@"JSON: %@", responseObject);
         
         NSArray* dictsArray = [responseObject objectForKey:@"response"];
         
         NSMutableArray* objectsArray = [NSMutableArray array];
         
         
         for (NSDictionary* dict in dictsArray) {
             
             User* user = [[User alloc] initWithServerResponce:dict];
             [objectsArray addObject:user];
         }
         
         if (success) {
             success(objectsArray);
         }
         
     } failure:^void(AFHTTPRequestOperation * __nonnull operation, NSError * __nonnull error) {
         NSLog(@"error: %@", error);
         
         if (failure) {
             failure(error, operation.response.statusCode);
         }
         
     }];
    //     success:^(AFHTTPRequestOperation * _nonnull operation, id  _nonnull responseObject) {
    //
    //         NSLog(@"JSON: %@", responseObject);
    //
    //         NSArray* dictsArray = [responseObject objectForKey:@"response"];
    //
    //         NSMutableArray* objectsArray = [NSMutableArray array];
    //
    //
    //         for (NSDictionary* dict in dictsArray) {
    //
    //             User* user = [[User alloc] initWithServerResponce:dict];
    //             [objectsArray addObject:user];
    //         }
    //
    //         if (success) {
    //              success(objectsArray);
    //         }
    //     }
    //     failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    //
    //          NSLog(@"error: %@", error);
    //
    //          if (failure) {
    //              failure(error, operation.response.statusCode);
    //          }
    //     }];
}

@end

