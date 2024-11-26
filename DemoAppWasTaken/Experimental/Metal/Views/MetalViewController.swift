//
//  MetalViewController.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 17/10/2024.
//

import Foundation

import Metal
import MetalKit
import UIKit
import SwiftUI


struct MetalContentView: View {
    var body: some View {
        Color.blue
            .edgesIgnoringSafeArea(.all)
            .sineShader()
    }
}


extension View {
    func colorShader() -> some View {
        modifier(ColorShader())
    }
    
    func sizeColorShader() -> some View {
        modifier(SizeColorShader(testVar: 5.0))
    }
    
    func sineShader() -> some View {
        modifier(SineShader())
    }
    
    func daltonizeShader() -> some View {
        modifier(DaltonizeShader())
    }
}

struct ColorShader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .colorEffect(ShaderLibrary.colorr())
    }
}


struct DaltonizeShader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .colorEffect(ShaderLibrary.Daltonize())
    }
}


struct SizeColorShader: ViewModifier {
    
    var test:Float
    
    var date = Date()
    
    func body(content: Content) -> some View {
        TimelineView(.animation){ _ in
            content.visualEffect { content, proxy in
                content
                    .colorEffect(ShaderLibrary.sizeColor(.float2(proxy.size), .float(date.timeIntervalSinceNow)))
            }
        }
    }
    
    init(testVar:Float){
        
        test = testVar
    }
    
}
    
    
    
    struct SineShader: ViewModifier {
        
        private let startDate = Date()
        
        func body(content: Content) -> some View {
            TimelineView(.animation) { _ in
                content.visualEffect { content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.sineWave(
                                .float2(proxy.size),
                                .float(startDate.timeIntervalSinceNow),
                                .color(Color.red),
                                .color(Color.blue)
                            )
                        )
                }
            }
        }
    }



#Preview {
    MetalContentView()
}
