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
    fileprivate var speed: CGFloat = 5
    
    //MARK: - 主角
    fileprivate lazy var marineKing: Marine = {
        
        let marine = Marine(frame: CGRect(x: 20, y: marineHeight, width: marineHeight, height: marineHeight))
        return marine
    }()
    
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
        
    }

    fileprivate func setupBackground() {
        
        for index in -1..<2 {
            
            let background = UIImageView(frame: CGRect(x: 0, y: CGFloat(index) * screenWidth, width: screenWidth, height: screenHeigth))
            background.image = UIImage(named: "bg.jpeg")
            background.tag = 100 + index
            view.addSubview(background)
        }
        
    }
    
    // 背景移动
    fileprivate func moveBackground(direction: Direction) {
        
        for index in -1..<2 {
            
            let background = view.viewWithTag(100 + index) as! UIImageView
            background.setX(background.x() + CGFloat(direction.rawValue) * speed)
            
        }
    
    }
    
    fileprivate func setupMarine() {
        
        view.addSubview(marineKing)
    }
    
    
    
    
    
}

extension GameViewController {
    
    //MARK: 方向枚举
    enum Direction: Int {
        case goForward = 1
        case retreat = -1
    }
}
