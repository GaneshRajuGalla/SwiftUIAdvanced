//
//  CustomTransistionSample.swift
//  SwiftUIAdvanced
//
//  Created by Ganesh on 15/08/23.
//

import SwiftUI

struct RotateViewModifier:ViewModifier{
    let rotationAngle:Double
    
    init(rotationAngle: Double = 40.0) {
        self.rotationAngle = rotationAngle
    }
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotationAngle))
            .offset(
                x: rotationAngle != 0 ? UIScreen.main.bounds.width : 0,
                y: rotationAngle != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition{
    
    static var rotating:AnyTransition{
        modifier(active:RotateViewModifier(rotationAngle: 180), identity: RotateViewModifier(rotationAngle: 0))
    }
    
    static func rotating(rotationAngle:Double) -> AnyTransition{
        modifier(active: RotateViewModifier(rotationAngle: rotationAngle), identity: RotateViewModifier(rotationAngle: 0))
    }
    
    static var rotationOn:AnyTransition{
        asymmetric(insertion: .rotating, removal: .move(edge: .leading))
    }
}

struct CustomTransistionSample: View {
    @State private var transitionType:Int = 0
    @State private var showRectangle:Bool = false
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                Button {
                    transitionType = 0
                } label: {
                    Text("Transition 1")
                        .font(.headline)
                        .withDefaultButtonFormmating(.orange)
                }
                .withPressableButtonStyle()
                
                Button {
                    transitionType = 1
                } label: {
                    Text("Transition 2")
                        .font(.headline)
                        .withDefaultButtonFormmating(.indigo)
                }
                .withPressableButtonStyle()
            }
            .padding(.horizontal,30)
            
            if showRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(colors: [Color.blue,Color.blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 250,height: 350)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .transition(transitionType == 0 ? .rotating(rotationAngle: 1080) : .rotationOn)
            }
            
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonFormmating()
                .padding(.horizontal,40)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct CustomTransistionSample_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransistionSample()
    }
}
