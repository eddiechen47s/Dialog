//
//  DropDownView.swift
//  AlertManager
//
//  Created by Eddie on 2021/7/29.
//

//import UIKit
//
//class DropDownView: UIView, UITableViewDataSource, UITableViewDelegate {
//    let tableView = UITableView()
//    var dropDownOptions = [String]()
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        setupTableView()
//        tableView.backgroundColor = .clear
////        self.backgroundColor = .orange
//    }
//    
//    private func setupTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubViews(tableView)
//        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
////        cell.textLabel?.text = dropDownOptions[indexPath.row]
//        cell.backgroundColor = .systemGreen
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        print(dropDownOptions[indexPath.row])
//    }
//    
//    
//}
//
