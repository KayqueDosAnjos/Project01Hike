//
//  SettingsView.swift
//  Project01Hike
//
//  Created by Kayque Dos anjos on 22/08/24.
//

import SwiftUI

struct SettingsView: View {
    
    // Mark - Properties
    
    private let alternativeAppIcons: [String] =
    ["AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"]
    
    var body: some View {
        List{
            
            // 01 - Section: Header
            
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors' Choise")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                
                .foregroundStyle(
                    LinearGradient(colors:[
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark],
                                   startPoint: .top,
                                   endPoint: .bottom))
                
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike witch looks georgeous in photos but is even better once you are actually there. the hike that you hope to do again someday. \nfind best days hikes in the app")
                        .font(.footnote)
                        .italic()
                    
                        Text("Dust off the boots! It's time for a walk! ")
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: Header
            .listRowSeparator(.hidden)
            
            // 02 - Section: Icons
            
            Section(header: Text("Alternative Icons")) {
                ScrollView(.horizontal, showsIndicators:
                    false){
                    HStack(spacing: 12) {
                        ForEach(alternativeAppIcons.indices, id: \.self) { item in
                            Button{
                                print("Icon \(alternativeAppIcons[item]) has pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternativeAppIcons[item]) { error in
                                    if error != nil{
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription ))")
                                    } else {
                                        print("Success! Yoy have changed the app's icon to \(alternativeAppIcons[item])")
                                    }
                                }
                                
                            } label: {
                                Image("\(alternativeAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }// :Scroll View
                    .padding(.top, 12)
                
                Text("Choose you favorite icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }//: Section
            .listRowSeparator(.hidden)
            
            // 03 -Section: About
            
            Section(
                header: Text("ABOUT THE APLICATION"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserverd")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                //01 - Basic label content
              
                
                //02 - Advanced label contet
                
                CustomListRowView(rowLabel: "Aplication", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle",rowContent: "iOS and iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift" ,rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0" ,rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Kayque dos anjos" ,rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Linkedin", rowIcon: "link", rowTintColor: .indigo, rowLinkLabel: "Kayque's linkedin", rowLinkDestination: "https://www.linkedin.com/in/kayquedosanjos/")
                
            }//: Section
        }//: LIst
        
    }
}

#Preview {
    SettingsView()
}
