//
//  MainCoordinator.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import SwiftUI

struct MainCoordinator: View
{
    @ObservedObject var viewModel: MainCoordinatorViewModel
    
    var body: some View
    {
        TabView(selection: $viewModel.state.selectedTab)
        {
            TableCoordinator(viewModel: viewModel.children.table)
                .tabItem
            {
                Label ("Table", systemImage: "1.circle")
            }
            .tag(MainCoordinatorViewModel.State.Tab.table)
            
            GridCoordinator(viewModel: viewModel.children.grid)
                .tabItem
            {
                Label ("Grid", systemImage: "2.circle")
            }
            .tag(MainCoordinatorViewModel.State.Tab.grid)
        }
    }
}
//#Preview
//{
//    MainCoordinator()
//}
