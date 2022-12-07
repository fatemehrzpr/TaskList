//
//  itemModel.swift
//  task list
//
//  Created by Fatemeh Razipour on 7/29/1401 AP.
//

import Foundation

struct ItemModel :Identifiable , Codable{
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    func updateComlation()-> ItemModel{
        return ItemModel(id:id, title: title, isCompleted: !isCompleted)
    }
}

