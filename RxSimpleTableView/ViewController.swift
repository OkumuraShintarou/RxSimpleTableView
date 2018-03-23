//
//  ViewController.swift
//  RxSimpleTableView
//
//  Created by 奥村晋太郎 on 2018/03/19.
//  Copyright © 2018年 奥村晋太郎. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    fileprivate let vm = RxSimpleTableViewCellModel()

    fileprivate let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewDelegate()
        configure()
    }
}

extension ViewController {
    func configure() {
        bindCellItems()
        tableViewItemSelected()
        tablewViewRegister()
    }

    func bindCellItems() {
        vm.cellItems
            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { _, element, cell in
                let cell = cell as! RxSimpleTableViewCell
                cell.testLabel.text = element
            }
            .disposed(by: bag)
    }

    func tableViewItemSelected() {
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexpath in
                guard let wself = self else { return }
                print(indexpath.row)
            })
            .disposed(by: bag)
    }

    func tablewViewRegister() {
        tableView.register(UINib(nibName: "RxSimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    func configureTableViewDelegate() {
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: bag)
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }

    func tableView(_: UITableView, editingStyleForRowAt _: IndexPath) -> UITableViewCellEditingStyle {
        /// To prevent swipe to delete behavior
        return .none
    }
}

