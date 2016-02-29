//
//  User.h
//  HW45
//
//  Created by Илья Егоров on 24.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (assign, nonatomic) NSInteger userID;
@property (assign, nonatomic) BOOL isOnline;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* birthDate;
@property (strong, nonatomic) NSURL* smallImageURL;
@property (strong, nonatomic) NSURL* largeImageURL;

@property (strong, nonatomic) NSString* mobilePhone;


-(id)initWithServerResponce:(NSDictionary*)responceObject;

- (instancetype)initWithId:(NSInteger)userID;


@end
