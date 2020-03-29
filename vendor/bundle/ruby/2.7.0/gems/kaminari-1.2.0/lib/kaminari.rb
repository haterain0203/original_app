# frozen_string_literal: true

require 'kaminari/core'
require 'kaminari/actionview'
require 'kaminari/activerecord'

Kaminari.configure do |config|
    config.page_method_name = :per_page_kaminari
end
