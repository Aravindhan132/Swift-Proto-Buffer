//
//  DataRepository.swift
//  PlatformBuilderProto
//
//  Created by aravind on 20/07/20.
//

import Foundation
import SwiftGRPC

class DataRepository {
    
    static let shared = DataRepository()
    private init() {}

    private let client = NoteServiceServiceClient.init(address: "127.0.0.1:50051", secure: false)
    
    func getBinderUI(completion: @escaping([Layout]?, CallResult?) -> Void) {
        _ = try? client.list(Empty(), completion: { (builder, result) in
            DispatchQueue.main.async {
                print(builder)
                completion(builder?.layout, result)
            }
        })
        
        let vv = try? client.list(Empty())
        print(vv)
    }
    
    

}

