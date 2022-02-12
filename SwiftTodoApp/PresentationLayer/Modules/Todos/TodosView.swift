//
//  TodosView.swift
//  SwiftTodoApp
//
//  Created by Sadık Çoban on 12.02.2022.
//

import UIKit

class TodosView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var placeHolderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 25)
        label.text = "No items yet, add one!"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Actions
    public func showPlaceholder(){
        UIView.animate(withDuration: 0.3) {
            self.placeHolderLabel.alpha = 1
            self.tableView.alpha = 0
        }
    }
    
    public func hidePlaceholder(){
        UIView.animate(withDuration: 0.3) {
            self.placeHolderLabel.alpha = 0
            self.tableView.alpha = 1
        }
    }
    
    public func reloadTableView() {
        self.tableView.reloadData()
    }
    
    public func insertRow(at index: Int, section: Int = 0) {
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [
                IndexPath(
                    row: index,
                    section: section
                )
            ], with: .automatic)
            self.tableView.endUpdates()
        }
        
        public func deleteRow(at index: Int, section: Int = 0) {
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [
                IndexPath(
                    row: index,
                    section: section
                )
            ], with: .automatic)
            self.tableView.endUpdates()
        }
}

extension TodosView {
    func setupUI(){
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(placeHolderLabel)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            placeHolderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeHolderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
}
