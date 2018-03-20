//
//  RxSimpleTableViewCell.swift
//  RxSimpleTableView
//
//  Created by 奥村晋太郎 on 2018/03/19.
//  Copyright © 2018年 奥村晋太郎. All rights reserved.
//

import UIKit
import RxSwift

class RxSimpleTableViewCell: UITableViewCell {

    fileprivate let bag = DisposeBag()
    @IBOutlet weak var testLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
