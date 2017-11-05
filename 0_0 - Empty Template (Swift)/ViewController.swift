/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_0 - Empty Template (Swift)
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	11/12/15
 * 	@last rev	x
 *
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;

        optDemo_addButton(self.view);
        makeAMonsterousLabel(self.view);
        
        print("ViewController.viewDidLoad():       viewDidLoad() complete");
        
        //listen to 'Home' press
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                                         name: UIApplicationWillResignActiveNotification,
                                                         object: nil);
    
        return;
    }


    func applicationWillResignActive(notification: NSNotification) {
        print("I'm out of focus, home was pressed!");
        return;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();

        return;
    }

    
    func optDemo_addButton(view:UIView) {
        
        let button      : UIButton  = UIButton(type: UIButtonType.System) as UIButton;
        let buttonWidth : CGFloat   = 300;
        
        button.frame = CGRectMake(self.view.center.x-(buttonWidth/2), 100, buttonWidth, 50);

        
        button.backgroundColor = UIColor.greenColor()
        
        button.setTitle("Test Button", forState: UIControlState.Normal);
  
        button.addTarget(self, action: #selector(ViewController.myButton_response(_:)), forControlEvents:  .TouchUpInside);

        view.addSubview(button);
        
        print("ViewController.optDemo_addButton(): Button added");
        
        return;
    }
    

    func makeAMonsterousLabel(view:UIView) {
        
        let myFirstLabel  = UILabel();

        myFirstLabel.text          = "I made a label on the screen #toogood4you";
        myFirstLabel.font          = UIFont(name: "MarkerFelt-Thin", size: 45);
        myFirstLabel.textColor     = UIColor.redColor();
        myFirstLabel.textAlignment = .Center;

        //text-wrap
        myFirstLabel.numberOfLines = 0;
        myFirstLabel.lineBreakMode = .ByWordWrapping;
        
        myFirstLabel.frame = CGRectMake((self.view.center.x - 150), 200, 300, 500);
        
        myFirstLabel.backgroundColor = UIColor.grayColor();
        
        view.addSubview(myFirstLabel);

        return;
    }
    
    
/*    func pressed(sender: UIButton!) {
        let alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
        
        return;
    }
*/
    
    func myButton_response(sender: UIButton!) {

        print("Button Response fired. Game on!");
        
        return;
    }
}



