import SwiftUI

struct FriendInternalHelper: View {
    let color: Color
    let size: CGFloat
    let name: String // Added name property

    @State private var position: CGPoint = CGPoint(x: CGFloat.random(in: 50...350), y: CGFloat.random(in: 50...650))
    @State private var velocity: CGSize = CGSize(width: CGFloat.random(in: -0.7...0.7), height: CGFloat.random(in: -0.7...0.7))
    private let tabBarHeight: CGFloat = 150

    @State private var eyeOffsetX: CGFloat = 0
    @State private var eyeOffsetY: CGFloat = 0
    @State private var smileOffsetX: CGFloat = 0
    @State private var smileOffsetY: CGFloat = 0

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: size, height: size)
                .position(position)
                .onAppear {
                    startMovement()
                    startLookingAround()
                }
                .overlay(
                    HStack(spacing: size * 0.05) {
                        EyeView(size: size * 0.05)
                            .offset(x: eyeOffsetX, y: eyeOffsetY)
                        EyeView(size: size * 0.05)
                            .offset(x: eyeOffsetX, y: eyeOffsetY)
                    }
                    .position(x: position.x, y: position.y - size * 0.1)
                )
            
            SmileView(size: size)
                .offset(x: smileOffsetX, y: smileOffsetY)
                .position(x: position.x, y: position.y + size * 0.3)

            // Name tag higher above the mouth
            Text(name)
                .font(.caption)
                .foregroundColor(.white)
                .position(x: position.x, y: position.y + size * 0.35) // Moved higher above the mouth
        }
    }

    private func startMovement() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            withAnimation(.linear(duration: 0.05)) {
                position.x += velocity.width
                position.y += velocity.height

                if position.x - size / 2 < 0 || position.x + size / 2 > UIScreen.main.bounds.width {
                    velocity.width *= -1
                }
                if position.y - size / 2 < 0 || position.y + size / 2 > UIScreen.main.bounds.height - tabBarHeight {
                    velocity.height *= -1
                }
            }
        }
    }

    private func startLookingAround() {
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { _ in
            withAnimation(.spring(response: 1.5, dampingFraction: 0.4, blendDuration: 0.6).repeatForever(autoreverses: true)) {
                let newEyeOffsetX = CGFloat.random(in: -8...8) // Slightly more drastic
                let newEyeOffsetY = CGFloat.random(in: -6...6)

                eyeOffsetX = newEyeOffsetX
                eyeOffsetY = newEyeOffsetY

                smileOffsetX = newEyeOffsetX * 0.6
                smileOffsetY = newEyeOffsetY * 0.6
            }
        }
    }
}
