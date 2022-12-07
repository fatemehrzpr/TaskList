//
//  ListRowView.swift
//  task list
//
//  Created by Fatemeh Razipour on 7/25/1401 AP.
//

import SwiftUI

struct listRowView: View {
    let item : ItemModel
    var body: some View {
        
        HStack{
            Image(systemName:item.isCompleted ? "checkmark.circle" :"circle" )
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title )
            
        }
        .font(.headline)
    }
    
}

struct listRowView_Previews : PreviewProvider {
    
    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "second", isCompleted: true)
    static var previews: some View{
        Group{
            listRowView(item: item1)
            listRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
    
}



