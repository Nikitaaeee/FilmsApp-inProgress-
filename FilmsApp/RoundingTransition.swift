//
//  RoundingTransition.swift
//  FilmsApp
//
//  Created by Никита on 30.11.2021.
//

import Foundation
import UIKit

class RoundingTransition: NSObject {
    
    var round = UIView()
    
    var start = CGPoint.zero {
        didSet {
            round.center = start
        }
    }
    
    var roundColor = UIColor.red
    
    var time = 0.8
    
    enum RoundingTransitionProfile: Int {
        case show, cancel, pop
    }
    
    var TransitionProfile = RoundingTransitionProfile.show
}

extension RoundingTransition: UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return time
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Создаем контейнер
        let container = transitionContext.containerView
        if TransitionProfile == .show {
            if let showedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = showedView.center
                let viewSize = showedView.frame.size
                
                round = UIView()
                round.frame = roundFrame(withViewCenter: viewCenter, size: viewSize, startPoint: start)
                round.layer.cornerRadius = round.frame.size.height / 2
                round.center = start
                round.backgroundColor = roundColor
                round.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                container.addSubview(round)
                
                showedView.center = start
                showedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                showedView.alpha = 0
                container.addSubview(showedView)
                
                UIView.animate(withDuration: time, animations:  {
                    self.round.transform = CGAffineTransform.identity
                    showedView.transform = CGAffineTransform.identity
                    showedView.alpha = 1
                    showedView.center = viewCenter
                    
                }, completion: { (success: Bool) in
                    transitionContext.completeTransition(success)
                    
                })
            }
        } else {
            // TransitionProfile вместо transitionProfile
            let transitionModeKey = (TransitionProfile == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returnableView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returnableView.center
                let viewSize = returnableView.frame.size
                
                round.frame = roundFrame(withViewCenter: viewCenter, size: viewSize, startPoint: start)
                
                round.layer.cornerRadius = round.frame.size.height / 2
                round.center = start
                
                UIView.animate(withDuration: time, animations:  {
                    self.round.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returnableView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returnableView.center = self.start
                    returnableView.alpha = 0
                    
                    if self.TransitionProfile == .pop {
                        container.insertSubview(returnableView, belowSubview: returnableView)
                        container.insertSubview(self.round, belowSubview: returnableView)
                    }
                }, completion: { (success: Bool) in
                    returnableView.center = viewCenter
                    returnableView.removeFromSuperview()
                    
                    self.round.removeFromSuperview()
                    transitionContext.completeTransition(success)
                })
               
            }
        }
    }
    
    func roundFrame(withViewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect {
        let xLenght = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLenght = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offsetVector = sqrt(xLenght * xLenght + yLenght * yLenght) * 2
        let size = CGSize(width: offsetVector, height: offsetVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
    }
    
    
}
