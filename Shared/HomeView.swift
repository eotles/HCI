//
//  HomeView.swift
//  HCI
//
//  Created by Erkin Otles on 11/24/20.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var userData: UserData
    @State private var searchText : String = ""
    
    var body: some View {
        
        
        NavigationView {
            VStack{
                
                SearchBarView(text: $searchText, placeholder: "Search patients")
                
                Spacer()
                
                List{
                    ForEach(userData.patients.filter {self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())} ) { patient in
                        NavigationLink(
                            destination: PatientView(patient: patient)
                                .environmentObject(self.userData)
                        ) {
                            Text(patient.name) 
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationBarTitle("Home", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserData())
    }
}
