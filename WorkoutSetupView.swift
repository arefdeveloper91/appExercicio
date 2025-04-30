import SwiftUI

struct WorkoutSetupView: View {
    let workoutName: String
    let onStart: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: onCancel) {
                    Image(systemName: "xmark")
                        .font(.system(size: 12))
                        .padding(8)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Text(workoutName)
                    .font(.headline)
                
                Spacer()
                
                // Empty view for balance
                Color.clear
                    .frame(width: 28, height: 28)
            }
            
            Spacer()
            
            VStack {
                Text("Objetivo")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    
                    Text("Aberto")
                        .font(.body)
                }
                .padding(.top, 1)
            }
            
            Spacer()
            
            Button(action: onStart) {
                Image(systemName: "play.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color.green)
                    .clipShape(Circle())
            }
            
            Spacer()
        }
        .padding()
    }
}
