//
//  ViewController.swift
//  FindFib
//
//  Created by Ambas Chobsanti on 20/10/19.
//  Copyright © 2019 Ambas Chobsanti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentFibText = String(readFib().last ?? 0)
        numberLabel.text = currentFibText
    }
    
    @IBAction func didTabForward(_ sender: Any) {
        calculateNextFib()
        let nextFibText = String(readFib().last ?? 0)
        numberLabel.text = nextFibText
    }
    
    @IBAction func didTabBackward(_ sender: Any) {
        var fib = readFib()
        fib.popLast()
        writeFib(fib: fib)
        let fibText = String(fib.last ?? 0)
        numberLabel.text = fibText
    }
    
    func readFib() -> [Int] {
        let fib = UserDefaults.standard.value(forKey: "Fib") as? [Int] ?? [Int]()
        return fib
    }
    
    func writeFib(fib: [Int]) {
        UserDefaults.standard.setValue(fib, forKey: "Fib")
    }
    
    func calculateNextFib() {
        var fib = readFib()
        if fib.count == 0  {
            fib = [0]
            writeFib(fib: fib)
        } else if fib.count == 1 {
            fib = [0,1]
            writeFib(fib: fib)
        } else {
            var tempFib = fib
            let lastFib = tempFib.popLast()!
            let beforeLastFib = tempFib.popLast()!
            fib.append(lastFib + beforeLastFib)
            writeFib(fib: fib)
        }
    }
}

