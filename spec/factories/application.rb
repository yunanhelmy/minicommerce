FactoryBot.define do
  factory :application, class: "Doorkeeper::Application" do
    sequence(:name) { |n| "Application #{n}" }
    redirect_uri { 'urn:ietf:wg:oauth:2.0:oob' }
    owner_type { 'User' }
    owner_id { FactoryBot.create(:user, email: Faker::Internet.free_email, password: 'password', password_confirmation: 'password').id }
  end
end
