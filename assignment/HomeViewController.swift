//
//  HomeViewController.swift
//  assignment
//
//  Created by rahul kaushik on 21/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
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
//        stackViewConstraints()
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(deleteCartButton)
        stackView.addArrangedSubview(checkoutButton)
        view.addSubview(stackView)
        stackViewConstraints()
        // Do any additional setup after loading the view.
    }
    
    
    private func stackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

}
