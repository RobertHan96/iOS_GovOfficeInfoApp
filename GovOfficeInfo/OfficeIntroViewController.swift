import UIKit

import Then
import SnapKit

class OfficeIntroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstrains()
    }
    let ad = UIApplication.shared.delegate as? AppDelegate
    let guItems : [String] = ["여권 발급", "지방세 신고", "차량 등록", "복지 상담", "도로 정비", "폐기물"]
    let taxItems : [String] = ["연말정산", "부가가치세 신고", "상속", "세무 상담"]

    let officeTaskTable : UITableView = UITableView().then {
        $0.separatorStyle = .none
        $0.separatorInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        $0.allowsSelection = false
        $0.isScrollEnabled = false
        $0.register(UINib(nibName: "OfficeTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "officeTaskItemCell")
    }
    let btnTitle = UIButton().then {
        $0.setTitle("주요 담당 업무", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(displayP3Red: 93, green: 81, blue: 81, alpha: 1)
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ad?.screenID == 1 {
            return guItems.count
        } else {
            return taxItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let officeTaskCell = tableView.dequeueReusableCell(withIdentifier: "officeTaskItemCell", for: indexPath) as? OfficeTaskTableViewCell else {return UITableViewCell()}
        
        if ad?.screenID == 1 {
            officeTaskCell.labelOfficeTask.text = guItems[indexPath.row]
        } else {
            officeTaskCell.labelOfficeTask.text = taxItems[indexPath.row]
        }
        return officeTaskCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
//                cell.alpha = 1
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(btnTitle)
        view.addSubview(officeTaskTable)
        officeTaskTable.delegate = self
        officeTaskTable.dataSource = self
    }
    
    func makeConstrains()  {
        btnTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(30)
            make.right.lessThanOrEqualTo(self.view.safeAreaLayoutGuide.snp.right).offset(-30)
        }
        
        officeTaskTable.snp.makeConstraints { (make) in
            make.top.equalTo(btnTitle.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(50)
        }
    }

}
