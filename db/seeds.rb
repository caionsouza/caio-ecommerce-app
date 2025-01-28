# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.create([
  { name: 'Smartphone Samsung Galaxy S21', 
    description: 'Smartphone Samsung Galaxy S21 com 128GB de armazenamento, câmera tripla e tela de 6.2 polegadas.', 
    price: 4999.90, 
    image: 's21.jpg',
    stock: 20 },
    
  { name: 'Notebook Dell Inspiron 15', 
    description: 'Notebook Dell Inspiron com processador Intel Core i5, 8GB de RAM e SSD de 256GB.', 
    price: 3899.99, 
    image: 'notebook.jpg',
    stock: 25 },
    
  { name: 'Fone de Ouvido Bluetooth JBL', 
    description: 'Fone de ouvido sem fio JBL com qualidade de som superior e bateria de longa duração.', 
    price: 349.90, 
    image: 'fone.jpg',
    stock: 250 },
    
  { name: 'Smart TV LG 55" 4K UHD', 
    description: 'Smart TV LG com resolução 4K, inteligência artificial e sistema webOS.', 
    price: 3799.99, 
    image: 'smart tv.jpg',
    stock: 5 },
    
  { name: 'Cafeteira Expresso Nespresso', 
    description: 'Cafeteira Nespresso para preparo de café expresso e cápsulas de diversos sabores.', 
    price: 499.90, 
    image: 'Nespresso.jpg',
    stock: 150 },
    
  { name: 'Relógio Smartwatch Apple Watch Series 8', 
    description: 'Apple Watch Series 8 com GPS, monitoramento de saúde e resistência à água.', 
    price: 4299.90, 
    image: 'applewatch.jpg',
    stock: 250 },
    
  { name: 'Console PlayStation 5', 
    description: 'PlayStation 5 com SSD ultra-rápido, suporte a gráficos 4K e novo controle DualSense.', 
    price: 5999.90, 
    image: 'Ps5.jpg',
    stock: 3 },
    
  { name: 'Mouse Gamer Razer DeathAdder V2', 
    description: 'Mouse gamer ergonômico com sensor óptico de alta precisão e iluminação RGB.', 
    price: 349.90, 
    image: 'mouse.jpg', 
    stock: 25 },
  
  { name: 'Monitor UltraWide LG 34"', 
    description: 'Monitor LG UltraWide com tela de 34 polegadas, resolução QHD e taxa de atualização de 144Hz.', 
    price: 2599.90, 
    image: 'monitor.jpg', 
    stock: 20 },
    
  { name: 'Cadeira Gamer DXRacer', 
    description: 'Cadeira gamer ergonômica DXRacer com ajuste de altura e inclinação.', 
    price: 1599.90, 
    image: 'cadeira.jpg',
    stock: 30 }
])