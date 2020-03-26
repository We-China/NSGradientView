//
//  NSGradient+Extension.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//

import AppKit
import Foundation

public extension NSGradient {
    static func gradient(list: [NSGradientModel], colorSpace: NSColorSpace = .deviceRGB) -> NSGradient? {
        let colors = list.map { $0.color }
        let locations = list.map { $0.location }
        
        let gradient = NSGradient(colors: colors, atLocations: locations, colorSpace: colorSpace)
        
        return gradient
    }
}
