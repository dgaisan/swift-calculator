//  CalculatorImpl.swift
//  Implementation of Calculator Protocol

import Foundation
class CalculatorImpl: Calculator {
    private var leftReady: Bool
    private var leftOperand: Int, rightOperand: Int
    private var val: String
    private var op: Operator
    
    init () {
        op = .plus
        leftReady = false
        leftOperand = 0
        rightOperand = 0
        val = "0"
    }
 
    func processDigit (digit: Int) {
        if leftReady {
            rightOperand = rightOperand * 10 + digit
            val = String(rightOperand)
        } else {
            leftOperand = leftOperand * 10 + digit
            val = String(leftOperand)
        }
    }
    
    func processOperator (value: Operator) {
        leftReady = true
        op = value
    }
    
    func calculate () {
        if leftReady {
            switch op {
            case .plus:
                val = String(leftOperand + rightOperand)
            case .minus:
                val = String(leftOperand - rightOperand)
            case .multiply:
                val = String(leftOperand * rightOperand)
            }
            
            cleanUpState()
        }
    }
    
    private func cleanUpState () {
        op = .plus
        leftReady = false
        leftOperand = 0
        rightOperand = 0
    }
    
    func drop () {
        cleanUpState()
        val = "0"
    }
    
    var value: String {
        return self.val
    }
}
