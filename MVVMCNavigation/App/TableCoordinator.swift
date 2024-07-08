//
//  TableCoordinator.swift
//  MVVMCNavigation
//
//  Created by olja on 16.1.24.
//

import SwiftUI

struct TableCoordinator: View
{
    @ObservedObject var viewModel: TableCoordinatorViewModel
    
    var body: some View
    {
        NavigationStack(path: $viewModel.children.stack)
        {
            List
            {
                ForEach(viewModel.state.items)
                {
                    item in
                    
                    Button(item.title, action: { viewModel.show(item: item) })
                        .foregroundColor(.gray)
                }
            }
            .navigationDestination(for: StackElement.self)
            {
                topItem in
                
                switch topItem
                {
                case .item(let item):
                    ItemView(viewModel: item)
                    
                case .detail(let detail):
                    Text("Detail")
                }
            }
        }
    }
}
