//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Rodrigo Conte on 24/01/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: - Functions
    
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    private func randomSpeed() -> Double {
        return Double.random(in: 0.5...3)
    }
    
    private func randomDelay() -> Double {
        return Double.random(in: 0.5...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray.opacity(0.15))
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: geometry.size.width),
                                  y: randomCoordinate(max: geometry.size.height))
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//: Loop
            }//: Zstack
            .drawingGroup()
        }//: Geometry
    }
}

#Preview {
    MotionAnimationView()
}
