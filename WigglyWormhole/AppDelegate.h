//full name:WEI Wuhao
//  AppDelegate.h
//  WigglyWormhole
//
//  Created by Alex on 21/10/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDataModel.h"
#import "MenuVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong)AppDataModel*appDataModel;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



@end

