//
//  ThemeChooserViewController.swift
//  Concentration-Assignment1
//
//  Created by Shakaib Akhtar on 20/08/2019.
//  Copyright © 2019 iParagons. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {

    var themes = [
        "Flags" : ["🇧🇷", "🇧🇪", "🇯🇵", "🇨🇦", "🇺🇸", "🇵🇪", "🇮🇪", "🇦🇷"],
        "Faces" : ["😀", "🙄", "😡", "🤢", "🤡", "😱", "😍", "🤠"],
        "Sports" : ["🏌️", "🤼‍♂️", "🥋", "🏹", "🥊", "🏊", "🤾🏿‍♂️", "🏇🏿"],
        "Animals" : ["🦊", "🐼", "🦁", "🐘", "🐓", "🦀", "🐷", "🦉"],
        "Fruits" : ["🥑", "🍍", "🍆", "🍠", "🍉", "🍇", "🥝", "🍒"],
        "Appliances" : ["💻", "🖥", "⌚️", "☎️", "🖨", "🖱", "📱", "⌨️"]
    ]
    
    @IBAction func ChooseTheme(_ sender: UIButton) {
        performSegue(withIdentifier: "Choose Theme", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Choose Theme") {
            if let theme = (sender as? UIButton)?.currentTitle {
                if let destination = segue.destination as? GameViewController {
                    destination.theme = themes[theme]!
                }
            }
        }
    }
}
