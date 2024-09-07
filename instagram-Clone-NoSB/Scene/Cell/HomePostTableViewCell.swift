//
//  HomePostTableViewCell.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

class HomePostTableViewCell: UITableViewCell {

    private let username: UILabel = UILabel()
    private let postImage: UIImageView = UIImageView()
    private let likeButton: UIButton = UIButton()
    private let commentButton: UIButton = UIButton()
    private let sendButton: UIButton = UIButton()
    private let bookmarkButton: UIButton = UIButton()
    private let padingView: UIView = UIView()
    
    enum Identifier: String{
        case custom = "postCell"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(){
        contentView.backgroundColor = .black
        //--MARK: UserNameDraw
        username.textColor = .white
        username.font = UIFont(name: "Arial", size: 20)
        username.font = .systemFont(ofSize: 20, weight: .bold)
        username.backgroundColor = UIColor(.black).withAlphaComponent(0.2)
        //--MARK: Post Image
        postImage.contentMode = .scaleAspectFill
        postImage.image = UIImage(named: "manzara2")
        postImage.backgroundColor = .black
        //--MARK: Like Button
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .white
        //--MARK: Commnet Button
        commentButton.setImage(UIImage(systemName: "ellipsis.message"), for: .normal)
        commentButton.tintColor = .white
        //--MARK: Send Button
        sendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sendButton.tintColor = .white
        //--MARK: Bookmark Button
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .white
        //--MARK: Pading View
        padingView.backgroundColor = .black
        
        contentView.addSubview(postImage)
        contentView.addSubview(username)
        contentView.addSubview(likeButton)
        contentView.addSubview(padingView)
        contentView.addSubview(commentButton)
        contentView.addSubview(sendButton)
        contentView.addSubview(bookmarkButton)
        username.translatesAutoresizingMaskIntoConstraints = false
        postImage.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        padingView.translatesAutoresizingMaskIntoConstraints = false
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImage.bottomAnchor.constraint(equalTo: likeButton.topAnchor),
            
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            likeButton.bottomAnchor.constraint(equalTo: padingView.topAnchor),
            likeButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
            
            
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            likeButton.bottomAnchor.constraint(equalTo: padingView.topAnchor),
            likeButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1),
            likeButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
            
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 5),
            commentButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            commentButton.bottomAnchor.constraint(equalTo: likeButton.bottomAnchor),
            commentButton.widthAnchor.constraint(equalTo: likeButton.widthAnchor),
            
            sendButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 5),
            sendButton.topAnchor.constraint(equalTo: commentButton.topAnchor),
            sendButton.bottomAnchor.constraint(equalTo: commentButton.bottomAnchor),
            sendButton.widthAnchor.constraint(equalTo: commentButton.widthAnchor),
            
            bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            bookmarkButton.topAnchor.constraint(equalTo: sendButton.topAnchor),
            bookmarkButton.bottomAnchor.constraint(equalTo: sendButton.bottomAnchor),
            bookmarkButton.widthAnchor.constraint(equalTo: sendButton.widthAnchor),
            
            
            padingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            padingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            padingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            padingView.heightAnchor.constraint(equalToConstant: 0)
            
        ])
    }
    
    
    func cellDataModel(model: PostModel){
        username.text = model.username
    }
}

#Preview("UIKit"){
    TabbarViewController()
}
