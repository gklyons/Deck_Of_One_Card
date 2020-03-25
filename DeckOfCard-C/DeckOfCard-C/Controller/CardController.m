//
//  CardController.m
//  DeckOfCard-C
//
//  Created by Garrett Lyons on 3/24/20.
//  Copyright © 2020 Turtle. All rights reserved.
//

#import "CardController.h"
#import "Card.h"


static NSString * const kBaseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const kDrawComponent = @"draw/";
static NSString * const kCountQueryName = @"count";
static NSString * const kCardsArray = @"cards";

@implementation CardController

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<Card *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL * drawURL = [baseURL URLByAppendingPathComponent:kDrawComponent];
    NSString *cardCount = [numberOfCards stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:kCountQueryName value:cardCount];
    urlComponents.queryItems = @[queryItem];
    NSURL *searchURL = urlComponents.URL;
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error: no data returned from task");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error: &error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Unable to create a dictionary from the data");
            completion(nil);
            return;
        }

        NSArray * cardsArray = jsonDictionary[kCardsArray];
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        for (NSDictionary *cardDictionary in cardsArray)
        {
            Card *card = [[Card alloc] initWithDictionary: cardDictionary];
            [cardsPlaceholder addObject: card];
        }
        completion(cardsPlaceholder);
        
    }]resume];
}

//MARK: - Fetch Image Function

+ (void)fetchCardImage:(Card *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error: no data returned from task");
            completion(nil);
            return;
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
        
    }]resume];
}

@end
