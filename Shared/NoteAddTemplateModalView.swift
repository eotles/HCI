//
//  NoteAddTemplateModalView.swift
//  HCI
//
//  Created by Erkin Otles on 11/29/20.
//

import SwiftUI

struct NoteAddTemplateModalView: View {
    @EnvironmentObject var userData: UserData
    @Binding var isPresented: Bool
    
    var body: some View{
        
        VStack{
            Spacer()
            
            VStack {
                
                Spacer ()
                
                HStack {
                    
                    Spacer()
                    
                    NoteAddTemplateButtonView(isPresented: $isPresented,
                                              abbreviation: "HPI",
                                              name: "Hx of Present Illness",
                                              templateText: "CC: ***\nHPI: ***\nPMH: ***\nPSH: ***\nMeds: ***\n...\n")
                    
                    
                    Spacer()
                    
                    NoteAddTemplateButtonView(isPresented: $isPresented,
                                              abbreviation: "PN",
                                              name: "Progress Note",
                                              templateText: "Subjective: ***\nObjective: ***\nAssessment: ***\nPlan: ***\n")
                    
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    
                    Spacer ()
                    
                    NoteAddTemplateButtonView(isPresented: $isPresented,
                                              abbreviation: "CN",
                                              name: "Clinic Note",
                                              templateText: "Subjective: ***\nObjective: ***\nAssessment: ***\nPlan: ***\n")
                    
                    Spacer()
                    
                    NoteAddTemplateButtonView(isPresented: $isPresented,
                                              abbreviation: "Op",
                                              name: "Operative Note",
                                              templateText: "Subjective: ***\nObjective: ***\nAssessment: ***\nPlan: ***\n")
                    
                    Spacer()
                    
                }
                
                Spacer()
                
            }
            
            
            Button("Cancel") {
                self.isPresented = false
            }
            
            Spacer()
            
        }
    }
}


struct NoteAddTemplateButtonView: View {
    @EnvironmentObject var userData: UserData
    @Binding var isPresented: Bool
    
    var abbreviation: String
    var name: String
    var templateText: String
    
    var body: some View{
        
        Button(action: {
            userData.currNote.text += templateText
            self.isPresented = false
        }) {
            VStack {
                Text(abbreviation)
                    .font(.system(size: 100.0))
                Text(name)
                    .font(.largeTitle)
            }
            .frame(width: 300, height: 300)
            .border(Color.blue)
        }
    }
}

struct NoteAddTemplateModalView_Previews: PreviewProvider {
    
    static var previews: some View {
        let userData = UserData()
        return NoteAddTemplateModalView(isPresented: .constant(true))
            .environmentObject(userData)
    }
}
