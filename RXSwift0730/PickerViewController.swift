//
//  ViewController.swift
//  RXSwift0730
//
//  Created by 최민경 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    
    private let simplePickerView = UIPickerView()
    private let simpleLabel = UILabel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setPickerView() {
        let items = Observable.just([
            "영화",
            "애니메이션",
            "드라마",
            "기타"
        ])
        items.bind(to: simplePickerView.rx.itemTitles) { (row, element) in
            return element
        }
        .disposed(by: disposeBag)
        
        
        simplePickerView.rx.modelSelected(String.self)
            .map { $0.description }
            .bind(to: simpleLabel.rx.text)
            .disposed(by: disposeBag)
    }


}

