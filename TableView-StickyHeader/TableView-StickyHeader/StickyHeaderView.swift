//
//  StickyHeaderView.swift
//  TableView-StickyHeader
//
//  Created by Jon Bash on 2020-05-08.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit


class StickyHeaderView: UIView {
    // properties
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented; cannot use this view in storyboard")
    }
    func setUpViews() {
        backgroundColor = .systemBlue
    }

    func setUpConstraints() {

    }
}
