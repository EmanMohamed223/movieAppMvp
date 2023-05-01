//
//  IteamTable.swift
//  Iteams
//
//  Created by Eman on 16/01/2023.
//

import UIKit
protocol deleget2
{
    func renderdata(result:MyResult?)
  
}
class IteamTable: UITableViewController,deleget2 {
    func renderdata(result: MyResult?) {
        self.tempitems = result?.items
        DispatchQueue.main.async {
        
                       self.tableView.reloadData()
               }
    }
    
    var tempitems : [Item]?
    override func viewDidLoad() {
        super.viewDidLoad()
tempitems=[]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mycell")
       // var  presenter  = Presenter(UITableViewController :self.tableView)
        var  presenter  = Presenter()

       presenter.delegatEqual(d: self)
        presenter.getItems()
//        let indicator = UIActivityIndicatorView(style: .large)
//        indicator.center = self.view.center
//        self.view.addSubview(indicator)
//        indicator.startAnimating()
//        networkF.fetchResult{ myresult in
//            print(myresult?.items[0].header ?? "No title")
//            self.tempitems = myresult?.items
//            DispatchQueue.main.async {
//             self.myLabel.text = myresult?.items[0].header ?? "No title"
//                indicator.stopAnimating()
//                self.tableView.reloadData()
//            }
//
//        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tempitems!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)as?TableViewCell
        var temp = tempitems![indexPath.row]
        cell?.titlelabel?.text = temp.header
        // Configure the cell...

        return cell!
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var details = self.storyboard?.instantiateViewController(withIdentifier: "data")as!ViewController
        details.detailedItem = tempitems![indexPath.row]
        self.navigationController?.pushViewController(details, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
