//
//  TrainingView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 01/02/2023.
//

import SwiftUI


struct TrainingView: View {
    @Binding var showTraining : Bool
    @Binding var trainings: [Training]

    @State private var date = Date()
    @State private var description = ""
    @State private var duration = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker(selection: $date, displayedComponents: .date) {
                        Text("Date")
                    }
                    TextField("Description", text: $description)
                    Stepper(value: $duration, in: 0...240, step: 10) {
                        Text("Durée : \(duration) min")
                    }
                }
                Section {
                    Button(action: {
                        let trainingsData = try? JSONEncoder().encode(self.trainings + [Training(date: self.date, description: self.description, duration: self.duration)])
                        UserDefaults.standard.set(trainingsData, forKey: "trainings")
                        self.trainings = {
                            if let trainingsData = UserDefaults.standard.data(forKey: "trainings") {
                                return try! JSONDecoder().decode([Training].self, from: trainingsData)
                            } else {
                                return []
                            }
                        }()
                        self.showTraining = false
                    }) {
                        Text("Ajouter")
                    }

                }
            }
            .navigationBarTitle("Nouvel entraînement")
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
static var previews: some View {
TrainingView(showTraining: .constant(true), trainings: .constant([]))
}
}

