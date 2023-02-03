//
//  FooterView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 31/01/2023.
//

import Foundation
import SwiftUI

struct FooterView: View {
    @State private var showListTraining = false
    @State private var showProfile = false

    var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 600.0, height: 110.0)
                HStack {
                    VStack {
                        Image(systemName: "figure.wrestling")
                            .foregroundColor(Color.white)
                            .font(.system(size: 60))
                            .offset(x: -40)
                            .onTapGesture {
                                self.showListTraining.toggle()
                            }
                        Text("Entraînement")
                            .foregroundColor(Color.white)
                            .offset(x: -50, y: 8)
                    }
                    VStack {
                        Image(systemName: "figure.wave")
                            .foregroundColor(Color.white)
                            .font(.system(size: 60))
                            .offset(x: 40)
                            .onTapGesture {
                                self.showProfile.toggle()
                            }
                        Text("Profil")
                            .foregroundColor(Color.white)
                            .offset(x: 43)
                    }
                }
            }
            .frame(height: 40)
            .sheet(isPresented: $showListTraining) {
                ListTrainingView(showListTraining: $showListTraining)
            }
            .sheet(isPresented: $showProfile) {
                ProfileView(showProfile: $showProfile)
                
            }
        }
}


struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
