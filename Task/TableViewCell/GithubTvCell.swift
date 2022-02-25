//
//  GithubTvCell.swift
//  Task
//
//  Created by vinumurugan E on 24/02/22.
//

import UIKit

class GithubTvCell: UITableViewCell {
    
    var senderAction : (()->())!
    
    @IBOutlet weak var imgV: ImageLoader!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var languageLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var sizeLbl: UILabel!
    
    @IBOutlet weak var updatedLbl: UILabel!
    
    @IBAction func btnAction(_ sender: Any) {
        senderAction()
    }
    var info : Items? {
        didSet {
            imgV.loadImageWithUrl(URL(string: info?.owner?.avatar_url ?? "" )!)
            nameLbl.text = info?.full_name ?? ""
            languageLbl.text = "   \(info?.language ?? "")   "
            languageLbl.backgroundColor = (info?.language ?? "").geneic_Color()
            descriptionLbl.text = info?.description ?? ""
            sizeLbl.text = "Size: \(info?.size!.covertToFileString() ?? "")"
            updatedLbl.text = "Updated at: \(info?.updated_at!.prefix(10) ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
