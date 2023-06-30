//
//  CardView.swift
//  Hike
//
//  Created by Oleksandr on 29.06.2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    
    @State private var imageNumbber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet = false
    
    
    // MARK: - Functions
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumbber
        
        imageNumbber = randomNumber
    }
    
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
                            isShowingSheet.toggle()
                        } label: {
                            CustomButton()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
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
                    
                    CustomCircleView()
                    
                    Image("image-\(imageNumbber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumbber)
                }
                
                // MARK: - Footer
                
                Button {
                    randomImage()
                } label: {
                    Text("exploreMore")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
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
