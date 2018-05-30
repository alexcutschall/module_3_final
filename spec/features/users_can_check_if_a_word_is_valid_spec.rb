require 'rails_helper'

describe 'as a guest user' do
  context 'when they visit the root path' do
    feature 'and they enter in a word' do
      it "tells them if the word is valid and the root word" do
        visit '/'

        fill_in 'q', with: 'foxes'
        click_on 'Validate Word'

        expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
      end
      it "tells them if the word is invalid" do
        visit '/'

        fill_in 'q', with: 'foxez'
        click_on 'Validate Word'

        expect(page).to have_content("'foxez' is not a valid word.")
      end
    end
  end
end
