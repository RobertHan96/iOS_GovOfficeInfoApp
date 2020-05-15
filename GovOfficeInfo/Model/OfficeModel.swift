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
    let guList : [String] = ["종로", "중구", "성동", "용산", "광진", "동대문", "중랑", "성북", "강북",
                            "도봉", "노원", "은평", "서대문", "마포", "양천", "강서", "구로", "금천",
                            "영등포", "동작", "관악", "서초", "강남", "송파", "강동"
                            ]
    let taxList : [String] = ["종로", "중구(중구 일부)", "남대문(중구 일부)", "용산", "성북", "서대문",                           "강북", "은평",  "마포", "영등포", "강서", "양천", "구로",
                              "동작(영등포 일부)","금천", "관악", "강남(강남 일부)", "삼성(강남 일부)",
                                "역삼(강남 일부", "반포(서초 일부)", "서초(서초 일부)", "송파(송파 일부)",
                                "잠실(송파 일부)", "성동/광진", "강북", "노원/창동",  "동대문", "중랑", "강동"]
    let guItems : [String] = ["여권 발급", "지방세 신고", "차량 등록", "복지 상담", "도로 정비", "폐기물"]
    let taxItems : [String] = ["연말정산", "부가가치세 신고", "상속", "세무 상담"]

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
