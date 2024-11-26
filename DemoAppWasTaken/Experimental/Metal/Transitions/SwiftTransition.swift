//
//  TestTransition.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 05/11/2024.
//

import Foundation
import MetalKit
import UIKit
import SwiftUI



class SwiftTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let originFrame: CGRect

    init(originFrame: CGRect) {
      self.originFrame = originFrame
    }
    
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        
        return 5.0
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
          let toVC = transitionContext.viewController(forKey: .to),
          let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
          else {
            return
        }
        
        let container = transitionContext.containerView
        toVC.view.isHidden = true
        AnimationHelper.perspectiveTransform(for:container)
        
        
        
        snapshot.layer.transform = AnimationHelper.yRotation(.pi / 2)
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        let duration = transitionDuration(using: transitionContext)
        
        // 1
        UIView.animateKeyframes(
          withDuration: duration,
          delay: 0,
          options: .calculationModeCubic,
          animations: {
            // 2
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3) {
              fromVC.view.layer.transform = AnimationHelper.yRotation(-.pi / 2)
            }
            
            // 3
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
              snapshot.layer.transform = AnimationHelper.yRotation(0.0)
            }
            
            // 4
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
              snapshot.frame = finalFrame
              snapshot.layer.cornerRadius = 0
            }
        },
          // 5
          completion: { _ in
            toVC.view.isHidden = false
            snapshot.removeFromSuperview()
            fromVC.view.layer.transform = CATransform3DIdentity
              
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        })
        
    }
    
    
    
 
    
    
    
}
