import SwiftUI

struct SummaryView: View {
    let time: Int
    let heartRate: Int
    let calories: Int
    let onDone: () -> Void
    
    var body: some View {
        VStack {
            Text("Resumo")
                .font(.headline)
                .padding(.top, 5)
            
            ScrollView {
                VStack(spacing: 10) {
                    SummaryMetricView(
                        icon: "clock",
                        iconColor: .blue,
                        title: "Duração",
                        value: formatTime(seconds: time)
                    )
                    
                    SummaryMetricView(
                        icon: "flame.fill",
                        iconColor: .orange,
                        title: "Calorias",
                        value: "\(calories) kcal"
                    )
                    
                    SummaryMetricView(
                        icon: "heart.fill",
                        iconColor: .red,
                        title: "Freq. Cardíaca Média",
                        value: "\(heartRate) bpm"
                    )
                }
            }
            
            Spacer()
            
            Button(action: onDone) {
                Text("Concluir")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .padding(.bottom)
        }
        .padding()
    }
    
    func formatTime(seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

struct SummaryMetricView: View {
    let icon: String
    let iconColor: Color
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                    
                    Text(value)
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}
