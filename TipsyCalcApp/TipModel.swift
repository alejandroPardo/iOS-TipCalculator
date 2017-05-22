//
//  TipModel.swift
//  TipsyCalcApp
//
//  Created by Alejandro Pardo on 20/05/2017.
//  Copyright © 2017 tec. All rights reserved.
//

import Foundation

class TipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    
    private var _splitNumber: Double = 0
    private var _splitTotal: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set(billAmount) {
            _billAmount = billAmount
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set(tipPercent) {
            _tipPercent = tipPercent
        }
    }
    
    var splitNumber: Double {
        get {
            return _splitNumber
        } set(splitNumber) {
            _splitNumber = splitNumber
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var splitTotal: Double {
        return _splitTotal
    }
    
    init(billAmount: Double, tipPercent:Double, splitNumber: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitNumber = splitNumber
    }
    
    func calculateTip(){
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
    
    func calculateSplit(){
        _splitTotal = totalAmount / (splitNumber * 10)
    }
}
