//
//  Item.swift
//  MVVMCNavigation
//
//  Created by olja on 5.2.24.
//

import Foundation

struct Item: Identifiable, Hashable
{
    var id = UUID()
    var title: String
    var description: String
}
