//
//  ContentView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 31/01/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack{
           HeaderView()
            Spacer()
           Text("Bienvenu(e) dans votre journal d'entraînement")
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .bold()
                .font(.system(size: 36))
                .padding(.horizontal)
                .offset(y: -20)
            Spacer()
           FooterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


