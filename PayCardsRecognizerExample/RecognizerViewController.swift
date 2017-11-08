//
//  ViewController.swift
//  PayCardsRecognizerExample
//
//  Created by Vitaliy Kuzmenko on 12/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

import UIKit

import PayCardsRecognizer

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(#imageLiteral(resourceName: "Transparent"), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .white
    }
}

extension String {
    
    public func format(_ seprator: String) -> String {
        let src = self
        var dst = [String]()
        var i = 1
        for char in src {
            let mod = i % 4
            dst.append(String(char))
            if mod == 0 {
                dst.append(seprator)
            }
            i += 1
        }
        return dst.joined(separator: "")
    }
    
}

class RecognizerViewController: UIViewController, PayCardsRecognizerPlatformDelegate {
    
    var recognizer: PayCardsRecognizer!
    
    @IBOutlet weak var recognizerContainer: UIView!
    
    lazy var activityView: UIBarButtonItem = {
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.startAnimating()
        let item = UIBarButtonItem(customView: activityView)
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .async, container: recognizerContainer, frameColor: #colorLiteral(red:0.008,  green:0.478,  blue:1, alpha:1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recognizer.startCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        recognizer.stopCamera()
        navigationItem.rightBarButtonItem = nil
    }

    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
        
        print(result)
        print(result.dictionary as NSDictionary)
        
        
        if result.isCompleted {
            performSegue(withIdentifier: "CardDetailsViewController", sender: result)
        } else {
            navigationItem.rightBarButtonItem = activityView
        }
    }
    
    @IBAction func start() {
        recognizer.startCamera()
    }
    
    @IBAction func stop() {
        recognizer.stopCamera()
    }
    
    @IBAction func restart() {
        recognizer.resumeRecognizer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CardDetailsViewController
        vc.result = sender as? PayCardsRecognizerResult
    }

}

