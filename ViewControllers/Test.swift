import UIKit;

class Customer {
    var name: String
    var photo: UIImage

    init() {
        
    }
}

class CustomerCell: UITableViewCell {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nameLabel: UILabel
    var photoImageView: UIImageView
}

class MyViewController : UITableViewController {
    
    var customers = [Customer]()
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath)
        guard let custCell = cell as? CustomerCell  else { fatalError() };
        
        let customer = customers[indexPath.row]
        
        custCell.nameLabel.text = customer.name
        custCell.photoImageView.image = customer.photo
        
        return cell
    }
}
