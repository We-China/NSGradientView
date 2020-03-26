//
//  NSGradientModel.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//

import AppKit
import Foundation

public struct NSGradientModel {
    public let color: NSColor
    public let location: CGFloat
    
    public init(color: NSColor, location: CGFloat) {
        self.color = color
        self.location = location
    }
}
