//
//  NavigationController.swift
//  PayCardsRecognizerExample
//
//  Created by sasha malina on 16/04/2018.
//  Copyright © 2018 Vitaliy Kuzmenko. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(#imageLiteral(resourceName: "Transparent"), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .white
    }
}
