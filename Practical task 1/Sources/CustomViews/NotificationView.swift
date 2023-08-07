//
//  CustomView.swift
//  Practical task 1
//
//  Created by Helena on 5.08.2023.
//

import UIKit

class NotificationView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "GTWalsheimPro-Black", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pretitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    convenience init(title: String, pretitle: String, image: UIImage?) {
        self.init(frame: CGRect.zero)
        titleLabel.text = title
        pretitleLabel.text = pretitle
        self.image.image = image
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupView() {
        layer.cornerRadius = 25
        backgroundColor = UIColor.systemPink
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 30
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowColor = UIColor.systemPink.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(pretitleLabel)
        addSubview(image)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.rightAnchor.constraint(equalTo: rightAnchor, constant: -18),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27),
            image.heightAnchor.constraint(equalToConstant: 82),
            image.widthAnchor.constraint(equalToConstant: 82),
            
            pretitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            pretitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            titleLabel.bottomAnchor.constraint(equalTo: pretitleLabel.topAnchor, constant: 54)
        ])
    }
}
