//
//  ViewController.swift
//  Task
//
//  Created by vinumurugan E on 23/02/22.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate, UITableViewDelegate {
    
    @IBOutlet weak var tableV: UITableView!
    
    @IBOutlet weak var count: UIBarButtonItem!
    
    var githubViewModel : GithubViewModel!
    
    var dataSource : GithubTableViewDataSource<GithubTvCell,Items>!
    
    lazy var loaderMoreView: UIView = {
        let loaderView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        loaderView.color = UIColor.gray
        loaderView.startAnimating()
        return loaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.githubViewModel = GithubViewModel()
        
        // Refresh
        self.githubViewModel.bindGitHubViewModelToController = {
            self.updateDataSource()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.setUpLoaderView(toShow: false)
            }
        }
    }
    
    //MARK:- UI Update
    
    func updateDataSource() {
        count.title = "\(self.githubViewModel.listArr.count)"
        self.dataSource = GithubTableViewDataSource(cellIdentifier: "GithubTvCell", items: self.githubViewModel.listArr, configureCell: { (cell, info) in
            cell.info = info
            cell.senderAction = {
                self.detailsViewController(info: info)
            }
        })
        DispatchQueue.main.async {
            self.tableV.dataSource = self.dataSource
            self.tableV.delegate = self
            self.tableV.reloadData()
        }
    }
    
    
    //MARK:- Details ViewController
    
    func detailsViewController(info :Items) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.items = info
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK:- UI UIScrollView
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            self.setUpLoaderView(toShow: true)
            self.githubViewModel.callFuncToGetGitHubData()
        }
    }
    
    func setUpLoaderView(toShow: Bool) {
        if toShow {
            self.tableV.tableFooterView?.isHidden = false
            self.tableV.tableFooterView = self.loaderMoreView
        } else {
            self.tableV.tableFooterView = UIView()
        }
    }
    
}
