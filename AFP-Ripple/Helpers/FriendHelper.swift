import SwiftUI

struct SmileView: View {
    let size: CGFloat
    
    var body: some View {
        Path { path in
            let startX = size * 0.45 // Keep the rightward offset the same
            let startY = size * 0.18 // Slightly lower position
            
            let endX = size * 0.55 // Keep the rightward offset the same
            let endY = size * 0.18 // Same vertical position
            
            // Define the curvature of the smile, keeping the start and end points the same
            path.move(to: CGPoint(x: startX, y: startY))
            path.addQuadCurve(to: CGPoint(x: endX, y: endY), control: CGPoint(x: size * 0.5, y: size * 0.25)) // Adjusted control point for a smoother curve
        }
        .stroke(Color.white, lineWidth: size * 0.02) // White stroke for the smile
        .frame(width: size, height: size)
    }
}

extension Color {
    static func randomColor() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

struct EyeView: View {
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: size * 1.2, height: size * 1.2)
            Circle()
                .fill(Color.black)
                .frame(width: size * 0.5, height: size * 0.5)
            
        }
    }
}
