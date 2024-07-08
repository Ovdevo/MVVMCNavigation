//
//  ItemViewModel.swift
//  MVVMCNavigation
//
//  Created by olja on 25.1.24.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject
{
    var publisher: AnyPublisher<Event, Never>
    {
        publishSubject
            .eraseToAnyPublisher()
    }
    
    @Published var children = Children()
    
    @Published var state: State
    
    private var publishSubject = PassthroughSubject<Event, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init(item: Item)
    {
        self.state = .init(item: item)
    }
    
    func show(detailFor item: Item)
    {
        publishSubject.send(.requestDetail(for: item))
    }
}

extension ItemViewModel: Equatable
{
    static func == (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool 
    {
        true
    }
}

extension ItemViewModel: Hashable
{
    // means the same item will produce the same hash in all of the viewModels using it
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(state.item.id)
    }
}

extension ItemViewModel
{
    struct Children: Hashable
    {
        
    }
    
    struct State: Hashable
    {
        let item: Item
    }
    
    enum Event
    {
        case requestDetail(for: Item)
    }
}
