-- SQL脚本仅需执行一次，重复执行会生成多条数据，请谨慎手动执行！
-- 创建菜单
INSERT INTO def_resource(id, application_id, code, name, resource_type, parent_id, open_with, describe_, path, component, redirect, icon, is_hidden, is_general, state, sort_value, sub_group, field_is_secret, field_is_edit, data_scope, custom_class, is_def, tree_path, tree_grade, meta_json, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906735, 3, 'shop:system:memberUser', '商城用户维护', '20', 0, '01', '', '/system/memberUser', '/shop/system/memberUser/index', '', '', 0, 0, 1, 10, '', 0, 1, NULL, NULL, NULL, '/', 0, '{}', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');

-- 创建按钮
INSERT INTO def_resource(id, application_id, code, name, resource_type, parent_id, open_with, describe_, path, component, redirect, icon, is_general, state, sort_value, sub_group, field_is_secret, field_is_edit, data_scope, custom_class, is_def, tree_path, tree_grade, meta_json, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906736, 3, 'shop:system:memberUser:add', '新增', '40', 668362538357906735, '01', '', '', '', '', '', 0, 1, 1, '', 0, 1, NULL, NULL, NULL, '/668362538357906735/', 2, '{}', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource(id, application_id, code, name, resource_type, parent_id, open_with, describe_, path, component, redirect, icon, is_general, state, sort_value, sub_group, field_is_secret, field_is_edit, data_scope, custom_class, is_def, tree_path, tree_grade, meta_json, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906737, 3, 'shop:system:memberUser:edit', '编辑', '40', 668362538357906735, '01', '', '', '', '', '', 0, 1, 2, '', 0, 1, NULL, NULL, NULL, '/668362538357906735/', 2, '{}', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource(id, application_id, code, name, resource_type, parent_id, open_with, describe_, path, component, redirect, icon, is_general, state, sort_value, sub_group, field_is_secret, field_is_edit, data_scope, custom_class, is_def, tree_path, tree_grade, meta_json, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906738, 3, 'shop:system:memberUser:copy', '复制', '40', 668362538357906735, '01', '', '', '', '', '', 0, 1, 2, '', 0, 1, NULL, NULL, NULL, '/668362538357906735/', 2, '{}', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource(id, application_id, code, name, resource_type, parent_id, open_with, describe_, path, component, redirect, icon, is_general, state, sort_value, sub_group, field_is_secret, field_is_edit, data_scope, custom_class, is_def, tree_path, tree_grade, meta_json, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906739, 3, 'shop:system:memberUser:delete', '删除', '40', 668362538357906735, '01', '', '', '', '', '', 0, 1, 3, '', 0, 1, NULL, NULL, NULL, '/668362538357906735/', 2, '{}', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource(id, application_id, code, name, resource_type, parent_id, open_with, describe_, path, component, redirect, icon, is_general, state, sort_value, sub_group, field_is_secret, field_is_edit, data_scope, custom_class, is_def, tree_path, tree_grade, meta_json, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906740, 3, 'shop:system:memberUser:view', '查看', '40', 668362538357906735, '01', '', '', '', '', '', 0, 1, 4, '', 0, 1, NULL, NULL, NULL, '/668362538357906735/', 2, '{}', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');

-- 创建接口
INSERT INTO def_resource_api(id, resource_id, controller, spring_application_name, request_method, name, uri, is_input, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906741, 668362538357906735, 'MemberUserController', 'kpu-shop-server', 'POST', '商城用户-分页列表查询', '/shop/memberUser/page', 0, 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource_api(id, resource_id, controller, spring_application_name, request_method, name, uri, is_input, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906742, 668362538357906735, 'MemberUserController', 'kpu-shop-server', 'GET', '商城用户-查询单体详情', '/shop/memberUser/detail', 0, 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource_api(id, resource_id, controller, spring_application_name, request_method, name, uri, is_input, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906743, 668362538357906736, 'MemberUserController', 'kpu-shop-server', 'POST', '商城用户-新增', '/shop/memberUser', 0, 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource_api(id, resource_id, controller, spring_application_name, request_method, name, uri, is_input, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906744, 668362538357906737, 'MemberUserController', 'kpu-shop-server', 'PUT', '商城用户-修改', '/shop/memberUser', 0, 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource_api(id, resource_id, controller, spring_application_name, request_method, name, uri, is_input, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906745, 668362538357906739, 'MemberUserController', 'kpu-shop-server', 'DELETE', '商城用户-删除', '/shop/memberUser', 0, 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_resource_api(id, resource_id, controller, spring_application_name, request_method, name, uri, is_input, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906746, 668362538357906738, 'MemberUserController', 'kpu-shop-server', 'POST', '商城用户-复制', '/shop/memberUser/copy', 0, 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');

-- 字典
INSERT INTO def_dict(id, parent_id, parent_key, classify, key_, name, state, remark, sort_value, icon, css_style, css_class, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906753, 0, '', '20', 'SEX', '性别', 1, '[0-未知 1-男 2-女 3-保密]', 1, '', '', '', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');

INSERT INTO def_dict(id, parent_id, parent_key, classify, key_, name, state, remark, sort_value, icon, css_style, css_class, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906754, 668362538357906753, 'SEX', '20', '0', '未知', 1, '', 1, '', '', '', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_dict(id, parent_id, parent_key, classify, key_, name, state, remark, sort_value, icon, css_style, css_class, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906755, 668362538357906753, 'SEX', '20', '1', '男', 1, '', 1, '', '', '', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_dict(id, parent_id, parent_key, classify, key_, name, state, remark, sort_value, icon, css_style, css_class, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906756, 668362538357906753, 'SEX', '20', '2', '女', 1, '', 1, '', '', '', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');
INSERT INTO def_dict(id, parent_id, parent_key, classify, key_, name, state, remark, sort_value, icon, css_style, css_class, created_by, created_time, updated_by, updated_time)
VALUES (668362538357906757, 668362538357906753, 'SEX', '20', '3', '保密', 1, '', 1, '', '', '', 2, '2025-08-21 02:42:27', 2, '2025-08-21 02:42:27');

-- 删除数据，用于测试
-- delete from def_dict where id in (668362538357906753) or parent_id in (668362538357906753);

-- 删除数据，用于测试
/*
delete from def_resource where id in (668362538357906735, 668362538357906736, 668362538357906737, 668362538357906738, 668362538357906739, 668362538357906740);
delete from def_resource_api where id in (668362538357906741, 668362538357906742, 668362538357906743, 668362538357906744, 668362538357906745, 668362538357906746);
*/
