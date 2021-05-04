//
//  WorkoutViewController.swift
//  FUNFIT
//
//  Created by Prasanna Venkatesan on 23/03/2020.
//  Copyright © 2020 Prasanna Venkatesan. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {

    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    let workoutType = [ #imageLiteral(resourceName: "Squats"), #imageLiteral(resourceName: "Side Planks"), #imageLiteral(resourceName: "Squat Jumps"), #imageLiteral(resourceName: "Side Lunges"), #imageLiteral(resourceName: "High Knees"), #imageLiteral(resourceName: "Push Up and Rotate"), #imageLiteral(resourceName: "Shoulder Taps"), #imageLiteral(resourceName: "Wide Push Ups"), #imageLiteral(resourceName: "Dead Bugs"), #imageLiteral(resourceName: "Butt Kicks"), #imageLiteral(resourceName: "Lunges"), #imageLiteral(resourceName: "Wall Sits"),
                        #imageLiteral(resourceName: "Bicycle Crunches"), #imageLiteral(resourceName: "Single Leg Deadlifts"), #imageLiteral(resourceName: "Star Jumps"), #imageLiteral(resourceName: "Leg Raises"), #imageLiteral(resourceName: "Superman"), #imageLiteral(resourceName: "Push Ups"), #imageLiteral(resourceName: "Mountain Climbers"), #imageLiteral(resourceName: "Star Jumps"), #imageLiteral(resourceName: "Crunches"), #imageLiteral(resourceName: "Heel Touches"), #imageLiteral(resourceName: "Burpees"), ]
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutImage.image = #imageLiteral(resourceName: "Instructions-2")
        timerLabel.text = "--"
        // Do any additional setup after loading the view.
    }
   
    @IBAction func beginWorkout(_ sender: UIButton) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WorkoutViewController.action), userInfo: nil, repeats: true)
        goButton.isEnabled = false
        UIApplication.shared.isIdleTimerDisabled = true

    }
    
    @IBAction func pauseWorkout(_ sender: UIButton) {
        timer.invalidate()
        goButton.isEnabled = true
        UIApplication.shared.isIdleTimerDisabled = false

    }
    
    @IBAction func endWorkout(_
        sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        timer.invalidate()
        UIApplication.shared.isIdleTimerDisabled = false

    }
    
    @objc func action() {
        time += 1
        timerLabel.text = String(time)
        if time == 1 {
            workoutImage.image = workoutType[Int.random(in: 0...22)]
        } else if time == 45 {
            timerLabel.text = "Rest"
            workoutImage.image = #imageLiteral(resourceName: "Rest")
        } else if time == 60 {
            timerLabel.text = "Next"
            time = 0
            workoutImage.image = workoutType[Int.random(in: 0...22)]
        }
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
