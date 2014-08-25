class MasterViewController < UITableViewController
  def title; 'Master'; end

  def viewDidAppear(animated)
    super

    NSNotificationCenter.defaultCenter.addObserverForName(
      'NewRowNotification',
      object: nil,
      queue: nil,
      usingBlock: -> (notification) {
        @data << notification.userInfo['text']
        tableView.reloadData
      }
    )
  end

  def tableView(table_view, numberOfRowsInSection: section)
    data.count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = table_view.dequeueReusableCellWithIdentifier('my_cell') || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: 'my_cell')
    end

    cell.textLabel.text = data[index_path.row]

    cell
  end

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    navigationController.pushViewController(DetailViewController.new, animated: true)
  end

  private

  def data
    @data ||= ['One', 'Two', 'Three']
  end
end
