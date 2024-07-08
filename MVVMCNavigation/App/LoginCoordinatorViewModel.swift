//
//  LoginCoordinatorViewModel.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import Foundation
import Combine

class LoginCoordinatorViewModel: ObservableObject
{
    var publisher: AnyPublisher<Event, Never>
    {
        publishSubject
            .eraseToAnyPublisher()
    }
    
    @Published var children = Children()
    
    @Published var state = State()
    
    private var publishSubject = PassthroughSubject<Event, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init()
    {
    }
    
    func handleLoginButtonTap()
    {
        publishSubject.send(.loggedIn)
    }
}

extension LoginCoordinatorViewModel
{
    struct Children
    {
        
    }
    
    struct State
    {
        
    }
    
    enum Event
    {
        case loggedIn
    }
}
