//
//  GameViewController.swift
//  MarineImba
//
//  Created by 我是五高你敢信 on 2017/3/23.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

let marineHeight = screenHeigth / 3
let horizonLine = screenHeigth / 3 * 2

class GameViewController: BaseViewController {

    //MARK: - 属性
    fileprivate let goForwardSpeed: CGFloat = -3
    fileprivate let retreatSpeed: CGFloat = 3
    fileprivate var speed: CGFloat = 0
    
    //MARK: - 主角
    fileprivate lazy var marineKing: Marine = {
        
        let marine = Marine(frame: CGRect(x: 20, y: marineHeight, width: marineHeight, height: marineHeight))
        return marine
    }()
    
    //MARK: 计时器
    fileprivate var timer: Timer!
    
    //MARK: - viewWillAppear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupUI()
        
    }
    
    //MARK: - setupUI
    fileprivate func setupUI() {
        
        setupBackground()
        
        setupMarine()
        
        setupDirectionButton()
        
        setupTimer()
    }

    fileprivate func setupBackground() {
        
        for index in -1..<2 {
            
            let background = UIImageView(frame: CGRect(x: CGFloat(index) * screenWidth, y: 0, width: screenWidth, height: screenHeigth))
            background.image = UIImage(named: "bg.jpeg")
            background.tag = 100 + index
            view.addSubview(background)
        }
        
    }
    
    // 背景移动
    fileprivate func moveBackground() {
        
        for index in -1..<2 {
            
            let background = view.viewWithTag(100 + index) as! UIImageView
            background.setX(background.x() + speed)
            
            if speed > 0 {
                
                if background.x() >= screenWidth {
                    background.setX(-screenWidth)
                }
                
            }else if speed < 0 {
                
                if background.right() <= 0 {
                    background.setX(screenWidth)
                }
            }
        }
    
    }
    
    fileprivate func setupMarine() {
        
        view.addSubview(marineKing)
    }
    
    //添加前进后退按键
    fileprivate func setupDirectionButton() {
        
        let leftButton = UIButton()
        leftButton.setBackgroundImage(UIImage(named: "button_left"), for: .normal)
        leftButton.frame = CGRect(x: screenWidth - (screenHeigth / 3) - 20, y: screenHeigth / 6 * 5, width: screenHeigth / 6, height: screenHeigth / 6)
        leftButton.tag = 10
        leftButton.addTarget(self, action: #selector(directionButtonClick(sender:)), for: .touchDown)
        leftButton.addTarget(self, action: #selector(directionButtonCancel), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(directionButtonCancel), for: .touchDragOutside)
        view.addSubview(leftButton)
        
        let rightButton = UIButton()
        rightButton.setBackgroundImage(UIImage(named: "button_right"), for: .normal)
        rightButton.frame = CGRect(x: screenWidth - (screenHeigth / 6), y: screenHeigth / 6 * 5, width: screenHeigth / 6, height: screenHeigth / 6)
        rightButton.tag = 11
        rightButton.addTarget(self, action: #selector(directionButtonClick(sender:)), for: .touchDown)
        rightButton.addTarget(self, action: #selector(directionButtonCancel), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(directionButtonCancel), for: .touchDragOutside)
        view.addSubview(rightButton)
    }
    
    
    @objc fileprivate func directionButtonClick(sender: UIButton) {
        
        switch sender.tag {
        case 10: //后退
            speed = retreatSpeed
        default: //前进
            speed = goForwardSpeed
        }
    }
    
    @objc fileprivate func directionButtonCancel() {
        
        speed = 0
    }
    
    //MARK: - 添加计时器
    fileprivate func setupTimer() {
        
        timer = Timer(timeInterval: 0.02, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func timerAction() {
        
        moveBackground()
    }
    
}

extension GameViewController {
    
    //MARK: 方向枚举
    enum Direction: Int {
        case goForward = -1
        case retreat = 1
    }
}


