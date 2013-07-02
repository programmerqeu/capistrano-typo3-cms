SimpleCov.start do
  add_filter '_test'
  add_group 'Tests', 'test'
  add_group 'SPecs', 'spec'
  add_group 'Long files' do |src_file|
    src_file.lines.count > 100
  end
end

#SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
#    SimpleCov::Formatter::HTMLFormatter,
#    Coveralls::SimpleCov::Formatter
#]