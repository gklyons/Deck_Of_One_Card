//
//  Card.h
//  DeckOfCard-C
//
//  Created by Garrett Lyons on 3/24/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (nonatomic, copy, readonly)NSString *suit;
@property (nonatomic, copy, readonly)NSString *imageString;
@property (nonatomic, copy, readonly)NSString *value;

-(instancetype)initWithSuit:(NSString *)suit
                imageString:(NSString *)imageString
                      value:(NSString *)value;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
