# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170413010145) do

  create_table "actions", primary_key: "accion_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.bigint   "module_id",                                                   null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["module_id"], name: "module_id", using: :btree
  end

  create_table "cities", primary_key: "city_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 200,                                      null: false
    t.bigint   "state_id",                                                    null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                   null: false
    t.index ["state_id"], name: "state_id", using: :btree
  end

  create_table "conditions", primary_key: "condition_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "state",          limit: 65535,                                      null: false
    t.bigint   "schedule_id",                                                       null: false
    t.text     "condition",      limit: 65535,                                      null: false
    t.string   "condition_type", limit: 8,                                          null: false
    t.datetime "created_at",                   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                         null: false
    t.index ["schedule_id"], name: "schedule_id", using: :btree
  end

  create_table "consumptions", primary_key: "consumption_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",       limit: 1, default: 1,                          null: false
    t.bigint   "device_id",                                                  null: false
    t.date     "date",                                                       null: false
    t.time     "time",                                                       null: false
    t.integer  "consumption",                                                null: false, comment: "Unidad por definir"
    t.datetime "created_at",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                  null: false
    t.index ["device_id"], name: "device_id", using: :btree
  end

  create_table "countries", primary_key: "country_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
  end

  create_table "devices", primary_key: "device_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",       limit: 1,   default: 1,                          null: false
    t.bigint   "location_id",                                                  null: false
    t.string   "UUID",        limit: 100,                                      null: false
    t.integer  "state_onoff", limit: 1,                                        null: false
    t.datetime "created_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                    null: false
    t.index ["location_id"], name: "location_id", using: :btree
  end

  create_table "incidence_type", primary_key: "incidence_type_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
  end

  create_table "incidences", primary_key: "incidence_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",             limit: 1,     default: 1,                          null: false
    t.string   "title",             limit: 100,                                        null: false
    t.text     "description",       limit: 65535,                                      null: false
    t.bigint   "incidence_type_id",                                                    null: false
    t.string   "progress",          limit: 8,                                          null: false
    t.datetime "created_at",                      default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                       default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                            null: false
    t.index ["incidence_type_id"], name: "incidence_type_id", using: :btree
  end

  create_table "incidences_tracking", primary_key: "incidence_tracking_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",        limit: 1,     default: 1,                          null: false
    t.bigint   "incidence_id",                                                    null: false
    t.bigint   "user_id",                                                         null: false
    t.text     "comment",      limit: 65535,                                      null: false
    t.datetime "created_at",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["incidence_id"], name: "incidence_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "locations", primary_key: "location_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.bigint   "user_id",                                                     null: false
    t.string   "name",       limit: 100,                                      null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "modules", primary_key: "module_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1
    t.string   "name",       limit: 100
    t.datetime "created_at"
    t.datetime "update_at"
    t.datetime "delete_at"
  end

  create_table "parameters", primary_key: "parameter_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
  end

  create_table "parameters_value", primary_key: "parameter_value_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",        limit: 1,     default: 1,                          null: false
    t.text     "value",        limit: 65535,                                      null: false
    t.bigint   "parameter_id",                                                    null: false
    t.datetime "created_at",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["parameter_id"], name: "parameter_id", using: :btree
  end

  create_table "perfils", primary_key: "perfil_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
  end

  create_table "permissions", primary_key: "permission_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1, default: 1,                          null: false
    t.bigint   "user_id",                                                   null: false
    t.bigint   "accion_id",                                                 null: false
    t.datetime "created_at",           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["accion_id"], name: "accion_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "petition_types", primary_key: "petition_type_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
  end

  create_table "petitions", primary_key: "petition_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",            limit: 1,     default: 1,                          null: false
    t.bigint   "user_id",                                                             null: false
    t.bigint   "petition_type_id",                                                    null: false
    t.string   "title",            limit: 100,                                        null: false
    t.text     "description",      limit: 65535,                                      null: false
    t.datetime "created_at",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                      default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["petition_type_id"], name: "petition_type_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "petitions_tracking", primary_key: "petition_tracking_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",       limit: 1,     default: 1,                          null: false
    t.bigint   "petition_id",                                                    null: false
    t.bigint   "user_id",                                                        null: false
    t.text     "comemnt",     limit: 65535,                                      null: false
    t.datetime "created_at",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["petition_id"], name: "petition_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "recovery_passwords", primary_key: "recovery_password_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.bigint   "user_id",                                                     null: false
    t.string   "token",      limit: 100,                                      null: false
    t.string   "progress",   limit: 7,                                        null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "schedules", primary_key: "schedule_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1, default: 1,                          null: false
    t.bigint   "device_id",                                                 null: false
    t.date     "date",                                                      null: false
    t.time     "time",                                                      null: false
    t.integer  "repetition", limit: 1,                                      null: false
    t.integer  "interval",                                                  null: false
    t.datetime "created_at",           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                 null: false
    t.index ["device_id"], name: "device_id", using: :btree
  end

  create_table "sessions", primary_key: "session_id", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.bigint   "user_id",                                                     null: false
    t.string   "token",      limit: 100,                                      null: false
    t.datetime "expires",                                                     null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
  end

  create_table "states", primary_key: "state_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.bigint   "country_id",                                                  null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at",                                                   null: false
    t.index ["country_id"], name: "country_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "perfil_id",              default: 0,  null: false
    t.string   "name",                   default: "", null: false
    t.string   "lastname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_desc", primary_key: "user_desc_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "state",             limit: 1,   default: 1,                          null: false
    t.bigint   "sex_id",                                                             null: false
    t.bigint   "city_residence_id",                                                  null: false
    t.string   "phone",             limit: 100,                                      null: false
    t.string   "address",           limit: 200,                                      null: false
    t.string   "cell_phone",        limit: 100,                                      null: false
    t.date     "birth_date",                                                         null: false
    t.bigint   "user_id",                                                            null: false
    t.datetime "created_at",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["city_residence_id"], name: "city_residence_id", using: :btree
    t.index ["sex_id"], name: "sex_id", using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "users_old", primary_key: "user_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "state",      limit: 1,   default: 1,                          null: false
    t.string   "name",       limit: 100,                                      null: false
    t.string   "lastname",   limit: 100,                                      null: false
    t.string   "fullname",   limit: 200,                                      null: false
    t.string   "email",      limit: 100,                                      null: false
    t.string   "password",   limit: 100,                                      null: false
    t.bigint   "perfil_id",                                                   null: false
    t.datetime "created_at",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "update_at",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "delete_at"
    t.index ["email"], name: "email", unique: true, using: :btree
    t.index ["perfil_id"], name: "perfil_id", using: :btree
  end

  add_foreign_key "actions", "modules", primary_key: "module_id", name: "actions_ibfk_1"
  add_foreign_key "cities", "states", primary_key: "state_id", name: "cities_ibfk_1"
  add_foreign_key "conditions", "schedules", primary_key: "schedule_id", name: "conditions_ibfk_1"
  add_foreign_key "consumptions", "devices", primary_key: "device_id", name: "consumptions_ibfk_1"
  add_foreign_key "devices", "locations", primary_key: "location_id", name: "devices_ibfk_1"
  add_foreign_key "incidences", "incidence_type", primary_key: "incidence_type_id", name: "incidences_ibfk_1"
  add_foreign_key "incidences_tracking", "incidences", primary_key: "incidence_id", name: "incidences_tracking_ibfk_2"
  add_foreign_key "incidences_tracking", "users_old", column: "user_id", primary_key: "user_id", name: "incidences_tracking_ibfk_1"
  add_foreign_key "locations", "users_old", column: "user_id", primary_key: "user_id", name: "locations_ibfk_1"
  add_foreign_key "parameters_value", "parameters", primary_key: "parameter_id", name: "parameters_value_ibfk_1"
  add_foreign_key "permissions", "actions", column: "accion_id", primary_key: "accion_id", name: "permissions_ibfk_2"
  add_foreign_key "permissions", "users_old", column: "user_id", primary_key: "user_id", name: "permissions_ibfk_1"
  add_foreign_key "petitions", "petition_types", primary_key: "petition_type_id", name: "petitions_ibfk_2"
  add_foreign_key "petitions", "users_old", column: "user_id", primary_key: "user_id", name: "petitions_ibfk_1"
  add_foreign_key "petitions_tracking", "petitions", primary_key: "petition_id", name: "petitions_tracking_ibfk_1"
  add_foreign_key "petitions_tracking", "users_old", column: "user_id", primary_key: "user_id", name: "petitions_tracking_ibfk_2"
  add_foreign_key "recovery_passwords", "users_old", column: "user_id", primary_key: "user_id", name: "recovery_passwords_ibfk_1"
  add_foreign_key "schedules", "devices", primary_key: "device_id", name: "schedules_ibfk_1"
  add_foreign_key "states", "countries", primary_key: "country_id", name: "states_ibfk_1"
  add_foreign_key "users_desc", "cities", column: "city_residence_id", primary_key: "city_id", name: "users_desc_ibfk_3"
  add_foreign_key "users_desc", "parameters_value", column: "sex_id", primary_key: "parameter_value_id", name: "users_desc_ibfk_2"
  add_foreign_key "users_desc", "users_old", column: "user_id", primary_key: "user_id", name: "users_desc_ibfk_1"
  add_foreign_key "users_old", "perfils", primary_key: "perfil_id", name: "users_old_ibfk_1"
end
