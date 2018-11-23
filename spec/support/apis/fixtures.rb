module Fixtures
  def fixtures_dir
    File.join File.dirname(__FILE__), "../fixtures"
  end

  def json_response(filename)
    file = File.join fixtures_dir, "#{filename}.json"
    File.read(file)
  end
end
