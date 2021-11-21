//
//  DiffableDataSource.swift
//  foodpin
//
//  Created by 張宸瑋 on 2021/11/8.
//

import UIKit

enum Section {
    case all
}

class DiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
