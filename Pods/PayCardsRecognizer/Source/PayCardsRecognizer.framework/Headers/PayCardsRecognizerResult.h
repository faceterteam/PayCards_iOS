//
//  PayCardsRecognizerResult.h
//  PayCardsRecognizer
//
//  Created by Vitaliy Kuzmenko on 12/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayCardsRecognizerResult : NSObject

@property (copy, nullable) NSString *recognizedNumber;

@property (copy, nullable) NSString *recognizedExpireDateMonth;

@property (copy, nullable) NSString *recognizedExpireDateYear;

@property (copy, nullable) NSString *recognizedHolderName;

@property (nonatomic, assign) CGRect recognizedNumberRect;

@property (copy, nullable) UIImage *image;

@property (copy, nonnull) NSDictionary<NSString*, id> * dictionary;

@property (nonatomic, assign) BOOL isCompleted;

@end
