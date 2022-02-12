//
//  TodosService.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import CoreData

protocol TodosService: AnyObject{
    func getTodos() throws -> [Todo]
    func addTodo(name: String, description: String, dueDate: String) throws -> Todo
    func deleteTodo(with id: String) throws
    func getTodo(with id: String) throws -> Todo?
    
}

class TodosServiceImplementation: TodosService {
    
    let persistentContainer = PersistentContainerProvider.getInstance()
    lazy var managedContext: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    
    func getTodos() throws -> [Todo] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let todos = result as? [Todo] {
                return todos
            } else {
                return []
            }
        } catch {
            print("Couldn't get todos")
            return []
        }
    }
    
    func addTodo(name: String, description: String, dueDate: String) throws -> Todo {
        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: managedContext) as! Todo
        todo.name = name
        todo.id = UUID().uuidString
        
        do {
            try managedContext.save()
        } catch {
            print("Couldn't add a todo")
        }
        
        return todo
    }
    
    func deleteTodo(with id: String) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let objectToDelete = result.first as? NSManagedObject {
                managedContext.delete(objectToDelete)
                
                do {
                    try managedContext.save()
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func getTodo(with id: String) throws -> Todo? {
        let predicate = NSPredicate(format: "id = %@", id)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let todo = result.first as? Todo  {
                return todo
            }
        } catch {
            print("Couldn't get todo")
        }
        
        return nil
    }
}



