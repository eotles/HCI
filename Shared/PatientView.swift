//
//  PatientView.swift
//  HCI
//
//  Created by Erkin Otles on 11/28/20.
//

import SwiftUI

func newNote(userData: UserData, patient: Patient) -> Note {
    let id = userData.notes.count
    
    let note = Note(id: id, pt_id: patient.id, date: Date(), author: "Me", text: "", isSigned: false)
    
    userData.notes.append(note)
    return(note)
}


struct PatientView: View {
    @EnvironmentObject var userData: UserData
    var patient: Patient
    
    let health_info = "Heart Rate: 69\nResp. Rate: 19"
    
    var body: some View {
        VStack {
            
            HStack{
                Text(patient.biologicalSex.rawValue + ",")
                Text(String(patient.age) + " years old")
                Spacer()
                
                Button("New Note") {
                    userData.currNote = newNote(userData: userData, patient: patient)
                }
            }
            .padding([.leading, .trailing])
            
            Divider()
            
            HStack {
                
                VStack{
                    Text(health_info)
                    Spacer()
                }
                
                Divider()
                
                NoteView() //make sure that these are all the patient's notes
                
            }
            /*
            .cornerRadius(4.0)
            .overlay(
                RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 2)
            )
            */
            .padding([.leading, .trailing])
            
            Divider()
            
        }
        .navigationBarTitle(patient.name)
    }
    
}

struct PatientView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return NavigationView {
            PatientView(patient: userData.patients[0])
                .environmentObject(userData)
        }
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
