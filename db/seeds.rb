# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "Frey",
    email: "frey@list.ru",
    password: "00000000",
    password_confirmation: "00000000",
    admin: true
)
u.skip_confirmation!
u.save!


