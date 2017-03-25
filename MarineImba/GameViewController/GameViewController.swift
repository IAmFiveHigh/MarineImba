//
//  GameViewController.swift
//  MarineImba
//
//  Created by 我是五高你敢信 on 2017/3/23.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {

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
    
    fileprivate func setupUI() {
        
        setupBackground()
        
    }

    fileprivate func setupBackground() {
        
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeigth))
        background.image = UIImage(named: "bg.jpeg")
        view.addSubview(background)
    }
    
}
