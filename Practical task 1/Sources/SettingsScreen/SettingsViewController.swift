//
//  NewViewController.swift
//  Practical task 1
//
//  Created by Helena on 8.07.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private var model = Model.allModels

    // MARK: - UI Elements
    
    private lazy var notificationView = NotificationView(title: "Turn on notification", pretitle: "Update your settings", image: UIImage(named: "bell"))
    
    private lazy var navigationView = NavigationBarView(title: "Settings")
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .white
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
        view.addSubview(navigationView)
        view.addSubview(notificationView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 116),
            
            notificationView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            notificationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            notificationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            notificationView.widthAnchor.constraint(equalToConstant: 325),
            notificationView.heightAnchor.constraint(equalToConstant: 99),
            
            tableView.topAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource { // построение отображения таблицы
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.model = model[indexPath.row]
        cell.onChanged = { [weak self] state in
            self?.model[indexPath.row].isOn = state
        }
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate { // взаимодействие с таблицей
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        81
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // чтобы ячейка отжималась
    }
    
}

