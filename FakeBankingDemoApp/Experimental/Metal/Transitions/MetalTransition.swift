//
//  TestTransition.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 05/11/2024.
//

import Foundation
import MetalKit
import UIKit



class MetalTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    let duration: TimeInterval = 2
    let view = MetalView(device: MTLCreateSystemDefaultDevice())
    let queue = DispatchQueue.main
    
    
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        
        
        return 2
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        guard
            let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to)
        else { return }
        
        let container = transitionContext.containerView
        let frame = container.frame
        
        view.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        container.addSubview(to.view)
        container.addSubview(view)
        
        view.fromTexture = (from.view as! MetalView).snapshot()
        view.toTexture = (to.view as! MetalView).snapshot()
        
        queue.asyncAfter(deadline: .now() + duration) {
            self.view.removeFromSuperview()
            transitionContext.completeTransition(
                !transitionContext.transitionWasCancelled
            )
        }
        
        
        
        
        
        
        
    }
}
