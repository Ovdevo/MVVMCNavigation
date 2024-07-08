//
//  AppCoordinator.ViewModel.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import Foundation
import Combine

extension AppCoordinator
{
    class ViewModel: ObservableObject
    {
        var publisher: AnyPublisher<Event, Never>
        {
            publishSubject
                .eraseToAnyPublisher()
        }
        
        @Published var children: Children
        
        @Published var state = State()
        
        private var publishSubject = PassthroughSubject<Event, Never>()
        private var cancellables = Set<AnyCancellable>()
        
        init()
        {
            let loginCoordinatorViewModel = LoginCoordinatorViewModel()
            
            self.children = .init(content: .login(loginCoordinatorViewModel))
            
            loginCoordinatorViewModel
                .publisher
                .sink()
                {
                    [weak self] event in
                    
                    switch event
                    {
                    case .loggedIn:
                        self?.showMain()
                        
                    }
                }
                .store(in: &cancellables)
        }
        
        func handleSettingsButtonTap()
        {
            showSettings()
        }
        
        private func showMain()
        {
            let mainCoordinatorViewModel = MainCoordinatorViewModel()
            
            self.children.content = .main(mainCoordinatorViewModel)
        }
        
        private func showSettings()
        {
            let settingsCoordinatorViewModel = SettingsCoordinatorViewModel()
            
            settingsCoordinatorViewModel
                .publisher
                .sink()
                {
                    [weak self] settingsEvent in
                    
                    switch settingsEvent
                    {
                    case .logout:
                        self?.logout()
                        
                    }
                }
                .store(in: &cancellables)
            
            self.children.settings = settingsCoordinatorViewModel
        }
        
        private func logout()
        {
            self.children.settings = nil
            
            let loginCoordinatorViewModel = LoginCoordinatorViewModel()
            loginCoordinatorViewModel
                .publisher
                .sink()
                {
                   [weak self] loginEvent in
                    
                    switch loginEvent
                    {
                    case .loggedIn:
                        self?.showMain()
                        
                    }
                }
                .store(in: &cancellables)
            
            self.children.content = .login(loginCoordinatorViewModel)
        }
    }
}

extension AppCoordinator.ViewModel
{
    struct Children
    {
        var content: Content
        var settings: SettingsCoordinatorViewModel?
        
        enum Content
        {
            case login(LoginCoordinatorViewModel)
            case main(MainCoordinatorViewModel)
        }
    }
    
    struct State
    {
    }
    
    enum Event
    {
    }
}
