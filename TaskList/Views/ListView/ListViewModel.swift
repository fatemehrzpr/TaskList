//
//  listViewModel.swift
//  task list
//
//  Created by Fatemeh Razipour on 7/30/1401 AP.
//

import Foundation
class ListViewModel: ObservableObject {
    
    @Published var items:[ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_List"
    
    init(){
        getItems()
    }
    
    func getItems (){
        
        
        //        let newItems = [
        //            itemModel(title: "This is the first note", isCompleted: false),
        //            itemModel(title: "this is second", isCompleted: true )
        //        ]
        //       items.append(contentsOf: newItems )
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
        
    }
    
    func deleteItems(index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func onMoveItems(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append( newItem)
    }
    
    func updateItem(item : ItemModel) {
        //      if let index = items.firstIndex { existingItem in
        //          return existingItem.id == item.id
        //        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateComlation()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
