require 'swagger_helper'

RSpec.describe 'Medicos API', type: :request do
  let(:existing_medico) do
    Medico.create!(
      email: 'dr.existing@example.com',
      name: 'Dr. Existing',
      photo: 'dr_existing.jpg',
      password: 'existing_password',
      phone: '123-456-7890'
    )
  end

  let(:existing_medico_id) { existing_medico.id }
  let(:non_existent_medico_id) { existing_medico_id + 1000 }

  path '/medicos' do
    get('list medicos') do
      tags 'Medicos'
      produces 'application/json'

      response(200, 'successful') do
        run_test!
      end
    end

    post('create medico') do
      tags 'Medicos'
      consumes 'application/json'
      parameter name: :medico, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          name: { type: :string },
          photo: { type: :string },
          password: { type: :string },
          phone: { type: :string }
        },
        required: [ 'email', 'name', 'password' ]
      }

      response(201, 'created') do
        after do |example|
          example.metadata[:response][:examples] = {
            'application/json' => {
              email: 'dra.john.doe@example.com',
              password: 'password123',
              name: 'Dr. John Doe',
              phone: '123-456-7890',
              photo: 'dr_john_doe.jpg'
            }
          }
        end

        let(:medico) { { email: 'dra.john.doe@example.com', password: 'password123', name: 'Dr. John Doe', phone: '123-456-7890', photo: 'dr_john_doe.jpg' } }
        run_test!
      end
    end
  end

  path '/medicos/{id}' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show medico') do
      tags 'Medicos'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 name: { type: :string },
                 photo: { type: :string },
                 password: { type: :string },
                 phone: { type: :string }
               },
               required: [ 'id', 'email', 'name', 'password' ]

        let(:id) { existing_medico_id }
        run_test!
      end

      response(404, 'not found') do
        let(:id) { non_existent_medico_id }
        run_test!
      end
    end

    patch('update medico') do
      tags 'Medicos'
      consumes 'application/json'
      parameter name: :medico, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          name: { type: :string },
          photo: { type: :string },
          password: { type: :string },
          phone: { type: :string }
        },
        required: [ 'email', 'name', 'password' ]
      }

      response(200, 'successful') do
        let(:updated_attributes) { { name: 'Dr. New' } }

        let(:id) { existing_medico_id }
        let(:medico) { updated_attributes }
        run_test!
      end
    end

    delete('delete medico') do
      tags 'Medicos'
      response(204, 'no content') do
        let(:id) { existing_medico_id }
        run_test!
      end
    end
  end

  after(:each) do
    Medico.where(email: 'dr.existing@example.com').destroy_all
    Medico.where(email: 'dra.john.doe@example.com').destroy_all
  end
end
