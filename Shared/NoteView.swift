//
//  NoteView.swift
//  HCI
//
//  Created by Erkin Otles on 11/28/20.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var userData: UserData
    @State private var searchText : String = ""
    
    static let taskDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter
    }()
    
    var body: some View {
        
        HStack {
            
            VStack {
                
                SearchBarView(text: $searchText, placeholder: "Search")
                
                List{
                    ForEach(self.userData.notes.reversed().filter {
                        self.searchText.isEmpty ? true : $0.text.lowercased().contains(self.searchText.lowercased())
                    }) { note in
                        Button(action: {
                            userData.currNote = note
                            print(userData.currNote)
                        }) {
                            NoteListDetailView(note: note)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .frame(minWidth: 25, idealWidth: 75, maxWidth: 150)
            
            Divider()
            
            NoteDetailView()
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return NavigationView {
            NoteView()
                .environmentObject(userData)
        }
.previewInterfaceOrientation(.landscapeRight)
    }
}
