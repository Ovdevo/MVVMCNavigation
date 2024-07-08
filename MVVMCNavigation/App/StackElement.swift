//
//  StackElement.swift
//  MVVMCNavigation
//
//  Created by olja on 5.2.24.
//

import Foundation

enum StackElement: Hashable
{
    case item(ItemViewModel)
    case detail(ItemViewModel)
}
