import UIKit

import Then
import SnapKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    let ad = UIApplication.shared.delegate as? AppDelegate
    let mainTitile = UILabel().then {
        $0.text = "주변 관공서 정보"
        $0.font = UIFont.boldSystemFont(ofSize: 34)
        $0.textColor = .systemBlue
    }
    let btnContainer = UIView()
    let btnGotoTaxOffice = UIButton().then {
        $0.setTitle("주변 세무서 찾기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.darkGray, for: .normal)
        $0.layer.cornerRadius = 50
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    let btnGotoGuOffice = UIButton().then {
        $0.setTitle("주변 구청 찾기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.darkGray, for: .normal)
        $0.layer.cornerRadius = 50
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    let btnGotoTaxOfficeIntro = UIButton().then {
        $0.setTitle("세무서 담당업무", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.darkGray, for: .normal)
        $0.layer.cornerRadius = 50
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    let btnGotoGuOfficeIntro = UIButton().then {
        $0.setTitle("구청 담당업무", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.darkGray, for: .normal)
        $0.layer.cornerRadius = 50
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    
    @objc func gotoInfoView(_ sender : UIButton!) {

        if sender == btnGotoGuOfficeIntro {
            let officeTaskVC = OfficeIntroViewController()
            ad?.screenID = 1
            self.navigationController?.pushViewController(officeTaskVC, animated: true)
        } else if sender == btnGotoTaxOfficeIntro {
            let officeTaskVC = OfficeIntroViewController()
            ad?.screenID = 2
            self.navigationController?.pushViewController(officeTaskVC, animated: true)
        } else if sender == btnGotoGuOffice {
            let officeListVC = OfficeListViewController()
            ad?.screenID = 1
            self.navigationController?.pushViewController(officeListVC, animated: true)
        } else if sender == btnGotoTaxOffice {
            let officeListVC = OfficeListViewController()
            ad?.screenID = 2
            self.navigationController?.pushViewController(officeListVC, animated: true)
        }
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 208, green: 201, blue: 201, alpha: 1)
        view.addSubview(mainTitile)
        view.addSubview(btnContainer)
        view.addSubview(btnGotoTaxOffice)
        btnGotoTaxOffice.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoGuOffice.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoGuOfficeIntro.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoTaxOfficeIntro.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)

        view.addSubview(btnGotoGuOffice)
        view.addSubview(btnGotoGuOfficeIntro)
        view.addSubview(btnGotoTaxOfficeIntro)
    }
    
    func makeConstraints() {
        mainTitile.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
        }
        
        btnContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(mainTitile).offset(80)
            make.height.equalTo(view.layer.bounds.height/2)
        }
        btnGotoTaxOffice.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer)
            make.left.equalTo(btnContainer)
            make.right.equalTo(btnGotoTaxOfficeIntro.snp.left).offset(-10)
            make.width.equalTo(btnGotoTaxOfficeIntro.snp.width)
            make.height.equalTo(btnGotoGuOffice.snp.height)
        }
        btnGotoTaxOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer)
            make.right.equalTo(btnContainer)
            make.width.equalTo(btnGotoTaxOffice.snp.width)
            make.height.equalTo(btnGotoGuOfficeIntro.snp.height)
        }
        btnGotoGuOffice.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOffice.snp.bottom).offset(10)
            make.bottom.equalTo(btnContainer)
            make.left.equalTo(btnContainer)
            make.right.equalTo(btnGotoGuOfficeIntro.snp.left).offset(-10)
            make.width.equalTo(btnGotoTaxOfficeIntro.snp.width)
            make.height.equalTo(btnGotoTaxOffice.snp.height)
        }
        btnGotoGuOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOfficeIntro.snp.bottom).offset(10)
            make.bottom.equalTo(btnContainer)
            make.right.equalTo(btnContainer)
            make.width.equalTo(btnGotoGuOffice.snp.width)
            make.height.equalTo(btnGotoTaxOfficeIntro.snp.height)
        }
    }

        
}

