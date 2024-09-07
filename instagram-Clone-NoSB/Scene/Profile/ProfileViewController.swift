//
//  ProfileViewController.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

protocol ProfileViewControllerInterface: AnyObject{
    
    func configurePage()
}
class ProfileViewController: UIViewController {

    //--MARK: Companents
     private let usernameLabel: UILabel = {
        let label = UILabel()
         label.font = .systemFont(ofSize: 25, weight: .bold)
         label.textColor = .white
         label.textAlignment = .center
        return label
    }()
    private let lockButton: UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let button = UIButton()
        let largeImage2 = UIImage(systemName: "lock", withConfiguration: largeConfig)
        button.setImage(largeImage2, for: .normal)
        button.tintColor = .white
        return button
    }()
    private let settingsButton: UIButton = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let button = UIButton()
        let largeImage2 = UIImage(systemName: "line.3.horizontal", withConfiguration: largeConfig)
        button.setImage(largeImage2, for: .normal)
        button.tintColor = .white
        return button
    }()
    private let profilePhoto: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "profilePhoto")
        return image
    }()
    private let postLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "gönderi"
        return label
    }()
    private let postCount: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let followersLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "takipçi"
        return label
    }()
    private let followersCount: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let followingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "takip"
        return label
    }()
    private let followingCount: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
    }()
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profili Düzenle", for: .normal)
        button.setTitleColor(UIColor(.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.backgroundColor = .darkGray
        // Köşeleri yuvarlat
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    private let shareProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profili paylaş", for: .normal)
        button.setTitleColor(UIColor(.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.backgroundColor = .darkGray
        // Köşeleri yuvarlat
        button.layer.cornerRadius = 10
        button.clipsToBounds = true 
        return button
    }()

    
    private lazy var viewModel = ProfileViewModel()
    //--MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidload()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        postCount.text = String(viewModel.postCount)
        followersCount.text = String(viewModel.followersCount)
        followingCount.text = String(viewModel.followingCount)
        view.backgroundColor = .black
        usernameLabel.text = viewModel.userName
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.width / 2
        nameLabel.text = viewModel.nameLabel
        bioLabel.text = viewModel.bioText
        
    }


}

extension ProfileViewController: ProfileViewControllerInterface{
    func configurePage(){
        [lockButton, usernameLabel, settingsButton, profilePhoto, postLabel, followersLabel, followingLabel, postCount, followersCount, followingCount,nameLabel, bioLabel, editProfileButton, shareProfileButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            lockButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lockButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            usernameLabel.leadingAnchor.constraint(equalTo: lockButton.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: lockButton.topAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: lockButton.bottomAnchor),
            
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            settingsButton.topAnchor.constraint(equalTo: usernameLabel.topAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            
            profilePhoto.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor,constant: 20),
            profilePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profilePhoto.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            profilePhoto.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            postLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: view.frame.width / 15),
            postLabel.centerYAnchor.constraint(equalTo: profilePhoto.centerYAnchor),
            
            postCount.bottomAnchor.constraint(equalTo: postLabel.topAnchor),
            postCount.leadingAnchor.constraint(equalTo: postLabel.leadingAnchor),
            postCount.trailingAnchor.constraint(equalTo: postLabel.trailingAnchor),
            
            followersLabel.leadingAnchor.constraint(equalTo: postLabel.trailingAnchor, constant: view.frame.width / 8),
            followersLabel.centerYAnchor.constraint(equalTo: profilePhoto.centerYAnchor),
            
            followersCount.bottomAnchor.constraint(equalTo: followersLabel.topAnchor),
            followersCount.leadingAnchor.constraint(equalTo: followersLabel.leadingAnchor),
            followersCount.trailingAnchor.constraint(equalTo: followersLabel.trailingAnchor),
            
            followingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width / 15),
            followingLabel.centerYAnchor.constraint(equalTo: profilePhoto.centerYAnchor),
            
            followingCount.bottomAnchor.constraint(equalTo: followingLabel.topAnchor),
            followingCount.leadingAnchor.constraint(equalTo: followingLabel.leadingAnchor),
            followingCount.trailingAnchor.constraint(equalTo: followingLabel.trailingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: profilePhoto.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 5),
            
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            
            editProfileButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor,constant: 5),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editProfileButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.43),
            
            shareProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            shareProfileButton.topAnchor.constraint(equalTo: editProfileButton.topAnchor),
            shareProfileButton.bottomAnchor.constraint(equalTo: editProfileButton.bottomAnchor),
            shareProfileButton.widthAnchor.constraint(equalTo: editProfileButton.widthAnchor)
            
        ])
    }
}

#Preview(){
    ProfileViewController()
}
