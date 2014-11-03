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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Instantiate the canvas view.
        let canvasView = CanvasView(frame: self.view.bounds)
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.canvasView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

