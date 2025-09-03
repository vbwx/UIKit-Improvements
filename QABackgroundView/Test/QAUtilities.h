/*
 *  QAUtilities.h
 *
 *  Created by vbwx on 4/1/11.
 *  Copyright 2011-2012 QuantApps. All rights reserved.
 *
 */

#define A(ARRAY, INDEX) [ARRAY objectAtIndex:(INDEX)]
#define A_INS(ARRAY, INDEX, OBJECT) [ARRAY insertObject:OBJECT atIndex:(INDEX)]
#define A_REP(ARRAY, INDEX, OBJECT) [ARRAY replaceObjectAtIndex:(INDEX) withObject:OBJECT]
#define A_ADD(COLLECTION, OBJECT) [COLLECTION addObject:OBJECT]
#define A_DEL(ARRAY, INDEX) [ARRAY removeObjectAtIndex:(INDEX)]
#define A_L(ARRAY) [ARRAY lastObject]
#define A_NEW(...) [NSMutableArray arrayWithObjects:__VA_ARGS__, nil]
#define A_ALL(SET) [SET allObjects]
#define ANY(SET) [SET anyObject]
#define EMPTY(COLLECTION) [COLLECTION removeAllObjects]
#define D(DICTIONARY, KEY) [DICTIONARY objectForKey:KEY]
#define D_SET(DICTIONARY, KEY, OBJECT) [DICTIONARY setObject:OBJECT forKey:KEY]
#define D_DEL(DICTIONARY, KEY) [DICTIONARY removeObjectForKey:KEY]
#define D_K(DICTIONARY) [DICTIONARY allKeys]
#define D_V(DICTIONARY) [DICTIONARY allValues]
#define D_NEW(...) [NSMutableDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define B_NO [NSNumber numberWithBool:NO]
#define B_YES [NSNumber numberWithBool:YES]
#define I(NUM) [NSNumber numberWithInt:NUM]
#define S(STR1, STR2) [STR1 stringByAppendingString:STR2]
#define P(STR1, STR2) [STR1 stringByAppendingPathComponent:STR2]
#define C(CLASS) [CLASS class]
#define C_IS(OBJ, CLASS) [OBJ isKindOfClass:[CLASS class]]
#define C_OF(OBJ, CLASS) [OBJ isMemberOfClass:[CLASS class]]
#define E(OBJ1, OBJ2) [OBJ1 isEqual:OBJ2]
#define EQ(OBJ, STR) [OBJ isEqualToString:STR]
#define LEN(STR) [STR length]
#define L(COLLECTION) [COLLECTION count]
#define DEL(OBJ) [OBJ release]
#define RGB(R, G, B) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1]
#define RGBA(R, G, B, A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)]
#define CLEAR [UIColor clearColor]
#define IMG(NAME) [UIImage imageNamed:NAME]


@class DELEGATE_CLASS;


typedef struct
{
    NSTimeInterval fade, slide;
}
AnimationDuration;


extern NSString *AppVersion, *AppPath, *DocumentsPath, *CachesPath;
extern NSString *CurrentLanguage;
extern BOOL MultitaskingSupport;
extern CGSize WindowSize;
extern DELEGATE_CLASS *AppDelegate;
extern const AnimationDuration Durations;


void QAInitialize (DELEGATE_CLASS *delegate);
void QAErrorAlert (NSString *message);
void QAConfirmAlert (NSString *message, NSString *buttonTitle, id<UIAlertViewDelegate> delegate);
NSInteger QARandom (NSInteger min, NSInteger max);
UIImageView *QAImage (NSString *name);
BOOL QASerialize (NSString *path, id plist, BOOL alert);
BOOL QADeserialize (NSString *path, id *plist, BOOL alert);
