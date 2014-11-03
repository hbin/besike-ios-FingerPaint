//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Bin Huang on 10/31/14.
//  Copyright (c) 2014 Bin Huang. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let zigzag = [(100, 100), (100, 150), (150, 150), (150, 200)]

    var currentColor: CGColor = UIColor.redColor().CGColor {
        didSet {
            self.setNeedsDisplay()
        }
    }

    override func drawRect(rect: CGRect) {
        var path   = Path()
        zigzag.map { path.addPoint($0.0, $0.1) }

        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        CGContextAddLines(context, path.points, UInt(path.points.count))
        CGContextSetStrokeColorWithColor(context, self.currentColor)
        CGContextStrokePath(context);
    }
}

class Path {
    var points: [CGPoint] = []

    func addPoint(newPoint: CGPoint) {
        self.points.append(newPoint)
    }

    func addPoint(x: Int, _ y: Int) {
        var newPoint = CGPoint(x: x, y: y)
        self.points.append(newPoint)
    }
}
