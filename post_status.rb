require "librato/metrics"

`grep SAFE foo`
host_status = $?.exitstatus.to_i
host_name = `hostname -A`.strip
host_ips = `hostname -I`.strip.gsub(/ /, '_')
host_kernel = `uname -a`.strip.gsub(/ /, '_')

user = ENV['LIBRATO_USER'] || 'user'
token = ENV['LIBRATO_TOKEN'] || 'token'

Librato::Metrics.authenticate(user, token)
source = host_name + "__" + host_ips + "__" + host_kernel
source.gsub!(/[^a-zA-Z0-9_\.]/, '__')
queue = Librato::Metrics::Queue.new(source: source) 
queue.add("ih.dirty_c0w.vulnerable" => { "value" => host_status })
begin
  queue.submit
rescue => e
  puts e.inspect
end
