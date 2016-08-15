//
//  BaseViewController.swift
//  ALLEarn
//
//  Created by gophermosaic on 8/9/2559 BE.
//  Copyright © 2559 o.aigledev.allearn. All rights reserved.
//

import UIKit


@objc(BaseViewController)

class BaseViewController: UIViewController {
    var component: [UIView] = []
    
   var titleColor = UIColor.whiteColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        initLanguage()
        initView()
        initData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillAppear(animated)
    }
    
    func disableTransparantNavigationBar(){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func initLanguage(){
        
    }
    
    func initView(){
        
    }
    
    func initData(){
        
    }
    
    func goBack(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func disableLeftBarButton(){
        self.navigationItem.leftBarButtonItem = nil
    }
    
    func disableRightBarButton(){
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func setRightBarButtonImage(imageName : String)
    {
        self.navigationItem.rightBarButtonItem?.image = UIImage(named: imageName)
    }
    
    func setNavigation(){
        //        setNavigationTransparent()
        setFontTitleBar()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer!.enabled = true
        self.navigationController?.interactivePopGestureRecognizer!.delegate = nil
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BaseViewController.leftBarButtonAction))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_icon"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BaseViewController.rightBarButtonAction))
        //        self.navigationItem.rightBarButtonItem?.tintColor = ColorManager.getGrayBack()
        //        self.navigationItem.leftBarButtonItem?.tintColor = ColorManager.getGrayBack()
    }
    
    func leftBarButtonAction(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func rightBarButtonAction(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    //
    //    func alertDialogMessage(title : String,message : String){
    //        let alert = UIAlertController(title:title   , message:message, preferredStyle: UIAlertControllerStyle.Alert)
    //        var ok = ""
    //
    //        ok = LanguageManager.getInstance().getArray(.AlertDialog)[2] as! String
    //
    //        alert.addAction(UIAlertAction(title: ok, style: UIAlertActionStyle.Default, handler: { (action) -> Void in
    //
    //        }))
    //        self.presentViewController(alert, animated: true, completion: nil)
    //    }
    //
    //    func alertMessageWithResponse(message : String,controller: UIViewController , response : ()-> Void, cancel : ()->Void){
    //        let alert = UIAlertController(title:""   , message:message, preferredStyle: UIAlertControllerStyle.Alert)
    //        var ok = ""
    //        ok = LanguageManager.getInstance().getArray(.AlertDialog)[0] as! String
    //
    //        alert.addAction(UIAlertAction(title: ok, style: UIAlertActionStyle.Default, handler: { (action) -> Void in
    //            response()
    //        }))
    //
    //        UIApplication.sharedApplication().keyWindow?.rootViewController?.dismissViewControllerAnimated(false, completion: nil)
    //        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    //    }
    //
    
    override func setFontTitleBar(){
        let font : UIFont?
        font = UIFont(name: "SukhumvitSet-SemiBold", size: 18)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: titleColor,NSFontAttributeName: font!]
    }
    
    //
    private func setNavigationTransparent(){
        let navigationBar = navigationController!.navigationBar
        navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationBar.shadowImage = UIImage()
        navigationBar.translucent = true
    }
    //
    //    func setupKeyboard(view :[UIView]) {
    //        self.component = view
    //        for i in 0..<component.count {
    //
    //            component[i].addPreviousNextDoneOnKeyboardWithTarget(self, previousAction:  Selector("previousAction:"), nextAction: Selector("nextAction:"), doneAction: Selector("doneAction:"), addAction : Selector("addAction:") , removeAction: Selector("removeAction:"))
    //
    //            if i == 0
    //            {
    //                component[i].setEnablePrevious(false, next: true)
    //            }
    //            if i == (component.count - 1) {
    //                component[i].setEnablePrevious(true, next: false)
    //            }
    //
    //            //            if( component[i].isKindOfClass(UITextField))
    //            //            {
    //            //                let item = component[i] as? UITextField
    //            //                item?.addTarget(self, action: "OntextFieldTap:", forControlEvents: UIControlEvents.EditingDidBegin)
    //            //            }
    //        }
    //    }
    
    var currentTextField : UITextField?
    func OntextFieldTap(sender :UITextField) {
        currentTextField = sender
    }
    
    func previousAction(sender: UITextField!) {
        for i in 1..<component.count
        {
            if(component[i].isFirstResponder())
            {
                component[i-1].becomeFirstResponder()
                break
            }
        }
    }
    
    func nextAction(sender: UITextField!) {
        for i in 0..<component.count-1
        {
            if(component[i].isFirstResponder())
            {
                component[i+1].becomeFirstResponder()
                break
            }
        }
    }
    
    func doneAction(sender: UITextField!) {
        hideKeyboard()
    }
    
    func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    func isEmail(text : String) -> Bool{
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(text)
    }
    
}
