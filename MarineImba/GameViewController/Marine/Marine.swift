//
//  Marine.swift
//  MarineImba
//
//  Created by 我是五高你敢信 on 2017/3/27.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class Marine: UIImageView {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        image = UIImage(named: "停火")
        
        contentMode = .scaleAspectFit
    }
    
    fileprivate lazy var goForwardAniamtion: [UIImage] = {
        
        var array = [UIImage]()
        for index in 0..<7 {
            let image = UIImage(named: "\(index)")
            array.append(image!)
        }
        
        return array
    }()
    
    fileprivate lazy var retreatAniamtion: [UIImage] = {
        
        var array = [UIImage]()
        for index in 0..<7 {
            let image = UIImage(named: "-\(index)")
            array.append(image!)
        }
        
        return array
    }()
    
    fileprivate lazy var fireAniamtion: [UIImage] = {
        
        var array = [UIImage]()
        for index in 0..<5 {
            let image = UIImage(named: "开火\(index)")
            array.append(image!)
        }
        
        return array
    }()

}

extension Marine {
    //MARK:  暴露的外部可调用方法
    //前进
    func goForward() {
        
        stopAnimating()
        
        animationImages = goForwardAniamtion
        animationDuration = 1
        animationRepeatCount = 0
        startAnimating()
        
    }
    
    //后退
    func retreat() {
        
        stopAnimating()
        
        animationImages = retreatAniamtion
        animationDuration = 1
        animationRepeatCount = 0
        startAnimating()
    }
    
    //停止动画
    func endAnimation() {
        
        stopAnimating()
        image = UIImage(named: "停火")

    }
    
    //开火
    func fire() {
        
        endAnimation()
        
        let fire = UIImageView(frame: CGRect(x: width() - 20, y: height() / 4, width: width() / 2, height: width() / 2))
//        fire.setCenterY(centerY() / 2)
        fire.contentMode = .scaleAspectFit
        addSubview(fire)
        
        fire.animationImages = fireAniamtion
        fire.animationRepeatCount = 1
        fire.animationDuration = 0.2
        fire.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
            
            fire.removeFromSuperview()
        })
    }
    
}
