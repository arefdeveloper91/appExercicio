import SwiftUI

struct ActiveWorkoutView: View {
    let workoutName: String
    let time: Int
    let heartRate: Int
    let calories: Int
    let onStop: () -> Void
    
    var body: some View {
        VStack {
            Text(workoutName)
                .font(.headline)
                .padding(.top, 5)
            
            HStack(spacing: 8) {
                MetricView(
                    title: "Tempo",
                    value: formatTime(seconds: time),
                    color: workoutColor
                )
                
                MetricView(
                    title: "Calorias",
                    value: "\(calories)",
                    color: workoutColor
                )
            }
            .padding(.top, 5)
            
            HeartRateView(
                heartRate: heartRate,
                color: workoutColor
            )
            .padding(.top, 5)
            
            Spacer()
            
            Button(action: onStop) {
                Image(systemName: "pause.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            .padding(.bottom)
        }
        .padding()
    }
    
    var workoutColor: Color {
        switch workoutName {
        case "Corrida":
            return .red
        case "Caminhada":
            return .green
        case "Ciclismo":
            return .blue
        case "Natação":
            return .cyan
        default:
            return .orange
        }
    }
    
    func formatTime(seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

struct MetricView: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.3))
        .cornerRadius(12)
    }
}

struct HeartRateView: View {
    let heartRate: Int
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                
                Text("Frequência Cardíaca")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Text("\(heartRate) bpm")
                .font(.title3)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.3))
        .cornerRadius(12)
    }
}
