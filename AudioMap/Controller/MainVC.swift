//
//  ViewController.swift
//  AudioMap
//
//  Created by Admin on 16.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit


class MainVC: UIViewController, AudioEngineDelegate {
    
    @IBOutlet weak var dotGraph: DotGraphView!
    
    func newDataAdded(freq: Double, amp: Double) {
        dotGraph.add(freq: freq, amp: amp)
    } 

    override func viewDidLoad() {
        super.viewDidLoad()
        AudioEngine.shared.delegate = self
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
    

    @IBAction func startButtonClicked(_ sender: Any) {
        AudioEngine.shared.start()
    }
    @IBAction func stopButtonClicked(_ sender: Any) {
         AudioEngine.shared.stop()
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to remove all?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in 
            self.dotGraph.reset()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
        }
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}

