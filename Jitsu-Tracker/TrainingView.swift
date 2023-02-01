//
//  TrainingView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 01/02/2023.
//

import SwiftUI

struct TrainingView: View {
    @Binding var showTraining : Bool
    var body: some View {
        VStack(spacing: 20){
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .foregroundColor(.red)
                    .onTapGesture {
                        self.showTraining.toggle()
                    }
            }
                        .padding(.top, 20)
            Text("Entraînement")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .bold()
                    .font(.system(size: 36))
                    .padding(.horizontal)
                    .offset(y: -20)
            }

        }
    }


struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(showTraining: .constant(false))
    }
}

