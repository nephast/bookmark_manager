feature 'Addings tags' do
  scenario 'adding a single tag when saving a link' do
    visit '/links/new'
    fill_in('url', with: 'http://www.facebook.com')
    fill_in('title', with: 'Facebook')
    fill_in('tags', with: 'social')

    click_button 'save'
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end
end
