//
//  WaterTracker.swift
//  Water Tracker
//
//  Created by Talha VAROL on 09/03/22.
//
//

import UIKit

class WaterTrackerController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var addWaterCons: NSLayoutConstraint!
    
    // MARK: - Properties
    
    
    var waterStore = DataStore()
    let targetAmount = 2700.0
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateApperanca()
    }
    @IBAction func addWaterOne(_ sender: UIButton) {
        
        var waterAmount = 0.0
        
        switch sender.tag {
        case 0:
            waterAmount = 200
        case 1:
            waterAmount = 500
        case 2:
            waterAmount = 800
        default:
            break
        }
        waterStore.addWater(amount: waterAmount)
        updateApperanca()
    }
    
 //MARK: - Functions
    
    func updateWaterLabel(amount: Double){
        let screenHeight = Double(view.frame.size.height)
        let ratio = amount / targetAmount
        let calculatedHeight = screenHeight * ratio
        
        addWaterCons.constant = CGFloat(calculatedHeight)
        
        UIViewPropertyAnimator.init(duration: 0.5, dampingRatio: 0.75) {
            self.view.layoutIfNeeded()
        }.startAnimation()
        
    }
    
    func updateLabel(amount: Double){
        let amountToTarget = (targetAmount - amount) / 1000
        if amount < targetAmount{
            let subtitleText = String(format: "Bugünkü ihtiyacını karşılamak için \n%g litre daha su içmelisin", amountToTarget)
            subTitleLabel.text = subtitleText
            
            if amount ==  0 {
                titleLabel.text = "Merhaba! \nBugün su içtin mi?"
            }else{
                titleLabel.text = "Tebrikler! \nDoğru yoldasın."
            }
        }else{
            titleLabel.text = "Muhteşem! \nYeteri kadar su içtin."
            subTitleLabel.text = "Bugün için yeterli miktarda su içtin."
        }
    }
    
    func updateApperanca(){
        
        let currentWaterAmount = waterStore.getCurrentAmount()
        
        updateLabel(amount: currentWaterAmount)
        updateWaterLabel(amount: currentWaterAmount)
        
    }
    
 
    

    
    
    
}
