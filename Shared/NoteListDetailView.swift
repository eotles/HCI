//
//  NoteListView.swift
//  HCI
//
//  Created by Erkin Otles on 11/28/20.
//

import SwiftUI

struct NoteListDetailView: View {
    @EnvironmentObject var userData: UserData
    var note: Note
    
    static let noteListDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter
    }()
    
    
    var body: some View {
        VStack{
            
            HStack{
                Text("\(note.date, formatter: Self.noteListDateFormat)")
                    .fontWeight(userData.currNote == note ? .bold : .none)
                Spacer()
            }
            HStack{
                Text(note.author)
                    .font(.caption)
                    .fontWeight(userData.currNote == note ? .bold : .none)
                Spacer()
            }
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return NoteListDetailView(note: userData.notes[0])
            .environmentObject(userData)
    }
}
