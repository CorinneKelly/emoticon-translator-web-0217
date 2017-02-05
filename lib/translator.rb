# require modules here
require "yaml"
require 'byebug'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  final_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each do |feeling, emoticon_array|
    # ex. {happy => [";)", "-__-"], confused => [";)", "-__-"]}
    emoticon_array.each_with_index do |emoticon, index|
      # [";)", "-__-"]
      if index == 1
        # final_hash = {"get_meaning" => { -__- => happy }}
        final_hash["get_meaning"][emoticon] = feeling
        # # final_hash = {"get_emoticon" => { ;) => -____- }}
        final_hash["get_emoticon"][emoticon_array[0]] = emoticon
      end
    end
  end
  final_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)

  if emoticon_hash["get_emoticon"][emoticon]
    return emoticon_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_meaning"][emoticon]
    return emoticon_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
