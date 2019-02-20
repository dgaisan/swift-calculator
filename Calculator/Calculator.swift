//  Calculator.swift
//  Calculator Protocol


import Foundation

protocol Calculator {
    func processDigit (digit: Int)
    func processOperator (value: Operator)
    func drop ()
    var value: String {get}
}
