//
//  DetailsViewController.swift
//  Task
//
//  Created by vinumurugan E on 25/02/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var items : Items!
    
    @IBOutlet weak var imgV: ImageLoader!
    
    @IBOutlet weak var projectNameLB: UILabel!
    
    @IBOutlet weak var languageLB: UILabel!
    
    @IBOutlet weak var descriptionLB: UILabel!
    
    @IBOutlet weak var createdLB: UILabel!
    
    @IBOutlet weak var updatedLB: UILabel!
    
    @IBOutlet weak var fileSizeLB: UILabel!
    
    @IBOutlet weak var branchLB: UILabel!
    
    @IBOutlet weak var urlLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgV.loadImageWithUrl(URL(string: items?.owner?.avatar_url ?? "nil" )!)
        projectNameLB.text = items?.full_name ?? "nil"
        languageLB.text = "   \(items?.language ?? "nil")   "
        languageLB.backgroundColor = (items?.language ?? "").geneic_Color()
        descriptionLB.text = items?.description ?? "nil"
        fileSizeLB.text = "\(items?.size!.covertToFileString() ?? "nil")"
        updatedLB.text = "\(items?.updated_at!.prefix(10) ?? "nil")"
        createdLB.text = "\(items?.created_at!.prefix(10) ?? "nil")"
        
        branchLB.text = items?.default_branch ?? "nil"
        
        urlLB.text = items?.clone_url ?? "nil"
        
    }
}
