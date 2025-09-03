/*
 *  QAUtilities.m
 *
 *  Created by vbwx on 4/1/11.
 *  Copyright 2011-2012 QuantApps. All rights reserved.
 *
 */

#import <unistd.h>
#import <ctype.h>
#import <stdlib.h>


NSString *AppVersion, *AppPath, *DocumentsPath, *CachesPath;
NSString *CurrentLanguage;
DELEGATE_CLASS *AppDelegate;

BOOL MultitaskingSupport;
CGSize WindowSize;
const AnimationDuration Durations = {0.5, 0.3};


void QAInitialize (DELEGATE_CLASS *delegate)
{
    NSBundle *app = [NSBundle mainBundle];
	AppVersion = [[app objectForInfoDictionaryKey:@"CFBundleVersion"] copy];
    AppPath = [[app resourcePath] copy];
	CurrentLanguage = [A([NSLocale preferredLanguages], 0) copy];
	MultitaskingSupport = [[UIDevice currentDevice] respondsToSelector:
						   @selector(isMultitaskingSupported)];
    AppDelegate = delegate;
    WindowSize = [[UIScreen mainScreen] applicationFrame].size;
    DocumentsPath = [A(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES), 0) copy];
    CachesPath = [A(NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES), 0) copy];
    srandomdev();
}

void QAErrorAlert (NSString *message)
{
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:message
						   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
	[alert show];
}

void QAConfirmAlert (NSString *message, NSString *buttonTitle, id<UIAlertViewDelegate> delegate)
{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"" message:message delegate:delegate cancelButtonTitle:@"Cancel" otherButtonTitles:buttonTitle, nil] autorelease];
    [alert show];
}

NSInteger QARandom (NSInteger v1, NSInteger v2)
{
    if (v2 == v1)
        return v1;
    if (v2 < v1)
    {
        v1 ^= v2;
        v2 ^= v1;
        v1 ^= v2;
    }
    return v1 + (random() % (v2-v1));
}

UIImageView *QAImage (NSString *name)
{
    UIImage *img = [UIImage imageNamed:name];
    if (img)
        return [[[UIImageView alloc] initWithImage:img] autorelease];
    return nil;
}

BOOL QASerialize (NSString *path, id plist, BOOL alert)
{
    if (!path || !plist || EQ(path, @""))
        return NO;

    NSString *desc = nil;
    NSError *err = nil;
    NSData *data = ([NSPropertyListSerialization respondsToSelector:
                     @selector(dataWithPropertyList:format:options:error:)] ?
                    [NSPropertyListSerialization dataWithPropertyList:plist
                     format:NSPropertyListBinaryFormat_v1_0 options:0 error:&err] :
                    [NSPropertyListSerialization dataFromPropertyList:plist
                     format:NSPropertyListBinaryFormat_v1_0 errorDescription:&desc]);
    if (data)
    {
        if (EQ([path pathExtension], @""))
            path = [path stringByAppendingPathExtension:@"plist"];
        if ([data writeToFile:path atomically:YES])
            return YES;
        else if (alert)
            QAErrorAlert(S(S(@"Cannot write to file \"", [path lastPathComponent]), @"\"!"));
    }
    else
        QAErrorAlert(desc == nil ? [err description] : [desc autorelease]);

    return NO;
}

BOOL QADeserialize (NSString *path, id *plist, BOOL alert)
{
    if (!path || !plist || EQ(path, @""))
        return NO;

    NSString *desc = nil;
    NSError *err = nil;
    NSFileManager *fileman = [NSFileManager defaultManager];
    if (LEN([path pathExtension]) == 0)
        path = [path stringByAppendingPathExtension:@"plist"];
    if ([fileman fileExistsAtPath:path])
    {
        NSData *data = [fileman contentsAtPath:path];
        *plist = ([NSPropertyListSerialization respondsToSelector:
                   @selector(propertyListWithData:options:format:error:)] ?
                  [NSPropertyListSerialization propertyListWithData:data options:
                   NSPropertyListMutableContainers format:NULL error:&err] :
                  [NSPropertyListSerialization propertyListFromData:data mutabilityOption:
                   NSPropertyListMutableContainers format:NULL errorDescription:&desc]);
        if (*plist)
            return YES;
        else
            QAErrorAlert(desc == nil ? [err description] : [desc autorelease]);
    }
    else if (alert)
        QAErrorAlert(S(S(@"File \"", [path lastPathComponent]), @"\" does not exist!"));
    return NO;
}
