//
//  TableViewController.swift
//  UserInterfaceExample
//
//  Created by Owen on 8/29/23.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    lazy var imageModel:ImageModel  = {
        return ImageModel.sharedInstance()
    }()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return self.imageModel.numberOfImages()
        }
        return 1
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Configure the cell...
            cell.textLabel!.text = self.imageModel.getImageName(for: indexPath.row)
            
            
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            
            // Configure the cell...
            cell.textLabel?.text = "All Images"
            cell.detailTextLabel?.text = "Summary"
            
            return cell
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text{
                vc.displayImageName = name
            }
    }
    

}
