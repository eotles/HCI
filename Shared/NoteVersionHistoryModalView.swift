//
//  NoteVersionHistoryModalView.swift
//  HCI
//
//  Created by Erkin Otles on 11/29/20.
//

import SwiftUI

struct NoteVersionHistoryModalView: View {
    @EnvironmentObject var userData: UserData
    @Binding var isPresented: Bool
    
    static let noteDetailDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
    }()
    
    var body: some View {
        
        VStack {
            Spacer ()
            
            Text("Version history")
            
            Text("Author: \(userData.currNote.author)")
            
            Text("Creation Date: \(userData.currNote.date, formatter: Self.noteDetailDateFormat)")
                
            Spacer()
            
            Text(self.userData.currNote.text)
            
            Spacer()
            
            Button("Exit") {
                self.isPresented = false
            }
        }
    }
}

struct NoteVersionHistoryModalView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        NoteVersionHistoryModalView(isPresented: .constant(true))
            .environmentObject(userData)
    }
}
