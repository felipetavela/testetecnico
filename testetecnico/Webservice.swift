import Foundation

class Webservice {
    
    func getData (url: URL, completion: @escaping (Player?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                let newData = try? JSONDecoder().decode(Welcome.self, from: data)
                if let newData = newData {
                    completion(newData.object[0].player)
                    
                }
            }
        }.resume()
    }
}


