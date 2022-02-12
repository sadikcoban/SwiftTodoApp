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

class TodosPresenterImplementation: TodosPresenter {
    
    weak var viewController: TodosPresenterOutput?
    
    func interactor(didRetrieveTodos todos: [Todo]) {
        viewController?.presenter(didRetrieveTodos: todos)
    }
    
    func interactor(didFailRetrieveTodos error: Error) {
        viewController?.presenter(didFailRetrieveTodos: error.localizedDescription)
    }
    
    func interactor(didAddTodo todo: Todo) {
        viewController?.presenter(didAddTodo: todo)
    }
    
    func interactor(didFailAddTodo error: Error) {
        viewController?.presenter(didFailAddTodo: error.localizedDescription)
    }
    
    func interactor(didDeleteTodoAtIndex index: Int) {
        viewController?.presenter(didDeleteTodoAtIndex: index)
    }
    
    func interactor(didFailDeleteTodoAtIndex index: Int) {
        viewController?.presenter(didFailDeleteTodoAtIndex: index, message: "Couldn't delete todo")
    }
    
    func interactor(didFindTodo todo: Todo) {
        if let id = todo.id {
            viewController?.presenter(didObtainTodoId: id)
        }
    }
    
    
}
