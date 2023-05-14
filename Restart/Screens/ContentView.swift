//
//  ContentView.swift
//  Restart
//
//  Created by Ben Woo on 17/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnbardingViewActive: Bool = false;
    
    var body: some View {
        ZStack {
            if isOnbardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
