//
//  LanguageTool.h
//  test_Localization
//
//  Created by wen-chi Chang on 2018/7/23.
//  Copyright © 2018年 wen-chi Chang. All rights reserved.
//

#define GetStringWithKeyFromTable(key, tbl) [[LanguageTool sharedInstance] getStringForKey:key withTable:tbl]

#define GetStringWithKey(key) [[LanguageTool sharedInstance] getStringForKey:key withTable:@"Localizable"]

#import <Foundation/Foundation.h>

@interface LanguageTool : NSObject

+(id)sharedInstance;

//使用key與table去取得字串
-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table;

//改變語言
-(void)changeNowLanguage;

//設置語言
-(void)setNewLanguage:(NSString*)language;

//重設rootVC
-(void)resetRootViewController;

@end
