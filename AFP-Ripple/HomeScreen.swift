import SwiftUI

struct HomeScreen: View {
    @State private var circles: [(view: ContentView, name: String, position: CGPoint, age: String, hobby: String, notes: String, color: Color, size: CGFloat)] = []
    @State private var newName: String = ""
    @State private var showDeleteAlert: Bool = false
    @State private var isMenuVisible: Bool = false
    @State private var selectedCircleIndex: Int? = nil

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.rippleTeal1, .rippleLilac1]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            // Hide the friend-adding menu when the CircleDetailView is shown
            if let selectedIndex = selectedCircleIndex {
                CircleDetailView(
                    circle: $circles[selectedIndex],
                    onDone: {
                        // Update the circle's color in HomeScreen
                        let updatedColor = circles[selectedIndex].color
                        circles[selectedIndex].view = ContentView(color: updatedColor, size: circles[selectedIndex].size, name: circles[selectedIndex].name)
                        // Slide out the CircleDetailView to the right
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.selectedCircleIndex = nil
                        }
                    }
                )
                .transition(.move(edge: .trailing).combined(with: .opacity)) // Slide in from the right
                .animation(.easeInOut(duration: 0.5)) // Animation duration for the slide-in
            } else {
                // Show circles when no detail view is selected
                ForEach(0..<circles.count, id: \.self) { index in
                    circles[index].view
                        .onTapGesture {
                            withAnimation {
                                self.selectedCircleIndex = index
                                // Hide the friend-adding menu when a circle is selected
                                isMenuVisible = false
                            }
                        }
                }
            }

            VStack {
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
                                .padding()
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)

                            Button(action: {
                                if !newName.isEmpty {
                                    let newCircle = ContentView(
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
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.top, selectedCircleIndex == nil ? 5 : -30) // Moves it up when detail view is shown

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
