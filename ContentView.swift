//
//  ContentView.swift
//  exercicio Watch App
//
//  Created by Aref Chucri on 30/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentScreen: Screen = .home
    @State private var selectedWorkout: String = ""
    @State private var isActive: Bool = false
    @State private var time: Int = 0
    @State private var heartRate: Int = 72
    @State private var calories: Int = 0
    @State private var timer: Timer? = nil
    
    enum Screen {
        case home, workout, active, summary
    }
    
    var body: some View {
        ZStack {
            // Background color
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Content based on current screen
            switch currentScreen {
            case .home:
                HomeView(onSelectWorkout: { workout in
                    self.selectedWorkout = workout
                    self.currentScreen = .workout
                })
            case .workout:
                WorkoutSetupView(
                    workoutName: selectedWorkout,
                    onStart: startWorkout,
                    onCancel: goToHome
                )
            case .active:
                ActiveWorkoutView(
                    workoutName: selectedWorkout,
                    time: time,
                    heartRate: heartRate,
                    calories: calories,
                    onStop: stopWorkout
                )
            case .summary:
                SummaryView(
                    time: time,
                    heartRate: heartRate,
                    calories: calories,
                    onDone: goToHome
                )
            }
        }
    }
    
    func startWorkout() {
        isActive = true
        currentScreen = .active
        
        // Reset values
        time = 0
        heartRate = 72
        calories = 0
        
        // Start timer to update workout stats
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            time += 1
            // Simulate heart rate changes
            heartRate = min(heartRate + Int.random(in: 0...2), 180)
            // Simulate calorie burn
            calories += Int.random(in: 1...2)
        }
    }
    
    func stopWorkout() {
        isActive = false
        timer?.invalidate()
        timer = nil
        currentScreen = .summary
    }
    
    func goToHome() {
        timer?.invalidate()
        timer = nil
        currentScreen = .home
        time = 0
        heartRate = 72
        calories = 0
    }
}
