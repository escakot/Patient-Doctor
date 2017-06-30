//
//  Perscription.h
//  Patient Doctor
//
//  Created by Errol Cheong on 2017-06-29.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Perscription : NSObject

@property (nonatomic) NSString* perscription;
@property (nonatomic) NSDate* issueDate;
@property (nonatomic, assign) BOOL refillable;

-(instancetype)initWithPerscription:(NSString*)perscription;

@end
