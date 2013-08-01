SimpleCov.start do
  add_filter '_test'
  add_filter '_spec'
  add_group 'Tests', 'test'
  add_group 'Specs', 'spec'

  add_group 'Long files' do |src_file|
    src_file.lines.count > 100
  end
end
