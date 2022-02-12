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
    func didCommitDelete(for index: Int)
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
            //gettodos from service
            //run presenter function didRetrieveTodos
        } catch {
            presenter?.interactor(didFailRetrieveTodos: error)
        }
    }
    
    func didCommitDelete(for index: Int) {
        do {
            //delete todo from service
            //delete todo from todos list
            //run presenter funrction didDeleteTodoAtIndex
        } catch {
            presenter?.interactor(didFailDeleteTodoAtIndex: index)
        }
        
    }
    
    func didSelectRow(at index: Int) {
        if self.todos.indices.contains(index) {
            presenter?.interactor(didFindTodo: self.todos[index])
        }
        
    }
    
    
}
