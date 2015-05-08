//
//  MSCategory.m
//
//  Created by   on 5/7/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MSCategory.h"
#import "MSItems.h"


NSString *const kMSCategoryName = @"name";
NSString *const kMSCategoryItems = @"items";


@interface MSCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MSCategory

@synthesize name = _name;
@synthesize items = _items;


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
            self.name = [self objectOrNilForKey:kMSCategoryName fromDictionary:dict];
    NSObject *receivedMSItems = [dict objectForKey:kMSCategoryItems];
    NSMutableArray *parsedMSItems = [NSMutableArray array];
    if ([receivedMSItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMSItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMSItems addObject:[MSItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMSItems isKindOfClass:[NSDictionary class]]) {
       [parsedMSItems addObject:[MSItems modelObjectWithDictionary:(NSDictionary *)receivedMSItems]];
    }

    self.items = [NSArray arrayWithArray:parsedMSItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kMSCategoryName];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kMSCategoryItems];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
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

    self.name = [aDecoder decodeObjectForKey:kMSCategoryName];
    self.items = [aDecoder decodeObjectForKey:kMSCategoryItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kMSCategoryName];
    [aCoder encodeObject:_items forKey:kMSCategoryItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    MSCategory *copy = [[MSCategory alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
