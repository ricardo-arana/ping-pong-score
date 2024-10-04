//
//  Item.swift
//  ping pong score
//
//  Created by Ricardo Arana Reyes Guerrero on 3/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
