//
//  GradientItemModel.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//  Copyright © 2020 zuolin. All rights reserved.
//

import AppKit
import Foundation

struct GradientItemModel {
    let itemType: GradientItemModel.ItemType
    
    init(itemType: GradientItemModel.ItemType) {
        self.itemType = itemType
    }
}

extension GradientItemModel {
    enum ItemType: String, CaseIterable {
        case basic
        case dark
        case deuteranopia
        case grayscale
        case purple
        case tritanopia
    }
}

protocol GradientItemTypeProtocol {
    var text: String { get }
    var gradient: NSGradient? { get }
    var angleType: NSGradientView.AngleType { get }
}

extension GradientItemModel.ItemType: GradientItemTypeProtocol {
    var text: String {
        return self.rawValue.capitalized
    }
    
    var gradient: NSGradient? {
        switch self {
        case .basic:
            return getBasicGradient()
        case .dark:
            return getDarkGradient()
        case .deuteranopia:
            return getDeuteranopiaGradient()
        case .grayscale:
            return getGrayscaleGradient()
        case .purple:
            return getPurpleGradient()
        case .tritanopia:
            return getTritanopiaGradient()
        }
    }
    
    var angleType: NSGradientView.AngleType {
        switch self {
        case .basic:
            return .leftRight
        case .dark:
            return .rightLeft
        case .deuteranopia:
            return .topBottom
        case .grayscale:
            return .bottomTop
        case .purple:
            return .custom(45.0)
        case .tritanopia:
            return .custom(64.0)
        }
    }
        
    private func getBasicGradient() -> NSGradient? {
        var list: [NSGradientModel] = []
        
        let black: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        let blackLocation: CGFloat = .zero
        let blackModel: NSGradientModel = NSGradientModel(color: black, location: blackLocation)
        list.append(blackModel)
        
        let blue: NSColor = NSColor(red: 0, green: 0, blue: 1, alpha: 1)
        let blueLocation: CGFloat = 0.15
        let blueModel: NSGradientModel = NSGradientModel(color: blue, location: blueLocation)
        list.append(blueModel)
        
        let cyan: NSColor = NSColor(red: 0, green: 1, blue: 1, alpha: 1)
        let cyanLocation: CGFloat = 0.25
        let cyanModel: NSGradientModel = NSGradientModel(color: cyan, location: cyanLocation)
        list.append(cyanModel)
        
        let green: NSColor = NSColor(red: 0, green: 1, blue: 0, alpha: 1)
        let greenLocation: CGFloat = 0.35
        let greenModel: NSGradientModel = NSGradientModel(color: green, location: greenLocation)
        list.append(greenModel)
        
        let yellow: NSColor = NSColor(red: 1, green: 1, blue: 0, alpha: 1)
        let yellowLocation: CGFloat = 0.55
        let yellowModel: NSGradientModel = NSGradientModel(color: yellow, location: yellowLocation)
        list.append(yellowModel)
        
        let red: NSColor = NSColor(red: 1, green: 0, blue: 0, alpha: 1)
        let redLocation: CGFloat = 0.90
        let redModel: NSGradientModel = NSGradientModel(color: red, location: redLocation)
        list.append(redModel)
        
        let white: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)
        let whiteLocation: CGFloat = 1.0
        let whiteModel: NSGradientModel = NSGradientModel(color: white, location: whiteLocation)
        list.append(whiteModel)
        
        let gradient = NSGradient.gradient(list: list, colorSpace: .deviceRGB)
        
        return gradient
    }
    
    private func getDarkGradient() -> NSGradient? {
        var list: [NSGradientModel] = []
        
        let black: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        let blackLocation: CGFloat = .zero
        let blackModel: NSGradientModel = NSGradientModel(color: black, location: blackLocation)
        list.append(blackModel)
        
        let blue: NSColor = NSColor(red: 0, green: 0, blue: 1, alpha: 1)
        let blueLocation: CGFloat = 0.65
        let blueModel: NSGradientModel = NSGradientModel(color: blue, location: blueLocation)
        list.append(blueModel)
        
        let green: NSColor = NSColor(red: 0, green: 1, blue: 0, alpha: 1)
        let greenLocation: CGFloat = 0.90
        let greenModel: NSGradientModel = NSGradientModel(color: green, location: greenLocation)
        list.append(greenModel)
        
        let red: NSColor = NSColor(red: 1, green: 0, blue: 0, alpha: 1)
        let redLocation: CGFloat = 0.95
        let redModel: NSGradientModel = NSGradientModel(color: red, location: redLocation)
        list.append(redModel)
        
        let lightPink: NSColor = NSColor(red: 1, green: 0.71, blue: 0.76, alpha: 1)
        let lightPinkLocation: CGFloat = 1.0
        let lightPinkModel: NSGradientModel = NSGradientModel(color: lightPink, location: lightPinkLocation)
        list.append(lightPinkModel)
        
        let gradient = NSGradient.gradient(list: list, colorSpace: .deviceRGB)
        
        return gradient
    }
    
    private func getDeuteranopiaGradient() -> NSGradient? {
        var list: [NSGradientModel] = []
        
        let black: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        let blackLocation: CGFloat = .zero
        let blackModel: NSGradientModel = NSGradientModel(color: black, location: blackLocation)
        list.append(blackModel)
                
        let darkBlue: NSColor = NSColor(red: 0.03, green: 0.23, blue: 0.42, alpha: 1)
        let darkBlueLocation: CGFloat = 0.15
        let darkBlueModel: NSGradientModel = NSGradientModel(color: darkBlue, location:darkBlueLocation)
        list.append(darkBlueModel)
        
        let lightBlue: NSColor = NSColor(red: 0.52, green: 0.63, blue: 0.84, alpha: 1)
        let lightBlueLocation: CGFloat = 0.50
        let lightBlueModel: NSGradientModel = NSGradientModel(color: lightBlue, location:lightBlueLocation)
        list.append(lightBlueModel)
        
        let darkYellow: NSColor = NSColor(red: 0.65, green: 0.59, blue: 0.45, alpha: 1)
        let darkYellowLocation: CGFloat = 0.65
        let darkYellowModel: NSGradientModel = NSGradientModel(color: darkYellow, location:darkYellowLocation)
        list.append(darkYellowModel)
        
        let yellow: NSColor = NSColor(red: 1, green: 1, blue: 0, alpha: 1)
        let yellowLocation: CGFloat = 0.85
        let yellowModel: NSGradientModel = NSGradientModel(color: yellow, location:yellowLocation)
        list.append(yellowModel)
        
        let white: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)
        let whiteLocation: CGFloat = 1.0
        let whiteModel: NSGradientModel = NSGradientModel(color: white, location: whiteLocation)
        list.append(whiteModel)
        
        let gradient = NSGradient.gradient(list: list, colorSpace: .deviceRGB)
        
        return gradient
    }
    
    private func getGrayscaleGradient() -> NSGradient? {
        var list: [NSGradientModel] = []
        
        let black: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        let blackLocation: CGFloat = .zero
        let blackModel: NSGradientModel = NSGradientModel(color: black, location: blackLocation)
        list.append(blackModel)
        
        let white: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)
        let whiteLocation: CGFloat = 1.0
        let whiteModel: NSGradientModel = NSGradientModel(color: white, location: whiteLocation)
        list.append(whiteModel)
        
        let gradient = NSGradient.gradient(list: list, colorSpace: .deviceRGB)
        
        return gradient
    }
    
    private func getPurpleGradient() -> NSGradient? {
        var list: [NSGradientModel] = []
        
        let black: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        let blackLocation: CGFloat = .zero
        let blackModel: NSGradientModel = NSGradientModel(color: black, location: blackLocation)
        list.append(blackModel)
        
        let blue: NSColor = NSColor(red: 0, green: 0, blue: 1, alpha: 1)
        let blueLocation: CGFloat = 0.15
        let blueModel: NSGradientModel = NSGradientModel(color: blue, location: blueLocation)
        list.append(blueModel)
        
        let green: NSColor = NSColor(red: 0, green: 1, blue: 0, alpha: 1)
        let greenLocation: CGFloat = 0.30
        let greenModel: NSGradientModel = NSGradientModel(color: green, location: greenLocation)
        list.append(greenModel)
        
        let yellow: NSColor = NSColor(red: 1, green: 1, blue: 0, alpha: 1)
        let yellowLocation: CGFloat = 0.45
        let yellowModel: NSGradientModel = NSGradientModel(color: yellow, location: yellowLocation)
        list.append(yellowModel)
        
        let red: NSColor = NSColor(red: 1, green: 0, blue: 0, alpha: 1)
        let redLocation: CGFloat = 0.60
        let redModel: NSGradientModel = NSGradientModel(color: red, location: redLocation)
        list.append(redModel)
        
        let purple: NSColor = NSColor(red: 0.5, green: 0, blue: 0.5, alpha: 1)
        let purpleLocation: CGFloat = 0.75
        let purpleModel: NSGradientModel = NSGradientModel(color: purple, location: purpleLocation)
        list.append(purpleModel)
        
        let white: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)
        let whiteLocation: CGFloat = 1.0
        let whiteModel: NSGradientModel = NSGradientModel(color: white, location: whiteLocation)
        list.append(whiteModel)
        
        let gradient = NSGradient.gradient(list: list, colorSpace: .deviceRGB)
        
        return gradient
    }
    
    private func getTritanopiaGradient() -> NSGradient? {
        var list: [NSGradientModel] = []
        
        let black: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        let blackLocation: CGFloat = .zero
        let blackModel: NSGradientModel = NSGradientModel(color: black, location: blackLocation)
        list.append(blackModel)
        
        let darkTeal: NSColor = NSColor(red: 0, green: 0.27, blue: 0.32, alpha: 1)
        let darkTealLocation: CGFloat = 0.15
        let darkTealModel: NSGradientModel = NSGradientModel(color: darkTeal, location: darkTealLocation)
        list.append(darkTealModel)
        
        let lightBlue: NSColor = NSColor(red: 0.42, green: 0.73, blue: 0.84, alpha: 1)
        let lightBlueLocation: CGFloat = 0.25
        let lightBlueModel: NSGradientModel = NSGradientModel(color: lightBlue, location:lightBlueLocation)
        list.append(lightBlueModel)
        
        let darkRed: NSColor = NSColor(red: 0.29, green: 0.03, blue: 0.09, alpha: 1)
        let darkRedLocation: CGFloat = 0.45
        let darkRedModel: NSGradientModel = NSGradientModel(color: darkRed, location: darkRedLocation)
        list.append(darkRedModel)
        
        let red: NSColor = NSColor(red: 1, green: 0, blue: 0, alpha: 1)
        let redLocation: CGFloat = 0.90
        let redModel: NSGradientModel = NSGradientModel(color: red, location: redLocation)
        list.append(redModel)
        
        let lightRed: NSColor = NSColor(red: 0.84, green: 0.47, blue: 0.52, alpha: 1)
        let lightRedLocation: CGFloat = 0.95
        let lightRedModel: NSGradientModel = NSGradientModel(color: lightRed, location: lightRedLocation)
        list.append(lightRedModel)
        
        let white: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)
        let whiteLocation: CGFloat = 1.0
        let whiteModel: NSGradientModel = NSGradientModel(color: white, location: whiteLocation)
        list.append(whiteModel)
        
        let gradient = NSGradient.gradient(list: list, colorSpace: .deviceRGB)
        
        return gradient
    }
}
