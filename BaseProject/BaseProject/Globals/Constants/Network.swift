//
//  Network.swift
//  BaseProject
//
//  Created by taehy.k on 2021/07/31.
//

/*
 - Network Constants
 - URL Constants를 따로 만들지 않은 이유는 굳이 따로 만들 필요가 없을 것 같다고 이번에 생각.
    - 서비스 코드에서 바로 처리하는 것이 더 편한 것 같다.
 - 나머지 헤더 필드나 파라미터 관련해서는 상수화 시키기
 */

import Foundation

// MARK: - Network
extension Constants {
    // API Constants
    struct API {
        static var baseURL: URL {
            return URL(string: "#")!
        }
    }
}

// Header Field
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case xAuthToken = "x-auth-token"
}

// ContentType
enum ContentType: String {
    case json = "application/json"
}
