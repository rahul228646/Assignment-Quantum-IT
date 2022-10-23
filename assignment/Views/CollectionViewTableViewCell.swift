//
//  CollectionViewTableViewCell.swift
//  assignment
//
//  Created by rahul kaushik on 21/10/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    private let itemArray : [Item] = [
        Item(name: "Apple", price: "$ \(15)", qty: "\(1) Kg"),
        Item(name: "Orange", price: "$ \(5)", qty: "\(1) Kg"),
    ]
    
    
    static let identifier = "collectionViewTableViewCell"
    
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
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 240, height: 250)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ItemCollectionViewCell.self , forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(deleteCartButton)
        stackView.addArrangedSubview(checkoutButton)
        contentView.addSubview(stackView)
     
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        stackViewConstraints()
    }
    
    private func stackViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            stackView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

extension CollectionViewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        cell.layer.borderWidth = 10
        cell.layer.borderColor = CGColor(red: 0.90, green: 0.91, blue: 0.91, alpha: 1.00)
        cell.config(model: itemArray[indexPath.row])
        return cell
    }
}


