//
//  CustomButtomView.swift
//  Project01Hike
//
//  Created by Kayque Dos anjos on 22/08/24.
//

import SwiftUI

struct CustomButtomView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(LinearGradient(
                    colors: [
                        .white,
                        .customGreenLight,
                        .customGreenMedium],
                         startPoint: .top,
                         endPoint: .bottom))
            
            Circle()
                .stroke(LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium],
                         startPoint: .top,
                         endPoint: .bottom),
                         lineWidth: 4)
            
                Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    .linearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium],
                             startPoint: .top,
                             endPoint: .bottom)
                )
        } //: Zstack
        .frame(width: 58, height: 58)
  
    }
}

#Preview {
    CustomButtomView()
        .previewLayout(.sizeThatFits)
}
