namespace :dev do

DEFAULT_PASSWORD = 12345678
DEFAULT_FILE_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
    show_spinner("Apagando BD...") { %x(rails db:drop:_unsafe) }
    show_spinner("Criando BD...") { %x(rails db:create) }
    show_spinner("Migrando BD...") { %x(rails db:migrate) }
    show_spinner("Admin padrão...") { %x(rails dev:add_default_admin) }
    show_spinner("Tipo de Pagamento...") { %x(rails dev:add_payments) }
    show_spinner("Status de Pagamento...") { %x(rails dev:add_paystatus) }
    show_spinner("Tipo de Categorias...") { %x(rails dev:add_category) }
    show_spinner("Clientes de Exemplo...") { %x(rails dev:add_clients) }
    show_spinner("Produtos de Exemplo...") { %x(rails dev:add_products) }
  else
    puts "Você não esta em ambiente de desenvolvimento!"
  end
end
  
  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end
  
  desc "Adiciona o pagamento padrão"
  task add_payments: :environment do
    file_name = 'payment.txt'
    file_path = File.join(DEFAULT_FILE_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Payment.create!(type: line.strip)
    end
  end
  
  desc "Adiciona o status de pagamento"
  task add_paystatus: :environment do
    file_name = 'paystatus.txt'
    file_path = File.join(DEFAULT_FILE_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Paystatus.create!(type: line.strip)
    end
  end

  desc "Adiciona o categorias padrão"
  task add_category: :environment do
    file_name = 'category.txt'
    file_path = File.join(DEFAULT_FILE_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Category.create!(type: line.strip)
    end
  end

  desc "Adicionando Clientes de Exemplo"
  task add_clients: :environment do
    10.times do |i|
      Client.create!(
        name: Faker::Name.name,
        gender: Faker::Gender.binary_type,
        birth_date: Faker::Date.birthday,
        cpf: Faker::Number.number(digits: 11),
        address: Faker::Address.full_address
      )
    end
  end

  desc "Adcionando Produtos de Exemplo"
  task add_products: :environment do
    25.times do |i|
      Product.create!(
        name: Faker::Food.ingredient,
        description: Faker::Lorem.sentence,
        category: Category.all.sample,
        stock: Faker::Number.number(digits: 3),
        price: Faker::Number.decimal_part(digits: 2)
      )
    end
  end

  private
   
  def show_spinner(msg_start, msg_end = "Sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})") 
  end

end


