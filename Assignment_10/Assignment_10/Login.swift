
import UIKit

class Login: UIViewController {


    
    private let lbltitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "LogIn"
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"ArialRoundedMTBold", size: 20.0)
        lbl.textColor = .white
        return lbl
    }()
    private let txtuname : UITextField = {
        let txt = UITextField()
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.layer.cornerRadius = 6
        txt.placeholder = "Enter User Name"
        txt.textAlignment = .center
        return txt
    }()
    private let txtupass : UITextField = {
        let txt = UITextField()
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.layer.cornerRadius = 6
        txt.placeholder = "Enter Password"
        txt.textAlignment = .center
        return txt
    }()
    
    private let btnlogin:UIButton={
        let btn1 = UIButton()
        btn1.setTitle("Login", for: .normal)
        btn1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        btn1.layer.cornerRadius = 20
        btn1.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        return btn1
        
    }()
    
    @objc func navigate(){
        
        if(txtuname.text == "Admin" && txtupass.text == "Admin")
        {
            UserDefaults.standard.setValue("Admin", forKey: "username")
            let c = List_Notes()
            navigationController?.pushViewController(c, animated: true)
            //present(c,animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bglogin.jpeg")!)
        view.addSubview(txtuname)
        view.addSubview(txtupass)
        view.addSubview(btnlogin)
        view.addSubview(lbltitle)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lbltitle.frame = CGRect(x: 120, y: 200, width: 130, height: 40)
        txtuname.frame = CGRect(x: 50, y: 240, width: view.frame.size.width-100, height: 45)
        txtupass.frame = CGRect(x: 50, y: 295, width: view.frame.size.width-100, height: 45)
        btnlogin.frame = CGRect(x: 50, y: 350, width: view.frame.size.width-100, height: 45)
        
        
    }


}
