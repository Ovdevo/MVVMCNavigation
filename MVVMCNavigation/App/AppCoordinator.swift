//
//  AppCoordinator.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import SwiftUI

struct AppCoordinator: View 
{
    @StateObject private var viewModel = ViewModel()
    
    var body: some View
    {
        NavigationStack
        {
            switch viewModel.children.content
            {
            case .login(let loginCoordinatorViewModel):
                LoginCoordinator(viewModel: loginCoordinatorViewModel)
                
            case .main(let mainCoordinatorViewModel):
                MainCoordinator(viewModel: mainCoordinatorViewModel)
                    .navigationTitle("")
                    .toolbar()
                {
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        Button(action: viewModel.handleSettingsButtonTap,
                               label: { Text("Settings")})
                    }
                }
                .sheet(item: $viewModel.children.settings)
                {
                    setting in
                    
                    SettingsCoordinator(viewModel: setting)
                }
            }
        }
    }
}

#Preview 
{
    AppCoordinator()
}
