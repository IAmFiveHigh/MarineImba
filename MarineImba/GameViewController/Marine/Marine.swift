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
    
    

}

extension Marine {
    
    func goForward() {
        
        
    }
}
