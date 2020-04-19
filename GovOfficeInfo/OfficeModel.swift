import Foundation

struct Office {
    var name : String
    var tel : String
    var address : String
    var publicSite : String
    var lat : Double
    var lng : Double
    }

class dataFetchManager {
    static let shared : dataFetchManager = dataFetchManager()
    var officeInfo : [Office] = [] {
        didSet {
            print("fetch is completed")
        }
    }

    init() {
        
    }

    func fetchOfficeData(completion : @escaping () -> Void) {
        let junggu : Office = Office(name: "중구", tel: "02-155-6144",
                                     address: "서울시 중구 창경궁로 17 (예관동)", publicSite: "http://www.junggu.seoul.kr/index.jsp", lat: 37.5636204, lng:126.997976 )
        officeInfo.append(junggu)
        completion()
        }
    }
