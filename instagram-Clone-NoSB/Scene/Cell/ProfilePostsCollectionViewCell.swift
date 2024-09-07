//
//  ProfilePostsCollectionViewCell.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 7.09.2024.
//

import UIKit

class ProfilePostsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "postCell"
    
    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "manzara2")
        image.tintColor = .white
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
