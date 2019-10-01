//
//  PayCardsRecognizer.h
//  PayCardsRecognizer
//
//  Created by Vitaliy Kuzmenko on 12/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PayCardsRecognizerResult.h"

extern NSString * _Nonnull const WOCardNumber;
extern NSString * _Nonnull const WOExpDate;
extern NSString * _Nonnull const WOHolderName;
extern NSString * _Nonnull const WOHolderNameRaw;
extern NSString * _Nonnull const WONumberConfidences;
extern NSString * _Nonnull const WOHolderNameConfidences;
extern NSString * _Nonnull const WOExpDateConfidences;
extern NSString * _Nonnull const WOCardImage;
extern NSString * _Nonnull const WOPanRect;
extern NSString * _Nonnull const WODateRect;
extern NSString * _Nonnull const WONumberSamples;
extern NSString * _Nonnull const WODateSamples;
extern NSString * _Nonnull const WOHolderSamples;

typedef NS_ENUM(NSUInteger, PayCardsRecognizerResultMode) {
    PayCardsRecognizerResultModeAsync, // Recognized data will be return separatley. First time returned number and exiration, after name
    PayCardsRecognizerResultModeSync, // All recognized data will be return at one time.
};

typedef NS_OPTIONS(NSUInteger, PayCardsRecognizerDataMode) {
    PayCardsRecognizerDataModeNone = 0,
    PayCardsRecognizerDataModeNumber = 1,
    PayCardsRecognizerDataModeDate = 2,
    PayCardsRecognizerDataModeName = 4,
    PayCardsRecognizerDataModeGrabCardImage = 8
};

@protocol PayCardsRecognizerPlatformDelegate;

@interface PayCardsRecognizer : NSObject

- (instancetype _Nonnull)initWithDelegate:(id<PayCardsRecognizerPlatformDelegate> _Nonnull)delegate resultMode:(PayCardsRecognizerResultMode)resultMode container:(UIView * _Nonnull)container frameColor:(UIColor * _Nonnull)frameColor;

- (instancetype _Nonnull)initWithDelegate:(id<PayCardsRecognizerPlatformDelegate> _Nonnull)delegate recognizerMode:(PayCardsRecognizerDataMode)recognizerMode resultMode:(PayCardsRecognizerResultMode)resultMode container:(UIView * _Nonnull)container frameColor:(UIColor * _Nonnull)frameColor;

@property (nonatomic, weak, nullable) id<PayCardsRecognizerPlatformDelegate> delegate;

- (void)startCamera;

- (void)startCameraWithOrientation:(UIInterfaceOrientation)orientation;

- (void)stopCamera;

- (void)pauseRecognizer;

- (void)resumeRecognizer;

- (void)setOrientation:(UIInterfaceOrientation)orientation;

- (void)turnTorchOn:(BOOL)on withValue:(float)value;

@end

@protocol PayCardsRecognizerPlatformDelegate

- (void)payCardsRecognizer:(PayCardsRecognizer * _Nonnull)payCardsRecognizer didRecognize:(PayCardsRecognizerResult * _Nonnull)result;

@end
