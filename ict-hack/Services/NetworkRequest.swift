//
//  NetworkRequest.swift
//  ict-hack
//
//  Created by  Matvey on 09.05.2021.
//

import Foundation

struct Proposal: Decodable {
    let id: Int
    let name: String
    let author: String
    let description: String
    let value: Int
    let status: String
    let tags: [String]
}

struct NetworkService {
    
    private func getProposals(completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: "https://itmo-search.herokuapp.com/api/v1/proposals") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        
        task.resume()
    }
    
    func getProposalList(completion: @escaping(Result<[Proposal], Error>) -> Void) {
        getProposals { (data, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                return
            }
            let decodeData = decodeJSON(type: [Proposal].self, from: data)
            guard let unwrappedDecodedData = decodeData else {
                return
            }
            
            completion(.success(unwrappedDecodedData))
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
            let decoder = JSONDecoder()
            guard let data = data else { return nil }
            do {
                let object = try decoder.decode(type.self, from: data)
                return object
            } catch {
                return nil
            }
        }
    
}
