user = User.create email: 'm.yunan.helmy@gmail.com', password: 'yunan123', password_confirmation: 'yunan123'
Doorkeeper::Application.create name: 'Test App', scopes: 'public', redirect_uri: 'http://localhost:4000', owner_id: user.id, owner_type: user.class.to_s

# Seed dummy products
Products::Repository::DummyData.call
