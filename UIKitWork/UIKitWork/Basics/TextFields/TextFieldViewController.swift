import UIKit

class TextFieldViewController: UIViewController {
    
    private var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter text"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.returnKeyType = .search
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textField.delegate = self
        textField.addTarget(self, action: #selector(onEditingChanged), for: .editingChanged)
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
    }
    
    @objc func onEditingChanged(_ sender: UITextField) {
        print("DEBUG: Text field text is \(sender.text)")
    }
    
}

extension TextFieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("DEBUG: return key tapped..")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DEBUG: Text field did begin editing...")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DEBUG: Text field did end editing...")
    }
}
#Preview {
    TextFieldViewController()
}
