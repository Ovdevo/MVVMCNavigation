//
//  LoginCoordinator.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import SwiftUI

struct LoginCoordinator: View 
{
    @ObservedObject var viewModel: LoginCoordinatorViewModel
    
    var body: some View
    {
        Text("Login")
        
        Button(action: viewModel.handleLoginButtonTap,
               label: { Text("Login") })
    }
}
