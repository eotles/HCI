//
//  NoteDetailView.swift
//  HCI
//
//  Created by Erkin Otles on 11/29/20.
//

import SwiftUI

struct NoteDetailView: View {
    @EnvironmentObject var userData: UserData
    
    @State var addTemplateModalIsPresented = false
    @State var versionHistoryModalIsPresented = false
    
    
    
    @ObservedObject var trans = Transcription()
    
    static let noteDetailDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
    }()
    
    var body: some View {
        VStack {
        
            VStack {
                
                Text("\(userData.currNote.date, formatter: Self.noteDetailDateFormat)")
                    .font(.headline)
                
                Divider()
                
                if self.trans.isPlaying {
                    TextEditor(text: $trans.transcript)
                        .disabled(true)
                    
                } else {
                    TextEditor(text: $userData.currNote.text)
                        .disabled(userData.currNote.isSigned)
                        .onChange(of: userData.currNote.text, perform: { value in
                            self.userData.notes[self.userData.currNote.id] = self.userData.currNote
                        })
                }
                
                
                if !userData.currNote.isSigned {
                    HStack{
                        
                        Button(action: {
                            self.trans.micButtonTapped(startString: userData.currNote.text)
                        }) {
                            Image(systemName: !self.trans.micEnabled ? "mic.slash" : (self.trans.isPlaying ? "mic.circle.fill" : "mic.circle"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 25)
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button(action: {self.addTemplateModalIsPresented = true})  {
                            Text("Add Template")
                        }
                        .sheet(isPresented: $addTemplateModalIsPresented, content: {
                            NoteAddTemplateModalView(isPresented: self.$addTemplateModalIsPresented)
                        })
                        
                        
                        Spacer()
                        
                        Button("Sign") {
                            userData.currNote.isSigned = true
                            self.userData.notes[self.userData.currNote.id] = self.userData.currNote
                        }
                        
                    }
                }
                
                Divider()
                let authorText =  userData.currNote.author != "" ? "Author: \(userData.currNote.author)" : " "
                
                HStack{
                    Spacer()
                    
                    Text(authorText)
                        .font(.caption)
                    
                    Spacer()
                    
                    if userData.currNote.isSigned {
                        Button(action: {self.versionHistoryModalIsPresented = true})  {
                            Image(systemName: "info.circle").foregroundColor(.blue)
                        }
                        .sheet(isPresented: $versionHistoryModalIsPresented, content: {
                            NoteVersionHistoryModalView(isPresented: self.$versionHistoryModalIsPresented)
                        })
                    }
                }
            }
        }.onAppear {
            self.trans.getPermission()
        }
    }
}


struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return NavigationView {
            NoteDetailView()
                .environmentObject(userData)
        }
    }
}
