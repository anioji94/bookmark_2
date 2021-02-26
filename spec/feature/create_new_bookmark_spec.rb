feature 'create new bookmarks' do
    scenario 'user wants to add a new bookmark to the list' do
        # visit the bookmarks route
        visit('/bookmarks')
        # fill in a form
        fill_in('url', with: 'https://www.newgrounds.com')
        fill_in('title', with: 'New Grounds')
        # submit -> Post info  -> redirect to bookmarks
        click_button('Submit')
        # new bookmark url should be visible
        expect(page).to have_content('New Grounds: https://www.newgrounds.com')
    end
end