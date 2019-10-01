//
//  ViewController.swift
//  PayCardsRecognizerExample
//
//  Created by Vitaliy Kuzmenko on 12/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

import UIKit
import PayCardsRecognizer

final class RecognizerViewController: UIViewController {
    
    private var recognizer: PayCardsRecognizer!
    
    @IBOutlet weak var recognizerContainer: UIView!
    
    lazy var activityView: UIBarButtonItem = {
        let activityView = UIActivityIndicatorView(style: .gray)
        activityView.startAnimating()
        let item = UIBarButtonItem(customView: activityView)
        return item
    }()
    
    // MARK: - VC Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .async, container: recognizerContainer, frameColor: .green)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startCapturing()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopCapturing()
        navigationItem.rightBarButtonItem = nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CardDetailsViewController {
            vc.result = sender as? PayCardsRecognizerResult
        }
    }
    
}

// MARK: - Camera capturing
extension RecognizerViewController {
    private func startCapturing() {
        recognizer.startCamera()
    }
    
    private func stopCapturing() {
        recognizer.stopCamera()
    }
}

// MARK: - PayCardsRecognizerPlatformDelegate
extension RecognizerViewController: PayCardsRecognizerPlatformDelegate {
    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
        #if DEBUG
            print(result)
            print(result.dictionary as NSDictionary)
        #endif
        
        if result.isCompleted {
            performSegue(withIdentifier: "CardDetailsViewController", sender: result)
        } else {
            navigationItem.rightBarButtonItem = activityView
        }
    }
}


