
require "gtk3"
require_relative "Rfid"



class Window < Gtk::Window
	
  def initialize 
    super
		
  @box = Gtk::Box.new(:vertical,7)
  @label = Gtk::Label.new("Insertar tarjeta")
  @label2 = Gtk::Label.new("")
  @clear = Gtk::Button.new(:label => "Volver a escanear")
  @repeat = Gtk::Button.new(:label => "Ver anterior uid")
		 
  set_title("Scan_23")
  set_size_request(1000,500)
  set_border_width(7)
  set_window_position(:center)
		
		
  signal_connect("delete-event") {Gtk.main_quit}
		
		
  add(@box)
		
  
 @box.pack_start(@label2,:expand=> true,:fill=> true,:padding=>0)
 
  @box.pack_start(@repeat,:expand=> true,:fill=> true,:padding=>0)
  
  @box.pack_start(@label,:expand=> true,:fill=> true,:padding=>0)
  
  @box.pack_start(@clear,:expand=> true,:fill=> true,:padding=>0)
  
  @label.override_background_color(0,Gdk::RGBA::new(0,0,2,1))
  
  @label.override_color(0,Gdk::RGBA::new(1,1,1,1))
  
  @label2.override_background_color(0,Gdk::RGBA::new(0,0,0,0))
  
  @label2.override_color(0,Gdk::RGBA::new(1,1,1,1))
		
		
    @clear.signal_connect("clicked") do
      change_label('Insertar tarjeta','blue')
      change_label2('grey')
    end
      
    @repeat.signal_connect("clicked") do
      change_label2('blue')
	end
  end
	
	
				
  def change_label(text, color)
	
    @label.set_markup(text)
    if (color == 'blue')
      @label.override_background_color(0,Gdk::RGBA::new(0,0,1,1))
    end
    if (color == 'red')
      @label.override_background_color(0,Gdk::RGBA::new(1,0,0,3))
    end
  end

  def change_label2(color)
	
    rf = Rfid.new
    uid2 = rf.return_uid2
		
		
    if (color == 'blue')
      @label2.set_markup(uid2.to_s)
      @label2.override_background_color(0,Gdk::RGBA::new(0,0,0,1))
    end
    if (color == 'grey')
      @label2.set_markup('.     .     .')
      @label2.override_background_color(0,Gdk::RGBA::new(0,0,0,0))
    end
  end

end
