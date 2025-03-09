//
//  AppDelegate.swift
//  ararsamsonovPW3
//
//  Created by Артём on 08.11.2024.
//

import UIKit
import CoreData


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Core Data
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Wish")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error {
                    fatalError("Unresolved error \(error)")
                }
            })
            return container
        }()
    
    func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    fatalError("Unresolved error \(error)")
                }
            }
        }

        func applicationWillTerminate(_ application: UIApplication) {
            self.saveContext()
        }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

