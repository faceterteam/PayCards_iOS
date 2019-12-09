Pod::Spec.new do |spec|
  spec.name             = 'PayCardsRecognizer'
  spec.version          = '1.1.7'
  spec.license          = { type: 'MIT', file: 'LICENSE.md' }
  spec.homepage         = 'https://pay.cards'
  spec.authors          = { 'PAY.CARDS' => 'support@pay.cards' }
  spec.summary          = 'Bank card recognizer for mobile apps'
  spec.social_media_url = 'https://twitter.com/Pay_Cards'
  spec.source           = { :git => 'https://github.com/faceterteam/PayCards_iOS.git', :tag => "#{spec.version}" }
  spec.platform         = :ios, '8.0'
  spec.ios.deployment_target = '8.0'
  spec.requires_arc     = true
  spec.vendored_frameworks = 'Source/PayCardsRecognizer.framework'
end
