//
//  String+Extensions.swift
//  PayCardsRecognizerExample
//
//  Created by sasha malina on 16/04/2018.
//  Copyright © 2018 Vitaliy Kuzmenko. All rights reserved.
//

import Foundation

extension String {
    
    public func separate(by: String) -> String {
        let src = self
        var dst = [String]()
        var i = 1
        for char in src {
            let mod = i % 4
            dst.append(String(char))
            if mod == 0 {
                dst.append(by)
            }
            i += 1
        }
        return dst.joined(separator: "")
    }
    
}
