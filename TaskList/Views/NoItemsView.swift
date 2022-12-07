//
//   noItemsView.swift
//  task list
//
//  Created by Fatemeh Razipour on 8/7/1401 AP.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate : Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add btn and add a bunch of items to your todo list!")
                    .padding(.bottom,20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something ... ")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.pink.opacity(0.7) : Color.accentColor)
                        .cornerRadius(10)
                }
                
                .padding(.horizontal,animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.pink.opacity(0.5) : Color.accentColor.opacity(0.5),
                    radius: animate ? 30 : 10,
                    x : 0,
                    y : animate ? 50 :30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y:animate ? -7 : 0)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

