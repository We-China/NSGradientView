//
//  GradientViewModel.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//  Copyright © 2020 zuolin. All rights reserved.
//

import Foundation

class GradientViewModel {
    public var upateClosure: (() -> ())?
    
    public var dataSource: [GradientItemModel] = {
        var list: [GradientItemModel] = []
        
        GradientItemModel.ItemType.allCases.forEach { (itemType) in
            let itemModel = GradientItemModel(itemType: itemType)
            list.append(itemModel)
        }
        
        return list
    }()
}
