//
//  ListTrainingView.swift
//  Jitsu-Tracker
//
//  Created by Cours on 02/02/2023.
//
import SwiftUI
import Foundation

struct ListTrainingView: View {
    @Binding var showListTraining : Bool
    @State var showTraining = false
    @State private var trainings: [Training] = {
        if let trainingsData = UserDefaults.standard.data(forKey: "trainings") {
            return try! JSONDecoder().decode([Training].self, from: trainingsData)
        } else {
            return []
        }
    }()
    
    func saveTrainings() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(trainings) {
            UserDefaults.standard.set(encoded, forKey: "trainings")
        }
    }
    
     func loadNewTrainings() -> [Training] {
        if let trainingsData = UserDefaults.standard.data(forKey: "trainings") {
            return try! JSONDecoder().decode([Training].self, from: trainingsData)
        } else {
            return []
        }
    }
    
    func deleteTraining(_ deletedTraining: Training) {
        if let index = trainings.firstIndex(of: deletedTraining) {
            trainings.remove(at: index)
            saveTrainings()
        }
    }
    
    func TotalHours() -> Int {
        var totalTime = 0
        trainings.forEach{ training in
            totalTime = training.duration + totalTime
        }
        return totalTime
    }
    
    func TotalCalories() -> Int {
            var totalCals = 0
            let totalTime = self.TotalHours()
            let caloriesPerMinute = 10
            totalCals = totalTime * caloriesPerMinute
            
            return totalCals
        }

    private func stringDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(trainings) { training in
                        HStack {
                            Text("\(self.stringDate(date: training.date))")
                            Text(training.description)
                            Text("\(training.duration) min")
                        }
                    }
                    .onDelete { indices in
                            let deletedTrainings = indices.map { self.trainings[$0] }
                            deletedTrainings.forEach { deletedTraining in
                                self.deleteTraining(deletedTraining)
                            }
                        }
                }
                .navigationBarTitle("Entraînements")
                .navigationBarItems(trailing: Button(action: {
                    self.showTraining.toggle()
                }) {
                    Text("Ajouter")
                })
                
                if(TotalHours() != 0) {
                    Text("\(self.TotalHours()) minutes passées sur le tatami 🥋")
                }
                
                if(TotalCalories() != 0) {
                    Text("\(self.TotalCalories()) calories dépensées 🥵")
                }
            }
            .sheet(isPresented: $showTraining) {
                TrainingView(showTraining: self.$showTraining, trainings: self.$trainings)
            }
        }
    }
}

struct Training: Codable, Identifiable, Equatable {
    var id = UUID()
    let date: Date
    let description: String
    let duration: Int
}

struct ListTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        ListTrainingView(showListTraining: .constant(false))
    }
}



