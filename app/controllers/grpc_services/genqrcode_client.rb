

module GenqrcodeClient

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'genqrcode_services_pb'

def requestPayment(pix_key, user_id, total_price, hotel_id, check_in, check_out, room_option_id, children_quantity, adults_quantity)
        msg = "#{pix_key} #{user_id} #{"%.2f" % total_price} #{hotel_id} #{check_in} #{check_out} #{room_option_id} #{children_quantity} #{adults_quantity}"
        hostname = 'localhost:50051'
        stub = Genqrcode::GenQrCodeService::Stub.new(hostname, :this_channel_is_insecure)
        begin
            message = stub.generate(::Genqrcode::RequestCode.new(rq: msg)).res
            "#{message}"    
        rescue GRPC::BadStatus => e
            abort "ERROR: #{e.message}"
        end
    end
end