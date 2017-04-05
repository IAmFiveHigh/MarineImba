//
//  CakeProgressView.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/4/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CakeProgressView: UIView {
    
    fileprivate let interval: TimeInterval = 0.02
    
    //冷却时间
    fileprivate let cd: TimeInterval
    
    //读秒
    fileprivate var progress: Int = 0
    
    fileprivate lazy var label: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    fileprivate lazy var cakeProgress: CakeProgress = {
        
        let progress = CakeProgress(frame: self.bounds)
        return progress
    }()
    
    //计时器
    fileprivate var timer: Timer!
    
    //MARK: 设置是否显示倒计时数字
    var hasIndexLabel: Bool = true {
        didSet {
            if hasIndexLabel {
                label.isHidden = false
            }else {
                label.isHidden = true
            }
        }
    }
    
    init(frame: CGRect, cd: TimeInterval) {
        
        self.cd = cd
        
        super.init(frame: frame)
        
        setupUI()
        
        createTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        addSubview(cakeProgress)
        
        label.frame = CGRect(x: 0, y: 0, width: width() / 3, height: width() / 3)
        label.center = center
        label.text = "\(cd)"
        addSubview(label)
    }
    
    fileprivate func createTimer() {
        
        timer = Timer(timeInterval: interval, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timer.fireDate = Date.distantFuture

        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func timerAction() {
        
        cakeProgress.progress += CGFloat(1 / (Double(cd) / interval))
        
        //1 秒表进度加等于常量时间间隔
        progress += 1
        
        let tmp = progress / Int(1 / interval) //实际走了多少秒
        let tmp2 = progress % Int(1 / interval) //当走够整数秒的时候
        
        if tmp == Int(cd) {
            
            timer.fireDate = Date.distantFuture
            isHidden = true
        }
        
        if tmp2 == 0{
            
            label.text = "\(Int(cd) - tmp)"
        }
        
    }
    
    func colddown() {
        
        //重设label文字
        isHidden = false
        label.text = "\(cd)"
        
        progress = 0
        cakeProgress.progress = 0
        //开启计时器
        timer.fireDate = Date.distantPast
        
        
    }
    
    deinit {
        print("CakeProgressTimerInvalidate")
        timer.invalidate()
    }
    
}

class CakeProgress: UIView {
    
    var progress: CGFloat = 0.0 {
        didSet {
            
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(UIColor.black.cgColor)
        ctx?.setAlpha(0.5)
        ctx?.setLineWidth(1)
        ctx?.move(to: CGPoint(x: width() / 2, y: height() / 2))
        ctx?.addLine(to: CGPoint(x: middleWidth(), y: 0))
        let endAngle = CGFloat(M_PI) * 2 * progress - CGFloat(M_PI) / 2
        
        ctx?.addArc(center: CGPoint(x: width() / 2, y: height() / 2), radius: width() / 2, startAngle: -CGFloat(M_PI) / 2, endAngle: endAngle, clockwise: true)
        ctx?.fillPath()
        
    }
}
