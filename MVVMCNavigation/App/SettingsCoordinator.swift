//
//  SettingsCoordinator.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import SwiftUI

struct SettingsCoordinator: View 
{
    @ObservedObject var viewModel: SettingsCoordinatorViewModel
    
    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                NavigationLink("This is profile")
                {
                    Text("Go to Profile")
                }
                
                Spacer()
                    .frame(height: 10)
                
                NavigationLink("This is Logout")
                {
                    Text("Go to Logout")
                }
                
                Spacer()
                    .frame(height: 10)
                
                NavigationLink("This is Preferences")
                {
                    Text("Go to Preferences")
                }
                
                Button("Logout", action: viewModel.handleLogoutButtonTap)
            }
        }
    }
}

//#Preview 
//{
//    SettingsCoordinator()
//}
