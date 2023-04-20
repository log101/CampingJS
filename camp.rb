require 'camping'
Camping.goes :Nuts

module Nuts::Controllers
    class Index < R '/'
        def get
            @time = Time.now
            render :sundial
        end
    end
end

module Nuts::Views
    def layout
      html do
        head do
          title { "Nuts And GORP" }
        end
        body { self << yield }
      end
    end
  
    def sundial
      p "The current time is: #{@time}"
    end
end