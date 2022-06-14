//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Swift Learning on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet weak var lableDay: UILabel!
    @IBOutlet weak var lableMonth: UILabel!
    @IBOutlet weak var lableYear: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var findDayBatton: UIButton!
    
    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findDayBatton.layer.cornerRadius = 5
        resultLable.layer.cornerRadius = 5
        resultLable.layer.masksToBounds = true
        
    }
    
    
    
    @IBAction func findDayButtonPressed(_ sender: UIButton) {
        
        guard let day = dayTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        dateFormater.locale = Locale(identifier: "ru_RU")

        guard let date = calendar.date(from: dateComponents) else { return }
        let weekday = dateFormater.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        resultLable.text = capitalizedWeekday
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

