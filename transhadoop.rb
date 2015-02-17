#!/usr/bin/env ruby

# coding: uitf-8

require 'bundler'

Bundler.require

remotehost="localhost"
remoteuser="dev"
remotepasswd="dev123"


Net::SCP.download!(remotehost, remoteuser,  ARGV[0], ".",
                   :ssh => { :password => remotepasswd })
