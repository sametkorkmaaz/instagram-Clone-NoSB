//
//  SearchTableViewCell.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    private let smallImage1: UIImageView = UIImageView()
    private let smallImage2: UIImageView = UIImageView()
    private let smallImage3: UIImageView = UIImageView()
    private let smallImage4: UIImageView = UIImageView()
    private let bigImage: UIImageView = UIImageView()

    enum Identifier: String{
        case custom = "searchCell"
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
        //--MARK: Small Image 1
        smallImage1.image = UIImage(named: "profilePhoto")
        smallImage1.contentMode = .scaleAspectFill
        smallImage1.backgroundColor = .red
            //--MARK: Small Image 2
        smallImage2.image = UIImage(named: "insta")
        smallImage2.contentMode = .scaleAspectFill
        smallImage2.backgroundColor = .red
        //--MARK: Small Image 3
        smallImage3.image = UIImage(named: "insta")
        smallImage3.contentMode = .scaleAspectFill
        smallImage3.backgroundColor = .red
        //--MARK: Small Image 4
        smallImage4.image = UIImage(named: "profilePhoto")
        smallImage4.contentMode = .scaleAspectFill
        smallImage4.backgroundColor = .red
        //--MARK: Big Image
        bigImage.image = UIImage(named: "dikdortgen")
        bigImage.contentMode = .scaleToFill
        bigImage.backgroundColor = .red
        
        //--MARK: AddSubView
        [smallImage1, smallImage2, smallImage3, smallImage4, bigImage].forEach{
            contentView.addSubview($0)
        }
        //--MARK: Trans Auto
        [smallImage1, smallImage2, smallImage3, smallImage4, bigImage].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            smallImage1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            smallImage1.topAnchor.constraint(equalTo: contentView.topAnchor),
            smallImage1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            smallImage1.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.49),
            
            smallImage2.topAnchor.constraint(equalTo: smallImage1.topAnchor),
            smallImage2.heightAnchor.constraint(equalTo: smallImage1.heightAnchor),
            smallImage2.leadingAnchor.constraint(equalTo: smallImage1.trailingAnchor, constant: 1),
            smallImage2.widthAnchor.constraint(equalTo: smallImage1.widthAnchor),
            
            smallImage3.topAnchor.constraint(equalTo: smallImage1.bottomAnchor,constant: 1),
            smallImage3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
            smallImage3.leadingAnchor.constraint(equalTo: smallImage1.leadingAnchor),
            smallImage3.widthAnchor.constraint(equalTo: smallImage1.widthAnchor),
            
            smallImage4.topAnchor.constraint(equalTo: smallImage2.bottomAnchor,constant: 1),
            smallImage4.leadingAnchor.constraint(equalTo: smallImage3.trailingAnchor, constant: 1),
            smallImage4.bottomAnchor.constraint(equalTo: smallImage3.bottomAnchor),
            smallImage4.widthAnchor.constraint(equalTo: smallImage2.widthAnchor),
            
            bigImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bigImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 1),
            bigImage.leadingAnchor.constraint(equalTo: smallImage2.trailingAnchor, constant: 1),
            bigImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
}

#Preview(){
    SearchViewController()
}
