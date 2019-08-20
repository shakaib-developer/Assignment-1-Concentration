//
//  ThemeChooserViewController.swift
//  Concentration-Assignment1
//
//  Created by Shakaib Akhtar on 20/08/2019.
//  Copyright © 2019 iParagons. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {

    var themes: [String: (themeEmojis: [String], viewBGColor: UIColor, cardBGColor: UIColor)] = [
        "Flags" : (themeEmojis: ["🇧🇷", "🇧🇪", "🇯🇵", "🇨🇦", "🇺🇸", "🇵🇪", "🇮🇪", "🇦🇷"], viewBGColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), cardBGColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)),
        "Faces": (themeEmojis: ["😀", "🙄", "😡", "🤢", "🤡", "😱", "😍", "🤠"], viewBGColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), cardBGColor: #colorLiteral(red: 1, green: 0.894480437, blue: 0.00936337649, alpha: 1)),
        "Sports": (themeEmojis: ["🏌️", "🤼‍♂️", "🥋", "🏹", "🥊", "🏊", "🤾🏿‍♂️", "🏇🏿"], viewBGColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardBGColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
        "Animals": (themeEmojis: ["🦊", "🐼", "🦁", "🐘", "🐓", "🦀", "🐷", "🦉"], viewBGColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardBGColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
        "Fruits": (themeEmojis: ["🥑", "🍍", "🍆", "🍠", "🍉", "🍇", "🥝", "🍒"], viewBGColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), cardBGColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        "Appliances": (themeEmojis: ["💻", "🖥", "⌚️", "☎️", "🖨", "🖱", "📱", "⌨️"], viewBGColor: #colorLiteral(red: 1, green: 0.894480437, blue: 0.00936337649, alpha: 1), cardBGColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    ]
    
    @IBAction func ChooseTheme(_ sender: UIButton) {
        performSegue(withIdentifier: "Choose Theme", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Choose Theme") {
            if let themeName = (sender as? UIButton)?.currentTitle {
                if let destination = segue.destination as? GameViewController, let selectedTheme = themes[themeName] {
                    destination.theme = selectedTheme.themeEmojis
                    destination.viewBGColor = selectedTheme.viewBGColor
                    destination.cardBGColor = selectedTheme.cardBGColor
                }
            }
        }
    }
}
