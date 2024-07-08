//
//  TableCoordinatorViewModel.swift
//  MVVMCNavigation
//
//  Created by olja on 16.1.24.
//

import Foundation
import Combine

class TableCoordinatorViewModel: ObservableObject
{
    var publisher: AnyPublisher<Event, Never>
    {
        publishSubject
            .eraseToAnyPublisher()
    }
    
    @Published var children: Children
    
    @Published var state: State
    
    private var publishSubject = PassthroughSubject<Event, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init()
    {
        let items = Array(0..<40)
            .map { (item: "Item \($0)", detail: "Details for item number: \($0)") }
            .map { Item(title: $0.item, description: $0.detail) }
        
        self.children = .init(stack: [])
        self.state = .init(items: items)
    }
    
    func show(item: Item)
    {
        let viewModel = makeItemViewModel(for: item)
        
        children.stack.append(.item(viewModel))
    }
    
    func makeItemViewModel(for item: Item) -> ItemViewModel
    {
        let itemViewModel = ItemViewModel(item: item)
        
        itemViewModel
            .publisher
            .sink
            {
                [weak self] event in
                
                switch event
                {
                case .requestDetail(let item):
                    self?.show(detailFor: item)
                    
                }
            }
            .store(in: &cancellables)
        
        return itemViewModel
    }
    
    func show(detailFor item: Item)
    {
        let itemViewModel = ItemViewModel(item: item)
        
        children.stack.append(.detail(itemViewModel))
    }
}

extension TableCoordinatorViewModel
{
    struct Children
    {
        var stack: [StackElement]
    }
    
    struct State
    {
       var items: [Item]
    }
    
    enum Event
    {
        case showItem
    }
}
