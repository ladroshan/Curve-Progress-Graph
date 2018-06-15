//
//  ViewController.swift
//  Curve Progress
//
//  Created by Shubh on 15/06/18.
//  Copyright © 2018 Shubh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTarget: UILabel!
    
    @IBOutlet weak var progressView: ProgressGraph!
    
    @IBOutlet weak var labelGain: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnUpdateClicked(_ sender: UIButton) {
        progressView.updateProgress(target: Float(labelTarget.text!)!, score: Float(labelGain.text!)!)
    }
    
    @IBAction func targetPlus(_ sender: Any) {
        
        if let target = Int(labelTarget.text!),  target < 100 {
            self.labelTarget.text = "\(target + 10)"
        }
    }
    
    @IBAction func targetMinus(_ sender: Any) {
        
        if let target = Int(labelTarget.text!),  target > 0 {
            self.labelTarget.text = "\(target - 10)"
        }
    }
    
    @IBAction func gainPlus(_ sender: Any) {
        if let gain = Int(labelGain.text!),  gain < 100 {
            self.labelGain.text = "\(gain + 10)"
        }
    }
    
    @IBAction func gainMinus(_ sender: Any) {
        if let gain = Int(labelGain.text!),  gain > 0 {
            self.labelGain.text = "\(gain - 10)"
        }
    }
}

