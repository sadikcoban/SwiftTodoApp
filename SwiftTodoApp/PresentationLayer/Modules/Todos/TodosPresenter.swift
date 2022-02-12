//
//  TodosPresenter.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import Foundation

protocol TodosPresenter: AnyObject {
    func interactor(didRetrieveTodos todos: [Todo])
    func interactor(didFailRetrieveTodos error: Error)
    
    func interactor(didAddTodo todo: Todo)
    func interactor(didFailAddTodo error: Error)
    
    func interactor(didDeleteTodoAtIndex index: Int)
    func interactor(didFailDeleteTodoAtIndex index: Int)
    
    func interactor(didFindTodo todo: Todo)

}

class TodoPresenterImplementation: TodosPresenter {
    
    
    
    func interactor(didRetrieveTodos todos: [Todo]) {
        
    }
    
    func interactor(didFailRetrieveTodos error: Error) {
        
    }
    
    func interactor(didAddTodo todo: Todo) {
        
    }
    
    func interactor(didFailAddTodo error: Error) {
        
    }
    
    func interactor(didDeleteTodoAtIndex index: Int) {
        
    }
    
    func interactor(didFailDeleteTodoAtIndex index: Int) {
        
    }
    
    func interactor(didFindTodo todo: Todo) {
        
    }
    
    
}
