//
//  Add_Notes.swift
//  Assignment_10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Add_Notes: UIViewController {
    var Notes:String?
    
    private let lbltitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "ADD NOTES"
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"ArialRoundedMTBold", size: 20.0)
        lbl.textColor = .white
        return lbl
    }()
    private let FileName : UITextField = {
        let lbl = UITextField()
        lbl.text = "File Name"
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"ArialRoundedMTBold", size: 15.0)
        lbl.textColor = .white
        return lbl
    }()
    
    private let txtsname : UITextView = {
        let txt = UITextView()
       // txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.layer.cornerRadius = 20
        txt.backgroundColor = .white
        return txt
    }()
    
    private let btnsave:UIButton={
        let btn1 = UIButton()
        btn1.setTitle("SAVE", for: .normal)
        btn1.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        btn1.layer.cornerRadius = 10
        btn1.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        return btn1
        
    }()
    @objc private func saveNote() {
        let name = FileName.text!
        let content = txtsname.text!
        let filePath = FileManagerService.getDocDir().appendingPathComponent("\(name).txt")
        
        do {
            try  content.write(to: filePath, atomically: true, encoding: .utf8)
            
        }catch {
            print(error)
        }
    }
    
    public func deleteNote(name: String) {
        let filePath = FileManagerService.getDocDir().appendingPathComponent("\(name)")
        
        do {
            try  FileManager.default.removeItem(at: filePath)
            
        }catch {
            print(error)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do{
            if let file = Notes {
                FileName.text = file
                let filePath = FileManagerService.getDocDir().appendingPathComponent("\(file)")
                let fetchedContent = try String(contentsOf: filePath)
                txtsname.text = fetchedContent
                print(fetchedContent)
                print(filePath)
            }
        } catch {
            print(error)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bglogin.jpeg")!)
        view.addSubview(lbltitle)
        view.addSubview(txtsname)
        view.addSubview(FileName)
        view.addSubview(btnsave)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbltitle.frame=CGRect(x: 20, y: 80, width:view.frame.size.width-40, height: 30)
        FileName.frame = CGRect(x: 20, y: 120, width: view.frame.size.width-40 , height: 30)
        txtsname.frame=CGRect(x: 20, y: 160, width:view.frame.size.width-40, height: 200)
        btnsave.frame = CGRect(x: 120, y: 380, width: 130, height: 40)
    }


}
