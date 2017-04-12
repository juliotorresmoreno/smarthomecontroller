class User < ApplicationRecord
    # Confirmamos el email y validamos que no sean vacios con presence
    # mostramos el mensaje de error con message
    validates :email , presence: true , confirmation: true
    validates :name, presence: { message: " es requerido"}
    validates :lastname, presence: { message: " es requerido"}

    # Validamos en una expresion regular nuestro email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" }
    validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
end
