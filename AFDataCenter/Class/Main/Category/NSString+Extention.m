//
//  NSString+NSString+Extention.m
//  精佰生活
//
//  Created by apple on 15/10/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "NSString+Extention.h"

@implementation NSString (Extention)

#pragma 计算字符串的size
+ (CGSize)sizeWithString:(NSString *)str size:(CGSize)size font:(UIFont *)font
{
    
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

#pragma 判断是不是正确的手机号
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,177
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,177
     22         */
    NSString * CT = @"^1((33|77|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma 字符串中是否有特性字符
-(BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

#pragma 正则匹配用户验证码6位数字
+ (BOOL)checkCaptcha:(NSString *)Captcha
{
    NSString *format = @"^[0-9]{6}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    BOOL isMatch = [pred evaluateWithObject:Captcha];
    AFLog(@"checkCaptcha%d", isMatch);
    return isMatch;
    
}
#pragma 正则匹配用户手机号和电话号（匹配形式如 0511-4405222 或 021-87888822）
+ (BOOL)checkTelNumOrPhoneNum:(NSString *)num
{
    NSString *format = @"\\d{3,4}( |-)\\d{,78}|\\d{11,12}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    BOOL isMatch = [pred evaluateWithObject:num];
    AFLog(@"checkCaptcha%d", isMatch);
    return isMatch;
   
}

#pragma 正则匹配手机号为11位数字
+ (BOOL)checkTelNum:(NSString *)TelNum
{
    NSString *format = @"^[0-9]{11}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    BOOL isMatch = [pred evaluateWithObject:TelNum];
    AFLog(@"checkTelNum%d", isMatch);
    return isMatch;
}

#pragma 正则匹配用户账号10或11位数字
+ (BOOL)checkAccount:(NSString *)account
{
    NSString *format = @"^\\d{10,11}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    BOOL isMatch = [pred evaluateWithObject:account];
    AFLog(@"checkAccount%d", isMatch);
    return isMatch;
}

#pragma 正则匹配用户卡号是不是礼品卡
+ (BOOL)checkGiftCard:(NSString *)account
{
    NSString *format = @"^[1|2][0-9]{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    BOOL isMatch = [pred evaluateWithObject:account];
    AFLog(@"checkAccount%d", isMatch);
    return isMatch;
}

#pragma 正则匹配用户密码: 规则1：8-18位数字、字母、数字+字母  规则2：6位纯数字
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern1 = @"^[A-Za-z0-9]{8,16}$";
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern1];
    BOOL isMatch1 = [pred1 evaluateWithObject:password]; // 是否跟规则匹配
    
    NSString *pattern2 = @"^[0-9]{6}$";
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern2];
    BOOL isMatch2 = [pred2 evaluateWithObject:password]; // 是否跟规则匹配
    AFLog(@"checkPassword规则1：%d 规则2：%d", isMatch1, isMatch2);
    
    if (isMatch1 || isMatch2) {
        return YES;
    } else {
        return NO;
    }
}

#pragma 格式化日期-->1988年11年12日
+ (NSString *)formatDate1WithOldDate:(NSString *)oldDate
{
    AFLog(@"%@", oldDate);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd"; // 源格式
    NSDate *date = [fmt dateFromString:oldDate];
    fmt.dateFormat = @"yyyy年MM月dd日"; // 需要设置的格式
    NSString *newDate = [fmt stringFromDate:date];
    
    return newDate;
}

#pragma 格式化日期-->1988-11-12
+ (NSString *)formatDate2WithOldDate:(NSString *)oldDate
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [fmt dateFromString:oldDate];
    NSString *newDate = [fmt stringFromDate:date];
    
    return newDate;
}
@end
