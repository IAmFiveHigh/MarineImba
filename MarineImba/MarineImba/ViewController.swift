//
//  ViewController.swift
//  MarineImba
//
//  Created by 我是五高你敢信 on 2017/3/22.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let beginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    fileprivate func setupUI() {
        
        beginButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        beginButton.setCenterX(screenWidth / 2)
        beginButton.setCenterY(screenHeigth / 2)
        
        beginButton.setBackgroundImage(UIImage(named: "开始游戏"), for: .normal)
        beginButton.contentMode = .scaleAspectFit
        beginButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(beginButton)
    }
    
    @objc fileprivate func buttonClick() {
        
        navigationController?.pushViewController(GameViewController(), animated: true)
    }


}



