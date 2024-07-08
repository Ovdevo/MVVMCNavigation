//
//  ItemView.swift
//  MVVMCNavigation
//
//  Created by olja on 25.1.24.
//

import SwiftUI

struct ItemView: View 
{
    @ObservedObject var viewModel: ItemViewModel
    var item: Item { viewModel.state.item }
    
    var body: some View
    {
        Text(item.title)
        Text(item.description)
        
        Button("See details", action: { viewModel.show(detailFor: item) })
    }
}
