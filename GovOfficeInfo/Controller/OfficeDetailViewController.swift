import UIKit
import SafariServices

import SnapKit
import NMapsMap
import Then

class OfficeDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstratins()
        setupOfficeLocation()
        
    }
        
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    let labelOfficeName = UILabel().then {
        $0.text = "구청"
        $0.font = UIFont.boldSystemFont(ofSize: 40)
    }
    let labelOfficeNumber = UILabel().then {
        $0.text = "TEL."
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .darkGray
    }
    let labelOfficeAddress = UILabel().then {
        $0.text = "서울시 00구"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .darkGray
    }
    let mapViewContainer = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }
    let btnGotoPublicSite = UIButton().then {
        $0.setImage(UIImage(named: "internet"), for: .normal)
    }
    let mapView = NMFMapView()
    
    func setupOfficeLocation() {
        let officeLat : Double = dataFetchManager.shared.officeInfo[0].lat
        let officeLng : Double = dataFetchManager.shared.officeInfo[0].lng
        let officeLocation = NMGLatLng(lat: officeLat, lng:officeLng)
        let marker = NMFMarker()
        marker.position = officeLocation
        marker.mapView = mapView
        let cameraUpdate = NMFCameraUpdate(scrollTo: officeLocation)
        mapView.moveCamera(cameraUpdate)
    }
    
    @objc func oepnSFSafariViewControllerAction(_ sender: UIButton) {
            let publicSite : String = dataFetchManager.shared.officeInfo[0].publicSite
            guard let url = URL(string: publicSite) else { return }
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
     }

    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(labelOfficeName)
        mapViewContainer.addSubview(mapView)
        view.addSubview(labelOfficeNumber)
        view.addSubview(labelOfficeAddress)
        view.addSubview(btnGotoPublicSite)
        view.addSubview(mapViewContainer)
        btnGotoPublicSite.addTarget(self, action: #selector(oepnSFSafariViewControllerAction), for: .touchUpInside)
        dataFetchManager.shared.fetchOfficeData {
            self.labelOfficeName.text = dataFetchManager.shared.officeInfo[0].name
            self.labelOfficeNumber.text = "TEL.\(dataFetchManager.shared.officeInfo[0].tel)"
            self.labelOfficeAddress.text = dataFetchManager.shared.officeInfo[0].address
        }
    }
    
    func makeConstratins() {
        labelOfficeName.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(20)
        }
        btnGotoPublicSite.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalTo(labelOfficeName.snp.right).offset(30)
            make.centerY.equalTo(labelOfficeName)
        }
        labelOfficeNumber.snp.makeConstraints { (make) in
            make.top.equalTo(labelOfficeName.snp.bottom).offset(10)
            make.left.equalTo(labelOfficeName.snp.left)
        }
        labelOfficeAddress.snp.makeConstraints { (make) in
            make.top.equalTo(labelOfficeNumber.snp.bottom).offset(10)
            make.left.equalTo(labelOfficeName.snp.left)
        }
        mapViewContainer.snp.makeConstraints { (make) in
            make.top.equalTo(labelOfficeAddress.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.left.equalTo(labelOfficeName.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-10)
        }
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(mapViewContainer.snp.top)
            make.bottom.equalTo(mapViewContainer.snp.bottom)
            make.left.equalTo(mapViewContainer.snp.left)
            make.right.equalTo(mapViewContainer.snp.right)

        }
    }
}
