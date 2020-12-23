//
//  headerVC.swift
//  learnAlamofire
//
//  Created by Muhammad Hammam on 21/12/2020.
//

import UIKit

class headerVC: UIView {

    @IBOutlet weak var HeaderLable: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // this class instantiate the nib and returns classType
    class func HeaderNibInnerClass() -> headerVC {
        let myClassNib = UINib(nibName: "headerVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! headerVC  //instantiate()[0] >> first view in the Nib
            return myClassNib
        }
}
