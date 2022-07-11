//
//  Extensions.swift
//  Movies
//
//  Created by Pham Trung Huy on 01/07/2022.
//

import Foundation

extension String{
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
