import Foundation
import SafariServices


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
        request.setValue("a8ef5ffc-f8eb-4186-8652-637f08920ddc", forHTTPHeaderField:"X-Api-Token")
        
        request.setValue("MOBILE", forHTTPHeaderField: "X-User-Id")
        
       
        
        let task = URLSession.shared.dataTask(with: request){ data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            print(data)
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
    
    public func openWebView() -> SFSafariViewController  {
        return SFSafariViewController(url: URL(string: "https://www.google.com")!)
       
    }
}
