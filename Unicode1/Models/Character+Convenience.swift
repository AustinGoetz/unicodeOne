//
//  Character+Convenience.swift
//  Unicode1
//
//  Created by Austin Goetz on 7/31/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation

extension Character {
    convenience init(codePoint: String, isEncoded: Bool = false) {
        self.init(context: CoreDataStack.context)
        self.codePoint = codePoint
        self.isEncoded = isEncoded
    }
}
