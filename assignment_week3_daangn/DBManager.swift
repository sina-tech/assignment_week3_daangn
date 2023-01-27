//
//  DBManager.swift
//  assignment_week3_daangn
//
//  Created by 황신아 on 2023/01/06.
//

import Foundation
import UIKit
import CoreData

class DBManager{
    static let share = DBManager()
    
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Model")

            container.loadPersistentStores(completionHandler: { (storeDescription,error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })

            return container
        }()

    lazy var context = persistentContainer.viewContext
    func saveContext(){
        
        if context.hasChanges {
            do{
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchPost() -> [Post]
    {
        var post = [Post]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Post.description())
        
        do{
            post = try context.fetch(fetchRequest) as! [Post]
        }
        catch{
            print("fetching error")
        }
        return post
    }
}
