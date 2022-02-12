//
//  TodosInteractor.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import Foundation


protocol TodosInteractor {
    func addTapped(with: String)
    func viewDidLoad()
    func didDeleteTodo(for index: Int)
    func didSelectRow(at index: Int)
}

class TodosInteractorImplementation: TodosInteractor {
    
    var presenter: TodosPresenter?
    private let todosService = TodosServiceImplementation()
    private var todos: [Todo] = []
    
    
    
    func addTapped(with: String) {
        
    }
    
    func viewDidLoad() {
        do {
            self.todos = try todosService.getTodos()
            
            presenter?.interactor(didRetrieveTodos: self.todos)
        } catch {
            presenter?.interactor(didFailRetrieveTodos: error)
        }
    }
    
    func didDeleteTodo(for index: Int) {
        if let id = self.todos[index].id {
            do {
                try todosService.deleteTodo(with: id)
                self.todos.remove(at: index)
                presenter?.interactor(didDeleteTodoAtIndex: index)
            } catch {
                presenter?.interactor(didFailDeleteTodoAtIndex: index)
            }
            
        }
    }
    
    func didSelectRow(at index: Int) {
        if self.todos.indices.contains(index) {
            presenter?.interactor(didFindTodo: self.todos[index])
        }
        
    }
    
    
}
