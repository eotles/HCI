//
//  Note.swift
//  HCI
//
//  Created by Erkin Otles on 11/28/20.
//

import SwiftUI
import CoreLocation

struct Note: Hashable, Codable, Identifiable {
    var id: Int
    var pt_id: Int
    var date: Date
    var author: String
    var text: String
    var isSigned: Bool
    
    init(id: Int, pt_id: Int, date: Date, author: String, text: String, isSigned: Bool) {
        self.id = id
        self.pt_id = pt_id
        self.date = date
        self.author = author
        self.text = text
        self.isSigned = isSigned
    }
    
}
