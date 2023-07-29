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
    
    private lazy var labelView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = .systemPink
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 30
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowColor = UIColor.systemPink.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Turn on notification"
        label.textAlignment = .left
        label.font = UIFont(name: "GTWalsheimPro-Black", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Update your settings"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bell: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bell")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 36
        view.layer.shadowOffset = CGSize(width: 0, height: 12)
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textAlignment = .left
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        view.addSubview(labelView)
        navigationView.addSubview(settingsLabel)
        navigationView.addSubview(backButton)
        labelView.addSubview(firstLabel)
        labelView.addSubview(secondLabel)
        labelView.addSubview(bell)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 116),
            
            backButton.leftAnchor.constraint(equalTo: navigationView.leftAnchor, constant: 28),
            backButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 64),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            settingsLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 15),
            settingsLabel.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 64),
            
            labelView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            labelView.widthAnchor.constraint(equalToConstant: 325),
            labelView.heightAnchor.constraint(equalToConstant: 99),
            
            bell.rightAnchor.constraint(equalTo: labelView.rightAnchor, constant: -18),
            bell.bottomAnchor.constraint(equalTo: labelView.bottomAnchor, constant: -27),
            bell.heightAnchor.constraint(equalToConstant: 82),
            bell.widthAnchor.constraint(equalToConstant: 82),
            
            firstLabel.leftAnchor.constraint(equalTo: labelView.leftAnchor, constant: 25),
            firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 54),
            
            secondLabel.leftAnchor.constraint(equalTo: labelView.leftAnchor, constant: 25),
            secondLabel.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Action
    
    @objc func buttonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(viewController: ViewController(), animated: true, animationOptions: .transitionFlipFromLeft)
    }
}

// MARK: - Extensions

extension SettingsViewController: UITableViewDataSource { // построение отображения таблицы
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.model = model[indexPath.row]
        cell?.onChanged = { [weak self] state in
            self?.model[indexPath.row].isOn = state
        }
        return cell ?? UITableViewCell()
    }
    
}

extension SettingsViewController: UITableViewDelegate { // взаимодействие с таблицей
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        81
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // чтобы ячейка отжималась
    }
    
}

