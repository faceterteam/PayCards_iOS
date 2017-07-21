//
//  CardDetailsViewController.swift
//  PayCardsRecognizer
//
//  Created by Vitaliy Kuzmenko on 13/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

import UIKit
import PayCardsRecognizer

class CardDetailsViewController: UIViewController {

    @IBOutlet weak var holderNameTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var expireDateTextField: UITextField!
    
    var result: PayCardsRecognizerResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        holderNameTextField.text = result?.recognizedHolderName
        numberTextField.text = result?.recognizedNumber?.format(" ")
        if let month = result?.recognizedExpireDateMonth, let year = result?.recognizedExpireDateYear {
            expireDateTextField.text = String(format: "%@/%@", month, year)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let name = holderNameTextField.text ?? ""
        let number = numberTextField.text ?? ""
        let date = expireDateTextField.text ?? ""
        
        let should = !(name.isEmpty || number.isEmpty || date.isEmpty)
        
        if !should {
            presentAlert()
        }
        
        return should
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: NSLocalizedString("Fill data", comment: ""), message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""), style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
