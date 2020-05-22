//
//  InterfaceController.swift
//  TrackerWatch WatchKit Extension
//
//  Created by Jack Sp@rroW on 08.03.2020.
//  Copyright © 2020 Jack Sp@rroW. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var time: WKInterfaceLabel!
    @IBOutlet weak var steps: WKInterfaceLabel!
    @IBOutlet weak var distance: WKInterfaceLabel!
    @IBOutlet weak var updateBtn: WKInterfaceButton! {
        didSet {
            updateBtn.setHidden(true)
        }
    }
    
    var isTrackingRunning: Bool = false
    var isHidden: Bool = true
    var timer: Timer?

    
    @objc func dayCloseLabel() {
        print("Timer fired!")
        //presentController(withName: "dayClose", context: nil)
        pushController(withName: "dayClose", context: nil)
    }
    
    
    @IBAction func updateTapped() {
        
        if isTrackingRunning {
            updateBtn.setTitle("закрыть день.")
        } else {
            updateBtn.setTitle("закрываем день...")
        }
        isTrackingRunning = !isTrackingRunning
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(dayCloseLabel), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func closeDayEnable(_ value: Bool) {
        
        if isHidden {
            updateBtn.setHidden(false)
        } else {
            updateBtn.setHidden(true)
        }
        
        isHidden = !isHidden
    }
    
    
    func rndDate() {
        time.setText("Биржа:250 420")
        steps.setText("Внебиржа:50 565")
        distance.setText("Другие:90 320")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        rndDate()
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
