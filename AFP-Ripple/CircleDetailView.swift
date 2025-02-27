import SwiftUI

struct CircleDetailView: View {
    @Binding var circle: (view: FriendInternalHelper, name: String, position: CGPoint, age: String, hobby: String, notes: String, color: Color, size: CGFloat)
    var onDone: () -> Void

    @State private var age: String
    @State private var hobby: String
    @State private var notes: String
    @State private var showColorPicker = false
    @State private var circleOffset: CGFloat = 0
    @State private var colorPickerOpacity: Double = 0

    private let fixedSize: CGFloat = 150

    init(circle: Binding<(view: FriendInternalHelper, name: String, position: CGPoint, age: String, hobby: String, notes: String, color: Color, size: CGFloat)>, onDone: @escaping () -> Void) {
        self._circle = circle
        self.onDone = onDone
        _age = State(initialValue: circle.age.wrappedValue)
        _hobby = State(initialValue: circle.hobby.wrappedValue)
        _notes = State(initialValue: circle.notes.wrappedValue)
    }

    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(circle.color)
                        .frame(width: fixedSize, height: fixedSize)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showColorPicker.toggle()
                                circleOffset = showColorPicker ? 15 : 0
                                colorPickerOpacity = showColorPicker ? 1 : 0
                            }
                        }

                    VStack {
                        HStack {
                            EyeView(size: fixedSize * 0.08)
                            EyeView(size: fixedSize * 0.08)
                        }
                        .offset(y: fixedSize * -0.001)

                        SmileView(size: fixedSize)
                            .offset(y: fixedSize * -0.18)
                    }
                    .offset(y: fixedSize * 0.45)
                }
                .offset(x: circleOffset * 0.5)

                if showColorPicker {
                    VStack {
                        Text("Pick a Color")
                            .font(.headline)
                            .opacity(colorPickerOpacity)
                            .foregroundStyle(.white)

                        ColorPicker("", selection: $circle.color)
                            .labelsHidden()
                            .frame(width: 80, height: 40)
                            .opacity(colorPickerOpacity)

                        VStack {
                            Text("Size: \(Int(circle.size))")
                                .font(.headline)
                                .padding(.top, 5)
                                .foregroundStyle(.white)

                            Slider(value: $circle.size, in: 50...200, step: 1)
                                .accentColor(circle.color)
                                .padding([.top, .horizontal], 10)
                        }
                        .opacity(colorPickerOpacity)
                    }
                    .padding(.leading, 10)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
            .padding(.top, 100)

            Text(circle.name)
                .foregroundStyle(circle.color)
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)

            TextField("Birthday", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Hobby", text: $hobby)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0)
                    .background(Color.white.cornerRadius(8))
                    .frame(height: 250)
                TextEditor(text: $notes)
                    .padding(2)
            }
            .padding()

            Button("Done") {
                circle.age = age
                circle.hobby = hobby
                circle.notes = notes
                onDone()
            }
            .buttonStyle(.borderedProminent)
            .accentColor(.rippleYellow1)
            .foregroundColor(.white)
            .padding(.bottom, 110)

            Spacer()
        }
        .background(.rippleTeal1).ignoresSafeArea()
    }
}

#Preview {
    FriendView()
}
