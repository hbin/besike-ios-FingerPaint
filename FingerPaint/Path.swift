//
//  Path.swift
//  FingerPaint
//
//  Created by Bin Huang on 11/4/14.
//  Copyright (c) 2014 Bin Huang. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var points: [CGPoint] = []
    let color: CGColor = UIColor.blackColor().CGColor
    let lineWidth: CGFloat = 2.0

    init(color: CGColor?, lineWidth: CGFloat?) {
        if let c = color {
            self.color = c
        }

        if let w = lineWidth {
            self.lineWidth = w
        }
    }

    func add(newPoint: CGPoint) {
        self.points.append(newPoint)
    }
}