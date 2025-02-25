//
//  CardElement.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 24/2/2025.
//

import SwiftUI



struct ExploreCard: View {
    
    @Binding var templateText: String
    @Binding var affirmationText: String
    @Binding var liked: Bool
    @Binding var savedCards: [card]
    
    @State var grad1: Color = .rippleTeal1
    @State var grad2: Color = .rippleYellow1
    @State var heartStatus: String = "heart"
    @State var colorArrayCopy: [Color] = [
        Color(#colorLiteral(red: 0.879907012, green: 0.7766652703, blue: 0.1443305612, alpha: 1)),
        Color(#colorLiteral(red: 0.8502051234, green: 0.8743068576, blue: 1, alpha: 1)),
        Color(#colorLiteral(red: 0.4647814631, green: 0.7324085832, blue: 0.69007653, alpha: 1)),
    ]
    
    let colorArray: [Color] = [
        Color(#colorLiteral(red: 0.879907012, green: 0.7766652703, blue: 0.1443305612, alpha: 1)),
        Color(#colorLiteral(red: 0.8502051234, green: 0.8743068576, blue: 1, alpha: 1)),
        Color(#colorLiteral(red: 0.4647814631, green: 0.7324085832, blue: 0.69007653, alpha: 1)),
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width:300, height: 500)
                .foregroundStyle(LinearGradient(
                    colors:
                        [colorArrayCopy[0],
                         colorArrayCopy[1],
                         colorArrayCopy[2]],
                    startPoint: .top, endPoint: .bottom))
            VStack{
                Spacer()
                Text(templateText)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                ZStack {
                    Text(affirmationText)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 60)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding(.top, -10)
                Spacer()
                
                HStack{
                    Spacer()
                    Button {
                        liked.toggle()
                        
                        if liked {
                            savedCards.append(card(template: templateText, affirmation: affirmationText, saved: true))
                        }
                    } label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Button {

                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
                }
                .padding()
                .padding(.bottom, 7)
                .frame(width:350, height: 500)
            }
        .onAppear(){
            colorArrayCopy = colorArray.shuffled()
        }
    }
}

//struct cardButtons: View {
//    @Binding var liked: Bool
//    @State var heartStatus: String = ""
//    
//    var body: some View {
//        HStack{
//            Spacer()
//            Button {
//                liked.toggle()
//                savedCards.append(card(template: templateText, affirmation: affirmationText, saved: true))
//            } label: {
//                Image(systemName: liked ? "heart.fill" : "heart")
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
//            Spacer()
//        }
//    }
//}


#Preview {
    @Previewable @State var templateText = "I am preview"
    @Previewable @State var affirmationText = "Cool"
    @Previewable @State var liked = false
    @Previewable @State var savedCard: [card] = []
    ExploreCard(templateText: $templateText, affirmationText: $affirmationText, liked: $liked, savedCards: $savedCard)
}
