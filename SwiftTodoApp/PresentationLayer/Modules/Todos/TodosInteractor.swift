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
    func didCommitDelete(for: Int)
    func didSelectRow(at: Int)
}

