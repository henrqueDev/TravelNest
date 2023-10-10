

module GenqrcodeClient

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'genqrcode_services_pb'

def requestPayment()
        msg = ARGV.size > 0 ?  ARGV[0] : '200R$ 2000/01'
        hostname = ARGV.size > 1 ?  ARGV[1] : 'localhost:50051'
        stub = Genqrcode::GenQrCodeService::Stub.new(hostname, :this_channel_is_insecure)
        begin
            message = stub.generate(::Genqrcode::RequestCode.new(rq: msg)).res
            puts "Url Pagamento -> #{message}"
        rescue GRPC::BadStatus => e
            abort "ERROR: #{e.message}"
        end
    end
end