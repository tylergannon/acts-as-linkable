module ActsAsLinkable
  module ActiveRecordExtensions
    def acts_as_linkable(opts={}, &block)
      class_eval "def link_attr; #{opts.inspect}; end;"
    end
  end
  
  module ActionViewExtensions
    def link(obj)
      return unless obj
      if (obj.class == Array) || (obj.class == ActiveRecord::Relation)
        obj.map{|v| link(v)}.join(", ")
      else
        p = obj.link_attr
        p[:partial] = "#{obj.class.name.tableize}/link" if p.empty?
        unless p[:partial].nil?
          obj_name = (p[:object_name] ||= obj.class.name.underscore).to_s.to_sym
          render :partial => p[:partial], :locals => {obj_name => obj}
        else
          opts = {}
          link_attr = obj.link_attr
          link_attr.each do |key, val|
            link_attr[key] = obj.send(val) if val.class == Symbol
          end
          opts[:title] = link_attr[:title] if link_attr.has_key?(:title)
          link_to link_attr[:name], obj, opts
        end
      end
    end
  end
end
