//
//  NetworkClient+upload.swift
//  NetworkLayerPOC
//
//  Created by Ramy Nasser on 17/11/2022.
//

import Foundation
import Alamofire

extension NetworkClient  {
    
    func sendMultiPartRequest<T: Codable>(endpoint: Endpoint,
                                          multipartData: MultipartData,
                                          _ expectedModel: T.Type,
                                          completion: CallResponse<T>) {

    }
}
