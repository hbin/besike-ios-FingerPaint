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
    let color: CGColor
    let lineWidth: CGFloat

    init(color: CGColor, lineWidth: CGFloat) {
        self.color = color
        self.lineWidth = lineWidth
    }

    func add(newPoint: CGPoint) {
        self.points.append(newPoint)
    }
}