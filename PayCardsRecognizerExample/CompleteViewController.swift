//
//  CompleteViewController.swift
//  PayCardsRecognizer
//
//  Created by Vitaliy Kuzmenko on 14/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openSDK(sender: AnyObject) {
        let url = URL(string: "https://github.com/faceterteam/PayCards_iOS")!
        UIApplication.shared.openURL(url)
    }

}
