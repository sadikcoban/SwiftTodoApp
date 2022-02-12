//
//  TitlesConfigurator.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import UIKit

class TodosConfigurator {
    
    static func configureModule(viewController: TodosViewController) {
        let view = TodosView()
        let router = TodosRouterImplementation()
        let interactor = TodosInteractorImplementation()
        let presenter = TodosPresenterImplementation()
        
        viewController.todosView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
