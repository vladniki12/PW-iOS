//
//  PWRemoteDM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire

class PWRemoteDM {
    
    let localDB = PWLocalDM()
    
    private func isNetworkAvailabile() -> Bool {
        guard let reachabilityManager = NetworkReachabilityManager(host: PWConstants.Network.REQUESTS_BASE_URL) else {
            return false
        }
        return reachabilityManager.isReachable
    }
    
    func getArray<T: Decodable>(request: URLRequestConvertible?, disposeOnCompleted: [Disposable?] = []) -> Observable<[T]> {
        guard let req = request else {
            return Observable.empty()
        }
        
        return Observable.create{ observer in
            
            guard self.isNetworkAvailabile() else {
                observer.on(.error(NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Ошибка соединения с сервером"])))
                return Disposables.create()
            }
            
            let task = Alamofire.request(req)
                .response{_ in
                    var x = 0
                    x = x + 1
                }.responseJSON(completionHandler: { (response) in
                    var x = 0
                    x = x + 1
                }).responseData(completionHandler: { (data) in
                    if let receivedData = data.data {
                        print("\n1-RESPONSE: \n" + (String(data: receivedData, encoding: .utf8) ?? ""))
                        if receivedData.isEmpty {
                            
                            return
                        }
                        do {
                            let jsonDecoder = JSONDecoder()
                            let apiResp = try jsonDecoder.decode([T].self, from: receivedData)
                            if( apiResp != nil) {
                                observer.on(.next(apiResp))
                                
                                observer.on(.completed)
                            }
                            return
                        } catch let parsingError {
                            
                            observer.on(.error(NSError(domain: (String(data: receivedData, encoding: .utf8) ?? ""), code: -1, userInfo: nil)))
                            
                        }
                    }
                })
            
            return Disposables.create {
                task.cancel()
            }
            }.share().do(onError: { error in
                disposeOnCompleted.forEach { $0?.dispose() }
            }, onCompleted: {
                disposeOnCompleted.forEach { $0?.dispose() }
            }, onDispose: {
                disposeOnCompleted.forEach { $0?.dispose() }
            })
        
        
        
    }
    
    func getObject<T: Decodable>(request: URLRequestConvertible?, disposeOnCompleted: [Disposable?] = []) -> Observable<T> {
        guard let req = request else {
            return Observable.empty()
        }
        
        return Observable.create{ observer in
            
            guard self.isNetworkAvailabile() else {
                observer.on(.error(NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Ошибка соединения с сервером"])))
                return Disposables.create()
            }
            
            let task = Alamofire.request(req)
                .response{_ in
                    var x = 0
                    x = x + 1
                }.responseJSON(completionHandler: { (response) in
                    var x = 0
                    x = x + 1
                }).responseData(completionHandler: { (data) in
                    if let receivedData = data.data {
                        print("\n1-RESPONSE: \n" + (String(data: receivedData, encoding: .utf8) ?? ""))
                        if receivedData.isEmpty {
                            
                            return
                        }
                        do {
                            let jsonDecoder = JSONDecoder()
                            let apiResp = try jsonDecoder.decode(T.self, from: receivedData)
                            if( apiResp != nil) {
                                observer.on(.next(apiResp))
                                
                                observer.on(.completed)
                            }
                            return
                        } catch let parsingError {
                            
                             observer.on(.error(NSError(domain: (String(data: receivedData, encoding: .utf8) ?? ""), code: -1, userInfo: nil)))
                            
                        }
                    }
                })
            
            return Disposables.create {
                task.cancel()
            }
        }.share().do(onError: { error in
            disposeOnCompleted.forEach { $0?.dispose() }
            }, onCompleted: {
            disposeOnCompleted.forEach { $0?.dispose() }
            }, onDispose: {
            disposeOnCompleted.forEach { $0?.dispose() }
            })
            
        
    }

}
