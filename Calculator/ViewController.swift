//
//  ViewController.swift
//  Calculator
//
//  Created by Dmitri Gaisan on 2/6/19.
//  Copyright © 2019 Dmitri Gaisan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var canvas: UILabel!
    let model = CalculatorImpl()
    
    override func viewDidLoad () {
        super.viewDidLoad()
        self.canvas.text = model.value
    }

    @IBAction func operandPressed (operand: UIButton) {
        model.processDigit(digit: operand.tag);
        self.canvas.text = model.value
    }
    
    @IBAction func plusOpPressed () {
        model.processOperator(value: .plus)
        self.canvas.text = model.value
    }

    @IBAction func minusOpPressed () {
        model.processOperator(value: .minus)
        self.canvas.text = model.value
    }
    
    @IBAction func multiplyPressed () {
        model.processOperator(value: .multiply)
        self.canvas.text = model.value
    }
    
    @IBAction func restartPressed () {
        model.drop()
        self.canvas.text = model.value
    }

    @IBAction func resultPressed () {
        model.calculate()
        self.canvas.text = model.value
    }
    
}
