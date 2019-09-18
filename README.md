PAY.CARDS RECOGNIZER
===================

Installation
------------

##### If you use [CocoaPods](http://cocoapods.org):

```ruby
pod 'PayCardsRecognizer'
```

Basic Usage
------------

```swift
import PayCardsRecognizer

class RecognizerViewController: UIViewController, PayCardsRecognizerPlatformDelegate {

	var recognizer: PayCardsRecognizer!
	
	override func viewDidLoad() {
	    super.viewDidLoad()
	    recognizer = PayCardsRecognizer(delegate: self, resultMode: .sync, container: self.view, frameColor: .green)
	}
	
	override func viewWillAppear(_ animated: Bool) {
	    super.viewWillAppear(animated)
	    
	    recognizer.startCamera()
	}
	    
	override func viewDidDisappear(_ animated: Bool) {
	    super.viewDidDisappear(animated)
	    
	    recognizer.stopCamera()
	}
	
	// PayCardsRecognizerPlatformDelegate
	
	func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
		result.recognizedNumber // Card number
		result.recognizedHolderName // Card holder
		result.recognizedExpireDateMonth // Expire month
		result.recognizedExpireDateYear // Expire year
	}

}
```
