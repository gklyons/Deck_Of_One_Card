//
//  CardController.h
//  DeckOfCard-C
//
//  Created by Garrett Lyons on 3/24/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Card;

NS_ASSUME_NONNULL_BEGIN

@interface CardController : NSObject

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^) (NSArray<Card *> *_Nullable cards))completion;

+ (void)fetchCardImage:(Card *)card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
