//
//  GradientCollectionViewItem.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//  Copyright © 2020 zuolin. All rights reserved.
//

import Cocoa

class GradientCollectionViewItem: NSCollectionViewItem {

    static let identifier = String(describing: GradientCollectionViewItem.self)
    
    @IBOutlet private weak var itemTextField: NSTextField!
    
    @IBOutlet private weak var gradientView: NSGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
}

extension GradientCollectionViewItem {
    public func bindingItemModel(_ itemModel: GradientItemModel) {
        itemTextField.stringValue = itemModel.itemType.text
                
        if let gradient = itemModel.itemType.gradient {
            gradientView.gradient = gradient
            gradientView.angleType = itemModel.itemType.angleType
        }
    }
}
