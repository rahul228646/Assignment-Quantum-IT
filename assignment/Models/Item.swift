//
//  Item.swift
//  assignment
//
//  Created by rahul kaushik on 22/10/22.
//

import Foundation

struct Item {
    let name : String
    let price : String
    let qty : String
    
    init(name: String, price: String, qty: String) {
        self.name = name
        self.price = price
        self.qty = qty
    }
}
