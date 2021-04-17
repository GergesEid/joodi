//
//  calendarTimeViewController.swift
//  JOODI
//
//  Created by Gerges on 16/04/2021.
//

import UIKit

class calendarTimeViewController: UIViewController {
    //"E, d MMM yyyy HH:mm"
    @IBOutlet weak var DataPicker: UIDatePicker!
    @IBOutlet weak var viewOfDate: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var viewOfHeader: UIView!
    
    var formattedDate:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: DataPicker.date)
    }
    var formattedDateDayOfWeek:String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "E"
        return formatter1.string(from: DataPicker.date)
    }
    
    var formattedDateNumberOfDay:String {
        
        let formatterDay = DateFormatter()
        formatterDay.dateFormat = "d"
        return formatterDay.string(from: DataPicker.date)
    }
    
    var formattedDateMonth:String {
        
        let formatterMonth = DateFormatter()
        formatterMonth.dateFormat = "MMM"
        return formatterMonth.string(from: DataPicker.date)
    }
    
    var formattedDateYear:String {
        
        let formatterYear = DateFormatter()
        formatterYear.dateFormat = "yyyy"
        return formatterYear.string(from: DataPicker.date)
    }
    
    var formattedDateHour:String {
        let formatterHour = DateFormatter()
        formatterHour.dateFormat = "HH"
        return formatterHour.string(from: DataPicker.date)
    }
    
    var formattedDateMinute:String {
        let formatterMinute = DateFormatter()
        formatterMinute.dateFormat = "mm"
        return formatterMinute.string(from: DataPicker.date)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUICalender ()
    }
    
    // set ui
    func setUICalender () {
        // make it wheels
        DataPicker.preferredDatePickerStyle = .wheels
        // add corner radius to view
        viewOfDate.layer.cornerRadius = 30
//        viewOfHeader.layer.cornerRadius = 30
        // add corner radius to button
        doneButton.layer.cornerRadius = 10
    }
    
    // dismiss view controller
    @IBAction func dismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        
        // check if time selected is earlier than currentDate
        if date.compare(DataPicker.date) == ComparisonResult.orderedDescending {
            print("myDate is earlier than currentDate")
            self.view.makeToast("Please select time to deliver at least one hour from now",duration: 4.0, position: .center)
        } else {
            print("myDate is not earlier than currentDate")
            NotificationCenter.default.post(name: .saveDate, object: self)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
