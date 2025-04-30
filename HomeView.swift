import SwiftUI

struct HomeView: View {
    let onSelectWorkout: (String) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("FitWatch")
                    .font(.headline)
                    .padding(.top, 5)
                
                WorkoutButton(
                    name: "Corrida",
                    color: .red,
                    action: { onSelectWorkout("Corrida") }
                )
                
                WorkoutButton(
                    name: "Caminhada",
                    color: .green,
                    action: { onSelectWorkout("Caminhada") }
                )
                
                WorkoutButton(
                    name: "Ciclismo",
                    color: .blue,
                    action: { onSelectWorkout("Ciclismo") }
                )
                
                WorkoutButton(
                    name: "Natação",
                    color: .cyan,
                    action: { onSelectWorkout("Natação") }
                )
            }
            .padding(.horizontal)
        }
    }
}

struct WorkoutButton: View {
    let name: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                HStack {
                    Image(systemName: "figure.run")
                        .foregroundColor(.white)
                    
                    Text(name)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(20)
        }
    }
}
