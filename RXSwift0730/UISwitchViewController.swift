//
//  UISwitchViewController.swift
//  RXSwift0730
//
//  Created by 최민경 on 7/30/24.
//
import UIKit
import RxSwift
import RxCocoa

class UISwitchViewController: UIViewController {
    
    let simpleSwitch = UISwitch()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwitch()
    }
    
    func setSwitch() {
        Observable.of(false)
            .bind(to: simpleSwitch.rx.isOn)
            .disposed(by: disposeBag)
    }
}
