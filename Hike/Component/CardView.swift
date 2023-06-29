//
//  CardView.swift
//  Hike
//
//  Created by Oleksandr on 29.06.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - Header
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        Spacer()
                        Button {
                            // Action: Show a sheet
                            print("Pressed")
                        } label: {
                            CustomButton()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } // : header
                .padding(.horizontal, 30)
                // MARK: - Main
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color("ColorIndigoMedium"),
                                    Color("ColorSalmonLight")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(width: 256, height: 256)
                    
                    
                    Image("image-1")
                        .resizable()
                        .scaledToFit()
                }
                
                // MARK: - Footer
            }
        } //: Card
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
