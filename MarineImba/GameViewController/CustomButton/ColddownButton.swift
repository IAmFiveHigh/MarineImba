//
//  ColddownButton.swift
//  MarineImba
//
//  Created by 我是五高你敢信 on 2017/4/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ColddownButton: UIView {
    
    //冷却时间
    fileprivate var cd: TimeInterval
    
    //真正的按钮
    fileprivate let button = UIButton()
    
    //背景图片
    fileprivate let imageView = UIImageView()
    
    //点击事件
    fileprivate let action: () -> ()
    
    //表面动画View
    fileprivate var coldView: CakeProgressView!
    
    init(frame: CGRect, cd: TimeInterval, action: @escaping () -> ()) {
        
        self.cd = cd
        self.action = action
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 布置界面
    fileprivate func setupUI() {
        
        imageView.frame = self.bounds
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        coldView = CakeProgressView(frame: self.bounds, cd: cd)
        
        //一开始隐藏
        coldView.isHidden = true
        addSubview(coldView)

        
        button.frame = CGRect(x: 0, y: 0, width: width(), height: height())
        button.addTarget(self, action: #selector(buttonClick), for: .touchDown)
        addSubview(button)
        
        
        
    }
    
    @objc fileprivate func buttonClick() {
        
        //1 进入冷却动画
        coldView.colddown()
        
        //2 执行外部赋予的方法
        action()
        
        //3 button禁止点击
        button.isEnabled = false
        
        //4 cd时间结束后 button可以点击
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + cd, execute: {
            self.button.isEnabled = true
        })
    }
    
    //MARK: - 外部方法 设置按钮图片
    func setBack(image: String) {
        
        imageView.image = UIImage(named: image)
    }

}
