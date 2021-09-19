//
//  Requests.swift
//  SarryProject
//
//  Created by omair khan on 14/09/2021.
//

import Foundation
import UIKit

func request() -> URLRequest {
    var request = URLRequest(url: URL(string: BaseURL + "catalog/")!)
    request.setValue(TOKEN, forHTTPHeaderField: "Authorization")
    request.setValue(ACCEPTLANGUAGE, forHTTPHeaderField: "Accept-Langauge")
    return request
}

