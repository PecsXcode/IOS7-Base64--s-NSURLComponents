//
//  Ujdonsagok.m
//  IOS7
//
//  Created by Klacsó Péter on 2014.03.08..
//  Copyright (c) 2014 Klacsó Péter. All rights reserved.
//

#import "Ujdonsagok.h"

@interface Ujdonsagok ()

@end

@implementation Ujdonsagok

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    // Base 64 kód
    NSString *string = @"Generálunk egy Base64 szöveget";
    
    NSData *base64generalas = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString * data1= [base64generalas base64EncodedStringWithOptions:0];
    // de lehet így is felírni
    NSString *data2 = [[string dataUsingEncoding:NSUTF8StringEncoding]base64EncodedStringWithOptions:0];
    
    NSLog(@"------------------------");
    NSLog(@"base64 kód generálás 1: %@", data1);
    NSLog(@"base64 kód generálás 2: %@", data2);
    
    
    NSData *base64 = [[NSData alloc]initWithBase64EncodedString:data1 options:0];
    NSString *base64visszafejtve = [NSString stringWithUTF8String:[base64 bytes]];
    NSLog(@"base64 visszafejtve: %@",base64visszafejtve);
    NSLog(@"------------------------");
    
    //base64 kód hosszának röviditése, eltűnik az = jel
    NSString *rövidit = [data1 substringWithRange:NSMakeRange(0,43)];
    
    NSLog(@"------------------------");
    
    //NSURLComponents
    NSURLComponents *regisztraciovisszaigazolása = [NSURLComponents componentsWithString:@"http://pecsxcode.wordpress.com"];
    regisztraciovisszaigazolása.path = @"/iOS7/megerosito.php";
    regisztraciovisszaigazolása.query = [NSString stringWithFormat:@"code=%@",rövidit ];
    
    NSLog(@"host: %@", regisztraciovisszaigazolása.host);
    NSLog(@"végeredmény: %@", [regisztraciovisszaigazolása URL]); // URL-el lehet lekérni az egész sort
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
