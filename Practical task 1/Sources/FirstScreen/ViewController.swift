//
//  ViewController.swift
//  Practical task 1
//
//  Created by Helena on 17.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "picture"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var newView: UIView = {
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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Keytar sweenet"
        label.textAlignment = .center
        label.font = UIFont(name: "GTWalsheimPro-Black", size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Portland ugh fashion axe Helvetica. Echo Park Austin gastropub roof party."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I'm interested", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15
        button.tintColor = .white
        button.titleLabel?.font = .italicSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
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
        view.addSubview(imageView)
        view.addSubview(newView)
        newView.addSubview(titleLabel)
        newView.addSubview(subtitleLabel)
        newView.addSubview(button)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (0.26 * (view.bounds.width))),
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: (-0.26 * (view.bounds.width))),
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: (0.17 * (view.bounds.height))),
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.15),
        
        newView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (0.04 * (view.bounds.width))),
        newView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: (-0.04 * (view.bounds.width))),
        newView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: (0.17 * (view.bounds.height))),
        newView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: (-0.08 * (view.bounds.height))),
        
        button.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: (0.12 * (view.bounds.width))),
        button.rightAnchor.constraint(equalTo: newView.rightAnchor, constant: (-0.12 * (view.bounds.width))),
        button.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: (-0.045 * (view.bounds.height))),
        button.heightAnchor.constraint(equalToConstant: (0.06 * (view.bounds.height))),
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        titleLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: (0.04 * (view.bounds.height))),
        
        subtitleLabel.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: (0.077 * (view.bounds.width))),
        subtitleLabel.rightAnchor.constraint(equalTo: newView.rightAnchor, constant: (-0.077 * (view.bounds.width))),
        subtitleLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: (0.099 * (view.bounds.height)))
        ])
    }
    
    // MARK: - Action
    
    @objc func buttonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(viewController: SettingsViewController(), animated: true, animationOptions: .transitionFlipFromRight)
    }
}




