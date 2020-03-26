//
//  NSGradientView.swift
//  NSGradientView
//
//  Created by zuolin on 2020/3/26.
//

import Cocoa

open class NSGradientView: NSView {

    public var gradient: NSGradient? {
        didSet {
            self.viewWillDraw()
        }
    }
    
    public var angleType: NSGradientView.AngleType = .leftRight {
        didSet {
            if let _ = gradient {
                self.viewWillDraw()
            }
        }
    }
    
    open override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        if let gradient = gradient {
            gradient.draw(in: self.bounds, angle: angleType.getAngle())
        }
    }
}

public extension NSGradientView {
    /// NSGradient Angle value type
    enum AngleType {
        
        case leftRight
        case rightLeft
        case topBottom
        case bottomTop
        case custom(CGFloat)
        
        public func getAngle() -> CGFloat {
            switch self {
            case .leftRight:
                return .zero
            case .rightLeft:
                return 180
            case .topBottom:
                return -90
            case .bottomTop:
                return 90
            case .custom(let angle):
                return angle
            }
        }
    }
}
