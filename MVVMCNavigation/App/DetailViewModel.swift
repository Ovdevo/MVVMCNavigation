//
//  DetailViewModel.swift
//  MVVMCNavigation
//
//  Created by olja on 25.1.24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject
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
}

extension DetailViewModel
{
    struct Children
    {
        
    }
    
    struct State
    {
        
    }
    
    enum Event
    {
        
    }
}
