//
//  HPView.swift
//  MarineImba
//
//  Created by 我是五高你敢信 on 2017/4/6.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class HPView: UIView {

    //MARK: 属性
    fileprivate var hp: Double {
        didSet {
            if hp > letHP {
                
                hp = letHP
            }else if hp < 0 {
                
                hp = 0
            }
            
        }
    }
    
    fileprivate let letHP: Double
    //MARK: UI
    fileprivate let title = UILabel()
    
    fileprivate let progressView = UIView()
    
    fileprivate var progressWidth: CGFloat!
    
    init(frame: CGRect, hp: Double) {
        
        self.hp = hp
        self.letHP = hp
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        
        title.frame = CGRect(x: 8, y: 2, width: width() / 3, height: height() / 2)
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor = UIColor.black
        title.text = "HP: \(hp)"
        addSubview(title)
        
        let background = UIView(frame: CGRect(x: title.x(), y: height() / 2, width: width() - title.x() * 2, height: height() / 2))
        background.layer.cornerRadius = height() / 3
        background.layer.borderColor = UIColor.red.cgColor
        background.layer.borderWidth = 2
        addSubview(background)
        
        progressView.frame = CGRect(x: background.x() + 2, y: background.y() + 2, width: background.width() - 2 * 2, height: background.height() - 2 * 2)
        progressView.backgroundColor = UIColor.red
        progressView.layer.cornerRadius = progressView.height() / 2
        progressWidth = progressView.width()
        addSubview(progressView)
    }
    
    //MARK: - 外部方法 改变进度
    func change(HP: Double) {
        
        //1 改变hp
        hp += HP
        
        //2 设置progressView宽度
        progressView.setWidth(progressWidth * CGFloat(hp / letHP))
        
        //3 设置title
        title.text = "\(hp)"
    }
}
