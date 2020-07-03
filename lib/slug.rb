module Slug

    def slug(name)
        # spaces, commas, periods, apostraphes
        subs = {
            ',' => '',
            "'" => '',
            ' ' => '-',
            '.' => ''
        }
        name.gsub(/\W/,subs)
    end

    def find_by_slug(slug)
        self.all.select do |i|
            self.slug(i.name)==slug
        end
    end
    
end