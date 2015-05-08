//
//  MSBaseClass.m
//
//  Created by   on 5/7/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MSBase.h"
#import "MSCategory.h"


NSString *const kMSBaseClassCategory = @"category";


@interface MSBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MSBase

@synthesize category = _category;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedMSCategory = [dict objectForKey:kMSBaseClassCategory];
    NSMutableArray *parsedMSCategory = [NSMutableArray array];
    if ([receivedMSCategory isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMSCategory) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMSCategory addObject:[MSCategory modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMSCategory isKindOfClass:[NSDictionary class]]) {
       [parsedMSCategory addObject:[MSCategory modelObjectWithDictionary:(NSDictionary *)receivedMSCategory]];
    }

    self.category = [NSArray arrayWithArray:parsedMSCategory];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCategory = [NSMutableArray array];
    for (NSObject *subArrayObject in self.category) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategory addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategory addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategory] forKey:kMSBaseClassCategory];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

- (MSCategory *)searchCategoryForSearchString:(NSString *)strSearch
{
    MSCategory *searchCategory = [MSCategory new];
    NSMutableArray *arrItems = [NSMutableArray new];
    [searchCategory setName:[NSString stringWithFormat:@"Results for \"%@\"",strSearch]];
    for (MSCategory *aCategory in self.category)
    {
        for (MSItems *aItem in aCategory.items)
        {
            if ([[aItem.name lowercaseString] containsString:[strSearch lowercaseString]])
            {
                [arrItems addObject:aItem];
            }
        }
    }
    [searchCategory setItems:arrItems];
    return searchCategory;
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.category = [aDecoder decodeObjectForKey:kMSBaseClassCategory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_category forKey:kMSBaseClassCategory];
}

- (id)copyWithZone:(NSZone *)zone
{
    MSBase *copy = [[MSBase alloc] init];
    
    if (copy) {

        copy.category = [self.category copyWithZone:zone];
    }
    
    return copy;
}


@end
