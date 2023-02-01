//
//  ProfileView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 01/02/2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var selectedBeltColor = "Blanche"
    @State private var beltColors = ["Blanche", "Bleu", "Violette", "Marron", "Noir"]
    @Binding var showProfile : Bool


    var body: some View {
        
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.showProfile.toggle()
                    }
            }
            .padding(.top, 20)
            Image("jonathan-borba-YcrcG17Kjmg-unsplash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 100))
            
            TextField("Nom d'utilisateur", text: $username)
                .padding(.all, 15)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.bottom, 15)
            
            TextField("Adresse mail", text: $email)
                .padding(.all, 15)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.bottom, 15)
            
            Picker(selection: $selectedBeltColor, label: Text("Couleur de la ceinture")) {
                ForEach(beltColors, id: \.self) { color in
                    Text(color).tag(color)
                }
            }
            .padding(.all, 15)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.bottom, 15)
            
            Button(action: {
                // enregistre l'utilisateur dans la BDD
            })
            { Text("Enregistrer")
                    .foregroundColor(.white)
                    .padding(.all, 15)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfile: .constant(false))
    }
}
