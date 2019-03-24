//
//  OC_judge.h
//  NewCalculator
//
//  Created by Michael Tan on 2019/3/21.
//  Copyright © 2019 Michael Tan. All rights reserved.
//

#ifndef OC_judge_h
#define OC_judge_h

#import <Foundation/Foundation.h>

@interface OC_model : NSObject

+(NSString*) judgement: (NSString*) expr;
//+(NSString*) direct_cal: (NSString*) expr;

@end

#endif /* OC_judge_h */
