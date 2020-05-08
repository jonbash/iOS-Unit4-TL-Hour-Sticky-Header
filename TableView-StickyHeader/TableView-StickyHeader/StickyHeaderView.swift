//
//  StickyHeaderView.swift
//  TableView-StickyHeader
//
//  Created by Jon Bash on 2020-05-08.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit


class StickyHeaderView: UIView {
    var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "98º"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 60.0, weight: .light)
        label.hasDropShadow = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Rochester, NY"
        label.textColor = .white
        label.hasDropShadow = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Clear"
        label.textColor = .white
        label.hasDropShadow = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "partly-cloudy-day")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

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
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(summaryLabel)
        stackView.addArrangedSubview(temperatureLabel)
        addSubview(stackView)
    }

    func setUpConstraints() {
        iconImageView.addConstraints([
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        let centerY = centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
        centerY.priority = .defaultHigh // can break when at top
        let cityTopSpace = cityLabel.topAnchor.constraint(greaterThanOrEqualTo: self.layoutMarginsGuide.topAnchor, constant: 1)
        cityTopSpace.priority = .defaultHigh + 1
        addConstraints([
            self.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            centerY,
            cityTopSpace
        ])
    }

    func updateViewForScrollPosition(y: CGFloat, width: CGFloat) {
        var height = -y

        let minHeight: CGFloat = 100
        let defaultHeight: CGFloat = 300

        if height < minHeight {
            // prevent view from disappearing
            height = minHeight
        } else if height > defaultHeight {
            // prevent view from growing
            height = defaultHeight
        }
        frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
    }
}
