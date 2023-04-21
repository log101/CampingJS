require "camping"
Camping.goes :Nuts

module Nuts::Models
  class Page < Base
  end

  class BasicFields < V 1.0
    def self.up
      create_table Page.table_name do |t|
        t.string :title
        t.text :content
        t.timestamps
      end
    end

    def self.down
      drop_table Page.table_name
    end
  end
end

module Nuts::Controllers
  class Index < R "/"
    def get
      @pages = Page.find :all
      render :sundial
    end
  end
end

module Nuts::Views
  def layout
    html do
      head { title { "Nuts And GORP" } }
      body { self << yield }
    end
  end

  def sundial
    p "The current time is: #{@time}"
  end
end

def Nuts.create
  Nuts::Models.create_schema
end
