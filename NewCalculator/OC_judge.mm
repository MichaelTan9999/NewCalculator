//
//  OC_judge.m
//  NewCalculator
//
//  Created by Michael Tan on 2019/3/21.
//  Copyright © 2019 Michael Tan. All rights reserved.
//

#include "OC_judge.h"
#include "judge.hpp"
#include <iostream>
#include <string>
using namespace std;

@implementation OC_model

+(NSString*) judgement: (NSString*) expr
{
    
    std::string a = expr.UTF8String;
    a = proc(a);
    cout<<"The expression in Objective-C++ is "<<a<<endl;;
    expr=[NSString stringWithCString:a.c_str() encoding:[NSString defaultCStringEncoding]];
//    cout<<expr<<" Is this a problem?"<<endl;
    return expr;
}

@end
