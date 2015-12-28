//
//  BaseDef.h
//  dna
//
//  Created by 雪念飞叶 on 15/12/28.
//  Copyright © 2015年 雪念飞叶. All rights reserved.
//

#ifndef BaseDef_h
#define BaseDef_h

#ifdef DEBUG
#   define DTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DTLog(...)
#endif

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

#endif /* BaseDef_h */
