require 'json'

class Hangman
  def initialize
    @dictionary = File.readlines('hangman\google-10000-english-no-swears.txt').map(&:strip)
    @secret_word = ""
    @guesses = []
    @max_attempts = 6
    @attempts_left = @max_attempts
    @game_over = false
  end

  def new_game
    @secret_word = select_secret_word
    @guesses = []
    @attempts_left = @max_attempts
    @game_over = false
    play_game
  end

  def play_game
    while !@game_over
      display_game_state
      puts "Guess a letter or type 'save' to save the game:"
      input = gets.chomp.downcase

      if input == 'save'
        save_game
        puts "Game saved."
        next
      end

      if input.length != 1 || !('a'..'z').include?(input)
        puts "Please enter a valid letter."
        next
      end

      make_guess(input)
      check_game_over
    end
  end

  def select_secret_word
    valid_words = @dictionary.select { |word| (5..12).cover?(word.length) }
    valid_words.sample.downcase
  end

  def display_game_state
    display_word = @secret_word.chars.map { |letter| @guesses.include?(letter) ? letter : '_' }.join(' ')
    puts "Secret word: #{display_word}"
    puts "Incorrect guesses: #{@guesses.join(', ')}"
    puts "Attempts left: #{@attempts_left}"
  end

  def make_guess(letter)
    if @secret_word.include?(letter)
      @guesses << letter unless @guesses.include?(letter)
    else
      @guesses << letter unless @guesses.include?(letter)
      @attempts_left -= 1
    end
  end

  def check_game_over
    if @attempts_left <= 0
      puts "You're out of attempts. The secret word was #{@secret_word}. Game over!"
      @game_over = true
    elsif @secret_word.chars.all? { |letter| @guesses.include?(letter) }
      puts "Congratulations! You've guessed the secret word '#{@secret_word}' correctly!"
      @game_over = true
    end
  end

  def save_game
    game_state = {
      secret_word: @secret_word,
      guesses: @guesses,
      attempts_left: @attempts_left
    }
    output_dir = File.expand_path('save', __dir__)
    Dir.mkdir(output_dir) unless Dir.exist?(output_dir)
    
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    filename = File.join(output_dir, "game_#{timestamp}.json")
    
    File.open(filename, 'w') do |file|
        file.puts JSON.dump(game_state)
    end
    
    puts "Game saved to #{filename}"
  end

  def self.load_game
    saved_games_dir = File.expand_path('save', __dir__)
    
    # Verifica se a pasta "save" existe
    unless Dir.exist?(saved_games_dir)
      puts "No saved games found."
      return
    end
  
    # Obtém a lista de arquivos na pasta "save" com extensão ".json"
    saved_game_files = Dir.glob(File.join(saved_games_dir, '*.json'))
  
    if saved_game_files.empty?
      puts "No saved games found."
      return
    end
  
    # Escolhe o arquivo mais recente para carregar
    latest_saved_game = saved_game_files.max_by { |file| File.mtime(file) }
  
    begin
        saved_game = JSON.parse(File.read(latest_saved_game))
        hangman = Hangman.new
        hangman.instance_variable_set(:@secret_word, saved_game['secret_word'])
        hangman.instance_variable_set(:@guesses, saved_game['guesses'])
        hangman.instance_variable_set(:@attempts_left, saved_game['attempts_left'])

        puts "Game loaded from #{latest_saved_game}"
        hangman.play_game
    rescue JSON::ParserError
      puts "Error parsing the saved game file. The file might be corrupted."
    end
  end
  
  
end

puts "Welcome to Hangman!"
puts "1. New Game"
puts "2. Load Game"
choice = gets.chomp.to_i

if choice == 1
  hangman = Hangman.new
  hangman.new_game
elsif choice == 2
  Hangman.load_game
else
  puts "Invalid choice. Exiting."
end
