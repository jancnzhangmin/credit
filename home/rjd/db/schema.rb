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

ActiveRecord::Schema.define(version: 2018_06_12_173652) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "login"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bankcards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "bank"
    t.string "bankaccount"
    t.string "bankaddress"
    t.integer "isdefault"
    t.string "bankname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bankdef_id"
    t.integer "status"
    t.index ["bankdef_id"], name: "index_bankcards_on_bankdef_id"
    t.index ["user_id"], name: "index_bankcards_on_user_id"
  end

  create_table "bankdefs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "bank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processlogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.string "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rephones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tranapps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.integer "status"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tranapps_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password_digest"
    t.integer "status"
    t.string "tranaccount"
    t.string "tranpassword"
    t.string "admin"
    t.string "vcode"
    t.datetime "vcodetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "idfront_file_name"
    t.string "idfront_content_type"
    t.integer "idfront_file_size"
    t.datetime "idfront_updated_at"
    t.string "idback_file_name"
    t.string "idback_content_type"
    t.integer "idback_file_size"
    t.datetime "idback_updated_at"
  end

  create_table "withdrawapps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.float "amount"
    t.integer "status"
    t.string "message"
    t.integer "tobank"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_withdrawapps_on_user_id"
  end

  create_table "withdrawrecords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "bank"
    t.string "bankaccount"
    t.string "bankaddress"
    t.string "bankname"
    t.float "amount"
    t.string "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_withdrawrecords_on_user_id"
  end

  add_foreign_key "bankcards", "bankdefs"
  add_foreign_key "bankcards", "users"
  add_foreign_key "tranapps", "users"
  add_foreign_key "withdrawapps", "users"
  add_foreign_key "withdrawrecords", "users"
end
