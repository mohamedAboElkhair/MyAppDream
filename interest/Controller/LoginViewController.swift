//
//  LoginViewController.swift
//  interest
//
//  Created by Mohamed AbouElkhair on 2/21/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Alamofire
class LoginViewController: UIViewController , LoginButtonDelegate {
    
  //  let connection = GraphRequestConnection()

    
    let logingButton : FBLoginButton = {
    let button = FBLoginButton()
        button.permissions = ["email"]
        return button
        
    }()
    let login = Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logingButton)
        
        
        logingButton.center = view.center
        logingButton.delegate = self
            //if let token =
         if let accessToken = AccessToken.current {
            self.performSegue(withIdentifier: "AfterLogin", sender: self)
        }else{
        fatchProfile()
        }
    }
    
    func fatchProfile(){
    
         let parameters = ["fields": "name , id , email , picture.type(large)"]
       
        GraphRequest(graphPath: "me", parameters: parameters as [String : String] ).start { (connection, result, error)->Void in
            if error != nil{
            print(error ?? "here error")
            }
            
            if let userInfo = result as? [String: Any] {
                let IdUser = userInfo["id"] as! String
                let facebookProfileUrl = "http://graph.facebook.com/\(IdUser)/picture?type=large"
                
                let name = userInfo["name"]  as! String
                let email = userInfo["email"]  as! String
                let idUser = IdUser
    
                let photoLink = facebookProfileUrl
                let password = IdUser
                
                let parameters = [
                    "name" : name,
                    "email": email,
                   "password" : password,
                  "idUser": idUser,
                   "typeLogin" : "Facebook",
                   "photoLink": photoLink
                ]
                
              //  print(userprofile.name)
             let headers: HTTPHeaders = [

                   "Accept": "application/json",
                  
               ]

                Alamofire.request("http://127.0.0.1:8000/api/auth/signup", method: .post, parameters: parameters,encoding: JSONEncoding.default, headers:headers ).responseJSON {
                    response in
                    switch response.result {
                    case .success:
                    print(response)
                         self.performSegue(withIdentifier: "AfterLogin", sender: self)
                        break
                    case .failure(let error):
                        print(error)
                    }
                }
                
            }
            
            
           
        }
        
        

        
    
    }
      
    

  func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    
    fatchProfile()
    
    
  }
  
  func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
     print("complete logout")
  }
    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
     return   true
    }
    // MARK: - Navigation

  

}
