//
//  CustonBackgroundView.swift
//  Project01Hike
//
//  Created by Kayque Dos anjos on 22/08/24.
//

import SwiftUI

struct CustonBackgroundView: View {
    var body: some View {
        ZStack {
            // Mark - 3:Depth
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // Mark - 2:Light
            
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // Mark - 1:Surface
            
            LinearGradient(colors: [
                .customGreenLight,
                .customGreenMedium],
                startPoint: .top,
                endPoint: .bottom)
            
            .cornerRadius(40)
        }
        
        
    }
}

#Preview {
    CustonBackgroundView()
        .padding()
}
