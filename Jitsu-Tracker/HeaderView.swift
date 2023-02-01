//
//  HeaderView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 31/01/2023.
//

import Foundation
import SwiftUI


struct HeaderView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 600.0, height: 150.0)
                Image("Jitsu_tracker-removebg-preview")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 250, height: 250)
                    .padding(.top, 60)
            }
            .frame(height: 150)
        }
        .ignoresSafeArea()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
