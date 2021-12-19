module Types
  class UserAttributes < Types::BaseInputObject
    description 'Attributes for creating or updating a user'
    argument :email, String, 'Email of the user', required: false
    argument :first_name, String, 'First name of the user', required: false
    argument :last_name, String, 'Last name of the user', required: false
    argument :role, String, 'Role of the user', required: false
  end
end
