//
//  MetalView.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 17/10/2024.
//

import Foundation
import Metal
import MetalKit
import UIKit

final class MetalView: MTKView {

    let positions = [
        SIMD3<Float>(-1,  1, 0), // Top Left
        SIMD3<Float>(-1, -1, 0), // Bottom Left
        SIMD3<Float>( 1, -1, 0), // Bottom Right

        SIMD3<Float>( 1,  1, 0), // Top Right
        SIMD3<Float>(-1,  1, 0), // Top Left
        SIMD3<Float>( 1, -1, 0), // Bottom Right
    ]

    let textureCoordinates = [
        SIMD2<Float>(0, 0), // Top Left
        SIMD2<Float>(0, 1), // Bottom Left
        SIMD2<Float>(1, 1), // Bottom Right

        SIMD2<Float>(1, 0), // Top Right
        SIMD2<Float>(0, 0), // Top Left
        SIMD2<Float>(1, 1), // Bottom Right
    ]

    var renderPipelineState: MTLRenderPipelineState!
    var commandQueue: MTLCommandQueue!
    var sampler: MTLSamplerState!

    var fromTexture: MTLTexture?
    var toTexture: MTLTexture?
    var timePassed: Float = 0

    override init(frame: CGRect = .zero, device: MTLDevice?) {
        super.init(frame: frame, device: device)
        setup()
    }
    
    func setup() {
        commandQueue = device!.makeCommandQueue()
        sampler = device!.makeSamplerState(descriptor: MTLSamplerDescriptor())
        createRenderPipelineState()
    }
    
    func createRenderPipelineState() {
        let library = device!.makeDefaultLibrary()!
        let vertexFunction = library.makeFunction(name: "main_vertex")!
        let fragmentFunction = library.makeFunction(name: "doom_melt")!

        let vertexDescriptor = MTLVertexDescriptor()
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0

        vertexDescriptor.attributes[1].format = .float2
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.size

        vertexDescriptor.layouts[0].stride = MemoryLayout<SIMD3<Float>>.stride + MemoryLayout<SIMD2<Float>>.stride

        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        renderPipelineDescriptor.vertexDescriptor = vertexDescriptor

        renderPipelineState = try! device!.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MetalView {

    func snapshot() -> MTLTexture? {
        let width = Int(bounds.width)
        let height = Int(bounds.height)

        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )

        if let context, let data = context.data {
            layer.render(in: context)

            let descriptor = MTLTextureDescriptor.texture2DDescriptor(
                pixelFormat: .rgba8Unorm,
                width: width,
                height: height,
                mipmapped: false
            )
            descriptor.usage = [.shaderRead, .shaderWrite]

            if let texture = device?.makeTexture(descriptor: descriptor) {
                texture.replace(
                    region: MTLRegionMake2D(0, 0, width, height),
                    mipmapLevel: 0,
                    withBytes: data,
                    bytesPerRow: context.bytesPerRow
                )
                return texture
            }
        }

        return nil
    }

}
