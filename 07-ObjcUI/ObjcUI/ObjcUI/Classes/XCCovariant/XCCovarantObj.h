//
//  XCCovarantObj.h
//  ObjcUI
//
//  Created by Alexcai on 2018/11/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCCovarantObj<__covariant T > : NSObject

@property (nonatomic, strong) T obj;

@end

NS_ASSUME_NONNULL_END
