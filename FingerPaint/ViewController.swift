//
//  ViewController.swift
//  FingerPaint
//
//  Created by Bin Huang on 10/30/14.
//  Copyright (c) 2014 Bin Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!

    var selectedColorPicker: UIButton? {
        didSet {
            selectedColorPicker!.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
            selectedColorPicker!.layer.shadowOffset = CGSize(width: 0, height: 0)
            selectedColorPicker!.layer.shadowRadius = 3
            selectedColorPicker!.layer.shadowOpacity = 1

            self.canvasView.currentColor = selectedColorPicker!.backgroundColor!.CGColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Instantiate the canvas view.
        let canvasView = CanvasView(frame: self.view.bounds)
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.canvasView)

        setupColorPickers()
    }

    func colorPickerTapped(button: UIButton) {
        if let lastPicker = self.selectedColorPicker {
            lastPicker.layer.shadowRadius = 0
        }

        self.selectedColorPicker = button
    }

    private func setupColorPickers() {
        let colors : [UIColor] = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]

        let rects = [
            CGRect(x: 33,  y: 43, width: 44, height: 44),
            CGRect(x: 86,  y: 43, width: 44, height: 44),
            CGRect(x: 138, y: 43, width: 44, height: 44),
            CGRect(x: 190, y: 43, width: 44, height: 44),
            CGRect(x: 242, y: 43, width: 44, height: 44),
        ]

        for (i, color) in enumerate(colors) {
            let rect  = rects[i]
            let button = UIButton(frame: rect)

            button.backgroundColor = color
            self.view.addSubview(button)

            if i == 0 {
                self.selectedColorPicker = button
            }

            button.addTarget(self, action: "colorPickerTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
}

