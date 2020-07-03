module Slug
    module ClassMethods
        def find_by_slug(slug)
            self.all.find do |obj|
                obj.slug == slug
            end
        end
    end

    module InstanceMethods
        def slug()
            subs = {
                ',' => '',
                "'" => '',
                ' ' => '-',
                '.' => ''
            }
            self.name.downcase.gsub(/\W/,subs)
        end
    end
 
end