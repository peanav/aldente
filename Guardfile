guard :minitest do
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^models/(.+)\.rb$})         { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end
