//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Bin Huang on 10/31/14.
//  Copyright (c) 2014 Bin Huang. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    var paths = [Path]()
    private var newPath: Path?

    var currentColor: CGColor?
    var currentLineWidth: CGFloat?

    func clear() {
        self.paths = []
        self.setNeedsDisplay()
    }

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)

        for path in paths {
            CGContextAddLines(context, path.points, UInt(path.points.count))
            CGContextSetStrokeColorWithColor(context, path.color)
            CGContextSetLineWidth(context, path.lineWidth)
            CGContextStrokePath(context);
        }
    }

    // *** Draw when user touches the screen ***

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.newPath = Path(color: self.currentColor?, lineWidth: self.currentLineWidth?)
        self.paths.append(self.newPath!)
        addToPath(touches)
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        addToPath(touches)
        self.setNeedsDisplay()
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        addToPath(touches)
        self.newPath = nil
    }

    private func addToPath(touches: NSSet) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)

        self.newPath?.add(point)
    }
}


