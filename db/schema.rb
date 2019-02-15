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

ActiveRecord::Schema.define(version: 2019_02_12_062912) do

  create_table "auths", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "keyword"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "basesectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dropdownoptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "dropdown_id"
    t.string "wordval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dropdowns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flowtemplates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cla_id"
    t.string "name"
    t.string "subtitle"
    t.string "nextlink"
    t.integer "appointunion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flowtemplate_id"
    t.string "summary"
    t.integer "status"
    t.integer "pendstatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unionsectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cla_id"
    t.string "name"
    t.string "summary"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usergroups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "auth_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "basesector_id"
    t.bigint "unionsector_id"
    t.string "name"
    t.integer "sex"
    t.string "password_digest"
    t.string "login"
    t.integer "status"
    t.string "phone"
    t.string "offer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wordattches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wordattchval_file_name"
    t.string "wordattchval_content_type"
    t.bigint "wordattchval_file_size"
    t.datetime "wordattchval_updated_at"
  end

  create_table "wordcoins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.decimal "wordval", precision: 10
    t.integer "isnull"
    t.string "isnullsummary"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worddatetimes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.datetime "wordval"
    t.integer "isnull"
    t.string "isnullsummary"
    t.integer "datetype"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wordints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.bigint "wordval"
    t.integer "isnull"
    t.string "isnullsummary"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wordstrings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.string "wordval"
    t.integer "isnull"
    t.string "isnullsummary"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wordtexts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "flowtemplate_id"
    t.text "wordval"
    t.integer "isnull"
    t.string "isnullsummary"
    t.string "name"
    t.bigint "rank"
    t.integer "showlable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
