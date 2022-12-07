//
//  ContentView.swift
//  task list
//
//  Created by Fatemeh Razipour on 7/25/1401 AP.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listviewModel.items.isEmpty{
                NoItemsView()
            } else {
                
                List {
                    ForEach(listviewModel.items) { item in
                        listRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listviewModel.updateItem(item: item )
                                }
                            }
                        
                    }
                    .onDelete(perform: listviewModel.deleteItems)
                    .onMove(perform: listviewModel.onMoveItems)
                }
                .listStyle(PlainListStyle())
            }
            
        }
        
        .navigationTitle("To Do List 📝")
        .toolbar{
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                
                NavigationLink {
                    AddView()
                    
                } label: {
                    Text("Add ")
                }
            }
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}



