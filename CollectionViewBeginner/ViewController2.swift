//
//  ViewController2.swift
//  CollectionViewBeginner
//
//  Created by IwasakIYuta on 2021/07/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var collectionValueLabel: UILabel!
    var collectionValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionValueLabel.text = collectionValue + "がタップされたらしいよ"
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
