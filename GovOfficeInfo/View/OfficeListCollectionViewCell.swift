import UIKit

import SnapKit
import Then
class OfficeListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelOfficeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        labelOfficeName.textAlignment = .center
        labelOfficeName.adjustsFontSizeToFitWidth = true
    }
    
}
