//
//  CartViewController.swift
//  assignment
//
//  Created by rahul kaushik on 21/10/22.
//

import UIKit

class CartViewController: UIViewController {
    
    let sectionTitles: [String] = ["Mini Baskets", "Designer Hub"]
    
    
    private let cartFeed : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
//        table.register(FooterView.self, forHeaderFooterViewReuseIdentifier: FooterView.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.borderWidth = 10
        table.layer.borderColor = CGColor(red: 0.90, green: 0.91, blue: 0.91, alpha: 1.00)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        cartFeed.delegate = self
        cartFeed.dataSource = self
        view.addSubview(cartFeed)
        
        cartFeed.frame = view.bounds
        view.backgroundColor = .systemBackground
        
        title = "Cart"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "house.fill"), style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .systemRed
        
        NSLayoutConstraint.activate([
            cartFeed.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            cartFeed.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            cartFeed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cartFeed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
    
    private let deleteCartButton : UIButton = {
        let button = UIButton()
        button.setTitle("Delete Cart", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemRed
        return button
    }()

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        let label = UILabel()
        let label2 = UILabel()
        label.text = sectionTitles[section]
        label2.text = "(1 Product)"
        label.frame = CGRect(x: 5, y: 5, width: view.frame.width, height: 35)
        label2.frame = CGRect(x: 5, y: 5, width: view.frame.width, height: 35)
        label.textColor = .systemRed
        v.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(label)
        v.addSubview(label2)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),
            
            label2.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            label2.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),

        ])
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    

    
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView()
//        deleteCartButton.frame = CGRect(x: 5, y: 5, width: 400, height: 35)
//        view.backgroundColor = .systemBackground
//        view.addSubview(deleteCartButton)
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        1
//    }

    
}
