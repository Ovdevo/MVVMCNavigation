//
//  GridCoordinator.swift
//  MVVMCNavigation
//
//  Created by olja on 16.1.24.
//

import SwiftUI

struct GridCoordinator: View
{
    @ObservedObject var viewModel: GridCoordinatorViewModel
    
    var body: some View
    {
        NavigationStack(path: $viewModel.children.stack)
        {
            ScrollView
            {
                Grid
                {
                    ForEach(0..<viewModel.state.items.count/3, id: \.self)
                    {
                        column in
                        
                        GridRow
                        {
                            ForEach(0..<3)
                            {
                                row in
                                
                                let item = row + (column * 3)
                                
                                makeButton(title:viewModel.state.items[item].title, action: {viewModel.show(item: viewModel.state.items[item])})
                                    .padding()
                            }
                        }
                    }
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
                    DetailView()
                }
            }
            .padding(.top, 5)
        }
    }
    
    private func makeButton(title: String,
                                action: @escaping () -> ())
    -> some View
    {
        Button(action: action)
        {
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
                .padding(.all)
                .background(Color.gray)
                .cornerRadius(12)
        }
    }
}
