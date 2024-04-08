# frozen_string_literal: true

# Roles de usuario
Role.create!(name: 'admin')
Role.create!(name: 'directivo')
Role.create!(name: 'docente')
Role.create!(name: 'alumno')

# Usuario Admin
User.create!(email: 'admin@admin.com', password: 'admin123', password_confirmation: 'admin123')

# Permiso de admin
User.find_by(email: 'admin@admin.com').roles << Role.find_by(name: 'admin')
