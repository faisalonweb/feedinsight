
import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI


class NewRumiViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var newrumicol: UICollectionView!
    @IBOutlet weak var userprofile: UILabel!
    @IBOutlet weak var personname: UILabel!
    @IBOutlet weak var personimage: UIImageView!
    @IBOutlet weak var notiimage: UIImageView!
    
    
    let defaults = UserDefaults(suiteName:"User")
    let textArr = ["Ruminants","Aqua","Equines","Poultry"]
    let imageArr: [UIImage] = [
        UIImage(named: "ruminants")!,
        UIImage(named: "aqua")!,
        UIImage(named: "equines")!,
        UIImage(named: "chicken")!,
        UIImage(named: "equines")!,
        UIImage(named: "ruminants")!,
    ]
    var animalData = [AnimalCollectionCell]()
    var portait:CGFloat=0
    var landscap:CGFloat=0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.personname.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                let data = self?.defaults!.value(forKey: "imageData") as? Data
                if(data != nil) {
                    self?.personimage.image = UIImage(data: data!)
                }
            }
        }
        if(UIScreen.main.bounds.width < 415)
        {
            getScreenSize()
            print("h11")
            print("zise is : ", UIScreen.main.bounds.width)
            let itemSize = UIScreen.main.bounds.width/3 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 25 , height: itemSize + 25 )
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 20
            newrumicol.collectionViewLayout = layout
            portait = UIScreen.main.bounds.width
            landscap = UIScreen.main.bounds.height
        }
        else
        {
            getScreenSize()
            print("h12")
            print("zise is : ", UIScreen.main.bounds.width)
            let itemSize = UIScreen.main.bounds.width/4 - 2
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: itemSize + 25, height: itemSize + 25)
            layout.minimumInteritemSpacing = 2
            layout.minimumLineSpacing = 20
            newrumicol.collectionViewLayout = layout
            landscap = UIScreen.main.bounds.width
            portait = UIScreen.main.bounds.height
        }
    }
    var screenWidth:CGFloat=0
    var screenHeight:CGFloat=0
    var sizee:CGFloat=0
    func getScreenSize(){
        screenWidth=UIScreen.main.bounds.width
        screenHeight=UIScreen.main.bounds.height
        print("SCREEN RESOLUTION: "+screenWidth.description+" x "+screenHeight.description)
        sizee = screenWidth
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            getScreenSize()
            var screenHeight1:CGFloat=0
            screenHeight1 = UIScreen.main.bounds.width
            if(screenHeight1 == portait)
            {
                print("h11111")
                print("zise did not changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.width/3 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 25, height: itemSize + 25)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                newrumicol.collectionViewLayout = layout
            }
            if(screenHeight1 == landscap)
            {
                getScreenSize()
                print("h1")
                print("zise is changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.width/4 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 25, height: itemSize + 25)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                newrumicol.collectionViewLayout = layout
                getScreenSize()
            }
        } else {
            var screenHeight2:CGFloat=0
            screenHeight2 = UIScreen.main.bounds.width
            getScreenSize()     ///yeh galta hota h
            if(screenHeight2 == portait)
            {
                print("h111")
                print("zise did not changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.width/4 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 25, height: itemSize + 25)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                newrumicol.collectionViewLayout = layout
                getScreenSize()
            }
            if(screenHeight2 == landscap)
            {
                print("Portrait")
                print("screenHeight2 : ", screenHeight2)
                getScreenSize()
                print("h2")
                print("zise is changed : ", UIScreen.main.bounds.width)
                let itemSize = UIScreen.main.bounds.height/3 - 2
                let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: itemSize + 25, height: itemSize + 25)
                layout.minimumInteritemSpacing = 2
                layout.minimumLineSpacing = 20
                newrumicol.collectionViewLayout = layout
            }
        }
    }
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.personimage.addGestureRecognizer(tapOnImage)
        self.personimage.isUserInteractionEnabled = true
        super.viewDidLoad()
        
        //animalData = DataAppend.getAllAnimalData()
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        newrumicol.delegate = self
        newrumicol.dataSource = self
        
        notiimage?.layer.cornerRadius = (notiimage?.frame.size.width ?? 0.0) / 2
        notiimage?.clipsToBounds = true
        notiimage?.layer.borderWidth = 3.0
        notiimage?.layer.borderColor = UIColor.white.cgColor

        personimage?.layer.cornerRadius = (personimage?.frame.size.width ?? 0.0) / 2
        personimage?.clipsToBounds = true
        personimage?.layer.borderWidth = 3.0
        personimage?.layer.borderColor = UIColor.white.cgColor

    }
    
    @IBAction func backbtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @objc func tapOnImageAction() {

        self.tabBarController?.selectedIndex = 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewRumiCollectionViewCell", for: indexPath) as! NewRumiCollectionViewCell
        
        cell.rumiimage.image = imageArr[indexPath.row]
        cell.rumilabel.text = textArr[indexPath.row]
        if(indexPath.row > 0) {
            cell.contentView.layer.opacity = 0.3;
            cell.isUserInteractionEnabled = false
        }
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RuminantspickViewController") as? RuminantspickViewController
        vc?.titlename = textArr[indexPath.row]
        vc?.titleImage = imageArr[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

