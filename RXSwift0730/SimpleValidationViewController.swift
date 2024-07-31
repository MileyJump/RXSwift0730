//
//  SimpleValidationViewController.swift
//  RXSwift0730
//
//  Created by 최민경 on 7/31/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SimpleValidationViewController: UIViewController {
    private let minimalUsernameLength = 5
    private let minimalPasswordLength = 5
    
    var usernameTextField: UITextField!
    var usernameValidLabel: UILabel!

    var passwordTextField: UITextField!
    var passwordValidLabel: UILabel!

    var doSomethingButton: UIButton!
    
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        usernameValidLabel.text = " 5글자 이상! \(minimalUsernameLength)"
        passwordValidLabel.text = "5글자 이상!! \(minimalPasswordLength)"

        let username = usernameTextField.rx.text.orEmpty
            .map { $0.count >= self.minimalUsernameLength }
            .share(replay: 1)

        let password = passwordTextField.rx.text.orEmpty
            .map { $0.count >= self.minimalPasswordLength }
            .share(replay: 1)

        let everything = Observable.combineLatest(username, password) { $0 && $1 }
            .share(replay: 1)

        username
            .bind(to: passwordTextField.rx.isEnabled)
            .disposed(by: disposeBag)

        username
            .bind(to: passwordValidLabel.rx.isHidden)
            .disposed(by: disposeBag)

        password
            .bind(to: passwordValidLabel.rx.isHidden)
            .disposed(by: disposeBag)

        everything
            .bind(to: doSomethingButton.rx.isEnabled)
            .disposed(by: disposeBag)

        doSomethingButton.rx.tap
            .subscribe(onNext: { [weak self] _ in self?.showAlert() })
            .disposed(by: disposeBag)
    }

    func showAlert() {
        let alert = UIAlertController(
            title: "타이틀",
            message: "메세지",
            preferredStyle: .alert
        )
        let defaultAction = UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
