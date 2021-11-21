//
//  TableViewController.swift
//  foodpin
//
//  Created by 張宸瑋 on 2021/11/1.
//

import UIKit





class TableViewController: UITableViewController {
  
    @IBOutlet weak var top: UILabel!
    @IBOutlet weak var foot: UILabel!

    var restaurants:[Restaurant] = []
    var like = [] as [String]
        lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Restaurant.generateData(sourceArray: &restaurants)
        tableView.dataSource = dataSource
                
        //Create the snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)

        dataSource.apply(snapshot, animatingDifferences: false)
        navigationController?.navigationBar.prefersLargeTitles = true
        foot.numberOfLines = 0
        foot.lineBreakMode = NSLineBreakMode.byWordWrapping
        top.lineBreakMode = NSLineBreakMode.byWordWrapping
        top.numberOfLines = 0
        foot.text = "  I like: "
        top.text = "Student ID: 410821312"
        top.layer.borderWidth = 2
        

    }
    
   
    
    // MARK: - UITableView Diffable Data Source
    
    func configureDataSource() -> DiffableDataSource {
        let cellIdentifier = "datacell"
        
        let dataSource = DiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, restaurant in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
                /*
                cell.imageView?.image = UIImage(named: restaurant.img2)
                cell.imageView?.layer.cornerRadius = 40
                cell.imageView?.clipsToBounds = true
                cell.imageView?.layer.borderWidth = 1*/
                
                
                
                
                cell.nameLabel.text = restaurant.name
                cell.thumbnailImageView.image = UIImage(named: restaurant.image)
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.thumbnailImageView.image = UIImage(named: restaurant.img2)
                
                cell.accessoryType = restaurant.isFavorite ? .checkmark: .none//ch
                return cell
                
            }
        )
        
        return dataSource
    }
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//ch
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        restaurants[indexPath.row].isFavorite = true
        tableView.deselectRow(at: indexPath, animated: false)

    }*/
    
    // MARK: - swipe dislike action
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    // Mark as favorite action
    let favoriteAction = UIContextualAction(style: .destructive, title: "dislike") { (action, sourceView, completionHandler) in

    let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
    //update source array
    self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : false
    //print(self.restaurants[indexPath.row].isFavorite)
    if self.restaurants[indexPath.row].isFavorite == false{
        if let index = self.like.firstIndex(of: self.restaurants[indexPath.row].name) {
            self.like.remove(at: index)
        }
    }
    
    //update data source of the tableview
    var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
    snapshot.appendSections([.all])
    snapshot.appendItems(self.restaurants, toSection: .all)
    self.dataSource.apply(snapshot, animatingDifferences: false)

    //update cell
    cell.accessoryType = self.restaurants[indexPath.row].isFavorite ? .checkmark : .none


    // Call completion handler to dismiss the action button
    completionHandler(true)
    let stringg = self.like.joined(separator: ", ")
    self.foot.text = "  I like: " + stringg
    }

    // Change the action's color and icon
    favoriteAction.backgroundColor = UIColor.systemRed
    favoriteAction.image = UIImage(systemName: self.restaurants[indexPath.row].isFavorite ? "heart.slash.fill" : "heart.fill")

    let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
    

    return swipeConfiguration
    }    
    //delete causes the constraint problem: top margin priority to 750

// MARK: - left
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    // Get the selected restaurant
    guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else {
    return UISwipeActionsConfiguration()
    }
        let favoriteAction = UIContextualAction(style: .destructive, title: "like") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            //update source array
            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? true : true
            //print(self.restaurants[indexPath.row].isFavorite)
            if(self.restaurants[indexPath.row].isFavorite == true){
                var ccc = 0
                for i in self.like{
                    if i == self.restaurants[indexPath.row].name{
                        ccc = 1
                    }
                }
                if ccc == 0{
                    self.like.append(self.restaurants[indexPath.row].name)
                }
                
            }
            //update data source of the tableview
            var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
            snapshot.appendSections([.all])
            snapshot.appendItems(self.restaurants, toSection: .all)
            self.dataSource.apply(snapshot, animatingDifferences: false)
            
            //update cell
            cell.accessoryType = self.restaurants[indexPath.row].isFavorite ? .checkmark : .none
            
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
            let stringg = self.like.joined(separator: ", ")
            self.foot.text = "  I like: " + stringg
            //print(stringg)
        }
        
        // Change the action's color and icon
        favoriteAction.backgroundColor = UIColor.systemGreen
        favoriteAction.image = UIImage(systemName: self.restaurants[indexPath.row].isFavorite ? "heart.slash.fill" : "heart.fill")
        
        // Delete action
        
        
        // Share action
        
        
        // Change the action's color and icon
        
        // Configure both actions as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
        
        return swipeConfiguration
    }
    
    // MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.restaurantImageName = restaurants[indexPath.row].image
            }
        }
    }
}

