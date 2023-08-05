//
//  NavigationBarView.swift
//  Practical task 1
//
//  Created by Helena on 5.08.2023.
//

import UIKit

class NavigationBarView: UIView {
    
    // MARK: - UI Elements

    private lazy var label: UILabel = {
        let label = UILabel()
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
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    convenience init(title: String) {
        self.init(frame: CGRect.zero)
        label.text = title
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Action
    
    @objc func buttonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(viewController: ViewController(), animated: true, animationOptions: .transitionFlipFromLeft)
    }
    
    // MARK: - Setups
    
    private func setupView() {
        layer.cornerRadius = 20
        backgroundColor = .white
        layer.shadowOpacity = 1
        layer.shadowRadius = 36
        layer.shadowOffset = CGSize(width: 0, height: 12)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupHierarchy() {
        addSubview(label)
        addSubview(backButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 28),
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            label.leftAnchor.constraint(equalTo: rightAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 64)
        ])
    }
}
