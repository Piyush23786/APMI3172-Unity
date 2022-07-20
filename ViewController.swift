
import UIKit

class ViewController: UIViewController
{
    @IBOutlet var rotateSwitch: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       /* if let appDelegate = UIApplication.shared.delegate as? AppDelegate
        {
            appDelegate.startUnity()
            
            NotificationCenter.default.addObserver(self, selector: #selector(handleUnityReady), name: NSNotification.Name("UnityReady"), object: nil)
        }*/
    }
    
    @objc func handleUnityReady() {
        
        showUnitySubView()
        fatalError()
    }
    
    func showUnitySubView() {
        
        if let unityView = UnityGetGLView() {
            // insert subview at index 0 ensures unity view is behind current UI view
            view?.insertSubview(unityView, at: 0)
            view.backgroundColor = UIColor.red
           unityView.translatesAutoresizingMaskIntoConstraints = false
            let views = ["view": unityView]
            let w = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|", options: [], metrics: nil, views: views)
            let h = NSLayoutConstraint.constraints(withVisualFormat: "V:|-75-[view]-0-|", options: [], metrics: nil, views: views)
            view.addConstraints(w + h)
        }
    }
    
    @IBAction func startUnity(_ sender: UIButton)
    {
        if let unityView = UnityGetGLView()
        {
            unityView.isHidden = false;
        }
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate
        {
            appDelegate.startUnity()
           NotificationCenter.default.addObserver(self, selector: #selector(handleUnityReady), name: NSNotification.Name("UnityReady"), object: nil)
        }
        
    }
    
    @IBAction func stopUnity(_ sender: UIButton)
    {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate
        {
            appDelegate.stopUnity()
            
            if let unityView = UnityGetGLView()
            {
                unityView.isHidden = true;
            }
        }
    }
}
