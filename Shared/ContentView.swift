//
//  ContentView.swift
//  Shared
//
//  Created by Erkin Otles on 11/24/20.
//


/*


 

 */

import SwiftUI

struct ContentView: View {
    
    let notes = ["Nov 20, 2020": "ABC",
                 "Sep 20, 2020": "DEF"]
    
    
    let strings = ["Nov 20, 2020", "Sep 20, 2020"]
    
    let health_info = "DOB: 4/20/1969\nSex: F\n\nHeart Rate: 69\nResp. Rate: 19"
    
    @State private var fullText: String = "This is some editable text..."
    
    var body: some View {
        
        //NavigationView{
        VStack{
            
            HStack {
                
                Text(health_info)
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                HStack {
                    
                    List(strings, id: \.self) { string in Text(string) }
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .frame(minWidth: 25, idealWidth: 75, maxWidth: 150)
                    
                    VStack {
                    
                        VStack {
                            
                            Text("November 24, 2020")
                            
                            TextEditor(text: $fullText)
                                .background(Color.blue)
                                
                        }
                        
                    }
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)

            }
            //.padding([.leading, .trailing])
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        }
        //}
        .navigationBarTitle("Clare Crawley")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
