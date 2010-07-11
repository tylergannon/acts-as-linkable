# ActsAsLinkable
require 'acts_as_linkable_core'
ActiveRecord::Base.extend(ActsAsLinkable::ActiveRecordExtensions)
ActionView::Base.send :include, ActsAsLinkable::ActionViewExtensions


