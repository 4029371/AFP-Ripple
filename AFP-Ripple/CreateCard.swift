//
//  CardElement.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 24/2/2025.
//

import SwiftUI

struct CreateCard: View {
    
    @State var templateOptions: Bool = false
    @Binding var templateText: String
    @State var affirmationText: String = ""
    @State var cardArray: [card] = []
    @State var sentimentText: String = "That's not very positive!"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width:300, height: 500)
                .foregroundStyle(LinearGradient(colors: [.rippleTeal1, .rippleYellow1], startPoint: .top, endPoint: .bottom))
            VStack{
//                HStack{
//                    Button {
//                        templateOptions.toggle()
//                    } label: {
//                        Image(systemName: "list.bullet")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//                            .foregroundStyle(.white)
//                    }
//                    Spacer()
//                }
//                .padding(.leading, 40)
//                .padding(.top, 5)
//                .bold()
                
                Spacer()
                Text(templateText)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                ZStack {
                    
                    if affirmationText.isEmpty {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 200, height: 60)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                    }
                    TextField("...", text: $affirmationText)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 60)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding(.top, -10)
                
                Text(sentimentText)
                    .frame(height: 10)
                    .foregroundStyle(.white)
                    .italic()
                    .multilineTextAlignment(.center)
                
                Button {
                    //Add saving function here
                    var savedCard = card(template: templateText, affirmation: affirmationText, saved: true)
                    cardArray.append(savedCard)
                    affirmationText = ""
                } label: {
                    if !affirmationText.isEmpty{
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.top, 150)
                .frame(width: 40, height: 40)
                Spacer()
            }
            .padding()
            .padding(.bottom, 7)
            .frame(width:350, height: 500)
            
            .actionSheet(isPresented: $templateOptions) {
                ActionSheet(
                    title: Text("Choose an option"),
                    message: Text("Select one of the following actions"),
                    buttons: [
                        .default(Text("I am")) {
                            templateText = "I am"
                        },
                        .default(Text("I will")) {
                            templateText = "I will"
                        },
                        .default(Text("I believe")) {
                            templateText = "I believe"
                        },
                        .default(Text("I have")) {
                            templateText = "I have"
                        },
                        .default(Text("I can")) {
                            templateText = "I can"
                        },
                        .destructive(Text("Reset")) {
                            print("Reset")
                        },
                        .cancel()
                    ]
                )
                
            }
            
        }
        // REMOVE ME
        ForEach(cardArray, id: \.id) { card in
            Text(card.template + " " + card.affirmation)
        }
    }
}


//struct cardButtons: View {
//    @Binding var affirmationText: String
//    var body: some View {
//        HStack{
//            Spacer()
//            Button {
//                
//            } label: {
//                Image(systemName: "heart.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20, height: 20)
//                    .foregroundStyle(.white)
//            }
//            Spacer()
//            Button {
//
//            } label: {
//                Image(systemName: "paperplane.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20, height: 20)
//                    .foregroundStyle(.white)
//            }
//            Spacer()
//            Button {
//                
//            } label: {
//                Image(systemName: "pencil")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20, height: 20)
//                    .foregroundStyle(.white)
//            }
//            
//            Spacer()
//            Button {
//                affirmationText = ""
//            } label: {
//                Image(systemName: "eraser.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 20, height: 20)
//                    .foregroundStyle(.white)
//                    .bold()
//            }
//            Spacer()
//        }
//    }
//}


#Preview {
    @Previewable @State var text = "I am preview"
    CreateCard(templateText: $text)
}
