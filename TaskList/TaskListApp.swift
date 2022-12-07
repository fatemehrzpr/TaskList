//
//  task_listApp.swift
//  task list
//
//  Created by Fatemeh Razipour on 7/25/1401 AP.
//

import SwiftUI

@main
struct TaskListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
               ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
