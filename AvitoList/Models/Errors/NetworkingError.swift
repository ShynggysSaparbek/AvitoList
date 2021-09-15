//
//  NetworkingError.swift
//  AvitoList
//
//  Created by Saparbek . on 10.09.2021.
//

import Foundation
enum NetworkingError: Error {
    case failedToFetchData(Error)
    case failedToParseData(Data, Error)
    case dataIsUnexpextedlyNil
}
