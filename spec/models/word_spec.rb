require 'spec_helper'

describe Word do
  let(:attributes) {
    {:grammaticalFeatures=>[{:text=>"Third", :type=>"Person"}, {:text=>"Singular", :type=>"Number"}, {:text=>"Present", :type=>"Tense"}],
    :inflectionOf=>[{:id=>"fox", :text=>"fox"}],
    :language=>"en",
    :lexicalCategory=>"Verb",
    :text=>"foxes"}
  }
  it 'has attributes' do
    word = Word.new(attributes)

    expect(word).to respond_to(:text)
    expect(word).to respond_to(:root)
  end
end
