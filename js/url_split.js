
var admin_url = "https://hogehogejp.fugafuga.com/nav_to.do?uri=%2Fkb_knowledge.do%3Fsys_id%3Db65af67f1bf60c10dcee422dbc4bcb67%26sysparm_record_target%3Dkb_knowledge%26sysparm_record_row%3D1%26sysparm_record_rows%3D15437%26sysparm_record_list%3DORDERBYDESCsys_updated_on"
var user_url = "https://hogehogejp.fugafuga.com/f_support?id=kb_article&sys_id=920b8bfebb00db00d8d51272dbdb7539&kb_category=221969eabb409b00d8d51272dbdb7532"
var a = admin_url.split("%3D")
console.log("%3D is split = " + a)
console.log(a)
var b = a[0].split("%26");
console.log("%26 is split = " + b)



