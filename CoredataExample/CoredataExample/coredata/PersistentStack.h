//
//  ViewController.h
//  CoredataExample
//
//  Created by Jhonnatan Soares Rebuli on 02/01/19.
//  Copyright © 2019 Coredata. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistentStack : NSObject

- (id)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL;

@property (nonatomic,strong,readonly) NSManagedObjectContext* managedObjectContext;

@end
