//
//  MainCoordinatorViewModel.swift
//  MVVMCNavigation
//
//  Created by olja on 12.1.24.
//

import Foundation
import Combine

class MainCoordinatorViewModel: ObservableObject
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
        let tableCoordinatorViewModel = TableCoordinatorViewModel()
        let gridCoordinatorViewModel =  GridCoordinatorViewModel()
        
        self.children = .init(table: tableCoordinatorViewModel,
                              grid: gridCoordinatorViewModel)
        
        $state
            .map(\.selectedTab)
            .sink()
        {
            print("Tab: \($0)")
        }
        .store(in: &cancellables)
    }
}

extension MainCoordinatorViewModel
{
    struct Children
    {
        var table: TableCoordinatorViewModel
        var grid: GridCoordinatorViewModel
    }
    
    struct State
    {
        var selectedTab = Tab.table
        
        enum Tab
        {
            case table
            case grid
        }
    }
    
    enum Event
    {
        
    }
}
