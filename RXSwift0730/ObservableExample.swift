//
//  ObservableExample.swift
//  RXSwift0730
//
//  Created by 최민경 on 7/30/24.
//

import UIKit
import RxSwift
import RxCocoa

class ObservableExample: UIViewController {
    
    let itemsA = [3.3, 4.0, 5.0, 2.0, 3.6, 4.8]
    let itemsB = [2.3, 2.0, 1.3]
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observableExample()
    }
    
    func observableExample() {
        
        // just -> 하나의 값만 Emit 배출

        Observable.just(itemsA)
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print("just - \(error)")
            } onCompleted: {
                print("just completed")
            } onDisposed: {
                print("just disposed")
            }
            .disposed(by: disposeBag)
        
        // of - 여러가지 값, 2개 이상의 값을 Emit 배출한다

        Observable.of(itemsA, itemsB)
            .subscribe { value in
                print("of - \(value)")
            } onError: { error in
                print("of - \(error)")
            } onCompleted: {
                print("of completed")
            } onDisposed: {
                print("of disposed")
            }
            .disposed(by: disposeBag)
        
        // from -> 배열의 각 element를 Observable로 리턴

        Observable.from(itemsA)
            .subscribe { value in
                print("from - \(value)")
            } onError: { error in
                print("from - \(error)")
            } onCompleted: {
                print("from completed")
            } onDisposed: {
                print("from disposed")
            }
            .disposed(by: disposeBag)
        
        // take - 방출된 아이템 중 처음 n개의 아이템을 보낸다 = 이 코드에서는 5개 : take(5)

        Observable.repeatElement("Jack")
            .take(5)
            .subscribe { value in
                print("repeat - \(value)")
            } onError: { error in
                print("repeat - \(error)")
            } onCompleted: {
                print("repeat completed")
            } onDisposed: {
                print("repeat disposed")
            }
            .disposed(by: disposeBag)
    }
    
}
