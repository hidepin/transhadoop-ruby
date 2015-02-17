#!/usr/bin/env ruby

# coding: uitf-8

require 'bundler'
require 'net/http'

Bundler.require

remotehost="127.0.0.1"
remoteuser="dev"
remotepasswd="dev123"
httpfshost="127.0.0.1"
httpfsport=14000
httpfsuser="hadoop"

remotefile = ARGV[0]
hadoopfile = ARGV[1]

Net::SCP.download!(remotehost, remoteuser,  remotefile, ".",
                   :ssh => { :password => remotepasswd })

file = File.open(File.basename(remotefile))
http = Net::HTTP.start(httpfshost, httpfsport)
response = http.put("/webhdfs/v1#{hadoopfile}?user.name=#{httpfsuser}&op=create&data=true", file.read, {'content-type' => 'application/octet-stream'})
puts response
