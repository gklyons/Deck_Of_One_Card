//
//  Card.m
//  DeckOfCard-C
//
//  Created by Garrett Lyons on 3/24/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import "Card.h"

static NSString * const kSuitKey = @"suit";
static NSString * const kImageKey = @"image";
static NSString * const kValue = @"value";

@implementation Card

-(instancetype)initWithSuit:(NSString *)suit imageString:(NSString *)imageString value:(NSString *)value;
{
    if(self = [super init])
    {
        _suit = suit;
        _imageString = imageString;
        _value = value;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
    NSString *suit = dictionary[kSuitKey];
    NSString *imageString = dictionary[kImageKey];
    NSString *value = dictionary[kValue];
    
    return [self initWithSuit:suit imageString:imageString value:value];
}
@end
