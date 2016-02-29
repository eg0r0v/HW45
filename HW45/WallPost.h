//
//  WallPost.h
//  HW45
//
//  Created by Илья Егоров on 15.02.16.
//  Copyright © 2016 Илья Егоров. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WallPost : NSObject

@property (strong, nonatomic) NSString* text;
@property (strong, nonatomic) NSString* postType;
@property (strong, nonatomic) NSNumber* fromID;
@property (strong, nonatomic) NSNumber* likes;
@property (strong, nonatomic) NSNumber* reposts;
@property (strong, nonatomic) NSArray* attachments;


-(id)initWithServerResponce:(NSDictionary*)responceObject;

@end
