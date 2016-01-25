//
//  NSString+Extention.h
//  精佰生活
//
//  Created by apple on 15/10/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extention)

/**
*  计算输入文字的大小
*
*  @param str   需要计算的文字
*
*  @param size   范围限制，CGSizeMake(MAXFLOAT, MAXFLOAT)：意为，宽和高均不限制
*
*  @param font  字体大小
*
*  @return 返回输入文字的大小
*/
+ (CGSize)sizeWithString:(NSString *)str size:(CGSize)size font:(UIFont *)font;

/** 判断是不是正确的手机号 */
- (BOOL)isMobileNumber:(NSString *)mobileNum;

/** 字符串中是否有特性字符 */
-(BOOL)isIncludeSpecialCharact: (NSString *)str;

/** 正则匹配用户验证码6位数字 */
+ (BOOL)checkCaptcha:(NSString *)Captcha;

/** 正则匹配用户账号10或11位数字 */
+ (BOOL)checkAccount:(NSString *)account;

/** 正则匹配用户卡号是不是礼品卡账号 */
+ (BOOL)checkGiftCard:(NSString *)account;

/** pragma 正则匹配用户手机号和电话号（匹配形式如 0511-4405222 或 021-87888822）*/
+ (BOOL)checkTelNumOrPhoneNum:(NSString *)num;

/** 正则匹配手机号为11位数字*/
+ (BOOL)checkTelNum:(NSString *)TelNum;

/** 正则匹配用户密码: 规则1：8-18位数字、字母、数字+字母  规则2：6位纯数字 */
+ (BOOL)checkPassword:(NSString *) password;

/** 格式化日期-->1988年11年12日 */
+ (NSString *)formatDate1WithOldDate:(NSString *)oldDate;
/** 格式化日期-->1988-11-12 */
+ (NSString *)formatDate2WithOldDate:(NSString *)oldDate;
@end
