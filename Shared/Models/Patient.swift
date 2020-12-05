//
//  Patient.swift
//  HCI
//
//  Created by Erkin Otles on 11/28/20.
//

import SwiftUI
import CoreLocation

struct Patient: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var biologicalSex: BiologicalSex
    var age: Int
    
    
    enum BiologicalSex: String, CaseIterable, Codable, Hashable {
        case female = "Female"
        case male = "Male"
        case intersex = "Intersex"
    }
}


