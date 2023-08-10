//
//  ViewController.swift
//  HW11
//
//  Created by Илья Капёрский on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir-Black", size: 28.0)
        label.text = "Login"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var login: UITextField = {
        let login = UITextField()
        login.text = "Login"
        login.backgroundColor = UIColor(named: "White")
        login.textAlignment = .left
        login.font = UIFont(name: "Avenir-Roman", size: 14.0)
        login.textColor = UIColor.systemGray2
        login.layer.masksToBounds = false
        login.layer.cornerRadius = 20
        login.layer.shadowColor = UIColor.black.cgColor
        login.layer.shadowOpacity = 0.3
        login.layer.shadowOffset = .zero
        login.layer.shadowRadius = 10
        login.layer.shouldRasterize = true
        login.layer.rasterizationScale = UIScreen.main.scale
        login.translatesAutoresizingMaskIntoConstraints = false

        login.setLeftIcon(UIImage(named: "person")!)
        return login
    }()
    
    private lazy var password: UITextField = {
        let password = UITextField()
        password.text = "Password"
        password.backgroundColor = UIColor(named: "White")
        password.textAlignment = .left
        password.font = UIFont(name: "Avenir-Roman", size: 14.0)
        password.textColor = UIColor.systemGray2
        password.layer.masksToBounds = false
        password.layer.cornerRadius = 20
        password.layer.shadowColor = UIColor.black.cgColor
        password.layer.shadowOpacity = 0.3
        password.layer.shadowOffset = .zero
        password.layer.shadowRadius = 10
        password.layer.shouldRasterize = true
        password.layer.rasterizationScale = UIScreen.main.scale
        password.translatesAutoresizingMaskIntoConstraints = false

        password.setLeftIcon(UIImage(named: "lock")!)
        return password
    }()
    
    // MARK: - Outlets
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.backgroundColor = UIColor(named: "Purple")
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgotButton: UIButton = {
        let forgotButton = UIButton()
        
        forgotButton.setTitle("Forgot your password?", for: .normal)
        forgotButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        forgotButton.setTitleColor(UIColor.white, for: .normal)
        forgotButton.clipsToBounds = true
        forgotButton.backgroundColor = nil
        forgotButton.addTarget(self, action: #selector(forgotButtonPressed), for: .touchUpInside)
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        return forgotButton
    }()
    
    private lazy var midView: UIView = {
        let midView = UIView(frame: CGRect(x: 0, y: (view.center.y / 3) * 4 - 5, width: view.frame.width, height: 10))
        midView.layer.shadowColor = UIColor.black.cgColor
        midView.layer.shadowOpacity = 0.3
        midView.layer.shadowOffset = .zero
        midView.layer.shadowRadius = 10
        midView.layer.shouldRasterize = true
        midView.layer.rasterizationScale = UIScreen.main.scale
        return midView
    }()
    
    private lazy var bottomView: UIView = {
        let bottomView = UIView(frame: CGRect(x: 0, y: (view.center.y / 3) * 4 + 5, width: view.frame.width, height: view.frame.height / 3))
        bottomView.backgroundColor = UIColor.white
        return bottomView
    }()
    
    private lazy var delimiterL: UIView = {
        let delimiterL = UIView(frame: CGRect(x: bottomView.frame.maxX - 130, y: bottomView.frame.minY + 40, width: 100, height: 1))
        delimiterL.backgroundColor = UIColor(named: "lightGray")
        delimiterL.layer.cornerRadius = 1
        return delimiterL
    }()
    
    private lazy var bottomLabel: UILabel = {
        let bottomLabel = UILabel()
        bottomLabel.textColor = UIColor.systemGray2
        bottomLabel.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        bottomLabel.text = "or connect with"
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        return bottomLabel
    }()
    
    private lazy var delimiterR: UIView = {
        let delimiterR = UIView(frame: CGRect(x: 30, y: bottomView.frame.minY + 40, width: 100, height: 1))
        delimiterR.backgroundColor = UIColor(named: "lightGray")
        delimiterR.layer.cornerRadius = 1
        return delimiterR
    }()
    
    private lazy var facebook: UIButton = {
        let image = UIImage(named: "facebook")

        let resizedImage = image!.resizeImage(25, 25)

        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        config.attributedTitle = AttributedString("Facebook", attributes: container)
        config.image = resizedImage
        config.imagePlacement = .leading
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0)
        config.imagePadding = 20
        config.baseBackgroundColor = UIColor(named: "facebook")
        
        let facebook = UIButton(configuration: config)
        facebook.translatesAutoresizingMaskIntoConstraints = false
        return facebook
    }()
    
    private lazy var twitter: UIButton = {
        let image = UIImage(named: "twitter")

        let resizedImage = image!.resizeImage(40, 40)

        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        config.attributedTitle = AttributedString("Twitter", attributes: container)
        config.image = resizedImage
        config.imagePlacement = .leading
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -45, bottom: 0, trailing: 0)
        config.imagePadding = 10
        config.baseBackgroundColor = UIColor(named: "twitter")
        
        let twitter = UIButton(configuration: config)
        twitter.translatesAutoresizingMaskIntoConstraints = false
        return twitter
    }()
    
    private lazy var haventAccLable: UILabel = {
        let haventAccLable = UILabel()
        haventAccLable.textColor = UIColor.systemGray2
        haventAccLable.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        haventAccLable.text = "Don't have account?"
        haventAccLable.translatesAutoresizingMaskIntoConstraints = false
        return haventAccLable
    }()
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        
        signInButton.setTitle("Sign up", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14.0)
        signInButton.setTitleColor(UIColor(named: "facebook"), for: .normal)
        signInButton.clipsToBounds = true
        signInButton.backgroundColor = nil
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        return signInButton
    }()

    // MARK: - Lifestyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupHierarchy()
        setupLayout()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Setup
    private func setupHierarchy() {
        view.addSubview(label)
        view.addSubview(login)
        view.addSubview(password)
        view.addSubview(button)
        view.addSubview(forgotButton)
        view.addSubview(midView)
        view.addSubview(bottomView)
        view.addSubview(delimiterL)
        view.addSubview(bottomLabel)
        view.addSubview(delimiterR)
        view.addSubview(facebook)
        view.addSubview(twitter)
        view.addSubview(haventAccLable)
        view.addSubview(signInButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.topAnchor.constraint(lessThanOrEqualTo: label.bottomAnchor, constant: 70),
            login.widthAnchor.constraint(equalToConstant: 280),
            login.heightAnchor.constraint(equalToConstant: 40),
            
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 20),
            password.widthAnchor.constraint(equalToConstant: 280),
            password.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(lessThanOrEqualTo: password.bottomAnchor, constant: 80),
            button.widthAnchor.constraint(equalToConstant: 280),
            button.heightAnchor.constraint(equalToConstant: 40),

            forgotButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotButton.topAnchor.constraint(lessThanOrEqualTo: button.bottomAnchor, constant: 20),
            
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.centerYAnchor.constraint(equalTo: delimiterL.centerYAnchor),
            
            facebook.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            facebook.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            facebook.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            facebook.heightAnchor.constraint(equalToConstant: 36),
            
            twitter.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            twitter.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            twitter.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            twitter.heightAnchor.constraint(equalToConstant: 36),
            
            haventAccLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            haventAccLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            signInButton.leftAnchor.constraint(equalTo: haventAccLable.rightAnchor, constant: 10),
            signInButton.centerYAnchor.constraint(equalTo: haventAccLable.centerYAnchor)
            
        ])

        
    }
    
    func setupMainView(){
        let mainGradient = CAGradientLayer()
        mainGradient.frame = view.bounds
        mainGradient.startPoint = CGPoint(x: 0, y: 0)
        mainGradient.endPoint = CGPoint(x: 1, y: 1)
        mainGradient.colors = [UIColor(named: "LightPurple")!.cgColor, UIColor(named: "LightBlue")!.cgColor]
        view.layer.insertSublayer(mainGradient, at: 0)
        
        let subGradient = CAGradientLayer()
        subGradient.frame = midView.bounds
        subGradient.startPoint = CGPoint(x: 0, y: 0)
        subGradient.endPoint = CGPoint(x: 1, y: 1)
        subGradient.colors = [UIColor(named: "DarkPink")!.cgColor, UIColor(named: "Pink")!.cgColor]
        midView.layer.insertSublayer(subGradient, at: 0)
    }

    
    // MARK: - Actions
    @objc private func buttonPressed(){
        
    }
    
    @objc private func forgotButtonPressed(){
        
    }
    
    @objc private func facebookButtonPressed(){
        
    }
    
    @objc private func twitterButtonPressed(){
        
    }
    
    @objc private func signInButtonPressed(){
        
    }

}

extension UITextField {
    func setLeftIcon(_ image: UIImage){
        let iconView = UIImageView(frame: CGRect(x: 25, y: 0, width: 17, height: 17))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 70, height: 20))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UIImage {
    func resizeImage(_ width: Int, _ height: Int)-> UIImage?{
        let newSize = CGSize(width: width, height: height) // Новый размер изображения
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

