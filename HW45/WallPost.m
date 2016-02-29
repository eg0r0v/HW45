//
//  WallPost.m
//  HW45
//
//  Created by Илья Егоров on 15.02.16.
//  Copyright © 2016 Илья Егоров. All rights reserved.
//

#import "WallPost.h"

@implementation WallPost


-(id)initWithServerResponce:(NSDictionary*)responseObject
{
    self = [super init];
    if (self) {
        self.postType = [responseObject objectForKey:@"post_type"];
        if ([self.postType isEqualToString:@"copy"]) {
            self.text = [responseObject objectForKey:@"copy_text"];
        } else {
            self.text = [responseObject objectForKey:@"text"];
        }
        self.fromID = [responseObject objectForKey:@"from_id"];
        self.likes = [[responseObject objectForKey:@"likes"] objectForKey:@"count"];
        self.reposts = [[responseObject objectForKey:@"reposts"] objectForKey:@"count"];
        self.attachments = [responseObject objectForKey:@"attachments"];
    }
    return self;
}
@end
