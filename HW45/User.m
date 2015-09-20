//
//  User.m
//  HW45
//
//  Created by Илья Егоров on 24.08.15.
//  Copyright © 2015 Илья Егоров. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithId:(NSInteger)userID
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(id)initWithServerResponce:(NSDictionary*)responceObject;
{
    self = [super init];
    if (self) {
        self.userID = (NSInteger)[responceObject objectForKey:@"id"];
        self.firstName = [responceObject objectForKey:@"first_name"];
        self.lastName = [responceObject objectForKey:@"last_name"];
        
        NSString* urlString = [responceObject objectForKey:@"photo_50"];
        
        if (urlString) {
            self.smallImageURL = [NSURL URLWithString:urlString];
        }
        
        urlString = [responceObject objectForKey:@"photo_max"];
        
        if (urlString) {
            self.largeImageURL = [NSURL URLWithString:urlString];
        }
        
        self.birthDate = [responceObject objectForKey:@"bdate"];
        
        self.mobilePhone = [responceObject objectForKey:@"mobile_phone"];
    }
    return self;
}
@end
