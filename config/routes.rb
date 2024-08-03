Rails.application.routes.draw do
  resources :agendamentos, defaults: { format: :json }
  resources :atividades, defaults: { format: :json }
  resources :medicos, defaults: { format: :json }
  resources :pacientes, defaults: { format: :json }
  resources :relatorios, defaults: { format: :json }
  resources :sessaos, defaults: { format: :json }

  # Montar os motores Rswag::Api e Rswag::Ui para servir a documentação Swagger
  mount Rswag::Api::Engine => "/api-docs"
  mount Rswag::Ui::Engine => "/api-docs"
end
