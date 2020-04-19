import UIKit

class OfficeTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var labelOfficeTask: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        labelOfficeTask.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
