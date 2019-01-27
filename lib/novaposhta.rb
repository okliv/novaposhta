require 'json'
require 'active_support'
require 'novaposhta/version'
require 'novaposhta/core_classes_addons'
require 'novaposhta/base'
require 'novaposhta/address'
require 'novaposhta/internet_document'
require 'novaposhta/counterparty'
require 'novaposhta/contact_person'
require 'uri'
require 'net/http'

module Novaposhta
  def self.configure
    yield base_class
  end

  def self.base_class
    Base
  end
end

require 'playground'
