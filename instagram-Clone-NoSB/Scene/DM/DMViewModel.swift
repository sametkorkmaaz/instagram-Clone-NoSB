//
//  DMViewModel.swift
//  instagram-Clone-NoSB
//
//  Created by Samet Korkmaz on 6.09.2024.
//

import Foundation

protocol DMViewModelInterface{
    var view: DMViewControllerInterface? { get set }
    
    func viewDidload()
    
}

final class DMViewModel {
    weak var view: DMViewControllerInterface?
    
    var username: String = "samet.krkmzz"
}

extension DMViewModel: DMViewModelInterface{
    func viewDidload(){
        view?.configureDMPage()
    }
    
}
