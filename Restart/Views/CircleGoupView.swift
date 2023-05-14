//
//  CircleGoupView.swift
//  Restart
//
//  Created by Ben Woo on 27/12/2022.
//

import SwiftUI

struct CircleGoupView: View {
    
    @State var ShapeColor: Color
    @State var SHapeOpacity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(SHapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(SHapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
    }
}

struct CircleGoupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGoupView(ShapeColor: .white, SHapeOpacity: 0.2)
        }
    }
}
