//
//  ViewController.swift
//  TableView-StickyHeader
//
//  Created by Paul Solt on 5/8/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - SubViews

    lazy var headerView: StickyHeaderView = {
        let headerView = StickyHeaderView(frame: CGRect(
            origin: .zero,
            size: CGSize(
                width: view.frame.width,
                height: 300)))
        return headerView
    }()

    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Lifecycle / Setup

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        setUpViews()
    }

    func setUpViews() {
        view.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
    }

    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"

        return cell
    }

    // MARK: - Table View Delegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView.y = \(scrollView.contentOffset.y)")
    }
}

