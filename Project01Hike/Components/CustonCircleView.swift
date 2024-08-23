//
//  CustonCircleView.swift
//  Project01Hike
//
//  Created by Kayque Dos anjos on 22/08/24.
//

import SwiftUI

struct CustonCircleView: View {
    @State private var isAnimationGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors:[
                        .customIndigoMedium,
                        .customSalmonLight],
                    startPoint: isAnimationGradient ? .topLeading: .bottomLeading,
                    endPoint: isAnimationGradient ? .bottomTrailing: .bottomTrailing))
            
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimationGradient.toggle()
                    }
                }
         MotionAnimationView()
        }// : Zstack
        .frame(width: 256, height: 256)
        
        
    }
}

#Preview {
    CustonCircleView()
}
