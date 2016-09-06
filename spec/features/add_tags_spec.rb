feature 'Addings tags' do
  scenario 'adding a single tag when saving a link' do
    add_link_with_bubble_tag
    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles')
  end
end
