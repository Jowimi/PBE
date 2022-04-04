require_relative 'Window.rb'
require "thread"
require "ruby-nfc"


rf = Rfid.new
window = Window.new
window.show_all

thr = Thread.new{
  while true do
  
    uid = rf.read_uid
    window.change_label("Uid: " + uid, 'red')
    
    
  end

}
window.signal_connect("delete-event") {
  Gtk.main_quit
  thr.kill
}
Gtk.main
thr.join
