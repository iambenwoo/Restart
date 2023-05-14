//
//  OnboardingView.swift
//  Restart
//
//  Created by Ben Woo on 17/12/2022.
//

import SwiftUI
import os

struct OnboardingView: View {
    
    // seems duplicate but it is not
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true;
    
    @State private var sliderWidth: Double = UIScreen.main.bounds.width - 90
    @State private var buttonOffset: CGFloat = 0

    let logger = Logger(subsystem: "com.appinsure", category: "OnboardingView")
    
    // MARK: Body
    
    var body: some View {
                
        ZStack() {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            Spacer()
            
            VStack(spacing: 20){
                
                // MARK: - Header
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size:60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                    It's not how muh we give but how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                }
                
                // MARK: - Center
                ZStack {
                    ZStack {
                        CircleGoupView(ShapeColor: .white, SHapeOpacity: 0.2)
                        Image("character-1")
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                // MARK: - Footer
                Spacer()
                // Footer
                ZStack {
                    // Slider background
                    HStack {
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: sliderWidth, alignment: .center)
                        Spacer()
                    }
                    HStack {
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .padding(8)
                        Spacer()
                    }
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // Slider
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80, alignment: .center)
                        Spacer()
                    }
                    
                    // Arrow Button
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged {
                                    gesture in
                                    if gesture.translation.width >= 0
                                        && gesture.translation.width <= ( sliderWidth - 80 )
                                    {
                                        buttonOffset = gesture.translation.width
                                        logger.debug("\(buttonOffset) \(gesture.translation.width)")
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffset > sliderWidth / 2 {
                                        buttonOffset = sliderWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                    buttonOffset = 0
                                }
                        )
                        
                        Spacer()
                    } // Arrow Button
                } // Footer
                .frame(width: sliderWidth, height: 80, alignment: .center)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
