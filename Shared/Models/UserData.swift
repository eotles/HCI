//
//  UserData.swift
//  HCI
//
//  Created by Erkin Otles on 11/28/20.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var patients = patientData
    @Published var notes = noteData
    
    @Published var currNote = Note(id: -1, pt_id: -1, date: Date(), author:"",
                                   text: "Select a note to read or start a new note.", isSigned: true)
    
}
