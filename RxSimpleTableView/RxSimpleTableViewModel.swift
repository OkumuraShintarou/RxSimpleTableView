 //
 //  RxSimpleTableViewModel.swift
 //  RxSimpleTableView
 //
 //  Created by 奥村晋太郎 on 2018/03/20.
 //  Copyright © 2018年 奥村晋太郎. All rights reserved.
 //

 import Foundation
 import RxSwift
 import RxCocoa

 final class RxSimpleTableViewCellModel {
    let cellItems = BehaviorRelay(value: [String]())

    init() {
        cellItems.accept(["iPhoneX","iPhone8Plus", "iPhone8", "iPhone7Plus"])
    }

 }
