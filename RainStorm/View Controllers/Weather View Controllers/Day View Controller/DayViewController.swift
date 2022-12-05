//
//  DayViewController.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/3/22.
//

import UIKit

final class DayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //setup  view
        setupView()
    }
    
    private func setupView() {
        //configure view
        view.backgroundColor = .green
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
