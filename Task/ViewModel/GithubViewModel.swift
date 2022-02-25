//
//  GithubViewModel.swift
//  Task
//
//  Created by vinumurugan E on 25/02/22.
//

import Foundation

class GithubViewModel: NSObject {
    
    var bindGitHubViewModelToController:(() -> ()) = {}
    
    var page = 1
    
    var isFetching = false
    
    var listArr = [Items] () {
        didSet {
            self.bindGitHubViewModelToController()
        }
    }
    
    override init() {
        super.init()
        callFuncToGetGitHubData()
    }
    
    func callFuncToGetGitHubData() {
        if isFetching {
            return
        }
        isFetching = true
        APIService.shared.getResponse(page: page, per_page: 15) { [self] (result) in
            page += 1
            listArr.append(contentsOf: result.items ?? [Items]())
            isFetching = false
        }
    }
}

