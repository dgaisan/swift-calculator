//
//  ViewController.swift
//  Calculator
//
//  Created by Dmitri Gaisan on 2/6/19.
//  Copyright © 2019 Dmitri Gaisan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let PLUS: String = "plus"
    let MINUS: String = "minus"
    
    @IBOutlet var canvas: UILabel!

    var state: Int = 0                  // value that will participate in calculation
    var currentValue: Int = 0           // current value on calculator's canvas
    var op: String!                     // keeps track of selected operator (+, -)
    var operatorPressed: Bool = false   // keeps track of type of button pressed, true - operator, false - operand
    
    override func viewDidLoad () {
        super.viewDidLoad()
    }

    @IBAction func operandPressed (operand: UIButton) {
        self.operatorPressed = true
        self.drawDigits(operand.tag)
    }
    
    @IBAction func plusOpPressed () {
        if operatorPressed {
            preserveState()
        }
        self.operatorPressed = false
        self.op = PLUS
    }

    @IBAction func minusOpPressed () {
        if operatorPressed {
            preserveState()
        }
        self.operatorPressed = false
        self.op = MINUS
    }
    
    @IBAction func restartPressed () {
        self.cleanUpState()
        self.canvas.text = ""
    }

    @IBAction func resultPressed () {
        switch self.op {
        case PLUS:
            state += currentValue
        case MINUS:
            state -= currentValue
        default:
            state = currentValue
        }
        self.showResult()
    }
    
    /**
    * Copy current value into state
    */
    func preserveState () {
        self.state = currentValue
        currentValue = 0
    }
    
    /**
    * Appends a digit to a value on canvas
    * @param {Int} val - digit to append
    */
    func drawDigits (_ val: Int) {
        currentValue = currentValue * 10 + val
        self.canvas.text = String(currentValue)
    }
    
    func showResult () {
        currentValue = 0
        self.canvas.text = String(state)
        self.cleanUpState()
    }
    
    func cleanUpState () {
        self.op = ""
        self.operatorPressed = false
        self.currentValue = 0
        self.state = 0
    }
}
