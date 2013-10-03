class StaticPage < ActiveRecord::Base
  attr_accessible :about, :blog, :contact, :faq, :help, :home, :privacy, :terms
end
