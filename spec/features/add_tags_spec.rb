feature 'Addings tags' do
  scenario 'adding a single tag when saving a link' do
    add_link_with_bubble_tag
    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles')
  end

  scenario 'adding multiple tags when saving a link' do
    visit('/links/new')
    fill_in('url', with: 'http://www.facebook.com')
    fill_in('title', with: 'Facebook')
    fill_in('tags', with: 'bubbles social networking')
    click_button 'save'

    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles', 'social', 'networking')
  end
end
