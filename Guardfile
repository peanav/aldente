guard 'puma', :port => 5000 do
  watch('Gemfile.lock')
  watch('config.ru')
  watch(%r{^modules|models/(.+)\.rb$})
end

guard :minitest do
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^models/(.+)\.rb$})         { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end
