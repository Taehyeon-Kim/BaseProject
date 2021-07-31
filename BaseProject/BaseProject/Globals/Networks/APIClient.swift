//
//  APIClient.swift
//  BaseProject
//
//  Created by taehy.k on 2021/07/31.
//

/*
 
    ex) 다음과 같이 사용할 수 있을 것으로 보인다.
     
    private func getSchedules(groupId: String, date: String) {
        APIClient.request(ScheduleResponse.self,
                                 router: APIRouter.getSchedules(groupId: groupId,
                                                                date: date)) { [weak self] (models) in
            self?.setScheduleResult(models)
        } failure: { error in
            print(error.localizedDescription)
        }
    }
     
    - 라우팅 처리를 통해 하나의 메서드 (request)만 사용해서 서버 통신을 할 수 있도록 한다.
    - 방법이 잘못되었다고 판단되면 각 서비스 별로 요청 메서드를 분리하도록 한다.
    - responseDecodable 방식을 사용하고 있고,
    - 성공, 실패에 대한 처리를 클로저를 통해하고 있다. -> 네트워크 Reponse에 대한 처리를 더 세분화할지는 팀원과 논의 필요

*/

import Foundation

import Alamofire

class APIClient {
    
    typealias onSuccess<T> = ((T) -> Void)
    typealias onFailure = ((_ error: Error) -> Void)
    
    static func request<T>(_ object: T.Type,
                                  router: APIRouter,
                                  success: @escaping onSuccess<T>,
                                  failure: @escaping onFailure) where T: Decodable {
        AF.request(router)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: object) { response in
                switch response.result {
                case .success:
                    guard let decodedData = response.value else { return }
                    success(decodedData)
                case .failure(let err):
                    failure(err)
                }
        }
    }
    
}
