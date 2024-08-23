//
//  CardView.swift
//  Project01Hike
//
//  Created by Kayque Dos anjos on 22/08/24.
//

import SwiftUI

struct CardView: View {
    
    // Mark - Proprieties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // Mark - Functions
    
    func randomImage() {
        print("--- The button has beens planted ---")
        print("Status: old image number = \(imageNumber)")
        
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Action: Random number generated = \(imageNumber)")
            
        } while randomNumber == imageNumber
                    
        imageNumber = randomNumber
        
        print("Result: New image number = \(imageNumber)")
        print("--- The End ---")
        print("\n")
    }
    
    
    var body: some View {
        // Mark - Card
        ZStack {
            CustonBackgroundView()
            
            VStack {
                // Mark - Header
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                    colors:[
                                    .customGrayLight,
                                    .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom))
                        Spacer()
                        
                        Button{
                            //Action Show a sheet
                            print("The Buttom has pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtomView()
                            
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                        
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }//: Header
                .padding(30)
                // Mark - Main Content
                
                ZStack {
                    CustonCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                //Mark - Footer
                
                Button{
                    // Action generate a random number
                    randomImage()
                    
                } label: {
                    Text("explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [            .customGreenLight,
                            .customGreenMedium],
                             startPoint: .top,
                             endPoint: .bottom))
                    
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }//: Zstack
        } //: Card
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
