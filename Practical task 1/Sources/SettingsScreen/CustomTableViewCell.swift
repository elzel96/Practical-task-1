//
//  CustomTableViewCell.swift
//  Practical task 1
//
//  Created by Helena on 8.07.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var model: Model? {
        didSet {
            icon.image = model?.icon
            title.text = model?.title
            subtitle.text = model?.subtitle
            switchButton.isOn = model?.isOn ?? false
            if model?.isOn == nil {
                switchButton.isHidden = true
            }
            additionalInfo.text = model?.additionalInfo
            if model?.additionalInfo == nil {
                additionalInfo.isHidden = true
            }
        }
    }
    
    // MARK: - Outlets
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .systemPink
        switchButton.tintColor = .systemPink
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    private let additionalInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(icon)
        addSubview(title)
        addSubview(subtitle)
        addSubview(switchButton)
        addSubview(additionalInfo)
        accessoryView = switchButton
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 48),
            
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 19),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            
            subtitle.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 19),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            
            switchButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 330),
            switchButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            
            additionalInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 330),
            additionalInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18)
        ])
    }
}
