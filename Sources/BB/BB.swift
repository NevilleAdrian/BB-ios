import Foundation
public struct BB {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func HelloToYou() -> String{ 
        return "Hello to you"
    }
    
    public func checkSurvey(token: String, id: String) {
        guard let url = URL(string: "https://api.bitlabs.ai/v1/client/check?platform=WEB") else {
            return
        }
        var request = URLRequest(url: url)
        //method, headers
        
        request.httpMethod = "GET"
        request.setValue("X-Api-Token", forHTTPHeaderField: token)
        request.setValue("X-User-Id", forHTTPHeaderField: id)
        
        let task = URLSession.shared.dataTask(with: request){ data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("SUCCESS: \(response)")
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
