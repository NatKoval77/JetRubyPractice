module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp.upcase!
      verb.downcase == 'q' ? (puts("Return to start menu..."); break) 
      : right_words = ["GET", "POST", "PUT", "DELETE"]
      right_words.include?(verb) ? action = nil : (puts("Wrong verb"); next)
      
      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp.downcase

        (puts("Return to main menu..."); next) if action == 'q'
      end
      
      if action.nil? || action.empty?
        verb == 'GET' ? puts("Need to blank line!") : routes[verb].call
      else
        routes[verb][action].nil? ? puts("Wrong action!") : routes[verb][action].call
      end

    end

  end
end

class PostsController
  extend Resource

  def initialize
    @posts = ["test zero", "test one"]
  end

  def index
    puts 'index'
    @posts.length.times.with_index do |index|
      puts("#{index}. #{@posts[index]}")
    end
  end

  def show
    puts 'show'
    print "Enter the index of post to need show "
    index = gets.chomp.to_i
    index < @posts.length ? puts("#{index}. #{@posts[index]}") 
    : puts("Out of range (#{@posts.length})! Please try again.")
  end

  def create
    puts 'create'
    print "Enter the text of new post "
    text = gets.chomp
    @posts.append(text)
    puts("#{@posts.find_index(text)}. #{@posts[@posts.find_index(text)]}")
  end

  def update
    puts 'update'
    print "Enter the index of post to need update "
    index = gets.chomp.to_i
    if index < @posts.length
      print "Enter the new text of post "
      text = gets.chomp
      @posts[index] = text
      puts("#{index}. #{@posts[index]}")
    else
      puts("Out of range (#{@posts.length})! Please try again.")
    end
  end

  def destroy
    puts 'destroy'
    print "Enter the index of post to need delete "
    index = gets.chomp.to_i
    index < @posts.length ? @posts.delete(@posts[index])
    : puts("Out of range (#{@posts.length})! Please try again.")
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      case choise
      when '1'
        PostsController.connection(@routes['posts'])
      when '2'
        puts("Unimplicated method... SORRY!")
      when 'q'
        break
      else
        puts("Wrong option!")
      end
      
    end
    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init