
class StoreApp
  def call(env)
    x = Builder::XmlMarkup.new :indent=>2
 
    x.declare! :DOCTYPE, :html
    x.html do
      x.head do
        x.title 'EASY MUSIC MARKET'
      end
      x.body do
        x.h1 'MUSICAL MARKET'
 
        Product.all.each do |product|
          x.h2 product.title
          x << "      #{product.description}\n"
          x.p product.price
        end
      end
    end
 
    response = Rack::Response.new(x.target!)
    response['Content-Type'] = 'text/html'
    response.finish
  end
end
