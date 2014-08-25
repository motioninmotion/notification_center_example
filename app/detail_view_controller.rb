class DetailViewController < UIViewController
  def loadView
    self.view = UIScrollView.new
  end

  def viewDidLoad
    view.backgroundColor = UIColor.redColor

    view.addSubview(@text_field = UITextField.new)
    @text_field.frame = [[20, 20], [280, 50]]
    @text_field.placeholder = "What to notify with…"
    @text_field.backgroundColor = UIColor.whiteColor
    @text_field.textAlignment = NSTextAlignmentCenter

    view.addSubview(@button = UIButton.new)
    @button.frame = [[20, 100], [280, 50]]
    @button.backgroundColor = UIColor.blackColor
    @button.setTitle('Notify Master!', forState: UIControlStateNormal)
    @button.addTarget(self, action: 'notify_pressed:', forControlEvents: UIControlEventTouchUpInside)
  end

  def notify_pressed(sender)
    NSNotificationCenter.defaultCenter.postNotificationName(
      'NewRowNotification',
      object: self,
      userInfo: {
        'text' => @text_field.text
      }
    )

    @text_field.text = ''
  end
end
