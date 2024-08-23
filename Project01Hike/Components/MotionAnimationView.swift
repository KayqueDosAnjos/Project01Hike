//
//  MotionAnimationView.swift
//  Project01Hike
//
//  Created by Kayque Dos anjos on 22/08/24.
//

import SwiftUI

struct MotionAnimationView: View {
    // Mark - Propeties
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // Mark - Functions
    
    func randonSize() -> CGFloat {
        
        return CGFloat(Int.random(in: 4...80))
    }
    
    //1. Random Cordinate
    func randomCordinate() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    //2. Random Size
    
    //3. Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. Random Speed
    func randomSpeed() -> CGFloat {
        return Double.random(in: 0.5...1.0)
    }

    
    //5. Random Delay
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randonSize())
                    .position(
                        x: randomCordinate(),
                        y: randomCordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
){
                            
                            isAnimating = true
                        }})
            }
        }// ZStack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack {
        MotionAnimationView()
            .background(
        Circle()
            .fill(.teal))
    }
}
