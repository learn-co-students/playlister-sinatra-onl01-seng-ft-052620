module Slugifiable

    module ClassMethods 
        #def find_by_slug(slug)
        #   self.all.map do |i| 
        #       if i.slug == slug 
        #            i 
        #        end 
        #    end.compact.first
        #end

        def find_by_slug(slug)
            self.all.find do |i| 
                if i.slug == slug 
                    i 
                end 
            end
        end
 end 

    module InstanceMethods 
        def slug 
            self.name.split(' ').map do |i| 
                i.downcase
            end.join("-")
        end 
    end 
end 