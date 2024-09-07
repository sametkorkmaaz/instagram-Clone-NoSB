//
//  ProfileViewModel.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 7.09.2024.
//


import Foundation

protocol ProfileViewModelInterface{
    var view: ProfileViewControllerInterface? { get set}
    
    func viewDidload()
}

final class ProfileViewModel{
    weak var view: ProfileViewControllerInterface?
    
    var userName: String = "samet.krkmzz"
    var postCount: Int = 1
    var followersCount: Int = 277
    var followingCount: Int = 391
    var nameLabel: String = "Samet"
    var bioText: String = "İstanbul"
}

extension ProfileViewModel: ProfileViewModelInterface{
        
    func viewDidload() {
        view?.configurePage()
    }
}
