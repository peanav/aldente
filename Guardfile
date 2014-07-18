guard 'puma', :port => 5000 do
  watch('Gemfile.lock')
  watch('config.ru')
  watch(%r{^modules|models/(.+)\.rb$})
end
