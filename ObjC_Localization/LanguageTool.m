//
//  LanguageTool.m
//  test_Localization
//
//  Created by wen-chi Chang on 2018/7/23.
//  Copyright © 2018年 wen-chi Chang. All rights reserved.
//

#define CNT @"zh-Hant"
#define EN @"en"
#define LANGUAGE_SET @"langeuageset"

#import "AppDelegate.h"
#import "LanguageTool.h"
#import "ViewController.h"

static LanguageTool *sharedModel;

@interface LanguageTool()

@property(nonatomic,strong)NSBundle *bundle;
@property(nonatomic,copy)NSString *language;

@end

@implementation LanguageTool

+(id)sharedInstance
{
    static LanguageTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LanguageTool alloc] init];
    });
    return instance;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initLanguage];
    }
    
    return self;
}

-(void)initLanguage
{
    NSString *tmp = [[NSUserDefaults standardUserDefaults]objectForKey:LANGUAGE_SET];
    
    self.language = tmp;
    NSString *path = [[NSBundle mainBundle]pathForResource:tmp ofType:@"lproj"];
    self.bundle = [NSBundle bundleWithPath:path];
}

-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table
{
    if (self.bundle)
    {
        return NSLocalizedStringFromTableInBundle(key, table, self.bundle, nil);
    }
    
    return NSLocalizedStringFromTable(key, table, @"");
}

-(void)changeNowLanguage
{
    if ([self.language isEqualToString:EN])
    {
        [self setNewLanguage:CNT];
    }
    else
    {
        [self setNewLanguage:EN];
    }
}

-(void)setNewLanguage:(NSString *)language
{
    if ([language isEqualToString:self.language])
    {
        return;
    }
    
    if ([language isEqualToString:EN] || [language isEqualToString:CNT])
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    
    self.language = language;
    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self resetRootViewController];
}

-(void)resetRootViewController
{
    
    UIWindow *window = [(AppDelegate*)[[UIApplication sharedApplication] delegate] window];
    
    ViewController *VC=[[ViewController alloc]init];
    window.rootViewController = VC;
    
    [window makeKeyAndVisible];
    
}

@end
