
import UIKit

class List_Notes: UIViewController {

    private let myTableView = UITableView()
    var filesArray = [String]()
    
    private let btnlogout:UIButton={
        let btn1 = UIButton()
        btn1.setTitle("LOGOUT", for: .normal)
        btn1.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        btn1.layer.cornerRadius = 20
        btn1.addTarget(self, action: #selector(logoutnav), for: .touchUpInside)
        return btn1
        
    }()
    
    private let lbluname : UILabel = {
        let lbl = UILabel()
        lbl.text = UserDefaults.standard.string(forKey: "username")!
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"ArialRoundedMTBold", size: 15.0)
        lbl.textColor = .white
        return lbl
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filesArray = FileManagerService.getFiles()
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myTableView)
        setupTableView()
        view.addSubview(btnlogout)
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(SeeNotes))
        navigationItem.setRightBarButton(addItem, animated: true)
        view.addSubview(lbluname)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        myTableView.frame = CGRect(x: 0, y: 70, width:view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 100)
        btnlogout.frame = CGRect(x: 135, y: 600, width: 100, height: 50)
        lbluname.frame = CGRect(x: 20, y: 60, width: 100, height: 30)
    }
    
}

extension List_Notes :UITableViewDataSource,UITableViewDelegate {
    
    private func setupTableView()
    {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "NotesCell")
        let a = FileManagerService.getFiles();
        print("All Files in Controller : ", a)
    }
    
    @objc func SeeNotes()
    {
        let newNote = Add_Notes()
        navigationController?.pushViewController(newNote, animated: true)
    }
    
    @objc func logoutnav()
    {
        let newNote = Login()
        navigationController?.pushViewController(newNote, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        let notes = filesArray[indexPath.row]
        cell.textLabel?.text = "\(notes)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let existNote = Add_Notes()
        existNote.Notes = filesArray[indexPath.row]
        navigationController?.pushViewController(existNote, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let vc = Add_Notes()
        vc.deleteNote(name: filesArray[indexPath.row])
        filesArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}


