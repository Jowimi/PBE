require 'ruby-nfc'
class Rfid

@@uid2=0
@@uid=0	


  def read_uid
	
    @@readers = NFC::Reader.all
    @@readers[0].poll(Mifare::Classic::Tag) do |tag|
		
		
    begin
      @@uid2 = @@uid
      @@uid = tag.uid_hex.upcase
			
    end                    
    end
  end
	
  def return_uid2
    uid2 = @@uid2.to_s
    return uid2
  end	
  
	
end
