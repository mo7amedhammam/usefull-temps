//
//  footerVC.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 22/12/2020.
//

import UIKit

class footerVC: UIView {

    @IBOutlet weak var FooterContainer: UIView!
    @IBOutlet weak var footerLableOutlet: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // this class instantiate the nib and returns classType
    class func FooterNibInnerClass() -> footerVC {
        let myFooterInnerClassNib = UINib(nibName: "footerVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! footerVC  //instantiate()[0] >> first view in the Nib
            return myFooterInnerClassNib
        }
    
    
}
