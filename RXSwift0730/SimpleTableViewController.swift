//
//  SimpleTableViewController.swift
//  RXSwift0730
//
//  Created by 최민경 on 7/31/24.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SimpleTableViewExampleController : UIViewController {
    var tableView = UITableView()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .gray
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        let items = Observable.just(
            (0..<20).map { "\($0)" }
        )

        items
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) 번째의 row~  \(row)"
            }
            .disposed(by: disposeBag)


        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                print("\(value) 번째를 탭했어요~")

            })
            .disposed(by: disposeBag)
    }

}
