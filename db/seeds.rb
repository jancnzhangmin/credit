# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wordtypedef = Wordtypedef.find_by_wordkey('float')
if wordtypedef
  puts '单精度定义类型已存在，本次忽略'
else
  Wordtypedef.create(wordtype:'单精度',wordkey:'float')
  puts '单精度定义类型初始化完成'
end
wordtypedef = Wordtypedef.find_by_wordkey('string')
if wordtypedef
  puts '字符串定义类型已存在，本次忽略'
else
  Wordtypedef.create(wordtype:'字符串',wordkey:'string')
  puts '字符串定义类型初始化完成'
end
wordtypedef = Wordtypedef.find_by_wordkey('text')
if wordtypedef
  puts '文本定义类型已存在，本次忽略'
else
  Wordtypedef.create(wordtype:'文本',wordkey:'text')
  puts '文本定义类型初始化完成'
end
wordtypedef = Wordtypedef.find_by_wordkey('attach')
if wordtypedef
  puts '附件定义类型已存在，本次忽略'
else
  Wordtypedef.create(wordtype:'附件',wordkey:'attach')
  puts '附件定义类型初始化完成'
end
wordtypedef = Wordtypedef.find_by_wordkey('int')
if wordtypedef
  puts '整型定义类型已存在，本次忽略'
else
  Wordtypedef.create(wordtype:'整型',wordkey:'int')
  puts '整型定义类型初始化完成'
end

#权限资源
auth = Auth.find_by_keyword('admin')
if auth
  puts '系统管理员权限已存在，本次忽略'
else
  Auth.create(keyword:'admin', name:'系统管理员')
  puts '系统管理员权限初始化完成'
end
auth = Auth.find_by_keyword('baseadmin')
if auth
  puts '基社管理员权限已存在，本次忽略'
else
  Auth.create(keyword:'baseadmin', name:'基社管理员')
  puts '基社管理员权限初始化完成'
end
auth = Auth.find_by_keyword('unionadmin')
if auth
  puts '联社管理员权限已存在，本次忽略'
else
  Auth.create(keyword:'unionadmin', name:'联社管理员')
  puts '联社管理员权限初始化完成'
end
auth = Auth.find_by_keyword('partadmin')
if auth
  puts '部门管理员权限已存在，本次忽略'
else
  Auth.create(keyword:'partadmin', name:'部门管理员')
  puts '部门管理员权限初始化完成'
end
auth = Auth.find_by_keyword('head')
if auth
  puts '部门领导权限已存在，本次忽略'
else
  Auth.create(keyword:'head', name:'部门领导')
  puts '部门领导权限初始化完成'
end
auth = Auth.find_by_keyword('feedadmin')
if auth
  puts '流程管理员权限已存在，本次忽略'
else
  Auth.create(keyword:'feedadmin', name:'流程管理员')
  puts '流程管理员权限初始化完成'
end
auth = Auth.find_by_keyword('business')
if auth
  puts '业务申核权限已存在，本次忽略'
else
  Auth.create(keyword:'business',name:'业务申核')
  puts '业务申核权限初始化完成'
end
auth = Auth.find_by_keyword('newwork')
if auth
  puts '新建工作权限已存在，本次忽略'
else
  Auth.create(keyword:'newwork', name:'新建工作')
  puts '新建工作权限初始化完成'
end
