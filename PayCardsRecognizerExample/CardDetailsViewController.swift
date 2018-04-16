//
//  CardDetailsViewController.swift
//  PayCardsRecognizer
//
//  Created by Vitaliy Kuzmenko on 13/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

import UIKit
import PayCardsRecognizer

final class CardDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var holderNameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    
    var result: PayCardsRecognizerResult?
    
    // MARK: - VC Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let name = holderNameTextField.text ?? ""
        let number = numberTextField.text ?? ""
        let date = expirationDateTextField.text ?? ""
        
        let should = !(name.isEmpty || number.isEmpty || date.isEmpty)
        
        if !should {
            presentAlert()
        }
        
        return should
    }
}

extension CardDetailsViewController {
    
    private func presentAlert() {
        let alert = UIAlertController(title: NSLocalizedString("Fill data", comment: ""), message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK!", comment: ""), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func prepareUI() {
        guard let res = result else {
            return
        }
        holderNameTextField.text = res.recognizedHolderName
        numberTextField.text = res.recognizedNumber?.separate(by: " ")
        if let month = res.recognizedExpireDateMonth, let year = res.recognizedExpireDateYear {
            expirationDateTextField.text = String(format: "%@/%@", month, year)
        }
    }
    
}

