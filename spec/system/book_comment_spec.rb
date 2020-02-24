require 'rails_helper'

describe 'コメント投稿のテスト' do
  let(:user) { create(:user) }
  let!(:book) { create(:book, user: user) }
  before do
  	visit new_user_session_path
  	fill_in 'user[name]', with: user.name
  	fill_in 'user[password]', with: user.password
  	click_button 'Log in'
  end

  context 'コメント機能のテスト' do
    before do
      visit book_path(book)
    end
    it 'コメントが投稿できること' do
      comment_text =  Faker::Lorem.characters(number: 20)
      fill_in 'book_comment[comment]', with: comment_text
      click_button '投稿'
      expect(find('.book-comments-show-block')).to have_content comment_text
    end
  end
end