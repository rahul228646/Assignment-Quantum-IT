
import UIKit

class WelcomeViewController: UIViewController {
    
    private let register : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let login : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(register)
        view.addSubview(login)
        register.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        login.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        configureLayout()
    }
    
    @objc func registerTapped() {
        let destinationVc = RegisterViewController()
        self.navigationController?.pushViewController(destinationVc, animated: true)
    }
    
    @objc func loginTapped() {
        let destinationVc = LoginViewController()
        self.navigationController?.pushViewController(destinationVc, animated: true)
    }
    
    func configureLayout() {
        NSLayoutConstraint.activate([
            register.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            register.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            register.widthAnchor.constraint(equalToConstant: view.bounds.width*0.6),
            register.heightAnchor.constraint(equalToConstant: 50),
            
            login.topAnchor.constraint(equalTo: register.bottomAnchor, constant: 20),
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.widthAnchor.constraint(equalToConstant: view.bounds.width*0.6),
            login.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}
