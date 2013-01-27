require 'spec_helper'

describe FlyersHelper do
  describe 'amazon_search_links' do
    it "links to amazon searches " do
      expect(amazon_search_links(['Crooked Fingers'])).to eq '<strong>Buy music on Amazon by <a href="#" category="music" search="Crooked Fingers" type="amzn">Crooked Fingers</a></strong>'
    end
  end
end
