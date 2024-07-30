//
//  UITextFieldUIButtonViewController.swift
//  RXSwift0730
//
//  Created by 최민경 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa

class UITextFieldUIButtonViewController: UIViewController {
    
    let signName = UILabel()
    let signEmail = UILabel()
    let signButton = UIButton()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSign()
    }
    
    
    // 왜 오류가 날까요
    func setSign() {
        Observable.combineLatest(signName.rx.text.orEmpty,
                                 signEmail.rx.text.orEmpty) { value1, value2 in
            return "name은 \(value1)이고, 이메일은 \(value2)입니다"
        }
                                 .bind(to: simpleLabel.rx.text)
                                 .disposed(by: disposeBag)
        
        signName.rx.text.orEmpty //String
            .map { $0.count < 4 } // Int
            .bind(to: signEmail.rx.isHidden, signButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        signEmail.rx.text.orEmpty
            .map { $0.count > 4 }
            .bind(to: signButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        signButton.rx.tap
            .subscribe { _ in
                self.showAlert()
            }
            .disposed(by: disposeBag)
    }
}
