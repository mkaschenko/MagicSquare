require File.expand_path('../../test_helper', __FILE__)

describe 'InterfaceController' do
  tests InterfaceController
  
  # If necessary, you can setup custom objects for the ib_outlets defined in the class.
  # Note however that by using 'tests InterfaceController' all the outlets will get stubbed
  # with stubs that respond to every message with nil.
  #
  # def after_setup
  #   ib_outlets :window => mock("Main Window"),
  #              :tableView => OSX::NSTableView.alloc.init,
  #              :searchField => OSX::NSSearchField.alloc.init
  # 
  #   window.stubs(:title => 'Main Window')
  #   tableView.addTableColumn OSX::NSTableColumn.alloc.init
  #   searchField.stringValue = "foo"
  # end
  
  it "should initialize" do
    controller.should.be.an.instance_of InterfaceController
  end
  
  it "should do stuff at awakeFromNib" do
    # Some example code of testing your #awakeFromNib.
    #
    # controller.ib_outlet(:some_text_view).expects(:string=).with('foo')
    
    controller.awakeFromNib
  end
end