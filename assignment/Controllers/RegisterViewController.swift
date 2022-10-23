
import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn

class RegisterViewController: UIViewController {

    
    private let registerLabel : UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailAddress : UITextField = {
        let emailAddress = UITextField()
        emailAddress.placeholder = "Email Address"
        emailAddress.layer.borderWidth = 1
        emailAddress.layer.borderColor = UIColor.black.cgColor
        emailAddress.leftViewMode = .always
        emailAddress.autocapitalizationType = .none
        emailAddress.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        emailAddress.backgroundColor = .systemBackground
        return emailAddress
    }()

    private let password : UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
        password.autocapitalizationType = .none
        password.leftViewMode = .always
        password.backgroundColor = .systemBackground
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return password
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let googleButton : GIDSignInButton = {
        let button = GIDSignInButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20

        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(registerLabel)
        stackView.addArrangedSubview(emailAddress)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(googleButton)
        view.addSubview(stackView)
        loginButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(didTapGoogle), for: .touchUpInside)
        configureLayout()
    }
    
    @objc func didTapRegister() {
        if let email = emailAddress.text, let password = password.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }
                else {
                    let destinationVc = MainTabBarViewController()
                    self.navigationController?.pushViewController(destinationVc, animated: true)
                }
            }
        }
    }
    
    @objc func didTapGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(error)
                    return
                }
                let destinationVc = MainTabBarViewController()
                self.navigationController?.pushViewController(destinationVc, animated: true)
                print("logged in")
            }
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            stackView.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width*0.8),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.height*0.3),
        ])
    }
    


}
