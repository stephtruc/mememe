//
//  MemeDetailViewController.swift
//  ImagePickerTestforMeMe
//
//  Created by Stephanie Truchan on 5/23/15.
//  Copyright (c) 2015 Stephanie Truchan. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var meme: Meme!
    
    @IBOutlet weak var detailMemeImage: UIImageView!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMemeImage.image = meme.memedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
