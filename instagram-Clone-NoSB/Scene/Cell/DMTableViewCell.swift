//
//  DMTableViewCell.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

class DMTableViewCell: UITableViewCell {
    
    private let userImage: UIImageView = UIImageView()
    private let userName: UILabel = UILabel()
    private let messageDetay: UILabel = UILabel()
    private let cameraButton: UIButton = UIButton()
    private let padingView: UIView = UIView()

    enum Identifier: String{
        case custom = "dmCell"
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
        //--MARK: ADDSubViews
        [userImage, userName, messageDetay, cameraButton, padingView].forEach{
            contentView.addSubview($0)
        }
        //--MARK: Trans Auto
        [userImage, userName, messageDetay, cameraButton, padingView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //--MARK: UserImage
        userImage.image = UIImage(named: "profilePhoto")
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 33 // Boyutun yarısı (80x80 için)
        userImage.layer.masksToBounds = true // Köşeler dışındaki alanı kırp
        userImage.layer.borderColor = UIColor.gray.cgColor // Sınır rengi
        userImage.layer.borderWidth = 0.5 // Sınır kalınlığı
        userImage.backgroundColor = .yellow
        //--MARK: userName
        userName.textColor = .white
        //--MARK: message Detay
        messageDetay.textColor = .white
        //--MARK: Camera Button
        cameraButton.tintColor = .white
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        //--MARK: Pading View
        padingView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            userImage.bottomAnchor.constraint(equalTo: padingView.topAnchor, constant: 0),
            userImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            
            userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16),
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            messageDetay.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
            messageDetay.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            
            cameraButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            cameraButton.topAnchor.constraint(equalTo: userImage.topAnchor),
            cameraButton.bottomAnchor.constraint(equalTo: userImage.bottomAnchor),
            cameraButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            padingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            padingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            padingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            padingView.heightAnchor.constraint(equalToConstant: 5),
            
        ])
    }
    
    func cellDataModel(model: MessageModel){
        userImage.image = UIImage(named: "\(model.userImage!)")
        userName.text = model.userName
        messageDetay.text = model.messageDetay
    }

}
#Preview("UIKit"){
    DMViewController()
}
