require 'stax/examples/version'

## auto require generators
Dir[File.join(__dir__, '..', 'generators', '**', '*_generator.rb')].map(&method(:require))