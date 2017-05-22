//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by Alejandro Pardo on 20/05/2017.
//  Copyright © 2017 tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentajeLbl: UILabel!
    @IBOutlet weak var tipPercentajeSlider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var splitLbl: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var totalSplitLbl: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0, splitNumber: 1.0)
    
    func setTipCalculationValues(){
        tip.tipPercent = Double(tipPercentajeSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.splitNumber = Double(splitSlider.value)
        tip.calculateTip()
        tip.calculateSplit()
    }
    
    func updateUI(){
        tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentajeLbl.text = "Tip: \(Int(tipPercentajeSlider.value * 100))%"
        splitLbl.text = "\(Int(splitSlider.value * 10))-Way split:"
        totalSplitLbl.text = String(format: "$%0.2f", tip.splitTotal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func billAmountWasChanged(_ sender: UITextField) {
        setTipCalculationValues()
        updateUI()
    }
    @IBAction func tipPercentajeDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }
    @IBAction func splitPercentajeDidChange(_ sender: UISlider) {
        let steps: Float = 10
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }
    
}

