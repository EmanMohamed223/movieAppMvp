//
//  Presenter.swift
//  Iteams
//
//  Created by Eman on 29/01/2023.
//

import Foundation
import UIKit
class Presenter {
    //3oza a3ml obj mn l table w accsees l delegt l feh w akhlyh b self
    var d :deleget2?
//    init(view:UITableViewController) {
//        self.d = (view as! any deleget2)
//    }
  
    
    func delegatEqual(d:deleget2)
    {
        self.d = d
    }
 func   getItems()
    {
        networkF.fetchResult{ myresult in
       
            self.d?.renderdata(result: myresult)
            
        }
    }
    
    
}

