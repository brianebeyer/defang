require 'spec_helper'
require 'uri'

describe URI do
  it 'defangs it correctly' do
    uri = 'http://google.com'
    expect(URI(uri).defang).to eq('hXXp://google[.]com')

    uri = 'http://google.co.uk'
    expect(URI(uri).defang).to eq('hXXp://google.co[.]uk')

    uri = 'http://google.com.freemoney.fo.ru'
    expect(URI(uri).defang).to eq('hXXp://google.com.freemoney.fo[.]ru')
  end

  it 'doesn\'t change the original' do
    string = 'http://google.com'
    obj = URI(string)
    obj.defang
    expect(obj.to_s).to eq(string)
  end

end
