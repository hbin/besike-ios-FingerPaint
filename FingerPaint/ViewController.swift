//
//  ViewController.swift
//  FingerPaint
//
//  Created by Bin Huang on 10/30/14.
//  Copyright (c) 2014 Bin Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var canvasView: CanvasView! {
        didSet {
            canvasView.backgroundColor = UIColor.whiteColor()
        }
    }

    weak var clearButton: UIButton! {
        didSet {
            clearButton.frame = CGRect(x: 267, y: 518, width: 37, height: 30)
            clearButton.setTitle("Clear", forState: UIControlState.Normal)
        }
    }

    weak var lineWidthSlider: UISlider! {
        didSet {
            lineWidthSlider.minimumValue = 1.0
            lineWidthSlider.maximumValue = 5.0
            lineWidthSlider.value = 2.0
            lineWidthSlider.frame = CGRect(x: 33, y: 100, width: 253, height: 20)
        }
    }

    weak var selectedColorPicker: UIButton! {
        didSet {
            selectedColorPicker.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
            selectedColorPicker.layer.shadowOffset = CGSize(width: 0, height: 0)
            selectedColorPicker.layer.shadowRadius = 3
            selectedColorPicker.layer.shadowOpacity = 1

            self.canvasView.currentColor = selectedColorPicker.backgroundColor!.CGColor
        }
    }

    // overrides ...........................................

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCanvasView()
        setupColorPickersBtn()
        setupLineWidthSlider()
        setupClearBtn()
    }

    // actions ...........................................

    func colorPickerTapped(button: UIButton) {
        if let lastPicker = self.selectedColorPicker {
            lastPicker.layer.shadowRadius = 0
        }

        self.selectedColorPicker = button
    }

    func lineWidthSliderValueChanged(slider: UISlider) {
        self.canvasView.currentLineWidth = CGFloat(slider.value)
    }

    func clearButtonTapped(button: UIButton) {
        self.canvasView.clear()
    }

    // private setups ...........................................

    private func setupCanvasView() {
        let canvasView = CanvasView(frame: self.view.bounds)

        self.canvasView = canvasView
        self.view.addSubview(canvasView)
    }

    private func setupColorPickersBtn() {
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
            let colorPickerBtn = UIButton(frame: rect)
            colorPickerBtn.backgroundColor = color

            if i == 0 {
                self.selectedColorPicker = colorPickerBtn
            }
            self.view.addSubview(colorPickerBtn)

            colorPickerBtn.addTarget(self, action: "colorPickerTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }

    private func setupLineWidthSlider() {
        let lineWidthSlider = UISlider()

        self.lineWidthSlider = lineWidthSlider
        self.view.addSubview(lineWidthSlider)

        lineWidthSlider.addTarget(self, action: "lineWidthSliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }

    private func setupClearBtn() {
        let clearBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton

        self.clearButton = clearBtn
        self.view.addSubview(clearBtn)

        clearBtn.addTarget(self, action: "clearButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
    }
}

