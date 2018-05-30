require 'spec_helper'

describe Word do
  context 'it has attributes' do
    it { should respond_to(:name) }
  end
end
