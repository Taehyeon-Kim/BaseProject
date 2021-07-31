//
//  APIRouter.swift
//  BaseProject
//
//  Created by taehy.k on 2021/07/31.
//

/*
     
     총 5가지 구분 요소에 따라 API 요청을 구분한다.
     - Case         : Enum Case (적절하게 네이밍을 통해 어떤 API 요청인지 구분한다.)
     - Method       : HTTP Method (get, post, patch, delete 등의 HTTP Method를 구분한다.)
     - Path         : URL Path (URL의 경우 Base URL 뒷 부분에 대한 Path를 Return 한다.)
     - Parameter    : Parameter (주로 Post에서 사용되고, Get에서도 파라미터가 사용되는 경우가 있으니 주의한다. 딕셔너리 형태로 작성한다.) -> 파라미터도 상수로 구분할 필요가 있으면 논의를 통해 따로 뺀다.
     - Encoding     : Encoding Method (URLEncoding, JSONEncoding 인지 구분해서 사용한다.)
     
 */

import Foundation

import Alamofire

enum APIRouter: URLRequestConvertible {
    // MARK: - Cases
    case getTravels
    case addTravel(travelName: String, destination: String, startDate: String, endDate: String, imageIndex: Int)
    case getSchedules(groupId: String, date: String)
    
    // MARK: - Methods
    var method: HTTPMethod {
        switch self {
        case .getTravels, .getSchedules:
            return .get
        case .addTravel:
            return .post
        }
    }
    
    // MARK: - Paths
    var path: String {
        switch self {
        case .getTravels, .addTravel:
            return "/travel"
        case .getSchedules(let groupId, let date):
            return "/schedule/daily/\(groupId)/\(date)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getTravels, .getSchedules:
            return nil
        case .addTravel(let travelName, let destination, let startDate, let endDate, let imageIndex):
            return [
                "travelName": travelName,
                "destination": destination,
                "startDate": startDate,
                "endDate": endDate,
                "imageIndex": imageIndex
            ]
        }
    }
    
    // MARK: - Encodings
    var encoding: ParameterEncoding {
        switch self {
        case .getTravels:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    // MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let url = Constants.API.baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        let token = ""
        
        // HTTP Method
        urlRequest.method = method
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(token, forHTTPHeaderField: HTTPHeaderField.xAuthToken.rawValue)
        
        // Parameters
        if let parameters = parameters {
            return try encoding.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}
