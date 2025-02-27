import SwiftUI

struct FriendView: View {
    @State private var circles: [(view: FriendInternalHelper, name: String, position: CGPoint, age: String, hobby: String, notes: String, color: Color, size: CGFloat)] = [
        (view: FriendInternalHelper(color: .rippleTeal2, size: 200, name: "David"), name: "David", position: CGPoint(x: 100, y: 100), age: "13", hobby: "Cycling", notes: "Loves nature", color: .rippleTeal2, size: 200),
        (view: FriendInternalHelper(color: .rippleYellow1, size: 120, name: "Kerlyn"), name: "Kerlyn", position: CGPoint(x: 150, y: 200), age: "15", hobby: "Reading", notes: "Enjoys fiction", color: .rippleYellow1, size: 120),
        (view: FriendInternalHelper(color: .rippleLilac1, size: 150, name: "Donovan"), name: "Donovan", position: CGPoint(x: 200, y: 300), age: "14", hobby: "Cooking", notes: "Chef in training", color: .rippleLilac1, size: 150),
        (view: FriendInternalHelper(color: Color(#colorLiteral(red: 1, green: 0.348757863, blue: 0.9353849292, alpha: 1)), size: 130, name: "Mira"), name: "Mira", position: CGPoint(x: 200, y: 300), age: "16", hobby: "Cooking", notes: "Chef in training", color: Color(#colorLiteral(red: 1, green: 0.348757863, blue: 0.9353849292, alpha: 1)), size: 130)
    ]

    @State private var newName: String = ""
    @State private var showDeleteAlert: Bool = false
    @State private var isMenuVisible: Bool = false
    @State private var selectedCircleIndex: Int? = nil

    var body: some View {
        ZStack {
            Color(.rippleTeal1)
                .ignoresSafeArea()

            if let selectedIndex = selectedCircleIndex {
                CircleDetailView(
                    circle: $circles[selectedIndex],
                    onDone: {
                        let updatedColor = circles[selectedIndex].color
                        circles[selectedIndex].view = FriendInternalHelper(color: updatedColor, size: circles[selectedIndex].size, name: circles[selectedIndex].name)
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.selectedCircleIndex = nil
                        }
                    }
                )
                .transition(.move(edge: .trailing).combined(with: .opacity))
                .animation(.easeInOut(duration: 0.5))
            } else {
                ForEach(0..<circles.count, id: \.self) { index in
                    circles[index].view
                        .onTapGesture {
                            withAnimation {
                                self.selectedCircleIndex = index
                                isMenuVisible = false
                            }
                        }
                }
            }

            VStack {
                Text("Friends")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.rippleYellow1)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)

                if isMenuVisible {
                    VStack(spacing: 5) {
                        HStack {
                            Button(action: {
                                if let index = circles.firstIndex(where: { $0.name == newName }) {
                                    showDeleteAlert = true
                                }
                            }) {
                                Image(systemName: "person.fill.badge.minus")
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()

                            TextField("Enter Friend's Name", text: $newName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 200)
                                .padding(.vertical, 8)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)

                            Button(action: {
                                if !newName.isEmpty {
                                    let newCircle = FriendInternalHelper(
                                        color: Color.randomColor(),
                                        size: CGFloat.random(in: 50...200),
                                        name: newName
                                    )
                                    let randomPosition = CGPoint(x: CGFloat.random(in: 50...350), y: CGFloat.random(in: 50...650))
                                    circles.append((newCircle, newName, randomPosition, "", "", "", newCircle.color, newCircle.size))
                                    newName = ""
                                }
                            }) {
                                Image(systemName: "person.fill.badge.plus")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                        .padding(.top, -40) // Move closer to Friends title
                        .frame(maxWidth: .infinity)
                    }
                }

                Button(action: {
                    withAnimation {
                        isMenuVisible.toggle()
                    }
                }) {
                    Image(systemName: "triangle.fill")
                        .rotationEffect(.degrees(isMenuVisible ? 0 : 180))
                        .padding(9)
                        .background(Color.rippleYellow1.opacity(0.9))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(color: .rippleYellow1, radius: 10)
                }
                .padding(.top, selectedCircleIndex == nil ? -15 : -2000)

                Spacer()
            }
            .animation(.easeInOut, value: isMenuVisible)
        }
        .alert(isPresented: $showDeleteAlert) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("Do you want to delete \(newName)?"),
                primaryButton: .destructive(Text("Yes")) {
                    if let index = circles.firstIndex(where: { $0.name == newName }) {
                        circles.remove(at: index)
                    }
                    newName = ""
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    FriendView()
}
