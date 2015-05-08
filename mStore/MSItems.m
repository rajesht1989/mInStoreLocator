//
//  MSItems.m
//
//  Created by   on 5/7/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "MSItems.h"


NSString *const kMSItemsId = @"id";
NSString *const kMSItemsName = @"name";
NSString *const kMSItemsPrice = @"price";
NSString *const kMSItemsLocation = @"location";


@interface MSItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MSItems

@synthesize itemsIdentifier = _itemsIdentifier;
@synthesize name = _name;
@synthesize price = _price;
@synthesize location = _location;


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
            self.itemsIdentifier = [self objectOrNilForKey:kMSItemsId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kMSItemsName fromDictionary:dict];
            self.price = [self objectOrNilForKey:kMSItemsPrice fromDictionary:dict];
            self.location = [self objectOrNilForKey:kMSItemsLocation fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.itemsIdentifier forKey:kMSItemsId];
    [mutableDict setValue:self.name forKey:kMSItemsName];
    [mutableDict setValue:self.price forKey:kMSItemsPrice];
    [mutableDict setValue:self.location forKey:kMSItemsLocation];

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

    self.itemsIdentifier = [aDecoder decodeObjectForKey:kMSItemsId];
    self.name = [aDecoder decodeObjectForKey:kMSItemsName];
    self.price = [aDecoder decodeObjectForKey:kMSItemsPrice];
    self.location = [aDecoder decodeObjectForKey:kMSItemsLocation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemsIdentifier forKey:kMSItemsId];
    [aCoder encodeObject:_name forKey:kMSItemsName];
    [aCoder encodeObject:_price forKey:kMSItemsPrice];
    [aCoder encodeObject:_location forKey:kMSItemsLocation];
}

- (id)copyWithZone:(NSZone *)zone
{
    MSItems *copy = [[MSItems alloc] init];
    
    if (copy) {

        copy.itemsIdentifier = [self.itemsIdentifier copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
    }
    
    return copy;
}


@end
