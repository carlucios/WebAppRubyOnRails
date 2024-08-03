# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_08_02_132751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendamentos", force: :cascade do |t|
    t.bigint "medico_id"
    t.bigint "paciente_id"
    t.date "start_date"
    t.time "start_hour"
    t.time "end_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_agendamentos_on_medico_id"
    t.index ["paciente_id"], name: "index_agendamentos_on_paciente_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.string "name"
    t.integer "series"
    t.integer "reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atividades_sessaos", id: false, force: :cascade do |t|
    t.bigint "atividade_id"
    t.bigint "sessao_id"
    t.index ["atividade_id"], name: "index_atividades_sessaos_on_atividade_id"
    t.index ["sessao_id"], name: "index_atividades_sessaos_on_sessao_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "phone"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_medicos_on_email", unique: true
  end

  create_table "pacientes", force: :cascade do |t|
    t.bigint "medico_id"
    t.string "cpf"
    t.string "name"
    t.string "photo"
    t.string "address"
    t.string "phone"
    t.string "insurance"
    t.string "hd"
    t.string "email"
    t.date "birth_date"
    t.date "aval_date"
    t.date "proc_date"
    t.string "rg"
    t.string "dominance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_pacientes_on_cpf", unique: true
    t.index ["medico_id"], name: "index_pacientes_on_medico_id"
  end

  create_table "relatorios", force: :cascade do |t|
    t.bigint "sessao_id"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sessao_id"], name: "index_relatorios_on_sessao_id"
  end

  create_table "sessaos", force: :cascade do |t|
    t.bigint "paciente_id"
    t.bigint "medico_id"
    t.date "start_date"
    t.time "start_hour"
    t.time "end_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_sessaos_on_medico_id"
    t.index ["paciente_id"], name: "index_sessaos_on_paciente_id"
  end
end
