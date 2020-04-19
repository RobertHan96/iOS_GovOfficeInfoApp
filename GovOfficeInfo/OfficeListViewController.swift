import UIKit

import Then
import SnapKit
class OfficeListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstrains()
    }
    let ad = UIApplication.shared.delegate as? AppDelegate
    let guList : [String] = ["종로", "중구", "성동", "용산", "광진", "동대문", "중랑", "성북", "강북",
                            "도봉", "노원", "은평", "서대문", "마포", "양천", "강서", "구로", "금천",
                            "영등포", "동작", "관악", "서초", "강남", "송파", "강동"
                            ]
    let taxList : [String] = ["종로", "중구(중구 일부)", "남대문(중구 일부)", "용산", "성북", "서대문",                           "강북", "은평",  "마포", "영등포", "강서", "양천", "구로",
                              "동작(영등포 일부)","금천", "관악", "강남(강남 일부)", "삼성(강남 일부)",
                                "역삼(강남 일부", "반포(서초 일부)", "서초(서초 일부)", "송파(송파 일부)",
                                "잠실(송파 일부)", "성동/광진", "강북", "노원/창동",  "동대문", "중랑", "강동"]

    let btnTitle = UIButton().then {
        $0.setTitle("지역별 위치 안내", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(displayP3Red: 93, green: 81, blue: 81, alpha: 1)
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    let officeListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(UINib(nibName: "OfficeListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "officeListItem")
        let layout = UICollectionViewFlowLayout()
        $0.backgroundColor = .white
        layout.minimumInteritemSpacing = 3
        $0.collectionViewLayout = layout
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ad?.screenID == 1 {
            return guList.count
        } else {
            return taxList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let officeListItem = collectionView.dequeueReusableCell(withReuseIdentifier: "officeListItem", for: indexPath) as? OfficeListCollectionViewCell
            else { return UICollectionViewCell() }
        if ad?.screenID == 1 {
            officeListItem.labelOfficeName.text = guList[indexPath.row]
            return officeListItem
        } else {
            officeListItem.labelOfficeName.text = taxList[indexPath.row]
            return officeListItem
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width / 3 - 20, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let officeDetailVC = OfficeDetailViewController()
        self.navigationController?.pushViewController(officeDetailVC, animated: true)
    }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(btnTitle)
        view.addSubview(officeListCollectionView)
        officeListCollectionView.delegate = self
        officeListCollectionView.dataSource = self
    }
    
    func makeConstrains()  {
        btnTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(30)
            make.right.lessThanOrEqualTo(self.view.safeAreaLayoutGuide.snp.right).offset(-30)
        }
        officeListCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(btnTitle.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-50)
        }
    }


}
