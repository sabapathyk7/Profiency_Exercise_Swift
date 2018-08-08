//
//  PETableViewCell.swift
//  Profiency_Exercise_Swift
//
//  Created by kanagasabapathy on 20/07/18.
//  Copyright © 2018 kanagasabapathy. All rights reserved.
//

import UIKit

class PETableViewCell: UITableViewCell {

//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var descLabel: UILabel!
//    @IBOutlet weak var rowImage: UIImageView?
    
    var titleLabel: UILabel! = UILabel()
    var descLabel: UILabel! = UILabel()
    var rowImage: UIImageView? = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel.init(frame: CGRect.init(x: 134, y: 2, width: 236, height: 20.5))
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        self.contentView.addSubview(titleLabel)
        
        descLabel = UILabel.init(frame: CGRect.init(x: 134, y: 22.5, width: 236, height: 57))
        descLabel.backgroundColor = .clear
        descLabel.textColor = .black
        descLabel.textAlignment = .center
        self.contentView.addSubview(descLabel)
        
        rowImage = UIImageView.init(frame: CGRect.init(x: 21, y: 0, width: 100, height: 80))
        rowImage?.contentMode = .scaleToFill
        self.contentView.addSubview(rowImage!)
        self.contentView.backgroundColor = .green
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
