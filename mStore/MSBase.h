//
//  MSBaseClass.h
//
//  Created by   on 5/7/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MSBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *category;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
