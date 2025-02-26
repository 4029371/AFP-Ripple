import SwiftUI

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

