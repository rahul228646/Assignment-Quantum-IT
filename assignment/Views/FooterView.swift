//
//  FooterView.swift
//  assignment
//
//  Created by rahul kaushik on 22/10/22.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {
    
    static let identifier = "footer"
    
    private let checkoutButton : UIButton = {
        let button = UIButton()
        button.setTitle("Checkout", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemRed
        return button
    }()
    
    private let deleteCartButton : UIButton = {
        let button = UIButton()
        button.setTitle("Delete Cart", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemRed
        return button
    }()
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "$ 456"
        label.textColor = .systemRed
        return label
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        stackViewConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = contentView.bounds
    }
    
    private func stackViewConstraints() {
        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
