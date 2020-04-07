require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
    
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Navigate to the product info from the main page" do
    visit root_path

    first('.product a').click
    sleep(1)

    save_screenshot
    
    expect(page).to have_css '.products-show'
  end

end
