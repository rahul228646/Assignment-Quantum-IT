//
//  ItemCollectionViewCell.swift
//  assignment
//
//  Created by rahul kaushik on 22/10/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "itemCollectionViewCell"
    
    private var image : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
//        imageView.frame.size.height = 10
        return imageView
    }()
    
    private var price : UILabel = {
        return UILabel()
    }()
    
    private var name : UILabel = {
        return UILabel()
    }()
    
    private var qty : UILabel = {
        return UILabel()
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(price)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(qty)
        contentView.addSubview(stackView)
        addConstraintToStackView()

    }
    
    func addConstraintToStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            image.heightAnchor.constraint(equalToConstant: contentView.frame.height*0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func config(model : Item) {
        price.text = model.price
        name.text = model.name
        qty.text = model.qty
        image.image = UIImage(named: model.name)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = contentView.bounds
    }
}
