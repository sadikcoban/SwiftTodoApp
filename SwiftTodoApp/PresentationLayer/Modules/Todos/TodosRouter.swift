//
//  TodosRouter.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import UIKit

protocol TodosRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    func navigateToDetail(with id: String)
}


class TodosRouterImplementation: TodosRouter {
    weak var navigationController: UINavigationController?
    
    func navigateToDetail(with id: String) {
        //navigation logic goes here...
    }
}
