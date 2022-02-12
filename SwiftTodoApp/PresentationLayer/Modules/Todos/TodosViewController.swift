//
//  TodosViewController.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import Foundation
import UIKit

protocol TodosPresenterOutput: AnyObject {
    func presenter(didRetrieveTodos todos: [Todo])
    func presenter(didFailRetrieveTodos message: String)
    
    func presenter(didAddTodo todo: Todo)
    func presenter(didFailAddTodo message: String)
    
    func presenter(didDeleteTodoAtIndex index: Int)
    func presenter(didFailDeleteTodoAtIndex index: Int, message: String)
    
    func presenter(didObtainTodoId id: String)
    func presenter(didFailObtainTodoId message: String)
}

class TodosViewController: UIViewController{
    
    // MARK: - Properties
    var todosView: TodosView?
    var interactor: TodosInteractor?
    
    private var todos: [Todo] = []
    
    lazy var addBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBarButtonItemTapped)
        )
        return item
    }()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = todosView
        
        todosView?.tableView.delegate = self
        todosView?.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Todos"
        self.navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    
    // MARK: - Actions
    @objc func addBarButtonItemTapped() {
        let alert = UIAlertController(
            title: "Add a new title",
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addTextField { (textField) in
            textField.placeholder = "Text"
        }
        
        let okAction = UIAlertAction(
            title: "Add",
            style: .default
        ) { [unowned self] (action) in
            self.interactor?.addTapped(with: alert.textFields?.first?.text ?? "")
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - Presenter Output
extension TodosViewController: TodosPresenterOutput {
    func presenter(didRetrieveTodos todos: [Todo]) {
        self.todos = todos
        self.todosView?.reloadTableView()
    }
    
    func presenter(didFailRetrieveTodos message: String) {
        showError(with: message)
    }
    
    func presenter(didAddTodo todo: Todo) {
        self.todos.append(todo)
        self.todosView?.insertRow(at: self.todos.count - 1)
    }
    
    func presenter(didFailAddTodo message: String) {
        showError(with: message)
    }
    
    func presenter(didDeleteTodoAtIndex index: Int) {
        self.todos.remove(at: index)
        self.todosView?.deleteRow(at: index)
    }
    
    func presenter(didFailDeleteTodoAtIndex index: Int, message: String) {
        showError(with: message)
    }
    
    func presenter(didObtainTodoId id: String) {
        //route to detail view
    }
    
    func presenter(didFailObtainTodoId message: String) {
        showError(with: message)
    }
    
    
}

// MARK: - UITableView DataSource & Delegate
extension TodosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.todos.isEmpty ?
        self.todosView?.showPlaceholder() :
        self.todosView?.hidePlaceholder()
        
        return self.todos.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.todos[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.interactor?.didCommitDelete(for: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.interactor?.didSelectRow(at: indexPath.row)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

