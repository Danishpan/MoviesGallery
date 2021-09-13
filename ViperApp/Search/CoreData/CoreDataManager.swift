//
//  CoreDataManager.swift
//  ViperApp
//
//  Created by Даир Алаев on 15.06.2021.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "LocalDBModel")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    
    private init() {
        
    }
    
    
    func save() {
        let context = persistentContainer.viewContext

        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    
    func addQuery(_ query: String){
        let context = persistentContainer.viewContext
        context.performAndWait {
            let newQuery = QueryStringEntity(context: context)
            newQuery.query = query
        }
        save()
    }
    
    func allQueries() -> [QueryStringEntity] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<QueryStringEntity> = QueryStringEntity.fetchRequest()
        
        var allQueries: [QueryStringEntity] = []
        
        context.performAndWait {
            let queries = (try? context.fetch(request)) ?? []
            allQueries = queries
        }
        return allQueries
    }
}


