/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.190.130
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : kpu_none

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 10/05/2025 16:27:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_employee
-- ----------------------------
DROP TABLE IF EXISTS `base_employee`;
CREATE TABLE `base_employee`
(
    `id`              bigint       NOT NULL COMMENT 'ID',
    `is_default`      bit(1)       NOT NULL DEFAULT b'0' COMMENT '是否默认员工;[0-否 1-是]',
    `position_id`     bigint                DEFAULT NULL COMMENT '所属岗位',
    `user_id`         bigint       NOT NULL COMMENT '用户',
    `last_company_id` bigint                DEFAULT NULL COMMENT '上一次登录单位ID',
    `last_dept_id`    bigint                DEFAULT NULL COMMENT '上一次登录部门ID',
    `real_name`       varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
    `active_status`   char(2)               DEFAULT '20' COMMENT '激活状态;[10-未激活 20-已激活]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.ACTIVE_STATUS)',
    `position_status` char(2)               DEFAULT '10' COMMENT '职位状态;[10-在职 20-离职]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.POSITION_STATUS)',
    `state`           bit(1)                DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
    `created_by`      bigint                DEFAULT NULL COMMENT '创建人',
    `created_time`    datetime              DEFAULT NULL COMMENT '创建时间',
    `updated_by`      bigint                DEFAULT NULL COMMENT '最后更新人',
    `updated_time`    datetime              DEFAULT NULL COMMENT '最后更新时间',
    `created_org_id`  bigint                DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_emp_user_id` (`user_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='员工';

-- ----------------------------
-- Records of base_employee
-- ----------------------------
BEGIN;
INSERT INTO `base_employee` (`id`, `is_default`, `position_id`, `user_id`, `last_company_id`, `last_dept_id`,
                             `real_name`, `active_status`, `position_status`, `state`, `created_by`, `created_time`,
                             `updated_by`, `updated_time`, `created_org_id`)
VALUES (160566476187631622, b'1', 1451532876054003712, 1, 1451532667655815168, NULL, '超管', '20', '10', b'1',
        1452186486253289472, '2021-11-21 16:45:25', 1452186486253289472, '2021-11-21 16:45:25', 1);
INSERT INTO `base_employee` (`id`, `is_default`, `position_id`, `user_id`, `last_company_id`, `last_dept_id`,
                             `real_name`, `active_status`, `position_status`, `state`, `created_by`, `created_time`,
                             `updated_by`, `updated_time`, `created_org_id`)
VALUES (1452186486492364800, b'1', 1451532876054003712, 2, 1451532727697276928, 1451532821628715008, '内置超管', '20',
        '10', b'1', 2, '2021-10-24 16:13:33', 1452186486253289472, '2021-11-09 20:36:44', 2);
INSERT INTO `base_employee` (`id`, `is_default`, `position_id`, `user_id`, `last_company_id`, `last_dept_id`,
                             `real_name`, `active_status`, `position_status`, `state`, `created_by`, `created_time`,
                             `updated_by`, `updated_time`, `created_org_id`)
VALUES (1454329823978586112, b'1', 1451532876054003712, 1454329823852756992, 1451532773234835456, NULL, '门店管理员',
        '20', '10', b'1', 1451549146992345088, '2021-10-30 14:10:25', 1451549146992345088, '2021-10-30 14:10:25', 1);
INSERT INTO `base_employee` (`id`, `is_default`, `position_id`, `user_id`, `last_company_id`, `last_dept_id`,
                             `real_name`, `active_status`, `position_status`, `state`, `created_by`, `created_time`,
                             `updated_by`, `updated_time`, `created_org_id`)
VALUES (1457904456589901824, b'1', 1458051094994223104, 1457904455960756224, 1451532773234835456, NULL, '普通用户',
        '20', '10', b'1', 1451549146992345088, '2021-11-09 10:54:44', 2, '2025-04-24 06:01:35', 0);
COMMIT;

-- ----------------------------
-- Table structure for base_employee_org_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_employee_org_rel`;
CREATE TABLE `base_employee_org_rel`
(
    `id`             bigint NOT NULL COMMENT 'ID',
    `org_id`         bigint NOT NULL COMMENT '关联机构',
    `employee_id`    bigint NOT NULL COMMENT '关联员工',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '最后更新人',
    `updated_time`   datetime DEFAULT NULL COMMENT '最后更新时间',
    `created_org_id` bigint   DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_employee_org` (`org_id`, `employee_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='员工所在部门';

-- ----------------------------
-- Records of base_employee_org_rel
-- ----------------------------
BEGIN;
INSERT INTO `base_employee_org_rel` (`id`, `org_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                     `updated_time`, `created_org_id`)
VALUES (624241460312869926, 1451532667655815168, 1457904456589901824, 2, '2025-04-24 06:01:35', 2,
        '2025-04-24 06:01:35', NULL);
INSERT INTO `base_employee_org_rel` (`id`, `org_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                     `updated_time`, `created_org_id`)
VALUES (624241460312869927, 1451532727697276928, 1457904456589901824, 2, '2025-04-24 06:01:35', 2,
        '2025-04-24 06:01:35', NULL);
COMMIT;

-- ----------------------------
-- Table structure for base_employee_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_employee_role_rel`;
CREATE TABLE `base_employee_role_rel`
(
    `id`             bigint NOT NULL COMMENT 'ID',
    `role_id`        bigint NOT NULL COMMENT '拥有角色;#base_role',
    `employee_id`    bigint NOT NULL COMMENT '所属员工;#base_employee',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '最后更新人',
    `updated_time`   datetime DEFAULT NULL COMMENT '最后更新时间',
    `created_org_id` bigint   DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_err_role_employee` (`role_id`, `employee_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='员工的角色';

-- ----------------------------
-- Records of base_employee_role_rel
-- ----------------------------
BEGIN;
INSERT INTO `base_employee_role_rel` (`id`, `role_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                      `updated_time`, `created_org_id`)
VALUES (1, 1452496398934081536, 1452186486492364800, 1, '2024-06-14 15:18:02', 1, '2024-06-14 15:18:04', 1);
INSERT INTO `base_employee_role_rel` (`id`, `role_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                      `updated_time`, `created_org_id`)
VALUES (614058582480276962, 1460615729169563648, 1457904456589901824, 2, '2025-03-28 02:49:47', 2,
        '2025-03-28 02:49:47', NULL);
INSERT INTO `base_employee_role_rel` (`id`, `role_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                      `updated_time`, `created_org_id`)
VALUES (614058582480277184, 1452496398934081536, 160566476187631622, 2, '2025-03-28 05:59:44', 2, '2025-03-28 05:59:44',
        NULL);
INSERT INTO `base_employee_role_rel` (`id`, `role_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                      `updated_time`, `created_org_id`)
VALUES (614058582480277188, 1452944729753780224, 160566476187631622, 2, '2025-03-28 05:59:49', 2, '2025-03-28 05:59:49',
        NULL);
INSERT INTO `base_employee_role_rel` (`id`, `role_id`, `employee_id`, `created_by`, `created_time`, `updated_by`,
                                      `updated_time`, `created_org_id`)
VALUES (614058582480277192, 1460615729169563648, 160566476187631622, 2, '2025-03-28 05:59:54', 2, '2025-03-28 05:59:54',
        NULL);
COMMIT;

-- ----------------------------
-- Table structure for base_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `base_operation_log`;
CREATE TABLE `base_operation_log`
(
    `id`             bigint    NOT NULL COMMENT '主键',
    `request_ip`     varchar(50)    DEFAULT '' COMMENT '操作IP',
    `type`           varchar(5)     DEFAULT 'OPT' COMMENT '日志类型;#LogType{OPT:操作类型;EX:异常类型}',
    `user_name`      varchar(50)    DEFAULT '' COMMENT '操作人',
    `description`    varchar(255)   DEFAULT '' COMMENT '操作描述',
    `class_path`     varchar(255)   DEFAULT '' COMMENT '类路径',
    `action_method`  varchar(50)    DEFAULT '' COMMENT '请求方法',
    `request_uri`    varchar(500)   DEFAULT '' COMMENT '请求地址',
    `http_method`    varchar(10)    DEFAULT 'GET' COMMENT '请求类型;#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
    `start_time`     timestamp NULL DEFAULT NULL COMMENT '开始时间',
    `finish_time`    timestamp NULL DEFAULT NULL COMMENT '完成时间',
    `consuming_time` bigint         DEFAULT '0' COMMENT '消耗时间',
    `ua`             varchar(500)   DEFAULT '' COMMENT '浏览器',
    `created_time`   datetime       DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint         DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime       DEFAULT NULL COMMENT '最后更新时间',
    `updated_by`     bigint         DEFAULT NULL COMMENT '最后更新人',
    `created_org_id` bigint         DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='操作日志';

-- ----------------------------
-- Records of base_operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for base_operation_log_ext
-- ----------------------------
DROP TABLE IF EXISTS `base_operation_log_ext`;
CREATE TABLE `base_operation_log_ext`
(
    `id`             bigint NOT NULL COMMENT '主键',
    `params`         longtext COMMENT '请求参数',
    `result`         longtext COMMENT '返回值',
    `ex_detail`      longtext COMMENT '异常描述',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime DEFAULT NULL COMMENT '最后更新时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '最后更新人ID',
    `created_org_id` bigint   DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='操作日志扩展';

-- ----------------------------
-- Records of base_operation_log_ext
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for base_org
-- ----------------------------
DROP TABLE IF EXISTS `base_org`;
CREATE TABLE `base_org`
(
    `id`             bigint       NOT NULL COMMENT 'ID',
    `name`           varchar(255) NOT NULL COMMENT '名称',
    `type_`          char(2)      DEFAULT '10' COMMENT '类型;[10-单位 20-部门]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.ORG_TYPE)',
    `short_name`     varchar(255) DEFAULT NULL COMMENT '简称',
    `parent_id`      bigint       DEFAULT NULL COMMENT '父组织',
    `tree_grade`     int          DEFAULT '0' COMMENT '树层级',
    `tree_path`      varchar(255) DEFAULT NULL COMMENT '树路径;用id拼接树结构',
    `sort_value`     int          DEFAULT '1' COMMENT '排序',
    `state`          bit(1)       DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
    `remarks`        varchar(255) DEFAULT NULL COMMENT '备注',
    `created_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint       DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime     DEFAULT NULL COMMENT '修改时间',
    `updated_by`     bigint       DEFAULT NULL COMMENT '修改人',
    `created_org_id` bigint       DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_org_name` (`name`) USING BTREE
) ENGINE = InnoDB COMMENT ='组织';

-- ----------------------------
-- Records of base_org
-- ----------------------------
BEGIN;
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (3, '公司经营层', '20', NULL, 1451532773234835456, 2, '/1451532773234835456/1451532667655815168/', 1, b'1', NULL,
        NULL, 0, '2022-01-15 00:28:54', 1452186486253289472, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (180724033313046540, '阿狸子公司', '10', NULL, 1451532667655815168, 1, '/1451532667655815168/', 1, b'1', NULL,
        '2022-01-15 00:26:00', 1452186486253289472, '2022-01-15 00:26:00', 1452186486253289472, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (180724033313046543, '业务部', '20', NULL, 180724033313046540, 2, '/180724033313046540/1451532667655815168/', 1,
        b'1', NULL, '2022-01-15 00:26:19', 1452186486253289472, '2022-01-15 00:26:19', 1452186486253289472, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (180724033313046546, '市场部', '20', NULL, 180724033313046540, 2, '/180724033313046540/1451532667655815168/', 2,
        b'1', NULL, '2022-01-15 00:26:30', 1452186486253289472, '2022-01-15 00:26:30', 1452186486253289472, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (180724033313046553, '公司管理层', '20', '', 1451532773234835456, 2, '/1451532773234835456/1451532667655815168/',
        2, b'1', '', '2022-01-15 00:29:08', 1452186486253289472, '2022-01-15 00:29:08', 1452186486253289472, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (1451532667655815168, '阿里集团', '10', '阿里', 0, 0, '/', 1, b'1', NULL, '2021-10-22 20:55:31', 2,
        '2021-10-22 20:55:31', 2, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (1451532727697276928, '企鹅集团', '10', '1', 0, 0, '/', 1, b'1', NULL, '2021-10-22 20:55:45', 2,
        '2021-10-22 20:55:45', 2, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (1451532773234835456, '领导班子', '20', NULL, 1451532667655815168, 1, '/1451532667655815168/', 2, b'1', NULL,
        '2021-10-22 20:55:56', 2, '2022-01-15 00:26:58', 1452186486253289472, 0);
INSERT INTO `base_org` (`id`, `name`, `type_`, `short_name`, `parent_id`, `tree_grade`, `tree_path`, `sort_value`,
                        `state`, `remarks`, `created_time`, `created_by`, `updated_time`, `updated_by`,
                        `created_org_id`)
VALUES (1451532821628715008, '产品部', '20', NULL, 1451532727697276928, 1, '/1451532727697276928/', 1, b'1', NULL,
        '2021-10-22 20:56:08', 2, '2021-10-22 20:56:08', 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for base_org_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_org_role_rel`;
CREATE TABLE `base_org_role_rel`
(
    `id`             bigint NOT NULL COMMENT 'ID',
    `org_id`         bigint NOT NULL COMMENT '所属部门;#base_org',
    `role_id`        bigint NOT NULL COMMENT '拥有角色;#base_role',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime DEFAULT NULL COMMENT '最后更新时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '最后更新人',
    `created_org_id` bigint   DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_org_role` (`org_id`, `role_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='组织的角色';

-- ----------------------------
-- Records of base_org_role_rel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for base_position
-- ----------------------------
DROP TABLE IF EXISTS `base_position`;
CREATE TABLE `base_position`
(
    `id`             bigint       NOT NULL COMMENT 'ID',
    `name`           varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
    `org_id`         bigint                DEFAULT NULL COMMENT '所属组织;#base_org@Echo(api = EchoApi.ORG_ID_CLASS)',
    `state`          bit(1)                DEFAULT b'1' COMMENT '状态;0-禁用 1-启用',
    `remarks`        varchar(255)          DEFAULT '' COMMENT '备注',
    `created_time`   datetime              DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint                DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime              DEFAULT NULL COMMENT '修改时间',
    `updated_by`     bigint                DEFAULT NULL COMMENT '修改人',
    `created_org_id` bigint                DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE = InnoDB COMMENT ='岗位';

-- ----------------------------
-- Records of base_position
-- ----------------------------
BEGIN;
INSERT INTO `base_position` (`id`, `name`, `org_id`, `state`, `remarks`, `created_time`, `created_by`, `updated_time`,
                             `updated_by`, `created_org_id`)
VALUES (614058582480276861, 'test', 180724033313046540, b'1', '', '2025-03-28 00:40:31', 2, '2025-03-28 00:40:31', 2,
        NULL);
COMMIT;

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role`
(
    `id`             bigint      NOT NULL COMMENT 'ID',
    `category`       char(2)     NOT NULL DEFAULT '10' COMMENT '角色类别;[10-功能角色 20-桌面角色 30-数据角色]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.ROLE_CATEGORY)',
    `type_`          char(2)     NOT NULL DEFAULT '20' COMMENT '角色类型;[10-系统角色 20-自定义角色]; \n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.DATA_TYPE)',
    `name`           varchar(50) NOT NULL COMMENT '名称',
    `code`           varchar(20) NOT NULL COMMENT '编码',
    `remarks`        varchar(255)         DEFAULT NULL COMMENT '备注',
    `state`          bit(1)               DEFAULT b'1' COMMENT '状态',
    `readonly_`      bit(1)               DEFAULT b'0' COMMENT '内置角色',
    `created_by`     bigint               DEFAULT NULL COMMENT '创建人',
    `created_time`   datetime             DEFAULT NULL COMMENT '创建时间',
    `updated_by`     bigint               DEFAULT NULL COMMENT '更新人',
    `updated_time`   datetime             DEFAULT NULL COMMENT '更新时间',
    `created_org_id` bigint               DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE = InnoDB COMMENT ='角色';

-- ----------------------------
-- Records of base_role
-- ----------------------------
BEGIN;
INSERT INTO `base_role` (`id`, `category`, `type_`, `name`, `code`, `remarks`, `state`, `readonly_`, `created_by`,
                         `created_time`, `updated_by`, `updated_time`, `created_org_id`)
VALUES (1, '30', '20', '查询机构数据', '2000', NULL, b'1', b'0', 2, NULL, 2, NULL, 0);
INSERT INTO `base_role` (`id`, `category`, `type_`, `name`, `code`, `remarks`, `state`, `readonly_`, `created_by`,
                         `created_time`, `updated_by`, `updated_time`, `created_org_id`)
VALUES (1452496398934081536, '10', '10', '租户管理员', 'TENANT_ADMIN', '租户管理员', b'1', b'1', 2,
        '2021-10-25 12:45:02', 2, '2021-10-26 18:25:50', 0);
INSERT INTO `base_role` (`id`, `category`, `type_`, `name`, `code`, `remarks`, `state`, `readonly_`, `created_by`,
                         `created_time`, `updated_by`, `updated_time`, `created_org_id`)
VALUES (1452944729753780224, '10', '20', '机构管理员', 'ORG_ADMIN', '单位(门店)管理员', b'1', b'0', 2,
        '2021-10-26 18:26:33', 2, '2021-10-26 18:26:33', 0);
INSERT INTO `base_role` (`id`, `category`, `type_`, `name`, `code`, `remarks`, `state`, `readonly_`, `created_by`,
                         `created_time`, `updated_by`, `updated_time`, `created_org_id`)
VALUES (1460615729169563648, '10', '20', '普通用户', '1000', NULL, b'1', b'0', 1452186486253289472,
        '2021-11-16 22:28:21', 1452186486253289472, '2021-11-16 22:28:21', 0);
COMMIT;

-- ----------------------------
-- Table structure for base_role_resource_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_role_resource_rel`;
CREATE TABLE `base_role_resource_rel`
(
    `id`             bigint NOT NULL COMMENT '主键',
    `resource_id`    bigint NOT NULL COMMENT '拥有资源;#def_resource',
    `application_id` bigint NOT NULL COMMENT '所属应用;#def_application',
    `role_id`        bigint NOT NULL COMMENT '所属角色;#base_role',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime DEFAULT NULL COMMENT '最后更新时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '最后更新人',
    `created_org_id` bigint   DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_role_resource` (`resource_id`, `role_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='角色的资源';

-- ----------------------------
-- Records of base_role_resource_rel
-- ----------------------------
BEGIN;
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (167990275619160169, 1449732868459724800, 1, 167640240079503484, '2021-12-12 01:04:23', 1452186486253289472,
        '2021-12-12 01:04:23', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (174370075875213404, 1449732868459724800, 1, 174370075875213393, '2021-12-28 21:33:13', 1452186486253289472,
        '2021-12-28 21:33:13', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (174370075875213405, 1457601147127726080, 1, 174370075875213393, '2021-12-28 21:33:13', 1452186486253289472,
        '2021-12-28 21:33:13', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631377, 1449733521265393664, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631378, 1449732868459724800, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631379, 1449733787893104640, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631380, 1460468030063509504, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631381, 1460537476991942656, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631382, 1449734007292952576, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631383, 1460436763976663040, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631384, 1460436934051495936, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631385, 1460537873248813056, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631386, 1449738581135327232, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631387, 1449732267470487552, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631388, 1457620528469639168, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631389, 1457620470995091456, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631390, 1457620585302458368, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631391, 1461609523809615872, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631392, 1449739134456299520, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631393, 1457665354649042944, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631394, 1457665399683284992, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631395, 1457665444381982720, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631396, 1457665503664275456, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631397, 1449738119237599232, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631398, 1457665635705159680, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631399, 1457665696765837312, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631400, 1457665749857337344, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631401, 1449731618892677120, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631402, 144313439471271936, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631403, 1460538485118074880, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631404, 1460538532253663232, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631405, 144313439471271937, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631406, 144313439471271938, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631407, 144313439471271940, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631408, 1449730828442533888, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (179609240191631409, 1449730881009745920, 1, 1460615729169563648, '2022-01-12 00:23:30', 1452186486253289472,
        '2022-01-12 00:23:30', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (600410812796116070, 1449733521265393664, 1, 1, '2025-02-19 00:14:15', 2, '2025-02-19 00:14:15', 2, NULL);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (600410812796116071, 1449734007292952576, 1, 1, '2025-02-19 00:14:15', 2, '2025-02-19 00:14:15', 2, NULL);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (600410812796116072, 179582070228516868, 1, 1, '2025-02-19 00:14:15', 2, '2025-02-19 00:14:15', 2, NULL);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233581195264, 1449734450995789824, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233589583872, 144313439471271947, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233589583873, 1449732267470487552, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233589583874, 1449738119237599232, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233589583875, 1449738581135327232, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778176, 1449739134456299520, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778177, 1449732868459724800, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778178, 1449733787893104640, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778179, 1449733521265393664, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778180, 1460537476991942656, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778181, 1460468030063509504, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233593778182, 1449734007292952576, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233602166784, 1460436763976663040, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233602166785, 1460436856054218752, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233602166786, 1460436934051495936, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233602166787, 1460537873248813056, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233602166788, 1457620408604819456, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233602166789, 1457620470995091456, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233606361088, 1457620528469639168, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233606361089, 1457620585302458368, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233606361090, 1457665587088982016, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233606361091, 1457665635705159680, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233606361092, 1457665696765837312, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555392, 1457665749857337344, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555393, 1457665354649042944, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555394, 1457665399683284992, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555395, 1457665444381982720, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555396, 1457665503664275456, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555397, 1457668749124435968, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
INSERT INTO `base_role_resource_rel` (`id`, `resource_id`, `application_id`, `role_id`, `created_time`, `created_by`,
                                      `updated_time`, `updated_by`, `created_org_id`)
VALUES (1460621233610555398, 1457668844297388032, 1, 1452944729753780224, '2021-11-16 22:50:14', 1452186486253289472,
        '2021-11-16 22:50:14', 1452186486253289472, 0);
COMMIT;

-- ----------------------------
-- Table structure for com_appendix
-- ----------------------------
DROP TABLE IF EXISTS `com_appendix`;
CREATE TABLE `com_appendix`
(
    `id`           bigint       NOT NULL COMMENT '文件ID',
    `biz_id`       bigint       NOT NULL COMMENT '业务id',
    `biz_type`     varchar(255) NOT NULL DEFAULT '' COMMENT '业务类型;同一个业务，不同的字段，需要分别设置不同的业务类型',
    `created_time` datetime     NOT NULL COMMENT '创建时间',
    `created_by`   bigint                DEFAULT NULL COMMENT '创建人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='业务附件';

-- ----------------------------
-- Records of com_appendix
-- ----------------------------
BEGIN;
INSERT INTO `com_appendix` (`id`, `biz_id`, `biz_type`, `created_time`, `created_by`)
VALUES (593945495446097920, 3, 'DEF__APPLICATION__LOGO', '2025-02-13 00:22:59', 2);
INSERT INTO `com_appendix` (`id`, `biz_id`, `biz_type`, `created_time`, `created_by`)
VALUES (593945495446098029, 2, 'DEF__APPLICATION__LOGO', '2025-02-09 19:33:05', 2);
INSERT INTO `com_appendix` (`id`, `biz_id`, `biz_type`, `created_time`, `created_by`)
VALUES (630294954723680278, 2, 'DEF__USER__AVATAR', '2025-05-10 14:37:07', 2);
COMMIT;

-- ----------------------------
-- Table structure for com_file
-- ----------------------------
DROP TABLE IF EXISTS `com_file`;
CREATE TABLE `com_file`
(
    `id`                 bigint       NOT NULL COMMENT 'ID',
    `biz_type`           varchar(255) NOT NULL DEFAULT '' COMMENT '业务类型;同一个业务，不同的字段，需要分别设置不同的业务类型',
    `file_type`          varchar(10)           DEFAULT 'OTHER' COMMENT '文件类型;#FileType{IMAGE:图片;VIDEO:视频;AUDIO:音频;DOC:文档;OTHER:其他;}',
    `storage_type`       varchar(30)           DEFAULT 'LOCAL' COMMENT '存储类型;#FileStorageType{LOCAL:本地;FAST_DFS:FastDFS;MIN_IO:MinIO;ALI_OSS:阿里云OSS;QINIU_OSS:七牛云OSS;HUAWEI_OSS:华为云OSS;}',
    `bucket`             varchar(255)          DEFAULT '' COMMENT '桶',
    `path`               varchar(255)          DEFAULT '' COMMENT '文件相对地址',
    `url`                varchar(255)          DEFAULT '' COMMENT '文件访问地址',
    `unique_file_name`   varchar(255)          DEFAULT '' COMMENT '唯一文件名',
    `file_md5`           varchar(255)          DEFAULT '' COMMENT '文件md5',
    `original_file_name` varchar(255)          DEFAULT '' COMMENT '原始文件名',
    `content_type`       varchar(255)          DEFAULT '' COMMENT '文件类型',
    `suffix`             varchar(255)          DEFAULT '' COMMENT '后缀',
    `size_`              bigint                DEFAULT '0' COMMENT '大小',
    `created_time`       datetime     NOT NULL COMMENT '创建时间',
    `created_by`         bigint                DEFAULT NULL COMMENT '创建人',
    `updated_time`       datetime     NOT NULL COMMENT '最后修改时间',
    `updated_by`         bigint                DEFAULT NULL COMMENT '最后修改人',
    `created_org_id`     bigint                DEFAULT NULL COMMENT '创建人组织',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='增量文件上传日志';

-- ----------------------------
-- Records of com_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for def_application
-- ----------------------------
DROP TABLE IF EXISTS `def_application`;
CREATE TABLE `def_application`
(
    `id`           bigint       NOT NULL COMMENT 'ID',
    `app_key`      varchar(255)          DEFAULT '' COMMENT '应用标识',
    `app_secret`   varchar(255)          DEFAULT '' COMMENT '应用秘钥',
    `name`         varchar(255) NOT NULL DEFAULT '' COMMENT '应用名称',
    `version`      varchar(255)          DEFAULT '' COMMENT '版本',
    `type`         char(2)      NOT NULL DEFAULT '10' COMMENT '应用类型;[10-自建应用 20-第三方应用]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.APPLICATION_TYPE)',
    `redirect`     varchar(255)          DEFAULT NULL COMMENT '重定向地址',
    `introduce`    varchar(255)          DEFAULT '' COMMENT '简介',
    `remark`       varchar(255)          DEFAULT '' COMMENT '备注',
    `url`          varchar(255)          DEFAULT '' COMMENT '应用地址',
    `is_general`   bit(1)                DEFAULT b'0' COMMENT '是否公共应用;0-否 1-是',
    `is_visible`   bit(1)                DEFAULT b'1' COMMENT '是否可见;0-否 1-是',
    `sort_value`   int                   DEFAULT '1' COMMENT '排序',
    `created_by`   bigint                DEFAULT NULL COMMENT '创建人',
    `created_time` datetime              DEFAULT NULL COMMENT '创建时间',
    `updated_by`   bigint                DEFAULT NULL COMMENT '最后更新人',
    `updated_time` datetime              DEFAULT NULL COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_application_key` (`app_key`) USING BTREE
) ENGINE = InnoDB COMMENT ='应用';

-- ----------------------------
-- Records of def_application
-- ----------------------------
BEGIN;
INSERT INTO `def_application` (`id`, `app_key`, `app_secret`, `name`, `version`, `type`, `redirect`, `introduce`,
                               `remark`, `url`, `is_general`, `is_visible`, `sort_value`, `created_by`, `created_time`,
                               `updated_by`, `updated_time`)
VALUES (1, 'basicPlatform', 'uhpe70w9rw0qjyp1hd6rae58ioa7anycc00p', '基础平台', '1', '10', '/msg/myMsg',
        '租户的工作台，最基础的功能。',
        '基础平台是整个平台最基础，最核心的功能，所有租户都拥有。可以理解为用户的工作台，跳转其他业务系统的控制台等。', '',
        b'1', b'1', 1, 2, '2021-12-12 12:12:12', 2, '2024-03-15 13:46:22');
INSERT INTO `def_application` (`id`, `app_key`, `app_secret`, `name`, `version`, `type`, `redirect`, `introduce`,
                               `remark`, `url`, `is_general`, `is_visible`, `sort_value`, `created_by`, `created_time`,
                               `updated_by`, `updated_time`)
VALUES (2, 'devOperation', 'ymyqj01qvmz7bpkne5li81cvxma2bebrzb57', '开发运营系统', '1', '10',
        '/application/application', '开发者或运营者使用，系统级功能，不能分配给租户。',
        '开发运营系统是给 开发者和运营者公司的用户使用的，主要维护一些系统级的配置和数据，不能分配给普通租户使用。', '',
        b'0', b'1', 2, 2, '2021-12-12 12:12:13', 2, '2025-02-09 19:33:05');
INSERT INTO `def_application` (`id`, `app_key`, `app_secret`, `name`, `version`, `type`, `redirect`, `introduce`,
                               `remark`, `url`, `is_general`, `is_visible`, `sort_value`, `created_by`, `created_time`,
                               `updated_by`, `updated_time`)
VALUES (3, 'businessSystem', 'c2mn7qb9i194mcypuletfxv8qe182e61awut', '业务系统', '1', '20', '/111:111',
        '根据不同业务开发出来的系统，租户需要购买方可使用。',
        '根据各自的业务，开发出来的系统。根据不同的租户需求，购买后获得此系统的功能。 （这个系统需要你们根据自己情况自行二次开发）',
        '', b'0', b'1', 3, 2, '2021-12-12 12:12:14', 2, '2025-02-13 00:22:59');
COMMIT;

-- ----------------------------
-- Table structure for def_area
-- ----------------------------
DROP TABLE IF EXISTS `def_area`;
CREATE TABLE `def_area`
(
    `id`            bigint       NOT NULL COMMENT 'id',
    `code`          varchar(64)  NOT NULL DEFAULT '' COMMENT '编码;统计用区划代码',
    `division_code` varchar(255)          DEFAULT '' COMMENT '城乡划分代码',
    `name`          varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
    `full_name`     varchar(255)          DEFAULT '' COMMENT '全名',
    `sort_value`    int                   DEFAULT '1' COMMENT '排序',
    `longitude`     varchar(255)          DEFAULT '' COMMENT '经度',
    `latitude`      varchar(255)          DEFAULT '' COMMENT '维度',
    `level_`        char(2)               DEFAULT '10' COMMENT '行政级别;[10-国家 20-省份/直辖市 30-地市 40-区县 50-乡镇]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.AREA_LEVEL)',
    `source_`       char(2)               DEFAULT '' COMMENT '数据来源;[10-爬取 20-新增]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.AREA_SOURCE)',
    `state`         bit(1)                DEFAULT b'0' COMMENT '状态',
    `tree_grade`    int                   DEFAULT '0' COMMENT '树层级',
    `tree_path`     varchar(512)          DEFAULT '/' COMMENT '树路径',
    `parent_id`     bigint                DEFAULT NULL COMMENT '父ID',
    `created_time`  datetime     NOT NULL COMMENT '创建时间',
    `created_by`    bigint                DEFAULT NULL COMMENT '创建人',
    `updated_time`  datetime     NOT NULL COMMENT '更新时间',
    `updated_by`    bigint                DEFAULT NULL COMMENT '更新人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_area_code` (`code`) USING BTREE
) ENGINE = InnoDB COMMENT ='地区表';

-- ----------------------------
-- Records of def_area
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for def_client
-- ----------------------------
DROP TABLE IF EXISTS `def_client`;
CREATE TABLE `def_client`
(
    `id`            bigint       NOT NULL COMMENT 'ID',
    `client_id`     varchar(24)  NOT NULL DEFAULT '' COMMENT '客户端ID',
    `client_secret` varchar(32)  NOT NULL DEFAULT '' COMMENT '客户端密码',
    `name`          varchar(255) NOT NULL DEFAULT '' COMMENT '客户端名称',
    `type`          char(2)               DEFAULT '10' COMMENT '类型;[10-WEB网站;15-移动端应用;20-手机H5网页;25-内部服务; 30-第三方应用]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.CLIENT_TYPE)',
    `remarks`       varchar(255)          DEFAULT '' COMMENT '备注',
    `state`         bit(1)                DEFAULT b'1' COMMENT '状态',
    `created_by`    bigint                DEFAULT NULL COMMENT '创建人id',
    `created_time`  datetime              DEFAULT NULL COMMENT '创建时间',
    `updated_by`    bigint                DEFAULT NULL COMMENT '更新人id',
    `updated_time`  datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_client_client_id` (`client_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='客户端';

-- ----------------------------
-- Records of def_client
-- ----------------------------
BEGIN;
INSERT INTO `def_client` (`id`, `client_id`, `client_secret`, `name`, `type`, `remarks`, `state`, `created_by`,
                          `created_time`, `updated_by`, `updated_time`)
VALUES (1, 'kpu_web', 'kpu_web_secret', 'kpu-web', '10', '', b'1', 2, '2021-10-16 22:33:48', 2, '2021-10-16 22:33:48');
COMMIT;

-- ----------------------------
-- Table structure for def_datasource_config
-- ----------------------------
DROP TABLE IF EXISTS `def_datasource_config`;
CREATE TABLE `def_datasource_config`
(
    `id`                bigint       NOT NULL COMMENT '主键ID',
    `name`              varchar(255) NOT NULL COMMENT '名称',
    `username`          varchar(255) NOT NULL COMMENT '账号',
    `password`          varchar(255) NOT NULL COMMENT '密码',
    `url`               varchar(255) NOT NULL COMMENT '链接',
    `driver_class_name` varchar(255) NOT NULL COMMENT '驱动',
    `created_time`      datetime     NOT NULL COMMENT '创建时间',
    `created_by`        bigint DEFAULT NULL COMMENT '创建人',
    `updated_time`      datetime     NOT NULL COMMENT '修改时间',
    `updated_by`        bigint DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='数据源';

-- ----------------------------
-- Records of def_datasource_config
-- ----------------------------
BEGIN;
INSERT INTO `def_datasource_config` (`id`, `name`, `username`, `password`, `url`, `driver_class_name`, `created_time`,
                                     `created_by`, `updated_time`, `updated_by`)
VALUES (1, 'defaults库', 'root', 'lmx123125',
        'jdbc:mysql://127.0.0.1:3306/kpu_ds_c_defaults?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true',
        'com.mysql.cj.jdbc.Driver', '2022-03-03 13:30:41', 1452186486253289472, '2024-04-08 15:45:28', 2);
INSERT INTO `def_datasource_config` (`id`, `name`, `username`, `password`, `url`, `driver_class_name`, `created_time`,
                                     `created_by`, `updated_time`, `updated_by`)
VALUES (2, 'base库', 'root', 'lmx123125',
        'jdbc:mysql://127.0.0.1:3306/kpu_none?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true',
        'com.mysql.cj.jdbc.Driver', '2022-03-29 11:17:54', 1452186486253289472, '2025-02-16 01:00:35', 2);
INSERT INTO `def_datasource_config` (`id`, `name`, `username`, `password`, `url`, `driver_class_name`, `created_time`,
                                     `created_by`, `updated_time`, `updated_by`)
VALUES (624241460312870125, 'base库', 'root', 'lmx123125',
        'jdbc:mysql://127.0.0.1:3306/kpu_none?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&nullCatalogMeansCurrent=true',
        'com.mysql.cj.jdbc.Driver', '2025-04-24 10:51:23', 2, '2025-04-24 10:51:23', 2);
COMMIT;

-- ----------------------------
-- Table structure for def_dict
-- ----------------------------
DROP TABLE IF EXISTS `def_dict`;
CREATE TABLE `def_dict`
(
    `id`           bigint       NOT NULL COMMENT 'ID',
    `parent_id`    bigint       NOT NULL DEFAULT '0' COMMENT '字典ID',
    `parent_key`   varchar(255)          DEFAULT NULL COMMENT '父字典标识',
    `classify`     char(2)      NOT NULL DEFAULT '20' COMMENT '分类;[10-系统字典 20-业务字典]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.DICT_CLASSIFY)',
    `key_`         varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
    `name`         varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
    `state`        bit(1)                DEFAULT b'1' COMMENT '状态',
    `remark`       varchar(255)          DEFAULT '' COMMENT '备注',
    `sort_value`   int                   DEFAULT '1' COMMENT '排序',
    `icon`         varchar(255)          DEFAULT '' COMMENT '图标',
    `css_style`    varchar(255)          DEFAULT '' COMMENT 'css样式',
    `css_class`    varchar(255)          DEFAULT '' COMMENT 'css类元素',
    `created_by`   bigint                DEFAULT NULL COMMENT '创建人id',
    `created_time` datetime     NOT NULL COMMENT '创建时间',
    `updated_by`   bigint                DEFAULT NULL COMMENT '更新人id',
    `updated_time` datetime     NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_dict_key` (`parent_id`, `key_`) USING BTREE
) ENGINE = InnoDB COMMENT ='字典';

-- ----------------------------
-- Records of def_dict
-- ----------------------------
BEGIN;
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1, 0, '', '10', 'TENANT_RESOURCE_TYPE', '资源类型', b'1', '[20-菜单 30-视图 40-按钮 50-字段]', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (2, 1, 'TENANT_RESOURCE_TYPE', '10', '20', '菜单', b'1', '', 1, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (4, 1, 'TENANT_RESOURCE_TYPE', '10', '40', '按钮', b'1', '', 3, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (5, 1, 'TENANT_RESOURCE_TYPE', '10', '50', '字段', b'1', '', 4, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (6, 1, 'TENANT_RESOURCE_TYPE', '10', '60', '数据', b'1', '', 5, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (43, 1451108231005863936, 'GLOBAL_NATION', '20', '01', '汉族', b'1', '', 0, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (44, 1451108231005863936, 'GLOBAL_NATION', '20', '02', '壮族', b'1', '', 1, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (45, 1451108231005863936, 'GLOBAL_NATION', '20', '03', '满族', b'1', '', 2, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (46, 1451108231005863936, 'GLOBAL_NATION', '20', '04', '回族', b'1', '', 3, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (47, 1451108231005863936, 'GLOBAL_NATION', '20', '05', '苗族', b'1', '', 4, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (48, 1451108231005863936, 'GLOBAL_NATION', '20', '06', '维吾尔族', b'1', '', 5, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (49, 1451108231005863936, 'GLOBAL_NATION', '20', '07', '土家族', b'1', '', 6, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (50, 1451108231005863936, 'GLOBAL_NATION', '20', '08', '彝族', b'1', '', 7, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (51, 1451108231005863936, 'GLOBAL_NATION', '20', '09', '蒙古族', b'1', '', 8, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (52, 1451108231005863936, 'GLOBAL_NATION', '20', '10', '藏族', b'1', '', 9, '', '', '', 1, '2021-12-12 12:12:12',
        1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (53, 1451108231005863936, 'GLOBAL_NATION', '20', '11', '布依族', b'1', '', 10, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (54, 1451108231005863936, 'GLOBAL_NATION', '20', '12', '侗族', b'1', '', 11, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (55, 1451108231005863936, 'GLOBAL_NATION', '20', '13', '瑶族', b'1', '', 12, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (56, 1451108231005863936, 'GLOBAL_NATION', '20', '14', '朝鲜族', b'1', '', 13, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (57, 1451108231005863936, 'GLOBAL_NATION', '20', '15', '白族', b'1', '', 14, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (58, 1451108231005863936, 'GLOBAL_NATION', '20', '16', '哈尼族', b'1', '', 15, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (59, 1451108231005863936, 'GLOBAL_NATION', '20', '17', '哈萨克族', b'1', '', 16, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (60, 1451108231005863936, 'GLOBAL_NATION', '20', '18', '黎族', b'1', '', 17, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (61, 1451108231005863936, 'GLOBAL_NATION', '20', '19', '傣族', b'1', '', 18, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (62, 1451108231005863936, 'GLOBAL_NATION', '20', '20', '畲族', b'1', '', 19, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (63, 1451108231005863936, 'GLOBAL_NATION', '20', '21', '傈僳族', b'1', '', 20, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (64, 1451108231005863936, 'GLOBAL_NATION', '20', '22', '仡佬族', b'1', '', 21, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (65, 1451108231005863936, 'GLOBAL_NATION', '20', '23', '东乡族', b'1', '', 22, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (66, 1451108231005863936, 'GLOBAL_NATION', '20', '24', '高山族', b'1', '', 23, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (67, 1451108231005863936, 'GLOBAL_NATION', '20', '25', '拉祜族', b'1', '', 24, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (68, 1451108231005863936, 'GLOBAL_NATION', '20', '26', '水族', b'1', '', 25, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (69, 1451108231005863936, 'GLOBAL_NATION', '20', '27', '佤族', b'1', '', 26, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (70, 1451108231005863936, 'GLOBAL_NATION', '20', '28', '纳西族', b'1', '', 27, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (71, 1451108231005863936, 'GLOBAL_NATION', '20', '29', '羌族', b'1', '', 28, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (72, 1451108231005863936, 'GLOBAL_NATION', '20', '30', '土族', b'1', '', 29, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (73, 1451108231005863936, 'GLOBAL_NATION', '20', '31', '仫佬族', b'1', '', 30, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (74, 1451108231005863936, 'GLOBAL_NATION', '20', '32', '锡伯族', b'1', '', 31, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (75, 1451108231005863936, 'GLOBAL_NATION', '20', '33', '柯尔克孜族', b'1', '', 32, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (76, 1451108231005863936, 'GLOBAL_NATION', '20', '34', '达斡尔族', b'1', '', 33, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (77, 1451108231005863936, 'GLOBAL_NATION', '20', '35', '景颇族', b'1', '', 34, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (78, 1451108231005863936, 'GLOBAL_NATION', '20', '36', '毛南族', b'1', '', 35, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (79, 1451108231005863936, 'GLOBAL_NATION', '20', '37', '撒拉族', b'1', '', 36, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (80, 1451108231005863936, 'GLOBAL_NATION', '20', '38', '塔吉克族', b'1', '', 37, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (81, 1451108231005863936, 'GLOBAL_NATION', '20', '39', '阿昌族', b'1', '', 38, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (82, 1451108231005863936, 'GLOBAL_NATION', '20', '40', '普米族', b'1', '', 39, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (83, 1451108231005863936, 'GLOBAL_NATION', '20', '41', '鄂温克族', b'1', '', 40, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (84, 1451108231005863936, 'GLOBAL_NATION', '20', '42', '怒族', b'1', '', 41, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (85, 1451108231005863936, 'GLOBAL_NATION', '20', '43', '京族', b'1', '', 42, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (86, 1451108231005863936, 'GLOBAL_NATION', '20', '44', '基诺族', b'1', '', 43, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (87, 1451108231005863936, 'GLOBAL_NATION', '20', '45', '德昂族', b'1', '', 44, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (88, 1451108231005863936, 'GLOBAL_NATION', '20', '46', '保安族', b'1', '', 45, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (89, 1451108231005863936, 'GLOBAL_NATION', '20', '47', '俄罗斯族', b'1', '', 46, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (90, 1451108231005863936, 'GLOBAL_NATION', '20', '48', '裕固族', b'1', '', 47, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (91, 1451108231005863936, 'GLOBAL_NATION', '20', '49', '乌兹别克族', b'1', '', 48, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (92, 1451108231005863936, 'GLOBAL_NATION', '20', '50', '门巴族', b'1', '', 49, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (93, 1451108231005863936, 'GLOBAL_NATION', '20', '51', '鄂伦春族', b'1', '', 50, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (94, 1451108231005863936, 'GLOBAL_NATION', '20', '52', '独龙族', b'1', '', 51, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (95, 1451108231005863936, 'GLOBAL_NATION', '20', '53', '塔塔尔族', b'1', '', 52, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (96, 1451108231005863936, 'GLOBAL_NATION', '20', '54', '赫哲族', b'1', '', 53, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (97, 1451108231005863936, 'GLOBAL_NATION', '20', '55', '珞巴族', b'1', '', 54, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (98, 1451108231005863936, 'GLOBAL_NATION', '20', '56', '布朗族', b'1', '', 55, '', '', '', 1,
        '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (99, 1451108231005863936, 'GLOBAL_NATION', '20', '57', '其他', b'1', '', 100, '', '', '', 3,
        '2021-12-12 12:12:12', 3, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078147, 0, '', '10', 'GLOBAL_SEX', '性别', b'1', '', 1, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078148, 0, '', '20', 'TENANT_APPLICATION_TYPE', '应用类型', b'1', '[10-自建应用 20-第三方应用]', 1,
        '', '', '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078149, 0, '', '20', 'TENANT_APPLICATION_GRANT_TYPE', '授权类型', b'1',
        '[10-应用授权 20-应用续期 30-取消授权]', 1, '', '', '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078150, 143963605795078149, 'TENANT_APPLICATION_GRANT_TYPE', '10', '10', '应用授权', b'1', '', 1,
        '', 'success', 'success', 2, '2021-12-12 12:12:12', 2, '2024-05-18 00:34:08');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078151, 143963605795078149, 'TENANT_APPLICATION_GRANT_TYPE', '10', '20', '应用续期', b'1', '', 2,
        '', 'info', 'info', 2, '2021-12-12 12:12:12', 2, '2024-05-18 00:34:34');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078152, 143963605795078149, 'TENANT_APPLICATION_GRANT_TYPE', '10', '30', '取消授权', b'1', '', 3,
        '', 'warning', 'warning', 2, '2021-12-12 12:12:12', 2, '2024-05-18 00:34:39');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078153, 143963605795078148, 'TENANT_APPLICATION_TYPE', '10', '10', '自建应用', b'1', '', 1, '', '',
        'success', 2, '2021-12-12 12:12:12', 2, '2024-03-07 21:21:27');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078154, 143963605795078148, 'TENANT_APPLICATION_TYPE', '10', '20', '第三方应用', b'1', '', 2, '',
        '', 'error', 2, '2021-12-12 12:12:12', 2, '2024-03-07 21:19:49');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078155, 143963605795078147, 'GLOBAL_SEX', '10', '1', '男', b'1', '', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (143963605795078156, 143963605795078147, 'GLOBAL_SEX', '10', '2', '女', b'1', '', 2, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (160561957882036228, 0, '', '10', 'TENANT_RESOURCE_OPEN_WITH', '打开方式', b'1', '[01-组件 02-内链 03-外链]', 1,
        '', '', '', 1, '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (160561957882036229, 160561957882036228, 'TENANT_RESOURCE_OPEN_WITH', '10', '01', '组件', b'1', '', 1, '', '',
        'success', 1, '2021-12-12 12:12:12', 2, '2024-04-16 10:24:17');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (160561957882036230, 160561957882036228, 'TENANT_RESOURCE_OPEN_WITH', '10', '02', '内链', b'1', '', 2, '', '',
        'error', 1, '2021-12-12 12:12:12', 2, '2024-04-16 10:24:24');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (160561957882036231, 160561957882036228, 'TENANT_RESOURCE_OPEN_WITH', '10', '03', '外链', b'1', '', 3, '', '',
        'info', 1, '2021-12-12 12:12:12', 2, '2024-04-16 10:24:27');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293568, 0, '', '10', 'BASE_ROLE_CATEGORY', '角色类别', b'1',
        '[10-功能角色 20-桌面角色 30-数据角色]', 1, '', '', '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293569, 0, '', '10', 'TENANT_RESOURCE_DATA_SCOPE', '数据范围', b'1',
        '[01-全部 02-本单位及子级 03-本单位 04-本部门及子级 05-本部门 06-个人 07-自定义]', 1, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293570, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '01', '全部', b'1', '', 1, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293571, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '02', '本单位及子级', b'1', '', 2,
        '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293572, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '03', '本单位', b'1', '', 3, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293573, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '04', '本部门及子级', b'1', '', 4,
        '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293574, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '05', '本部门', b'1', '', 5, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293575, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '06', '个人', b'1', '', 6, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293576, 179467712429293569, 'TENANT_RESOURCE_DATA_SCOPE', '10', '07', '自定义', b'1', '', 7, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293577, 179467712429293568, 'BASE_ROLE_CATEGORY', '10', '10', '功能角色', b'1', '', 1, '', '',
        'success', 1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:23:34');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293578, 179467712429293568, 'BASE_ROLE_CATEGORY', '10', '20', '桌面角色', b'1', '', 2, '', '',
        'info', 1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:23:42');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (179467712429293579, 179467712429293568, 'BASE_ROLE_CATEGORY', '10', '30', '数据角色', b'1', '', 1, '', '',
        'error', 1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:23:38');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (216686795209834626, 0, '', '20', 'TEST_ADD_DICT', '整形字典', b'1', '[1-测试 2-新增 aad-haha]', 1, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (216686795209834627, 216686795209834626, 'TEST_ADD_DICT', '20', '1', '测试', b'1', '', 1, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (216686795209834628, 216686795209834626, 'TEST_ADD_DICT', '20', '2', '新增', b'1', '', 1, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (244439645515939840, 0, '', '10', 'INTERFACE_EXEC_MODE', '执行模式', b'1', '接口执行模式 [01-实现类 02-脚本]', 1,
        '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (244439645515939841, 244439645515939840, 'INTERFACE_EXEC_MODE', '10', '01', '实现类', b'1', '', 1, '', '',
        'success', 1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:25:03');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (244439645515939842, 244439645515939840, 'INTERFACE_EXEC_MODE', '10', '02', '脚本', b'1', '', 2, '', '', 'error',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:25:09');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922112, 0, '', '10', 'MSG_TEMPLATE_TYPE', '消息类型', b'1', '[01-短信 02-邮件 03-站内信]', 1, '',
        '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922113, 245619503096922112, 'MSG_TEMPLATE_TYPE', '10', '01', '短信', b'1', '', 1, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922114, 245619503096922112, 'MSG_TEMPLATE_TYPE', '10', '02', '邮件', b'1', '', 2, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922115, 245619503096922112, 'MSG_TEMPLATE_TYPE', '10', '03', '站内信', b'1', '', 3, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922116, 0, '', '10', 'NOTICE_TARGET', '打开方式', b'1', '[01-页面 02-弹窗 03-新开窗口]', 1, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922117, 245619503096922116, 'NOTICE_TARGET', '10', '01', '页面', b'1', '', 1, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922118, 245619503096922116, 'NOTICE_TARGET', '10', '02', '弹窗', b'1', '', 2, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922119, 245619503096922116, 'NOTICE_TARGET', '10', '03', '新开窗口', b'1', '', 3, '', '', '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922120, 0, '', '10', 'NOTICE_REMIND_MODE', '提醒方式', b'1', '[01-待办 02-预警 03-提醒]', 1, '', '',
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922121, 245619503096922120, 'NOTICE_REMIND_MODE', '10', '01', '待办', b'1', '', 1, '', '',
        'success', 1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:25:23');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922122, 245619503096922120, 'NOTICE_REMIND_MODE', '10', '02', '预警', b'1', '', 2, '', '', 'error',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:25:28');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245619503096922123, 245619503096922120, 'NOTICE_REMIND_MODE', '10', '03', '提醒', b'1', '', 3, '', '', 'info',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2024-04-16 10:25:33');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (249679058940461056, 0, '', '10', 'MSG_INTERFACE_LOGGING_STATUS', '接口日志执行状态', b'1',
        '[01-初始化 02-成功 03-失败]', 1, '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (249679058940461057, 249679058940461056, 'MSG_INTERFACE_LOGGING_STATUS', '10', '01', '初始化', b'1',
        '[01-初始化 02-成功 03-失败]', 1, '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (249679058940461058, 249679058940461056, 'MSG_INTERFACE_LOGGING_STATUS', '10', '02', '成功', b'1',
        '[01-初始化 02-成功 03-失败]', 2, '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (249679058940461059, 249679058940461056, 'MSG_INTERFACE_LOGGING_STATUS', '10', '03', '失败', b'1',
        '[01-初始化 02-成功 03-失败]', 3, '', '', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530588, 0, NULL, '10', 'TENANT_LOGIN_STATUS', '登录状态', b'1',
        '[01-登录成功 02-验证码错误 03-密码错误 04-账号锁定 05-切换租户 06-短信验证码错误]', 1, '', '', '',
        1452186486253289472, '2022-10-12 17:50:44', 1452186486253289472, '2022-10-12 17:52:06');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530601, 281139711563530588, 'TENANT_LOGIN_STATUS', '10', '01', '登录成功', b'1', '', 1, '', '',
        'success', 1452186486253289472, '2022-10-12 17:52:06', 2, '2024-04-16 10:25:44');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530602, 281139711563530588, 'TENANT_LOGIN_STATUS', '10', '02', '验证码错误', b'1', '', 2, '', '',
        'error', 1452186486253289472, '2022-10-12 17:52:06', 2, '2024-04-16 10:26:46');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530603, 281139711563530588, 'TENANT_LOGIN_STATUS', '10', '03', '密码错误', b'1', '', 3, '', '',
        'error', 1452186486253289472, '2022-10-12 17:52:06', 2, '2024-04-16 10:26:52');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530604, 281139711563530588, 'TENANT_LOGIN_STATUS', '10', '04', '账号锁定', b'1', '', 4, '', '',
        'warning', 1452186486253289472, '2022-10-12 17:52:06', 2, '2024-04-16 10:27:28');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530605, 281139711563530588, 'TENANT_LOGIN_STATUS', '10', '05', '切换租户', b'1', '', 5, '', '',
        'info', 1452186486253289472, '2022-10-12 17:52:06', 2, '2024-04-16 10:27:07');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281139711563530606, 281139711563530588, 'TENANT_LOGIN_STATUS', '10', '06', '短信验证码错误', b'1', '', 6, '',
        '', 'error', 1452186486253289472, '2022-10-12 17:52:06', 2, '2024-04-16 10:27:00');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (598052407599096939, 0, NULL, '10', 'DATASOURCE_CONFIG_DRIVER', '数据源驱动', b'1', '', 1, '', '', '', 2,
        '2025-02-12 17:27:23', 2, '2025-02-12 17:27:23');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (598052407599096947, 598052407599096939, 'DATASOURCE_CONFIG_DRIVER', '10', 'com.mysql.cj.jdbc.Driver', 'mysql6',
        b'1', '', 1, '', '', '', 2, '2025-02-12 17:30:28', 2, '2025-02-12 17:30:28');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (598052407599096951, 598052407599096939, 'DATASOURCE_CONFIG_DRIVER', '10', 'com.mysql.jdbc.Driver', 'mysql5',
        b'1', '', 2, '', '', '', 2, '2025-02-12 17:30:51', 2, '2025-02-12 17:30:51');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (598052407599096955, 598052407599096939, 'DATASOURCE_CONFIG_DRIVER', '10', 'oracle.jdbc.driver.OracleDriver',
        'oracle', b'1', '', 3, '', '', '', 2, '2025-02-12 17:31:19', 2, '2025-02-12 17:31:19');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (598052407599096960, 598052407599096939, 'DATASOURCE_CONFIG_DRIVER', '10',
        'com.microsoft.sqlserver.jdbc.SQLServerDriver', 'sqlserver', b'1', '', 4, '', '', '', 2, '2025-02-12 17:31:50',
        2, '2025-02-12 17:31:50');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1445949268236959744, 0, '', '10', 'TENANT_DICT_CLASSIFY', '字典分类', b'1', '[10-系统字典 20-业务字典]', 1, '',
        '', '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1445983002105479168, 1445949268236959744, 'TENANT_DICT_CLASSIFY', '10', '10', '系统字典', b'1', '', 1, '', '',
        'success', 2, '2021-12-12 12:12:12', 2, '2024-04-16 10:28:49');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1445983070812372992, 1445949268236959744, 'TENANT_DICT_CLASSIFY', '10', '20', '业务字典', b'1', '', 2, '', '',
        'info', 2, '2021-12-12 12:12:12', 2, '2024-04-16 10:29:00');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448505925026447360, 0, '', '10', 'GLOBAL_AREA_LEVEL', '行政级别', b'1',
        '[10-国家 20-省份/直辖市 30-地市 40-区县 50-乡镇]', 1, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448506028873220096, 0, '', '10', 'TENANT_CLIENT_TYPE', '客户端类型', b'1',
        '[10-WEB网站;15-移动端应用;20-手机H5网页;25-内部服务; 30-第三方应用]', 1, '', '', '', 2, '2021-12-12 12:12:12',
        2, '2024-05-17 12:29:00');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448506127556804608, 0, '', '10', 'TENANT_AREA_SOURCE', '地区来源', b'1', '[10-爬取 20-新增]', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448506284952256512, 0, '', '10', 'TENANT_PARAMETER_TYPE', '参数类型', b'1', '[10-系统参数 20-业务参数]', 1, '',
        '', '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448515694336409600, 1448506284952256512, 'TENANT_PARAMETER_TYPE', '10', '10', '系统参数', b'1', '', 1, '', '',
        '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448515728603873280, 1448506284952256512, 'TENANT_PARAMETER_TYPE', '10', '20', '业务参数', b'1', '', 2, '', '',
        '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448515804071985152, 1448506127556804608, 'TENANT_AREA_SOURCE', '10', '10', '爬取', b'1', '', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448515832505171968, 1448506127556804608, 'TENANT_AREA_SOURCE', '10', '20', '新增', b'1', '', 2, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448636555584339968, 1448505925026447360, 'GLOBAL_AREA_LEVEL', '10', '10', '国家', b'1', '', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448636622080835584, 1448505925026447360, 'GLOBAL_AREA_LEVEL', '10', '20', '省份/直辖市', b'1', '', 2, '', '',
        '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448636660773289984, 1448505925026447360, 'GLOBAL_AREA_LEVEL', '10', '30', '地市', b'1', '', 3, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448636742079873024, 1448505925026447360, 'GLOBAL_AREA_LEVEL', '10', '40', '区县', b'1', '', 4, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448636799311151104, 1448505925026447360, 'GLOBAL_AREA_LEVEL', '10', '50', '乡镇', b'1', '', 5, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448646183458177024, 1448506028873220096, 'TENANT_CLIENT_TYPE', '10', '10', 'WEB网站', b'1', '', 1, '', '', '',
        2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448650608742498304, 1448506028873220096, 'TENANT_CLIENT_TYPE', '10', '15', '移动端应用', b'1', '', 2, '', '',
        '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448650640468213760, 1448506028873220096, 'TENANT_CLIENT_TYPE', '10', '20', '手机H5网页', b'1', '', 3, '', '',
        '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448650682050543616, 1448506028873220096, 'TENANT_CLIENT_TYPE', '10', '25', '内部服务', b'1', '', 4, '', '', '',
        2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1448650761264168960, 1448506028873220096, 'TENANT_CLIENT_TYPE', '10', '30', '第三方应用', b'1', '', 5, '', '',
        '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451099664811032576, 0, '', '10', 'BASE_ORG_TYPE', '机构类型', b'1', '[10-单位/门店 20-部门]', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451099742934138880, 1451099664811032576, 'BASE_ORG_TYPE', '10', '10', '单位', b'1', '', 1, '', '', 'success',
        2, '2021-12-12 12:12:12', 2, '2024-04-16 10:29:20');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451099769471500288, 1451099664811032576, 'BASE_ORG_TYPE', '10', '20', '部门', b'1', '', 2, '', '', 'error', 2,
        '2021-12-12 12:12:12', 2, '2024-04-16 10:29:26');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451100760304517120, 0, '', '10', 'BASE_POSITION_STATUS', '职位状态', b'1', '[10-在职 20-离职 30-未激活]', 1,
        '', '', '', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451100809038135296, 1451100760304517120, 'BASE_POSITION_STATUS', '10', '10', '在职', b'1', '', 1, '', '', '',
        2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451100851467714560, 1451100760304517120, 'BASE_POSITION_STATUS', '10', '20', '离职', b'1', '', 2, '', '', '',
        2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451103343890923520, 0, '', '10', 'GLOBAL_EDUCATION', '学历', b'1',
        '[01-小学 02-中学 03-高中 04-专科 05-本科 06-硕士 07-博士 08-博士后 09-其他]', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451103396311334912, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '01', '小学', b'1', '', 1, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451103460706484224, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '02', '中学', b'1', '', 2, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105115103559680, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '03', '高中', b'1', '', 3, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105202630295552, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '04', '专科', b'1', '', 4, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105239401758720, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '05', '本科', b'1', '', 5, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105277691559936, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '06', '硕士', b'1', '', 6, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105309626990592, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '07', '博士', b'1', '', 7, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105398009364480, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '08', '博士后', b'1', '', 8, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451105441353302016, 1451103343890923520, 'GLOBAL_EDUCATION', '10', '99', '其他', b'1', '', 99, '', '', '', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1451108231005863936, 0, '', '10', 'GLOBAL_NATION', '民族', b'1', '', 1, '', '', '', 2, '2021-12-12 12:12:12', 2,
        '2024-06-10 15:20:34');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333051138998272, 0, '', '10', 'TENANT_TENANT_STATUS', '租户审核状态', b'1',
        '[05-正常 10-待初始化 15-已撤回 20-待审核 25-已拒绝 30-已同意]', 1, '', '', '', 1451549146992345088,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333103441969152, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '05', '正常', b'1', '', 1, '', '', '',
        1451549146992345088, '2021-12-12 12:12:12', 1451549146992345088, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333135360622592, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '10', '待初始化结构', b'1', '', 2, '',
        '', '', 1451549146992345088, '2021-12-12 12:12:12', 1451549146992345088, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333161860235264, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '15', '待初始化数据源', b'1', '', 3, '',
        '', '', 1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333189936906240, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '20', '已撤回', b'1', '', 4, '', '', '',
        1451549146992345088, '2021-12-12 12:12:12', 1451549146992345088, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333229619216384, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '25', '待审核', b'1', '', 5, '', '', '',
        1451549146992345088, '2021-12-12 12:12:12', 1451549146992345088, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333259683987456, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '30', '已拒绝', b'1', '', 6, '', '', '',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_dict` (`id`, `parent_id`, `parent_key`, `classify`, `key_`, `name`, `state`, `remark`, `sort_value`,
                        `icon`, `css_style`, `css_class`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454333259683987458, 1454333051138998272, 'TENANT_TENANT_STATUS', '10', '35', '已同意', b'1', '', 7, '', '', '',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
COMMIT;

-- ----------------------------
-- Table structure for def_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_table`;
CREATE TABLE `def_gen_table`
(
    `id`                     bigint       NOT NULL COMMENT '编号',
    `name`                   varchar(200) NOT NULL COMMENT '表名称',
    `comment_`               varchar(500)          DEFAULT NULL COMMENT '表描述',
    `swagger_comment`        varchar(255)          DEFAULT NULL COMMENT 'swagger描述',
    `ds_id`                  bigint       NOT NULL COMMENT '数据源',
    `author`                 varchar(255) NOT NULL COMMENT '作者',
    `sub_id`                 bigint                DEFAULT NULL COMMENT '关联子表的ID',
    `sub_java_field_name`    varchar(255)          DEFAULT NULL COMMENT '子表关联的外键Java字段名',
    `entity_name`            varchar(255) NOT NULL COMMENT '实体类名称',
    `entity_super_class`     char(2)      NOT NULL COMMENT '实体父类;\n#EntitySuperClassEnum{SUPER_ENTITY:01}',
    `super_class`            char(2)      NOT NULL COMMENT '父类;\n\n#SuperClassEnum{SUPER_CLASS:01}',
    `parent`                 varchar(255) NOT NULL COMMENT '基础包路径',
    `plus_application_name`  varchar(255)          DEFAULT NULL COMMENT '前端应用名;如：src/views目录下的basic和devOperation,basic表示基础平台。devOperation表示开发运营系统。xxx 表示你们自己新建的xxx系统。',
    `plus_module_name`       varchar(255)          DEFAULT NULL COMMENT '前端模块名;如：src/views/devOperation目录下的文件夹名\n如：src/views/basic 目录下的文件夹名',
    `service_name`           varchar(255)          DEFAULT NULL COMMENT '服务名',
    `module_name`            varchar(255)          DEFAULT NULL COMMENT '模块名',
    `child_package_name`     varchar(255)          DEFAULT NULL COMMENT '子包名',
    `is_tenant_line`         bit(1)       NOT NULL DEFAULT b'0' COMMENT '行级租户注解',
    `ds_value`               varchar(255)          DEFAULT NULL COMMENT '数据源',
    `is_ds`                  bit(1)       NOT NULL DEFAULT b'0' COMMENT '数据源级租户注解',
    `is_lombok`              bit(1)       NOT NULL DEFAULT b'1' COMMENT '是否为lombok模型',
    `is_chain`               bit(1)       NOT NULL DEFAULT b'1' COMMENT '是否为链式模型',
    `is_column_constant`     bit(1)       NOT NULL DEFAULT b'0' COMMENT '是否生成字段常量',
    `gen_type`               char(2)      NOT NULL DEFAULT '01' COMMENT '生成代码方式;、; [01-zip压缩包 02-自定义路径]\n#GenTypeEnum{GEN:01,直接生成;ZIP:02,打包下载;}\n',
    `output_dir`             varchar(255)          DEFAULT '/' COMMENT '生成路径;（不填默认项目路径）',
    `front_output_dir`       varchar(255)          DEFAULT NULL COMMENT '前端(Vben)生成路径;（不填默认项目路径）',
    `front_vben5_output_dir` varchar(255)          DEFAULT NULL COMMENT '前端(Vben5)生成路径;（不填默认项目路径）',
    `front_soy_output_dir`   varchar(255)          DEFAULT NULL COMMENT '前端(Soybean)生成路径;（不填默认项目路径）',
    `tpl_type`               char(2)      NOT NULL DEFAULT '01' COMMENT '使用的模板; #TplEnum{SIMPLE:01,单表;TREE:02,树结构;MAIN_SUB:03,主从结构}',
    `popup_type`             char(2)      NOT NULL DEFAULT '01' COMMENT '弹窗方式; #PopupTypeEnum{MODAL:01,对话框;DRAWER:02,抽屉;}',
    `add_auth`               varchar(255)          DEFAULT NULL COMMENT '新增按钮权限编码',
    `edit_auth`              varchar(255)          DEFAULT NULL COMMENT '编辑按钮权限编码',
    `delete_auth`            varchar(255)          DEFAULT NULL COMMENT '删除按钮权限编码',
    `view_auth`              varchar(255)          DEFAULT NULL COMMENT '查看按钮权限编码',
    `copy_auth`              varchar(255)          DEFAULT NULL COMMENT '复制按钮权限编码',
    `add_show`               bit(1)       NOT NULL DEFAULT b'1' COMMENT '新增按钮是否显示',
    `edit_show`              bit(1)       NOT NULL DEFAULT b'1' COMMENT '编辑按钮是否显示',
    `delete_show`            bit(1)       NOT NULL DEFAULT b'1' COMMENT '删除按钮是否显示',
    `copy_show`              bit(1)       NOT NULL DEFAULT b'1' COMMENT '复制按钮是否显示',
    `view_show`              bit(1)       NOT NULL DEFAULT b'1' COMMENT '详情按钮是否显示',
    `options`                varchar(1000)         DEFAULT NULL COMMENT '其它生成选项',
    `remark`                 varchar(500)          DEFAULT NULL COMMENT '备注',
    `menu_parent_id`         bigint                DEFAULT NULL COMMENT '上级菜单ID',
    `menu_application_id`    bigint                DEFAULT NULL COMMENT '所属应用ID',
    `menu_name`              varchar(255)          DEFAULT NULL COMMENT '菜单名称',
    `menu_icon`              varchar(255)          DEFAULT NULL COMMENT '菜单图标',
    `tree_parent_id`         bigint                DEFAULT NULL COMMENT '父ID字段名',
    `tree_name`              varchar(255)          DEFAULT NULL COMMENT '名称字段名',
    `created_by`             bigint                DEFAULT NULL COMMENT '创建者',
    `created_time`           datetime     NOT NULL COMMENT '创建时间',
    `updated_by`             bigint                DEFAULT NULL COMMENT '更新者',
    `updated_time`           datetime     NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='代码生成';

-- ----------------------------
-- Records of def_gen_table
-- ----------------------------
BEGIN;
INSERT INTO `def_gen_table` (`id`, `name`, `comment_`, `swagger_comment`, `ds_id`, `author`, `sub_id`,
                             `sub_java_field_name`, `entity_name`, `entity_super_class`, `super_class`, `parent`,
                             `plus_application_name`, `plus_module_name`, `service_name`, `module_name`,
                             `child_package_name`, `is_tenant_line`, `ds_value`, `is_ds`, `is_lombok`, `is_chain`,
                             `is_column_constant`, `gen_type`, `output_dir`, `front_output_dir`,
                             `front_vben5_output_dir`, `front_soy_output_dir`, `tpl_type`, `popup_type`, `add_auth`,
                             `edit_auth`, `delete_auth`, `view_auth`, `copy_auth`, `add_show`, `edit_show`,
                             `delete_show`, `copy_show`, `view_show`, `options`, `remark`, `menu_parent_id`,
                             `menu_application_id`, `menu_name`, `menu_icon`, `tree_parent_id`, `tree_name`,
                             `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (599336478266597407, 'base_employee', '员工', '员工', 2, 'lmx', NULL, NULL, 'BaseEmployee', '02', '01',
        'cn.lmx.kpu', 'basic', 'dd', 'base', 'base', '', b'0', '', b'0', b'1', b'1', b'0', '01',
        '/Users/lmx/gitlab/kpu-boot', '/Users/lmx/gitlab/kpu-web', NULL, NULL, '01', '01', NULL, NULL, NULL, NULL, NULL,
        b'1', b'1', b'1', b'1', b'1', NULL, NULL, NULL, 1, '员工维护', NULL, NULL, NULL, 2, '2025-02-16 02:13:08', 2,
        '2025-02-16 02:13:30');
INSERT INTO `def_gen_table` (`id`, `name`, `comment_`, `swagger_comment`, `ds_id`, `author`, `sub_id`,
                             `sub_java_field_name`, `entity_name`, `entity_super_class`, `super_class`, `parent`,
                             `plus_application_name`, `plus_module_name`, `service_name`, `module_name`,
                             `child_package_name`, `is_tenant_line`, `ds_value`, `is_ds`, `is_lombok`, `is_chain`,
                             `is_column_constant`, `gen_type`, `output_dir`, `front_output_dir`,
                             `front_vben5_output_dir`, `front_soy_output_dir`, `tpl_type`, `popup_type`, `add_auth`,
                             `edit_auth`, `delete_auth`, `view_auth`, `copy_auth`, `add_show`, `edit_show`,
                             `delete_show`, `copy_show`, `view_show`, `options`, `remark`, `menu_parent_id`,
                             `menu_application_id`, `menu_name`, `menu_icon`, `tree_parent_id`, `tree_name`,
                             `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (599340760348993584, 'def_gen_test_simple', '测试树结构', '测试树结构', 2, 'lmx', 599336478266597407, 'id',
        'DefGenTestSimple', '02', '01', 'cn.lmx.kpu', 'basic', 'dd', 'base', 'base', '', b'0', '', b'0', b'1', b'1',
        b'0', '01', '/Users/lmx/gitlab/kpu-boot', '/Users/lmx/gitlab/kpu-web', NULL, NULL, '01', '03', NULL, NULL, NULL,
        NULL, NULL, b'1', b'1', b'1', b'1', b'1', NULL, NULL, NULL, 1, '测试树结构维护', NULL, NULL, 'id', 2,
        '2025-02-16 02:31:48', 2, '2025-02-16 03:39:35');
INSERT INTO `def_gen_table` (`id`, `name`, `comment_`, `swagger_comment`, `ds_id`, `author`, `sub_id`,
                             `sub_java_field_name`, `entity_name`, `entity_super_class`, `super_class`, `parent`,
                             `plus_application_name`, `plus_module_name`, `service_name`, `module_name`,
                             `child_package_name`, `is_tenant_line`, `ds_value`, `is_ds`, `is_lombok`, `is_chain`,
                             `is_column_constant`, `gen_type`, `output_dir`, `front_output_dir`,
                             `front_vben5_output_dir`, `front_soy_output_dir`, `tpl_type`, `popup_type`, `add_auth`,
                             `edit_auth`, `delete_auth`, `view_auth`, `copy_auth`, `add_show`, `edit_show`,
                             `delete_show`, `copy_show`, `view_show`, `options`, `remark`, `menu_parent_id`,
                             `menu_application_id`, `menu_name`, `menu_icon`, `tree_parent_id`, `tree_name`,
                             `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (624241460312870136, 'base_org', '组织', '组织', 2, 'lmx', NULL, NULL, 'BaseOrg', '02', '01', 'cn.lmx.kpu', '',
        '', '', '', '', b'0', '', b'0', b'1', b'1', b'0', '01', '/Users/lmx/gitlab/kpu-boot',
        '/Users/lmx/gitlab/kpu-web', '/Users/lmx/github/kpu-web-vben-max/apps/web-antd',
        '/Users/lmx/gitlab/kpu-web-soybean', '01', '01', NULL, NULL, NULL, NULL, NULL, b'1', b'1', b'1', b'1', b'1',
        NULL, NULL, NULL, NULL, '组织维护', NULL, NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table` (`id`, `name`, `comment_`, `swagger_comment`, `ds_id`, `author`, `sub_id`,
                             `sub_java_field_name`, `entity_name`, `entity_super_class`, `super_class`, `parent`,
                             `plus_application_name`, `plus_module_name`, `service_name`, `module_name`,
                             `child_package_name`, `is_tenant_line`, `ds_value`, `is_ds`, `is_lombok`, `is_chain`,
                             `is_column_constant`, `gen_type`, `output_dir`, `front_output_dir`,
                             `front_vben5_output_dir`, `front_soy_output_dir`, `tpl_type`, `popup_type`, `add_auth`,
                             `edit_auth`, `delete_auth`, `view_auth`, `copy_auth`, `add_show`, `edit_show`,
                             `delete_show`, `copy_show`, `view_show`, `options`, `remark`, `menu_parent_id`,
                             `menu_application_id`, `menu_name`, `menu_icon`, `tree_parent_id`, `tree_name`,
                             `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (624241460312870162, 'base_operation_log', '操作日志', '操作日志', 2, 'lmx', NULL, NULL, 'BaseOperationLog',
        '02', '01', 'cn.lmx.kpu', '', '', '', '', '', b'0', '', b'0', b'1', b'1', b'0', '01',
        '/Users/lmx/gitlab/kpu-boot', '/Users/lmx/gitlab/kpu-web', '/Users/lmx/github/kpu-web-vben-max/apps/web-antd',
        '/Users/lmx/gitlab/kpu-web-soybean', '01', '01', NULL, NULL, NULL, NULL, NULL, b'1', b'1', b'1', b'1', b'1',
        NULL, NULL, NULL, NULL, '操作日志维护', NULL, NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table` (`id`, `name`, `comment_`, `swagger_comment`, `ds_id`, `author`, `sub_id`,
                             `sub_java_field_name`, `entity_name`, `entity_super_class`, `super_class`, `parent`,
                             `plus_application_name`, `plus_module_name`, `service_name`, `module_name`,
                             `child_package_name`, `is_tenant_line`, `ds_value`, `is_ds`, `is_lombok`, `is_chain`,
                             `is_column_constant`, `gen_type`, `output_dir`, `front_output_dir`,
                             `front_vben5_output_dir`, `front_soy_output_dir`, `tpl_type`, `popup_type`, `add_auth`,
                             `edit_auth`, `delete_auth`, `view_auth`, `copy_auth`, `add_show`, `edit_show`,
                             `delete_show`, `copy_show`, `view_show`, `options`, `remark`, `menu_parent_id`,
                             `menu_application_id`, `menu_name`, `menu_icon`, `tree_parent_id`, `tree_name`,
                             `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (624241460312870189, 'base_position', '岗位', '岗位', 2, 'lmx', NULL, NULL, 'BasePosition', '02', '01',
        'cn.lmx.kpu', 'basic', 'dev', 'base', 'dev', '', b'0', '', b'0', b'1', b'1', b'0', '01',
        '/Users/lmx/gitlab/kpu-boot', '/Users/lmx/gitlab/kpu-web', '/Users/lmx/github/kpu-web-vben-max/apps/web-antd',
        '/Users/lmx/gitlab/kpu-web-soybean', '01', '01', NULL, NULL, NULL, NULL, NULL, b'1', b'1', b'1', b'1', b'1',
        NULL, NULL, 1449733521265393664, 1, '岗位维护', NULL, NULL, NULL, 2, '2025-04-24 11:08:19', 2,
        '2025-04-24 18:07:35');
INSERT INTO `def_gen_table` (`id`, `name`, `comment_`, `swagger_comment`, `ds_id`, `author`, `sub_id`,
                             `sub_java_field_name`, `entity_name`, `entity_super_class`, `super_class`, `parent`,
                             `plus_application_name`, `plus_module_name`, `service_name`, `module_name`,
                             `child_package_name`, `is_tenant_line`, `ds_value`, `is_ds`, `is_lombok`, `is_chain`,
                             `is_column_constant`, `gen_type`, `output_dir`, `front_output_dir`,
                             `front_vben5_output_dir`, `front_soy_output_dir`, `tpl_type`, `popup_type`, `add_auth`,
                             `edit_auth`, `delete_auth`, `view_auth`, `copy_auth`, `add_show`, `edit_show`,
                             `delete_show`, `copy_show`, `view_show`, `options`, `remark`, `menu_parent_id`,
                             `menu_application_id`, `menu_name`, `menu_icon`, `tree_parent_id`, `tree_name`,
                             `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (624241460312870200, 'base_org_role_rel', '组织的角色', '组织的角色', 2, 'lmx', NULL, NULL, 'BaseOrgRoleRel',
        '02', '01', 'cn.lmx.kpu', 'basic', 'dev', 'base', 'dev', '', b'0', '', b'0', b'1', b'1', b'0', '01',
        '/Users/lmx/gitlab/kpu-boot', '/Users/lmx/gitlab/kpu-web', '/Users/lmx/github/kpu-web-vben-max/apps/web-antd',
        '/Users/lmx/gitlab/kpu-web-soybean', '01', '01', NULL, NULL, NULL, NULL, NULL, b'1', b'1', b'1', b'1', b'1',
        NULL, NULL, 1449733521265393664, 1, '组织的角色维护', NULL, NULL, NULL, 2, '2025-04-24 11:08:19', 2,
        '2025-04-24 18:07:35');
COMMIT;

-- ----------------------------
-- Table structure for def_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_table_column`;
CREATE TABLE `def_gen_table_column`
(
    `id`                    bigint       NOT NULL COMMENT 'ID',
    `table_id`              bigint       NOT NULL COMMENT '所属表ID',
    `name`                  varchar(255) NOT NULL COMMENT '列名称',
    `comment_`              varchar(512)          DEFAULT NULL COMMENT '列描述',
    `swagger_comment`       varchar(255)          DEFAULT NULL COMMENT '文档描述',
    `type`                  varchar(255) NOT NULL COMMENT '列类型',
    `java_type`             varchar(512) NOT NULL COMMENT 'JAVA类型',
    `java_field`            varchar(255) NOT NULL COMMENT 'JAVA字段名',
    `ts_type`               varchar(255) NOT NULL COMMENT 'TS类型',
    `size_`                 bigint       NOT NULL DEFAULT '0' COMMENT '长度',
    `digit`                 int                   DEFAULT '0' COMMENT '小数位数',
    `is_pk`                 bit(1)       NOT NULL DEFAULT b'0' COMMENT '主键',
    `is_increment`          bit(1)       NOT NULL DEFAULT b'0' COMMENT '自增',
    `is_required`           bit(1)       NOT NULL DEFAULT b'0' COMMENT '必填',
    `is_logic_delete_field` bit(1)       NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
    `is_version_field`      bit(1)       NOT NULL DEFAULT b'0' COMMENT '乐观锁',
    `fill`                  varchar(255)          DEFAULT NULL COMMENT '填充类型;\n#FieldFill{INSERT:1}',
    `is_edit`               bit(1)       NOT NULL DEFAULT b'1' COMMENT '编辑',
    `is_list`               bit(1)       NOT NULL DEFAULT b'1' COMMENT '列表',
    `is_query`              bit(1)       NOT NULL DEFAULT b'0' COMMENT '查询',
    `width`                 varchar(255)          DEFAULT NULL COMMENT '宽度',
    `query_type`            varchar(255)          DEFAULT '03' COMMENT '查询方式;\n#SqlConditionEnum{EQUAL:01}\n（等于、不等于、大于、小于、范围）',
    `component`             varchar(255)          DEFAULT NULL COMMENT 'Vben组件;（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `soy_component`         varchar(255)          DEFAULT NULL COMMENT 'Soybean组件',
    `vxe_component`         varchar(255)          DEFAULT NULL COMMENT 'Vxe组件;（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`             varchar(255)          DEFAULT NULL COMMENT '字典类型',
    `echo_str`              varchar(255)          DEFAULT NULL COMMENT 'Echo',
    `enum_str`              varchar(255)          DEFAULT NULL COMMENT '枚举',
    `sort_value`            int                   DEFAULT '0' COMMENT '排序',
    `edit_def_value`        varchar(255)          DEFAULT NULL COMMENT '默认值',
    `edit_help_message`     varchar(255)          DEFAULT NULL COMMENT '提示信息',
    `index_help_message`    varchar(255)          DEFAULT NULL COMMENT '列表提示信息',
    `created_by`            bigint                DEFAULT NULL COMMENT '创建者',
    `created_time`          datetime              DEFAULT NULL COMMENT '创建时间',
    `updated_by`            bigint                DEFAULT NULL COMMENT '更新者',
    `updated_time`          datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='代码生成字段';

-- ----------------------------
-- Records of def_gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597408, 599336478266597407, 'id', 'ID', 'ID', 'BIGINT', 'Long', 'id', 'string', 19, 0, b'1', b'0',
        b'1', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL, 0, '', NULL,
        NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597409, 599336478266597407, 'is_default', '是否默认员工;[0-否 1-是]', '是否默认员工', 'BIT',
        'Boolean', 'isDefault', 'boolean', 1, 0, b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01',
        'RadioGroup', 'dict-radio', '$radio', NULL, NULL, NULL, 1, 'false', NULL, NULL, 2, '2025-02-16 02:13:08', 2,
        '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597410, 599336478266597407, 'position_id', '所属岗位', '所属岗位', 'BIGINT', 'Long', 'positionId',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 2, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597411, 599336478266597407, 'user_id', '用户', '用户', 'BIGINT', 'Long', 'userId', 'string', 19, 0,
        b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL,
        3, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597412, 599336478266597407, 'last_company_id', '上一次登录单位ID', '上一次登录单位ID', 'BIGINT',
        'Long', 'lastCompanyId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01',
        'Input', 'text', '$input', NULL, NULL, NULL, 4, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2,
        '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597413, 599336478266597407, 'last_dept_id', '上一次登录部门ID', '上一次登录部门ID', 'BIGINT',
        'Long', 'lastDeptId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01',
        'Input', 'text', '$input', NULL, NULL, NULL, 5, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2,
        '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597414, 599336478266597407, 'real_name', '真实姓名', '真实姓名', 'VARCHAR', 'String', 'realName',
        'string', 255, 0, b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input',
        NULL, NULL, NULL, 6, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597415, 599336478266597407, 'active_status',
        '激活状态;[10-未激活 20-已激活]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.ACTIVE_STATUS)',
        '激活状态', 'CHAR', 'String', 'activeStatus', 'string', 2, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1',
        b'1', NULL, '03', 'ApiRadioGroup', 'dict-radio', '$radio', 'EchoDictType.Global.ACTIVE_STATUS',
        '@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.ACTIVE_STATUS)', NULL, 7, '20',
        NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597416, 599336478266597407, 'position_status',
        '职位状态;[10-在职 20-离职]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.POSITION_STATUS)',
        '职位状态', 'CHAR', 'String', 'positionStatus', 'string', 2, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1',
        b'1', NULL, '03', 'ApiRadioGroup', 'dict-radio', '$radio', 'EchoDictType.Base.POSITION_STATUS',
        '@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.POSITION_STATUS)', NULL, 8, '10',
        NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597417, 599336478266597407, 'state', '状态;[0-禁用 1-启用]', '状态', 'BIT', 'Boolean', 'state',
        'boolean', 1, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'RadioGroup', 'dict-radio',
        '$radio', NULL, NULL, NULL, 9, 'true', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597418, 599336478266597407, 'created_by', '创建人', '创建人', 'BIGINT', 'Long', 'createdBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 10, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597419, 599336478266597407, 'created_time', '创建时间', '创建时间', 'DATETIME', 'LocalDateTime',
        'createdTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'text', '$input', NULL, NULL, NULL, 11, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597420, 599336478266597407, 'updated_by', '最后更新人', '最后更新人', 'BIGINT', 'Long', 'updatedBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 12, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597421, 599336478266597407, 'updated_time', '最后更新时间', '最后更新时间', 'DATETIME',
        'LocalDateTime', 'updatedTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL,
        '01', 'DatePicker', 'text', '$input', NULL, NULL, NULL, 13, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2,
        '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599336478266597422, 599336478266597407, 'created_org_id', '创建人组织', '创建人组织', 'BIGINT', 'Long',
        'createdOrgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input',
        'text', '$input', NULL, NULL, NULL, 14, '', NULL, NULL, 2, '2025-02-16 02:13:08', 2, '2025-02-16 02:13:08');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993585, 599340760348993584, 'id', 'ID', 'ID', 'BIGINT', 'Long', 'id', 'string', 19, 0, b'1', b'0',
        b'1', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL, 0, '', NULL,
        NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993586, 599340760348993584, 'name', '名称', '名称', 'VARCHAR', 'String', 'name', 'string', 24, 0,
        b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input', NULL, NULL, NULL,
        1, '大法师', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993587, 599340760348993584, 'parent_id', '父id', '父id', 'BIGINT', 'Long', 'parentId', 'string', 19,
        0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL,
        NULL, 2, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993588, 599340760348993584, 'sort_value', '排序', '排序', 'INT', 'Integer', 'sortValue', 'number',
        10, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL,
        NULL, 3, '22', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993589, 599340760348993584, 'stock', '库存', '库存', 'INT', 'Integer', 'stock', 'number', 10, 0,
        b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL,
        4, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993590, 599340760348993584, 'created_time', '创建时间', '创建时间', 'DATETIME', 'LocalDateTime',
        'createdTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 5, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993591, 599340760348993584, 'created_by', '创建人', '创建人', 'BIGINT', 'Long', 'createdBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 6, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993592, 599340760348993584, 'updated_time', '修改时间', '修改时间', 'DATETIME', 'LocalDateTime',
        'updatedTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 7, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993593, 599340760348993584, 'updated_by', '修改人', '修改人', 'BIGINT', 'Long', 'updatedBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 8, '123123', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993594, 599340760348993584, 'type_', '商品类型;;\n#ProductType{ordinary:普通;gift:赠品}',
        '商品类型', 'TEXT', 'ProductType', 'type', 'string', 65535, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1',
        b'1', NULL, '01', 'ApiRadioGroup', 'dict-radio', '$radio', NULL, '@Echo(api = Echo.ENUM_API)',
        '#ProductType{ordinary:普通;gift:赠品}', 9, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993595, 599340760348993584, 'type2', '商品类型2;;\n#{ordinary:01,普通;gift:02,赠品;}', '商品类型2',
        'LONGTEXT', 'DefGenTestSimpleType2Enum', 'type2', 'string', 2147483647, 0, b'0', b'0', b'0', b'0', b'0', NULL,
        b'1', b'1', b'1', NULL, '01', 'ApiRadioGroup', 'dict-radio', '$radio', NULL, '@Echo(api = Echo.ENUM_API)',
        '#{ordinary:01,普通;gift:02,赠品;}', 10, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993596, 599340760348993584, 'type3',
        '学历;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = EchoDictType.Global.EDUCATION)', '学历',
        'VARCHAR', 'String', 'type3', 'string', 255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL,
        '03', 'ApiRadioGroup', 'dict-radio', '$radio', 'EchoDictType.Global.EDUCATION',
        '@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = EchoDictType.Global.EDUCATION)', NULL, 11, '',
        NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993597, 599340760348993584, 'state', '状态', '状态', 'BIT', 'Boolean', 'state', 'boolean', 1, 0,
        b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'RadioGroup', 'dict-radio', '$radio', NULL,
        NULL, NULL, 12, 'false', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993598, 599340760348993584, 'test4', '测试', '测试', 'INT', 'Integer', 'test4', 'number', 10, 0,
        b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL,
        13, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993599, 599340760348993584, 'test5', '时间', '时间', 'DATE', 'LocalDate', 'test5', 'string', 10, 0,
        b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'DatePicker', 'datetime', '$input', NULL,
        NULL, NULL, 14, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993600, 599340760348993584, 'test6', '日期', '日期', 'DATETIME', 'LocalDateTime', 'test6', 'string',
        19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'DatePicker', 'datetime', '$input',
        NULL, NULL, NULL, 15, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993601, 599340760348993584, 'label', '名称', '名称', 'VARCHAR', 'String', 'label', 'string', 255, 0,
        b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input', NULL, NULL, NULL,
        16, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993602, 599340760348993584, 'test7',
        '字符字典;@Echo(api = \"cn.lmx.kpu.common.api.DictApi\", dictType=\"GLOBAL_SEX\")', '字符字典', 'CHAR',
        'String', 'test7', 'string', 10, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03',
        'ApiRadioGroup', 'dict-radio', '$radio', '\"GLOBAL_SEX\"',
        '@Echo(api = \"cn.lmx.kpu.common.api.DictApi\", dictType=\"GLOBAL_SEX\")', NULL, 17, '01', NULL, NULL, 2,
        '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993603, 599340760348993584, 'test12',
        '整形字典;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.TEST_ADD_DICT)[1-测试 2-新增 aad-haha]',
        '整形字典', 'INT', 'Integer', 'test12', 'number', 10, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1',
        NULL, '01', 'ApiRadioGroup', 'dict-radio', '$radio', 'EchoDictType.Global.TEST_ADD_DICT',
        '@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.TEST_ADD_DICT)', NULL, 18, '',
        NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993604, 599340760348993584, 'user_id', '用户;@Echo(api = EchoApi.POSITION_ID_CLASS)', '用户',
        'BIGINT', 'Long', 'userId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01',
        'ApiRadioGroup', 'dict-radio', '$radio', '', '@Echo(api = EchoApi.POSITION_ID_CLASS)', NULL, 19, '', NULL, NULL,
        2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993605, 599340760348993584, 'org_id', '组织;@Echo(api = EchoApi.ORG_ID_CLASS)', '组织', 'BIGINT',
        'Long', 'orgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01',
        'ApiRadioGroup', 'dict-radio', '$radio', '', '@Echo(api = EchoApi.ORG_ID_CLASS)', NULL, 20, '', NULL, NULL, 2,
        '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993606, 599340760348993584, 'test8', '小数', '小数', 'DECIMAL', 'BigDecimal', 'test8', 'string', 16,
        0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'number', '$input', NULL, NULL,
        NULL, 21, '21.2300', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993607, 599340760348993584, 'test9', '浮点2', '浮点2', 'FLOAT', 'Float', 'test9', 'number', 12, 0,
        b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL,
        22, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993608, 599340760348993584, 'test10', '浮点', '浮点', 'DECIMAL', 'BigDecimal', 'test10', 'string',
        24, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'number', '$input', NULL,
        NULL, NULL, 23, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (599340760348993609, 599340760348993584, 'test11', 'xiao树', 'xiao树', 'DECIMAL', 'BigDecimal', 'test11',
        'string', 2, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'number', '$input',
        NULL, NULL, NULL, 24, '', NULL, NULL, 2, '2025-02-16 02:31:48', 2, '2025-02-16 02:31:48');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870137, 624241460312870136, 'id', 'ID', 'ID', 'BIGINT', 'Long', 'id', 'string', 19, 0, b'1', b'0',
        b'1', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL, 0, '', NULL,
        NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870138, 624241460312870136, 'name', '名称', '名称', 'VARCHAR', 'String', 'name', 'string', 255, 0,
        b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input', NULL, NULL, NULL,
        1, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870139, 624241460312870136, 'type_',
        '类型;[10-单位 20-部门]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.ORG_TYPE)',
        '类型', 'CHAR', 'String', 'type', 'string', 2, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL,
        '03', 'ApiRadioGroup', 'dict-radio', '$radio', 'EchoDictType.Base.ORG_TYPE',
        '@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.ORG_TYPE)', NULL, 2, '10', NULL,
        NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870140, 624241460312870136, 'short_name', '简称', '简称', 'VARCHAR', 'String', 'shortName',
        'string', 255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input',
        NULL, NULL, NULL, 3, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870141, 624241460312870136, 'parent_id', '父组织', '父组织', 'BIGINT', 'Long', 'parentId', 'string',
        19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL,
        NULL, 4, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870142, 624241460312870136, 'tree_grade', '树层级', '树层级', 'INT', 'Integer', 'treeGrade',
        'number', 10, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 5, '0', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870143, 624241460312870136, 'tree_path', '树路径;用id拼接树结构', '树路径', 'VARCHAR', 'String',
        'treePath', 'string', 255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text',
        '$input', NULL, NULL, NULL, 6, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870144, 624241460312870136, 'sort_value', '排序', '排序', 'INT', 'Integer', 'sortValue', 'number',
        10, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input', NULL, NULL,
        NULL, 7, '1', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870145, 624241460312870136, 'state', '状态;[0-禁用 1-启用]', '状态', 'BIT', 'Boolean', 'state',
        'boolean', 1, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'RadioGroup', 'dict-radio',
        '$radio', NULL, NULL, NULL, 8, 'true', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870146, 624241460312870136, 'remarks', '备注', '备注', 'VARCHAR', 'String', 'remarks', 'string',
        255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'InputTextArea', 'textarea',
        '$textarea', NULL, NULL, NULL, 9, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870147, 624241460312870136, 'created_time', '创建时间', '创建时间', 'DATETIME', 'LocalDateTime',
        'createdTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 10, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870148, 624241460312870136, 'created_by', '创建人', '创建人', 'BIGINT', 'Long', 'createdBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 11, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870149, 624241460312870136, 'updated_time', '修改时间', '修改时间', 'DATETIME', 'LocalDateTime',
        'updatedTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 12, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870150, 624241460312870136, 'updated_by', '修改人', '修改人', 'BIGINT', 'Long', 'updatedBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 13, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870151, 624241460312870136, 'created_org_id', '创建人组织', '创建人组织', 'BIGINT', 'Long',
        'createdOrgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input',
        'text', '$input', NULL, NULL, NULL, 14, '', NULL, NULL, 2, '2025-04-24 10:52:47', 2, '2025-04-24 10:52:47');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870163, 624241460312870162, 'id', '主键', '主键', 'BIGINT', 'Long', 'id', 'string', 19, 0, b'1',
        b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL, 0, '',
        NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870164, 624241460312870162, 'request_ip', '操作IP', '操作IP', 'VARCHAR', 'String', 'requestIp',
        'string', 50, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input',
        NULL, NULL, NULL, 1, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870165, 624241460312870162, 'type', '日志类型;#LogType{OPT:操作类型;EX:异常类型}', '日志类型',
        'VARCHAR', 'LogType', 'type', 'string', 5, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01',
        'ApiRadioGroup', 'dict-radio', '$radio', NULL, '@Echo(api = Echo.ENUM_API)',
        '#LogType{OPT:操作类型;EX:异常类型}', 2, 'OPT', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870166, 624241460312870162, 'user_name', '操作人', '操作人', 'VARCHAR', 'String', 'userName',
        'string', 50, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input',
        NULL, NULL, NULL, 3, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870167, 624241460312870162, 'description', '操作描述', '操作描述', 'VARCHAR', 'String',
        'description', 'string', 255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input',
        'text', '$input', NULL, NULL, NULL, 4, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870168, 624241460312870162, 'class_path', '类路径', '类路径', 'VARCHAR', 'String', 'classPath',
        'string', 255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input',
        NULL, NULL, NULL, 5, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870169, 624241460312870162, 'action_method', '请求方法', '请求方法', 'VARCHAR', 'String',
        'actionMethod', 'string', 50, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input',
        'text', '$input', NULL, NULL, NULL, 6, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870170, 624241460312870162, 'request_uri', '请求地址', '请求地址', 'VARCHAR', 'String',
        'requestUri', 'string', 500, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input',
        'text', '$input', NULL, NULL, NULL, 7, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870171, 624241460312870162, 'http_method',
        '请求类型;#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
        '请求类型', 'VARCHAR', 'HttpMethod', 'httpMethod', 'string', 10, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1',
        b'1', b'1', NULL, '01', 'ApiRadioGroup', 'dict-radio', '$radio', NULL, '@Echo(api = Echo.ENUM_API)',
        '#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
        8, 'GET', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870172, 624241460312870162, 'start_time', '开始时间', '开始时间', 'TIMESTAMP', 'LocalDateTime',
        'startTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 9, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870173, 624241460312870162, 'finish_time', '完成时间', '完成时间', 'TIMESTAMP', 'LocalDateTime',
        'finishTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 10, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870174, 624241460312870162, 'consuming_time', '消耗时间', '消耗时间', 'BIGINT', 'Long',
        'consumingTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input',
        'text', '$input', NULL, NULL, NULL, 11, '0', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870175, 624241460312870162, 'ua', '浏览器', '浏览器', 'VARCHAR', 'String', 'ua', 'string', 500, 0,
        b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input', NULL, NULL, NULL,
        12, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870176, 624241460312870162, 'created_time', '创建时间', '创建时间', 'DATETIME', 'LocalDateTime',
        'createdTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 13, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870177, 624241460312870162, 'created_by', '创建人', '创建人', 'BIGINT', 'Long', 'createdBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 14, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870178, 624241460312870162, 'updated_time', '最后更新时间', '最后更新时间', 'DATETIME',
        'LocalDateTime', 'updatedTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL,
        '01', 'DatePicker', 'datetime', '$input', NULL, NULL, NULL, 15, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2,
        '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870179, 624241460312870162, 'updated_by', '最后更新人', '最后更新人', 'BIGINT', 'Long', 'updatedBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 16, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870180, 624241460312870162, 'created_org_id', '创建人组织', '创建人组织', 'BIGINT', 'Long',
        'createdOrgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input',
        'text', '$input', NULL, NULL, NULL, 17, '', NULL, NULL, 2, '2025-04-24 11:00:20', 2, '2025-04-24 11:00:20');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870190, 624241460312870189, 'id', 'ID', 'ID', 'BIGINT', 'Long', 'id', 'string', 19, 0, b'1', b'0',
        b'1', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL, 0, '', NULL,
        NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870191, 624241460312870189, 'name', '名称', '名称', 'VARCHAR', 'String', 'name', 'string', 255, 0,
        b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'Input', 'text', '$input', NULL, NULL, NULL,
        1, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870192, 624241460312870189, 'org_id', '所属组织;#base_org@Echo(api = EchoApi.ORG_ID_CLASS)',
        '所属组织', 'BIGINT', 'Long', 'orgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1',
        NULL, '01', 'ApiRadioGroup', 'dict-radio', '$radio', '', '@Echo(api = EchoApi.ORG_ID_CLASS)', NULL, 2, '', NULL,
        NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870193, 624241460312870189, 'state', '状态;0-禁用 1-启用', '状态', 'BIT', 'Boolean', 'state',
        'boolean', 1, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'RadioGroup', 'dict-radio',
        '$radio', NULL, NULL, NULL, 3, 'true', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870194, 624241460312870189, 'remarks', '备注', '备注', 'VARCHAR', 'String', 'remarks', 'string',
        255, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '03', 'InputTextArea', 'textarea',
        '$textarea', NULL, NULL, NULL, 4, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870195, 624241460312870189, 'created_time', '创建时间', '创建时间', 'DATETIME', 'LocalDateTime',
        'createdTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 5, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870196, 624241460312870189, 'created_by', '创建人', '创建人', 'BIGINT', 'Long', 'createdBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 6, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870197, 624241460312870189, 'updated_time', '修改时间', '修改时间', 'DATETIME', 'LocalDateTime',
        'updatedTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 7, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870198, 624241460312870189, 'updated_by', '修改人', '修改人', 'BIGINT', 'Long', 'updatedBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 8, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870199, 624241460312870189, 'created_org_id', '创建人组织', '创建人组织', 'BIGINT', 'Long',
        'createdOrgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input',
        'text', '$input', NULL, NULL, NULL, 9, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870201, 624241460312870200, 'id', 'ID', 'ID', 'BIGINT', 'Long', 'id', 'string', 19, 0, b'1', b'0',
        b'1', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input', NULL, NULL, NULL, 0, '', NULL,
        NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870202, 624241460312870200, 'org_id', '所属部门;#base_org', '所属部门', 'BIGINT', 'Long', 'orgId',
        'string', 19, 0, b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 1, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870203, 624241460312870200, 'role_id', '拥有角色;#base_role', '拥有角色', 'BIGINT', 'Long',
        'roleId', 'string', 19, 0, b'0', b'0', b'1', b'0', b'0', NULL, b'1', b'1', b'1', NULL, '01', 'Input', 'text',
        '$input', NULL, NULL, NULL, 2, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870204, 624241460312870200, 'created_time', '创建时间', '创建时间', 'DATETIME', 'LocalDateTime',
        'createdTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'DatePicker',
        'datetime', '$input', NULL, NULL, NULL, 3, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870205, 624241460312870200, 'created_by', '创建人', '创建人', 'BIGINT', 'Long', 'createdBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 4, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870206, 624241460312870200, 'updated_time', '最后更新时间', '最后更新时间', 'DATETIME',
        'LocalDateTime', 'updatedTime', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL,
        '01', 'DatePicker', 'datetime', '$input', NULL, NULL, NULL, 5, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2,
        '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870207, 624241460312870200, 'updated_by', '最后更新人', '最后更新人', 'BIGINT', 'Long', 'updatedBy',
        'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input', 'text', '$input',
        NULL, NULL, NULL, 6, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
INSERT INTO `def_gen_table_column` (`id`, `table_id`, `name`, `comment_`, `swagger_comment`, `type`, `java_type`,
                                    `java_field`, `ts_type`, `size_`, `digit`, `is_pk`, `is_increment`, `is_required`,
                                    `is_logic_delete_field`, `is_version_field`, `fill`, `is_edit`, `is_list`,
                                    `is_query`, `width`, `query_type`, `component`, `soy_component`, `vxe_component`,
                                    `dict_type`, `echo_str`, `enum_str`, `sort_value`, `edit_def_value`,
                                    `edit_help_message`, `index_help_message`, `created_by`, `created_time`,
                                    `updated_by`, `updated_time`)
VALUES (624241460312870208, 624241460312870200, 'created_org_id', '创建人组织', '创建人组织', 'BIGINT', 'Long',
        'createdOrgId', 'string', 19, 0, b'0', b'0', b'0', b'0', b'0', NULL, b'1', b'1', b'0', NULL, '01', 'Input',
        'text', '$input', NULL, NULL, NULL, 7, '', NULL, NULL, 2, '2025-04-24 11:08:19', 2, '2025-04-24 11:08:19');
COMMIT;

-- ----------------------------
-- Table structure for def_gen_test_simple
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_test_simple`;
CREATE TABLE `def_gen_test_simple`
(
    `id`           bigint      NOT NULL COMMENT 'ID',
    `name`         varchar(24) NOT NULL DEFAULT '大法师' COMMENT '名称',
    `parent_id`    bigint               DEFAULT NULL COMMENT '父id',
    `sort_value`   int                  DEFAULT '22' COMMENT '排序',
    `stock`        int         NOT NULL COMMENT '库存',
    `created_time` datetime             DEFAULT NULL COMMENT '创建时间',
    `created_by`   bigint               DEFAULT NULL COMMENT '创建人',
    `updated_time` datetime             DEFAULT NULL COMMENT '修改时间',
    `updated_by`   bigint               DEFAULT '123123' COMMENT '修改人',
    `type_`        text COMMENT '商品类型;;\n#ProductType{ordinary:普通;gift:赠品}',
    `type2`        longtext COMMENT '商品类型2;;\n#{ordinary:01,普通;gift:02,赠品;}',
    `type3`        varchar(255)         DEFAULT NULL COMMENT '学历;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = EchoDictType.Global.EDUCATION)',
    `state`        bit(1)               DEFAULT b'0' COMMENT '状态',
    `test4`        int                  DEFAULT NULL COMMENT '测试',
    `test5`        date                 DEFAULT NULL COMMENT '时间',
    `test6`        datetime             DEFAULT NULL COMMENT '日期',
    `label`        varchar(255)         DEFAULT NULL COMMENT '名称',
    `test7`        char(10)             DEFAULT '01' COMMENT '字符字典;@Echo(api = "cn.lmx.kpu.common.api.DictApi", dictType="GLOBAL_SEX")',
    `test12`       int                  DEFAULT NULL COMMENT '整形字典;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.TEST_ADD_DICT)[1-测试 2-新增 aad-haha]',
    `user_id`      bigint               DEFAULT NULL COMMENT '用户;@Echo(api = EchoApi.POSITION_ID_CLASS)',
    `org_id`       bigint               DEFAULT NULL COMMENT '组织;@Echo(api = EchoApi.ORG_ID_CLASS)',
    `test8`        decimal(16, 4)       DEFAULT '21.2300' COMMENT '小数',
    `test9`        float                DEFAULT NULL COMMENT '浮点2',
    `test10`       decimal(24, 6)       DEFAULT NULL COMMENT '浮点',
    `test11`       decimal(2, 0)        DEFAULT NULL COMMENT 'xiao树',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='测试树结构';

-- ----------------------------
-- Records of def_gen_test_simple
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for def_gen_test_tree
-- ----------------------------
DROP TABLE IF EXISTS `def_gen_test_tree`;
CREATE TABLE `def_gen_test_tree`
(
    `id`           bigint      NOT NULL COMMENT 'ID',
    `name`         varchar(24) NOT NULL DEFAULT '大法师' COMMENT '名称',
    `parent_id`    bigint               DEFAULT NULL COMMENT '父id',
    `sort_value`   int                  DEFAULT '22' COMMENT '排序',
    `stock`        int         NOT NULL COMMENT '库存',
    `created_time` datetime             DEFAULT NULL COMMENT '创建时间',
    `created_by`   bigint               DEFAULT NULL COMMENT '创建人',
    `updated_time` datetime             DEFAULT NULL COMMENT '修改时间',
    `updated_by`   bigint               DEFAULT '123123' COMMENT '修改人',
    `type_`        text COMMENT '商品类型;\n#ProductType{ordinary:普通;gift:赠品}',
    `type2`        longtext COMMENT '商品类型2;#{ordinary:01,普通;gift:02,赠品;}',
    `type3`        varchar(255)         DEFAULT NULL COMMENT '学历;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,  dictType = EchoDictType.Global.EDUCATION)',
    `state`        bit(1)               DEFAULT b'0' COMMENT '状态',
    `test4`        int                  DEFAULT NULL COMMENT '测试',
    `test5`        date                 DEFAULT NULL COMMENT '时间',
    `test6`        datetime             DEFAULT NULL COMMENT '日期',
    `label`        varchar(255)         DEFAULT NULL COMMENT '名称',
    `test7`        char(10)             DEFAULT '01' COMMENT '字符字典;@Echo(api = "cn.lmx.kpu.common.api.DictApi", dictType="GLOBAL_SEX")',
    `test12`       int                  DEFAULT NULL COMMENT '整形字典;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.TEST_ADD_DICT)[1-测试 2-新增 aad-haha]',
    `user_id`      bigint               DEFAULT NULL COMMENT '用户;@Echo(api = EchoApi.POSITION_ID_CLASS)[1-aa 2-ddd]',
    `org_id`       bigint               DEFAULT NULL COMMENT '组织;@Echo(api = EchoApi.ORG_ID_CLASS)',
    `test8`        decimal(16, 4)       DEFAULT '21.2300' COMMENT '小数',
    `test9`        float                DEFAULT NULL COMMENT '浮点2',
    `test10`       decimal(24, 6)       DEFAULT NULL COMMENT '浮点',
    `test11`       decimal(2, 0)        DEFAULT NULL COMMENT 'xiao树',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='测试树结构';

-- ----------------------------
-- Records of def_gen_test_tree
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for def_interface
-- ----------------------------
DROP TABLE IF EXISTS `def_interface`;
CREATE TABLE `def_interface`
(
    `id`           bigint       NOT NULL,
    `code`         varchar(255) NOT NULL COMMENT '接口编码',
    `name`         varchar(255) NOT NULL COMMENT '接口名称',
    `exec_mode`    char(2)      DEFAULT '01' COMMENT '执行方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.INTERFACE_EXEC_MODE)[01-实现类 02-脚本]',
    `script`       text COMMENT '实现脚本',
    `impl_class`   varchar(255) DEFAULT NULL COMMENT '实现类',
    `state`        bit(1)       DEFAULT b'1' COMMENT '状态',
    `created_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `created_by`   bigint       DEFAULT NULL COMMENT '创建人',
    `updated_time` datetime     DEFAULT NULL COMMENT '修改时间',
    `updated_by`   bigint       DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UK_INTERFACE_CODE` (`code`) USING BTREE
) ENGINE = InnoDB COMMENT ='接口';

-- ----------------------------
-- Records of def_interface
-- ----------------------------
BEGIN;
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (244439130119864323, 'ALI_SMS', '阿里短信', '01', '', 'aliSmsMsgStrategyImpl', b'1', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (244881451621810192, 'TENCENT_MAIL', '腾讯邮件', '01', '', 'tencentMailMsgStrategyImpl', b'1',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (244913337459015682, 'CHUANGLAN_SMS', '创蓝短信', '01', '', 'clSmsMsgStrategyImpl', b'1', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776718, 'BAIDU_SMS', '百度短信', '01', NULL, 'baiduSmsMsgStrategyImpl', b'1', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776719, 'TENCENT_SMS', '腾讯短信', '01', NULL, 'tencentSmsMsgStrategyImpl', b'1',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (251763346439667712, 'TEST', '测试通过脚本执行接口逻辑', '02',
        'package cn.lmx.kpu.msg.strategy.impl;\n\nimport org.slf4j.Logger;\nimport org.slf4j.LoggerFactory;\nimport cn.lmx.kpu.entity.msg.kpu.ExtendMsg;\nimport cn.lmx.kpu.service.msg.ExtendMsgService;\nimport cn.lmx.kpu.strategy.msg.MsgStrategy;\nimport cn.lmx.kpu.domain.strategy.msg.MsgParam;\nimport cn.lmx.kpu.domain.strategy.msg.MsgResult;\n\nimport javax.annotation.Resource;\n\n/**\n * @author zuihou\n * @date 2022/7/11 0011 10:29\n */\npublic class TestMsgStrategyImpl implements MsgStrategy {\n    private static final Logger log = LoggerFactory.getLogger(TestMsgStrategyImpl.class);\n\n    @Resource\n    private ExtendMsgService extendMsgService;\n\n    @Override\n    public MsgResult exec(MsgParam msgParam) {\n        System.out.println(\" 请开始你的接口逻辑 \");\n\n        ExtendMsg a = extendMsgService.getById(msgParam.getExtendMsg().getId());\n        log.info(\"a {}\", a);\n\n        return MsgResult.builder().result(\"保存成功\").build();\n    }\n}',
        '', b'1', '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface` (`id`, `code`, `name`, `exec_mode`, `script`, `impl_class`, `state`, `created_time`,
                             `created_by`, `updated_time`, `updated_by`)
VALUES (395546031032642561, 'NOTICE', '站内信', '01', NULL, 'noticeMsgStrategyImpl', b'1', '2023-08-16 22:55:26',
        1452186486253289472, '2023-08-16 22:55:26', 1452186486253289472);
COMMIT;

-- ----------------------------
-- Table structure for def_interface_property
-- ----------------------------
DROP TABLE IF EXISTS `def_interface_property`;
CREATE TABLE `def_interface_property`
(
    `id`           bigint       NOT NULL COMMENT 'ID',
    `interface_id` bigint       NOT NULL COMMENT '接口ID',
    `name`         varchar(255) NOT NULL COMMENT '参数名称',
    `key_`         varchar(255) NOT NULL COMMENT '参数键',
    `value`        varchar(255) NOT NULL COMMENT '参数值',
    `sort_value`   int          DEFAULT '0' COMMENT '顺序号',
    `remarks`      varchar(255) DEFAULT NULL COMMENT '备注',
    `created_time` datetime     NOT NULL COMMENT '创建时间',
    `created_by`   bigint       DEFAULT NULL COMMENT '创建人',
    `updated_time` datetime     NOT NULL COMMENT '修改时间',
    `updated_by`   bigint       DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UK_I_P_INTERFACE_ID_KEY` (`interface_id`, `key_`) USING BTREE
) ENGINE = InnoDB COMMENT ='接口属性';

-- ----------------------------
-- Records of def_interface_property
-- ----------------------------
BEGIN;
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (245606910252810240, 244913337459015682, '是否debug模式', 'debug', '0', 0, '1不发短信 0发短信',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (245606910252810244, 244913337459015682, '普通短信接口', 'endPoint', 'http://smssh1.253.com/msg/v1/send/json', 0,
        '', '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (245606910252810245, 244913337459015682, '签名', 'sign', '闪购网', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (245606910252810246, 244913337459015682, '变量短信接口', 'variableEndPoint',
        'http://smssh1.253.com/msg/variable/json', 0, '', '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (245606910252810248, 244913337459015682, '云通讯API密码', 'password', '请填写正确的秘钥', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (245606910252810252, 244913337459015682, '云通讯API账号', 'account', '请填写正确的秘钥', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246604205953908742, 244913337459015682, '是否变量短信', 'variable', 'true', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990915, 244881451621810192, '发送邮箱地址', 'fromEmail', '***@qq.com', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2025-04-02 05:03:07', 2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990916, 244881451621810192, '发送邮箱名称', 'fromName', '快速开发平台', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2025-04-02 05:30:05', 2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990917, 244881451621810192, '邮件服务器地址', 'hostName', 'smtp.qq.com', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2025-04-02 05:29:20', 2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990918, 244881451621810192, '密码', 'password', '***', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2025-04-02 05:03:07', 2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990919, 244881451621810192, '用户名', 'username', '***@qq.com', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2025-04-02 05:03:07', 2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990920, 244881451621810192, '端口', 'smtpPort', '465', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2023-08-16 22:38:59', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990921, 244881451621810192, '是否ssl', 'ssl', 'true', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2025-04-02 05:08:25', 2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (246756273565990922, 244881451621810192, '字符集', 'charset', 'UTF-8', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776720, 244439130119864323, '是否调试', 'debug', '0', 0, '1-不发短信 0-发短信',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776721, 244439130119864323, 'Access Key ID', 'accessKeyId', '请填写正确的秘钥', 0,
        '发送账号安全认证的Access Key ID', '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776722, 244439130119864323, 'Secret Access Key', 'accessKeySecret', '请填写正确的秘钥', 0,
        '发送账号安全认证的Secret Access Key', '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776723, 244439130119864323, '发送使用签名', 'signName', '闪购网', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776724, 244439130119864323, '地域ID', 'regionId', 'cn-hangzhou', 0,
        'https://help.aliyun.com/document_detail/419270.html', '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250025856074776726, 244439130119864323, '域名', 'endpoint', 'dysmsapi.aliyuncs.com', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998272, 250025856074776718, '域名', 'endPoint', 'http://smsv3.bj.baidubce.com', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998273, 250025856074776718, 'secretKey', 'secretKey', 'bacbedee5a604a939cc4c996371856b8', 0,
        '该id是百度提供的测试id，能成功调用，但无法接收短信', '2021-12-12 12:12:12', 1452186486253289472,
        '2023-08-17 09:41:07', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998274, 250025856074776718, 'accessKeyId', 'accessKeyId', '626e6a284eac4e3f97cc30b38ffea6a4', 0,
        '该id是百度提供的测试id，能成功调用，但无法接收短信', '2021-12-12 12:12:12', 1452186486253289472,
        '2023-08-17 09:41:07', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998276, 250025856074776718, '是否调试模式', 'debug', '0', 0,
        '0-非调试模式,发送短信  1-调试模式,不发短信', '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998277, 250025856074776719, '短信 SdkAppId', 'sdkAppId', '1400006666', 0,
        '在 短信控制台 添加应用后生成的实际 SdkAppId，示例如1400006666', '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998278, 250025856074776719, '指定接入地域域名', 'region', 'ap-beijing', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998279, 250025856074776719, 'secretId', 'secretId', '44', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998280, 250025856074776719, 'secretKey', 'secretKey', '123', 0, '', '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (250660012290998281, 250025856074776719, '地域域名', 'endpoint', 'sms.tencentcloudapi.com', 0, '',
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (606234496391724460, 251763346439667712, '1', '1', '1', 0, NULL, '2025-03-10 19:07:13', 2, '2025-03-10 19:07:13',
        2);
INSERT INTO `def_interface_property` (`id`, `interface_id`, `name`, `key_`, `value`, `sort_value`, `remarks`,
                                      `created_time`, `created_by`, `updated_time`, `updated_by`)
VALUES (613283164789686331, 251763346439667712, 'h', 'h', 'h', 0, 'h', '2025-03-25 21:26:52', 2, '2025-03-25 21:26:52',
        2);
COMMIT;

-- ----------------------------
-- Table structure for def_login_log
-- ----------------------------
DROP TABLE IF EXISTS `def_login_log`;
CREATE TABLE `def_login_log`
(
    `id`               bigint NOT NULL COMMENT '主键',
    `tenant_id`        bigint       DEFAULT NULL COMMENT '所属企业',
    `employee_id`      bigint       DEFAULT NULL COMMENT '登录员工',
    `user_id`          bigint       DEFAULT NULL COMMENT '登录用户',
    `request_ip`       varchar(50)  DEFAULT '' COMMENT '登录IP',
    `nick_name`        varchar(255) DEFAULT '' COMMENT '登录人姓名',
    `username`         varchar(255) DEFAULT '' COMMENT '登录人账号',
    `status`           char(2)      DEFAULT '01' COMMENT '登录状态;[01-登录成功 02-验证码错误 03-密码错误 04-账号锁定]\n    @Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.LOGIN_STATUS)',
    `description`      varchar(255) DEFAULT '' COMMENT '登录描述',
    `login_date`       char(10)     DEFAULT NULL COMMENT '登录时间',
    `ua`               varchar(512) DEFAULT '' COMMENT '浏览器请求头',
    `browser`          varchar(255) DEFAULT '' COMMENT '浏览器名称',
    `browser_version`  varchar(255) DEFAULT '' COMMENT '浏览器版本',
    `operating_system` varchar(255) DEFAULT '' COMMENT '操作系统',
    `location`         varchar(50)  DEFAULT '' COMMENT '登录地点',
    `created_time`     datetime     DEFAULT NULL COMMENT '创建时间',
    `created_by`       bigint       DEFAULT NULL COMMENT '创建人',
    `updated_time`     datetime     DEFAULT NULL COMMENT '最后更新时间',
    `updated_by`       bigint       DEFAULT NULL COMMENT '最后更新人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='登录日志';

-- ----------------------------
-- Records of def_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for def_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `def_msg_template`;
CREATE TABLE `def_msg_template`
(
    `id`            bigint       NOT NULL COMMENT '模板ID',
    `interface_id`  varchar(255) NOT NULL COMMENT '接口ID',
    `type`          char(2)      NOT NULL COMMENT '消息类型;[01-短信 02-邮件 03-站内信];@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_TEMPLATE_TYPE)',
    `code`          varchar(255) NOT NULL COMMENT '模板标识',
    `name`          varchar(255) DEFAULT NULL COMMENT '模板名称',
    `state`         bit(1)       DEFAULT NULL COMMENT '状态',
    `template_code` varchar(255) DEFAULT NULL COMMENT '模板编码',
    `sign`          varchar(255) DEFAULT NULL COMMENT '签名',
    `title`         varchar(255) DEFAULT NULL COMMENT '标题',
    `content`       longtext     NOT NULL COMMENT '模板内容',
    `script`        varchar(255) DEFAULT NULL COMMENT '脚本',
    `param`         varchar(255) DEFAULT NULL COMMENT '模板参数',
    `remarks`       varchar(255) DEFAULT NULL COMMENT '备注',
    `target_`       char(2)      DEFAULT NULL COMMENT '打开方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_TARGET)[01-页面 02-弹窗 03-新开窗口]',
    `auto_read`     bit(1)       DEFAULT b'1' COMMENT '自动已读',
    `remind_mode`   char(2)      DEFAULT NULL COMMENT '提醒方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_REMIND_MODE)[01-待办 02-预警 03-提醒]',
    `url`           varchar(255) DEFAULT NULL COMMENT '跳转地址',
    `created_by`    bigint       DEFAULT NULL COMMENT '创建人ID',
    `created_time`  datetime     DEFAULT NULL COMMENT '创建时间',
    `updated_by`    bigint       DEFAULT NULL COMMENT '最后修改人',
    `updated_time`  datetime     DEFAULT NULL COMMENT '最后修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UK_MSG_TEMPLATE_CODE` (`code`) USING BTREE
) ENGINE = InnoDB COMMENT ='消息模板';

-- ----------------------------
-- Records of def_msg_template
-- ----------------------------
BEGIN;
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245657569392066565, '244881451621810192', '02', 'TENCENT_EMAIL', '腾讯邮件', b'1', NULL, '', '你的一份邮件',
        '邮件内容3 ${xx}, ddd, \n\n<br/>\n<p style=\"color: red;\">red</p>', '', '[{\"key\":\"xx\",\"value\":\"\"}]',
        '3', '02', b'1', '02', '44', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2023-08-16 23:24:23');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (245891967232245772, '244913337459015682', '01', 'CHUAGNLAN_REG_SMS', '注册短信', b'1', '111', '盘江煤电',
        '注册', '采购项目【${xmmc}】发起了${lbmc}质疑，等待您的答复', '',
        '[{\"key\":\"xmmc\",\"value\":\"\"},{\"key\":\"lbmc\",\"value\":\"\"}]', 'chuanglan短信', NULL, b'1', NULL, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2023-08-16 23:24:36');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (250055645967941632, '244439130119864323', '01', 'REGISTER_SMS', '注册成功短信', b'1', 'SMS_99185070', '闪购网',
        '', '尊敬的用户，欢迎注册闪购网，您的注册验证码：${code},有效期5分钟。请勿将短信验证码告知他人！', '',
        '[{\"key\":\"code\",\"value\":\"\"}]', '', NULL, b'1', NULL, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2023-08-16 23:24:41');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (250660012290998275, '250025856074776718', '01', 'BAIDU_SMS_REG', '百度注册短信', b'1', 'sms-tmpl-awKvRY85349',
        'sms-signQxkiwz88470', NULL, '您的验证码为：${code}, ${minute}分钟内有效', '',
        '[{\"key\":\"code\",\"value\":\"\"},{\"key\":\"minute\",\"value\":\"\"}]', '', NULL, b'1', NULL, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2023-08-16 23:24:44');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (250660012290998282, '250025856074776719', '01', 'TX_SMS', '腾讯注册短信', b'1', '1234', '腾讯云', NULL,
        '你的验证阿妈为： ${code}', NULL, '[{\"key\":\"code\",\"value\":\"\"}]', '', NULL, b'1', NULL, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2023-08-16 23:24:47');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (251763346439667713, '251763346439667712', '03', 'TEST', '测试', b'1', NULL, '', '发送一个xx',
        '发送 ${xmmc}, 哈哈哈 ${name}.', NULL, '[{\"key\":\"xmmc\",\"value\":\"\"},{\"key\":\"name\",\"value\":\"\"}]',
        '', '02', b'1', '01', '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2023-08-16 22:47:53');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (252969897242394624, '244439130119864323', '01', 'MOBILE_LOGIN', '手机登录短信', b'1', 'SMS_99185070', '闪购网',
        '', '本次验证码为：${code}', '', '[{\"key\":\"code\",\"value\":\"\"}]', '', NULL, b'1', NULL, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2023-08-16 23:50:23');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (252969897242394625, '244881451621810192', '02', 'REGISTER_EMAIL', '注册邮件验证码', b'1', NULL, '',
        '欢迎注册${applicationName}', '尊敬的用户：\n	欢迎注册${applicationName}，您的注册验证码为：${code}',
        '// 逻辑\n\n\n// 返回\n[\n  applicationName: \"《灯灯中后台快速开发平台》\",\n  code: code\n]',
        '[{\"key\":\"applicationName\",\"value\":\"\"},{\"key\":\"code\",\"value\":\"\"}]', '', NULL, b'1', NULL, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2023-08-14 22:42:09');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (277119952886956032, '244439130119864323', '01', 'MOBILE_EDIT', '个人中心修改手机', b'1', 'SMS_99185070',
        '闪购网', NULL, '您正在修改登录手机，您的验证码为：${code}，请勿告知他人。', NULL,
        '[{\"key\":\"code\",\"value\":\"\"}]', NULL, NULL, b'1', NULL, NULL, 1452186486253289472, '2022-10-01 23:49:46',
        1452186486253289472, '2023-08-16 23:50:12');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (277119952886956033, '244881451621810192', '02', 'EMAIL_EDIT', '修改登录邮箱', b'1', NULL, NULL, '修改登录邮箱',
        '您正在修改登录邮箱，您的验证码为：${code}，请勿告知他人。', NULL, '[{\"key\":\"code\",\"value\":\"\"}]', NULL,
        NULL, b'1', NULL, NULL, 1452186486253289472, '2022-10-01 23:50:13', 1452186486253289472, '2023-08-16 22:26:38');
INSERT INTO `def_msg_template` (`id`, `interface_id`, `type`, `code`, `name`, `state`, `template_code`, `sign`, `title`,
                                `content`, `script`, `param`, `remarks`, `target_`, `auto_read`, `remind_mode`, `url`,
                                `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (395546031032642562, '395546031032642561', '03', 'NOTICE_TEMPLATE', '停服通知', b'1', NULL, NULL, NULL,
        '尊敬的用户,${nickname}：\n  近期服务器迁移，需要停服2天，特此通知。', NULL,
        '[{\"key\":\"nickname\",\"value\":\"\"}]', NULL, NULL, b'1', NULL, NULL, 1452186486253289472,
        '2023-08-16 22:56:53', 1452186486253289472, '2023-08-16 22:57:21');
COMMIT;

-- ----------------------------
-- Table structure for def_parameter
-- ----------------------------
DROP TABLE IF EXISTS `def_parameter`;
CREATE TABLE `def_parameter`
(
    `id`           bigint       NOT NULL COMMENT 'ID',
    `key_`         varchar(255) NOT NULL DEFAULT '' COMMENT '参数键',
    `value`        varchar(255) NOT NULL DEFAULT '' COMMENT '参数值',
    `name`         varchar(255) NOT NULL DEFAULT '' COMMENT '参数名称',
    `remarks`      varchar(255)          DEFAULT '' COMMENT '备注',
    `state`        bit(1)                DEFAULT b'1' COMMENT '状态',
    `param_type`   char(2)               DEFAULT '20' COMMENT '类型;[10-系统参数 20-业务参数]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.PARAMETER_TYPE)',
    `created_by`   bigint                DEFAULT NULL COMMENT '创建人id',
    `created_time` datetime     NOT NULL COMMENT '创建时间',
    `updated_by`   bigint                DEFAULT NULL COMMENT '更新人id',
    `updated_time` datetime     NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_param_key` (`key_`) USING BTREE
) ENGINE = InnoDB COMMENT ='参数配置';

-- ----------------------------
-- Records of def_parameter
-- ----------------------------
BEGIN;
INSERT INTO `def_parameter` (`id`, `key_`, `value`, `name`, `remarks`, `state`, `param_type`, `created_by`,
                             `created_time`, `updated_by`, `updated_time`)
VALUES (604269660522950770, 'xx', 'x', 'xx', '', b'1', '10', 2, '2025-03-05 08:23:21', 2, '2025-03-05 08:44:35');
COMMIT;

-- ----------------------------
-- Table structure for def_resource
-- ----------------------------
DROP TABLE IF EXISTS `def_resource`;
CREATE TABLE `def_resource`
(
    `id`              bigint       NOT NULL COMMENT 'ID',
    `application_id`  bigint       NOT NULL COMMENT '应用ID;#def_application',
    `code`            varchar(255) NOT NULL COMMENT '编码;唯一编码，用于区分资源',
    `name`            varchar(255) NOT NULL COMMENT '名称',
    `resource_type`   char(2)      NOT NULL DEFAULT '20' COMMENT '类型;[20-菜单 40-按钮 50-字段 60-数据]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS,dictType = EchoDictType.System.RESOURCE_TYPE)菜单即左侧显示的菜单视图即隐藏的菜单(需要配置在路由中)和页面上点击后需要通过路由打开的页面功能即页面上的非视图的按钮字段即列表页或编辑页的字段接口即后台的访问接口',
    `parent_id`       bigint       NOT NULL COMMENT '父级ID',
    `open_with`       char(2)               DEFAULT '01' COMMENT '打开方式;[01-组件 02-内链 03-外链]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.System.RESOURCE_OPEN_WITH)',
    `describe_`       varchar(255)          DEFAULT '' COMMENT '描述;resource_type=接口时表示接口说明',
    `path`            varchar(255)          DEFAULT '' COMMENT '地址栏路径;用于resource_type=菜单和视图和接口.resource_type=菜单和视图，表示地址栏地址, http开头表示外链, is_frame_src 为true表示在框架类打开.resource_type=接口，表示后端接口请求地址.',
    `component`       varchar(255)          DEFAULT '' COMMENT '页面路径;用于resource_type=菜单和视图. 前端页面在src/views目录下的相对地址.',
    `redirect`        varchar(255)          DEFAULT '' COMMENT '重定向;用于resource_type=菜单和视图',
    `icon`            varchar(255)          DEFAULT '' COMMENT '图标',
    `is_hidden`       bit(1)                DEFAULT b'0' COMMENT '是否隐藏菜单;\nresource_type=20时生效',
    `is_general`      bit(1)                DEFAULT b'0' COMMENT '是否公共资源;1-无需分配所有人就可以访问的',
    `state`           bit(1)       NOT NULL DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
    `sort_value`      int                   DEFAULT '1' COMMENT '排序;默认升序',
    `sub_group`       varchar(255)          DEFAULT '' COMMENT '分组',
    `field_is_secret` bit(1)                DEFAULT b'0' COMMENT '是否脱敏;显示时是否需要脱敏实现 (用于resource_type=字段)',
    `field_is_edit`   bit(1)                DEFAULT b'1' COMMENT '是否可以编辑;是否可以编辑(用于resource_type=字段)',
    `data_scope`      char(2)               DEFAULT NULL COMMENT '数据范围;[01-全部 02-本单位及子级 03-本单位 04-本部门及子级 05-本部门 06-个人 07-自定义]',
    `custom_class`    varchar(255)          DEFAULT NULL COMMENT '实现类;自定义实现类全类名',
    `is_def`          bit(1)                DEFAULT b'0' COMMENT '是否默认',
    `tree_path`       varchar(512)          DEFAULT '/' COMMENT '树路径',
    `tree_grade`      int                   DEFAULT '0' COMMENT '树层级',
    `meta_json`       varchar(512)          DEFAULT '{}' COMMENT '元数据;菜单视图的元数据',
    `created_by`      bigint                DEFAULT NULL COMMENT '创建人id',
    `created_time`    datetime              DEFAULT NULL COMMENT '创建时间',
    `updated_by`      bigint                DEFAULT NULL COMMENT '更新人id',
    `updated_time`    datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_resource_code` (`code`) USING BTREE
) ENGINE = InnoDB COMMENT ='资源';

-- ----------------------------
-- Records of def_resource
-- ----------------------------
BEGIN;
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921409, 2, 'tenant:application', '应用管理', '20', 0, '01', '', '/application', 'LAYOUT',
        '/application/application', 'ant-design:appstore-add-outlined', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL,
        NULL, '/', 0, '{}', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921412, 2, 'tenant:tenant:user', '用户管理', '20', 137848577387921409, '01', '', '/tenant/user',
        '/devOperation/tenant/defUser/index', NULL, 'ant-design:user-add-outlined', b'0', b'0', b'1', 3, '', b'0', b'1',
        NULL, NULL, NULL, '/137848577387921409/', 1, '{}', 2, '2021-12-12 12:12:12', 2, '2024-01-16 09:54:25');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921413, 2, 'tenant:application:application', '应用维护', '20', 137848577387921409, '01', '',
        '/application/application', '/devOperation/application/defApplication/index', NULL,
        'ant-design:appstore-twotone', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/', 1,
        '{\"hideChildrenInMenu\":true}', 2, '2021-12-12 12:12:12', 2, '2024-03-12 16:31:26');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921414, 2, 'tenant:application:resource', '资源维护', '20', 137848577387921409, '01', '',
        '/application/resource', '/devOperation/application/defResource/index', NULL, 'ant-design:menu-unfold-outlined',
        b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/', 1, '{\"content\":\"菜单\"}', 2,
        '2021-12-12 12:12:12', 2, '2024-03-12 16:31:45');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921417, 2, 'tenant:application:application:add', '新增', '40', 137848577387921413, '01', '', '', '',
        NULL, '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921418, 2, 'tenant:application:application:edit', '编辑', '40', 137848577387921413, '01', '', '',
        '', NULL, '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/', 2, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921419, 2, 'tenant:application:application:copy', '复制', '40', 137848577387921413, '01', '', '',
        '', NULL, '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/', 2, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921420, 2, 'tenant:application:application:delete', '删除', '40', 137848577387921413, '01', '', '',
        '', NULL, '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/', 2, '{}', 2, '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921421, 2, 'tenant:application:application:resource', '应用资源维护', '20', 137848577387921413,
        '01', '', '/application/application/resource/:id', '/devOperation/application/defResource/index', NULL, '',
        b'1', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921413/', 2,
        '{\"currentActiveMenu\":\"/application/application\"}', 2, '2021-12-12 12:12:12', 2, '2024-05-15 23:06:33');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (137848577387921422, 2, 'tenant:application:application:resource:add', '新增', '40', 137848577387921421, '01',
        '', '', '', NULL, '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 2, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (139496646533709824, 2, 'tenant:application:resource:add', '新增', '40', 137848577387921414, '01', '', '', '',
        '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (139702946697838592, 2, 'tenant:application:resource:edit', '编辑', '40', 137848577387921414, '01', '', '', '',
        '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (139702946697838593, 2, 'tenant:application:resource:delete', '删除', '40', 137848577387921414, '01', '', '', '',
        '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (143911967403278336, 2, 'tenant:system', '系统管理', '20', 0, '01', '', '/system', 'LAYOUT', '/system/dict',
        'ant-design:setting-outlined', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (144313439471271947, 1, 'basic:system', '系统功能', '20', 0, '01', '', '/basic/sysFunction', 'LAYOUT',
        '/basic/system/role', 'ant-design:setting-outlined', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/',
        0, '{}', 2, '2021-12-12 12:12:12', 2, '2025-05-10 13:27:07');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (160561957882036227, 2, 'tenant:tenant:user:reset:password', '重置密码', '40', 137848577387921412, '01', '', '',
        '', '', '', b'0', b'0', b'1', 104, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921412/',
        2, '{}', 1, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (160833820721938437, 2, 'tenant:developer', '开发者管理', '20', 0, '01', '', '/developer', 'LAYOUT',
        '/developer/tools/generator', 'ant-design:bug-outlined', b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL,
        '/', 0, '{}', 1, '2021-12-12 12:12:12', 1, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (160833820721938438, 2, 'tenant:developer:doc', 'Swagger文档', '20', 160833820721938437, '02', '',
        '/developer/doc', 'http://172.16.190.130:91/doc.html', '', 'ant-design:file-word-outlined', b'0', b'0', b'1', 3,
        '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1, '2021-12-12 12:12:12', 2,
        '2025-05-09 21:01:40');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (160833820721938439, 2, 'tenant:developer:nacos', 'nacos', '20', 160833820721938437, '03', '',
        'http://172.16.190.130:8848/nacos/', 'IFRAME', '', 'ant-design:aliyun-outlined', b'0', b'0', b'1', 4, '', b'0',
        b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1, '2021-12-12 12:12:12', 2, '2025-05-09 21:02:06');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (160833820721938440, 2, 'tenant:developer:skyWalking', 'SkyWalking', '20', 160833820721938437, '03', '',
        'http://sky.kpui.top/', 'IFRAME', '', 'ant-design:fund-projection-screen-outlined', b'0', b'0', b'1', 5, '',
        b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1, '2021-12-12 12:12:12', 2,
        '2025-05-09 21:02:28');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (160833820721938441, 2, 'tenant:developer:db', '数据库监控', '20', 160833820721938437, '02', '',
        '/developer/druid', 'http://172.16.190.130:91/druid/index.html', '', 'ant-design:console-sql-outlined', b'0',
        b'0', b'1', 6, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1, '2021-12-12 12:12:12', 2,
        '2025-05-09 21:03:00');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (172353511420329984, 2, 'tenant:system:file', '全局附件管理', '20', 143911967403278336, '01', '', '/system/file',
        '/devOperation/system/defFile/index', '', 'ant-design:file-zip-outlined', b'0', b'0', b'1', 6, '', b'0', b'1',
        NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 1452186486253289472, '2021-12-12 12:12:12', 2,
        '2025-05-10 13:30:07');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (172353511420329986, 2, 'tenant:system:file:upload', '上传', '40', 172353511420329984, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (172353511420329987, 2, 'tenant:system:file:debug:upload', '调试上传', '40', 172353511420329984, '01', '', '',
        '', '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/',
        2, '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (172353511420329988, 2, 'tenant:system:file:download', '下载', '40', 172353511420329984, '01', '', '', '', '',
        '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (172353511420329989, 2, 'tenant:system:file:delete', '删除', '40', 172353511420329984, '01', '', '', '', '', '',
        b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/172353511420329984/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2024-06-12 12:47:01');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516864, 1, 'basic:msg:msg:self', '查看个人消息', '60', 1449734007292952576, '01', '', '', '', '',
        '', b'0', b'0', b'1', 1000, '', b'0', b'1', '06', NULL, b'1', '/1449733521265393664/1449734007292952576/', 2,
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516865, 1, 'basic:msg:msg:all', '查看全部数据', '60', 1449734007292952576, '01', '', '', '', '', '',
        b'0', b'0', b'1', 1005, '', b'0', b'1', '01', NULL, b'0', '/1449733521265393664/1449734007292952576/', 2, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516866, 1, 'basic:msg:msg:company:children', '查看本单位其子单位数据', '60', 1449734007292952576,
        '01', '', '', '', '', '', b'0', b'0', b'1', 1001, '', b'0', b'1', '02', NULL, b'0',
        '/1449733521265393664/1449734007292952576/', 2, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516867, 1, 'basic:msg:msg:company', '查看本单位数据', '60', 1449734007292952576, '01', '', '', '',
        '', '', b'0', b'0', b'1', 1002, '', b'0', b'1', '03', NULL, b'0', '/1449733521265393664/1449734007292952576/',
        2, '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516868, 1, 'basic:msg:msg:dept', '查看本部门数据', '60', 1449734007292952576, '01', '', '', '', '',
        '', b'0', b'0', b'1', 1003, '', b'0', b'1', '05', NULL, b'0', '/1449733521265393664/1449734007292952576/', 2,
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516869, 1, 'basic:msg:msg:dept:children', '查看本部及其子部门数据', '60', 1449734007292952576, '01',
        '', '', '', '', '', b'0', b'0', b'1', 1004, '', b'0', b'1', '04', NULL, b'0',
        '/1449733521265393664/1449734007292952576/', 2, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (179582070228516870, 1, 'basic:msg:msg:custom', '查看自定义的数据', '60', 1449734007292952576, '01', '', '', '',
        '', '', b'0', b'0', b'1', 1006, '', b'0', b'1', '07', 'DATA_SCOPE_TEST', b'0',
        '/1449733521265393664/1449734007292952576/', 2, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (198310764748996608, 2, 'tenant:developer:tools', '开发工具', '20', 160833820721938437, '01', '',
        '/developer/tools', 'LAYOUT', '', 'ant-design:code-twotone', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL,
        NULL, '/160833820721938437/', 1, '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (198310764748996609, 2, 'tenant:developer:tools:generator', '代码生成', '20', 198310764748996608, '01', '',
        '/developer/tools/generator', '/devOperation/developer/defGenTable/index', '', '', b'0', b'0', b'1', 2, '',
        b'0', b'1', NULL, NULL, NULL, '/160833820721938437/198310764748996608/', 2, '{\"content\":\"new\"}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (199848844077301779, 1, 'basic:user:employee:invitation', '邀请', '40', 1449738581135327232, '01', '', '', '',
        '', '', b'0', b'0', b'1', 104, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2,
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (201343651610099712, 2, 'tenant:developer:tools:generator:edit', '修改代码配置', '20', 198310764748996609, '01',
        '', 'edit/:id', '/devOperation/developer/defGenTable/Edit', '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL,
        NULL, NULL, '/160833820721938437/198310764748996608/198310764748996609/', 3,
        '{\"currentActiveMenu\":\"/developer/tools/generator\"}', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (206499429136465920, 2, 'tenant:developer:tools:generator:project', '项目生成', '20', 198310764748996608, '01',
        '', 'project', '/devOperation/developer/genProject/index', '', '', b'0', b'0', b'1', 3, '', b'0', b'1', NULL,
        NULL, NULL, '/160833820721938437/198310764748996608/', 2, '{\"content\":\"new\"}', 1452186486253289472,
        '2021-12-12 12:12:12', 2, '2025-05-10 13:14:19');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207592996529504364, 2, 'tenant:developer:tools:generator:import', '导入', '40', 198310764748996609, '01', '',
        '', '', '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/', 3, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207592996529504370, 2, 'tenant:developer:tools:generator:sync', '同步', '40', 198310764748996609, '01', '', '',
        '', '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/', 3, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207644798130061312, 2, 'tenant:developer:tools:generator:delete', '删除', '40', 198310764748996609, '01', '',
        '', '', '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/', 3, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207644798130061314, 2, 'tenant:developer:tools:generator:preview', '预览', '40', 198310764748996609, '01', '',
        '', '', '', '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/', 3, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207644798130061318, 2, 'tenant:developer:tools:generator:edit:delete', '删除', '40', 201343651610099712, '01',
        '', '', '', '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/201343651610099712/', 4, '', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207644798130061323, 2, 'tenant:developer:tools:generator:edit:edit', '修改', '40', 201343651610099712, '01', '',
        '', '', '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/201343651610099712/', 4, '', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (207644798130061325, 2, 'tenant:developer:tools:generator:edit:sync', '同步', '40', 201343651610099712, '01', '',
        '', '', '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/198310764748996609/201343651610099712/', 4, '', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (219171794567823360, 1, 'basic:user:org:bind', '绑定', '40', 1449738119237599232, '01', '', '', '', '', '', b'0',
        b'0', b'1', 104, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '',
        1452186486253289472, '2022-04-28 17:59:31', 1452186486253289472, '2022-04-28 17:59:31');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (221743822848131072, 2, 'tenant:developer:tools:datasourceConfig', '数据源维护', '20', 198310764748996608, '01',
        '', '/developer/tools/datasource', '/devOperation/tenant/defDatasourceConfig/index', '',
        'ant-design:database-filled', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/', 2, '', 1452186486253289472, '2022-05-05 16:04:46',
        1452186486253289472, '2022-05-05 16:08:17');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (221743822848131074, 2, 'tenant:tenant:datasourceConfig:add', '新增', '40', 221743822848131072, '01', '', '', '',
        '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/221743822848131072/', 3, '', 1452186486253289472, '2022-05-05 16:05:50',
        1452186486253289472, '2022-05-05 16:05:50');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (221743822848131076, 2, 'tenant:tenant:datasourceConfig:edit', '编辑', '40', 221743822848131072, '01', '', '',
        '', '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/221743822848131072/', 3, '', 1452186486253289472, '2022-05-05 16:07:00',
        1452186486253289472, '2022-05-05 16:07:00');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (221743822848131078, 2, 'tenant:tenant:datasourceConfig:delete', '删除', '40', 221743822848131072, '01', '', '',
        '', '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/221743822848131072/', 3, '', 1452186486253289472, '2022-05-05 16:07:32',
        1452186486253289472, '2022-05-05 16:07:32');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (221743822848131080, 2, 'tenant:tenant:datasourceConfig:test', '测试', '40', 221743822848131072, '01', '', '',
        '', '', '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL,
        '/160833820721938437/198310764748996608/221743822848131072/', 3, '', 1452186486253289472, '2022-05-05 16:07:58',
        1452186486253289472, '2022-05-05 16:07:58');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (242152648445263888, 2, 'tenant:developer:minio', 'MinIO', '20', 160833820721938437, '02', '',
        '/developer/minio', 'http://172.16.190.130:9001/', '', 'ant-design:folder-open-filled', b'0', b'0', b'1', 7, '',
        b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1452186486253289472, '2021-12-12 12:12:12', 2,
        '2025-05-09 21:03:22');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (242152648445263893, 2, 'tenant:developer:job', '分布式定时任务', '20', 160833820721938437, '03', '',
        'http://172.16.190.130:90/xxl-job-admin/', 'IFRAME', '', 'ant-design:project-outlined', b'0', b'0', b'1', 8, '',
        b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1452186486253289472, '2021-12-12 12:12:12', 2,
        '2025-05-10 03:01:19');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (242152648445263898, 2, 'tenant:developer:file', '文件预览', '20', 160833820721938437, '02', '',
        '/developer/filepreview', 'http://172.16.190.130:40145/', '', 'ant-design:file-exclamation-outlined', b'0',
        b'0', b'1', 9, '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1452186486253289472,
        '2021-12-12 12:12:12', 2, '2025-05-09 21:04:29');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (242181583639937024, 2, 'tenant:developer:server', '服务器监控', '20', 160833820721938437, '01', '',
        '/developer/srever', '/devOperation/developer/srever/index', '', 'ant-design:aim-outlined', b'0', b'0', b'1', 2,
        '', b'0', b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (242300348075606021, 2, 'tenant:developer:jenkins', 'Jenkins', '20', 160833820721938437, '03', '',
        'http://172.16.190.130:8082/', 'IFRAME', '', 'ant-design:dropbox-outlined', b'0', b'0', b'1', 10, '', b'0',
        b'1', NULL, NULL, NULL, '/160833820721938437/', 1, '{}', 1452186486253289472, '2021-12-12 12:12:12', 2,
        '2025-05-09 21:05:07');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (249954310509559808, 2, 'tenant:ops', '运维平台', '20', 0, '01', '', '/ops', 'LAYOUT', '/ops/template',
        'ant-design:tool-outlined', b'0', b'0', b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (249954310509559809, 2, 'tenant:ops:interfaces', '接口管理', '20', 249954310509559808, '01', '',
        '/ops/interface', '/devOperation/ops/defInterface/index', '', 'ant-design:node-expand-outlined', b'0', b'0',
        b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/', 1, '', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (249954310509559810, 2, 'tenant:ops:interface:log', '接口日志', '20', 249954310509559808, '01', '', '/ops/log',
        '/devOperation/ops/defInterfaceLog/index', '', 'ant-design:customer-service-outlined', b'0', b'0', b'1', 2, '',
        b'0', b'1', NULL, NULL, NULL, '/249954310509559808/', 1, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (249954310509559811, 2, 'tenant:ops:template', '消息模板', '20', 249954310509559808, '01', '', '/ops/template',
        '/devOperation/ops/defMsgTemplate/index', '', 'ant-design:medium-outlined', b'0', b'0', b'1', 3, '', b'0', b'1',
        NULL, NULL, NULL, '/249954310509559808/', 1, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (249954310509559812, 2, 'tenant:ops:interfaces:property', '接口设置', '20', 249954310509559809, '01', '',
        '/ops/interface/property/:id', '/devOperation/ops/defInterface/property/index', '', '', b'1', b'0', b'1', 1, '',
        b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559809/', 2, '', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (249954310509559813, 2, 'tenant:ops:interfaces:log:logging', '日志执行记录', '20', 249954310509559810, '01', '',
        '/ops/log/:id', '/devOperation/ops/defInterfaceLogging/index', '', '', b'1', b'0', b'1', 1, '', b'0', b'1',
        NULL, NULL, NULL, '/249954310509559808/249954310509559810/', 2, '{\"currentActiveMenu\":\"/ops/log\"}',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2024-05-15 23:07:37');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776576, 2, 'tenant:ops:interfaces:add', '新增', '40', 249954310509559809, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559809/', 2, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776577, 2, 'tenant:ops:interfaces:edit', '编辑', '40', 249954310509559809, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559809/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776578, 2, 'tenant:ops:interfaces:view', '查看', '40', 249954310509559809, '01', '', '', '', '', '',
        b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559809/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776579, 2, 'tenant:ops:interfaces:delete', '删除', '40', 249954310509559809, '01', '', '', '', '',
        '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559809/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776580, 2, 'tenant:ops:interfaces:log:delete', '删除', '40', 249954310509559810, '01', '', '', '',
        '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559810/', 2,
        '', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776581, 2, 'tenant:ops:interfaces:log:logging:delete', '删除', '40', 249954310509559813, '01', '',
        '', '', '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL,
        '/249954310509559808/249954310509559810/249954310509559813/', 3, '', 1452186486253289472, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776582, 2, 'tenant:ops:template:add', '新增', '40', 249954310509559811, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559811/', 2, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776583, 2, 'tenant:ops:template:edit', '编辑', '40', 249954310509559811, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559811/', 2, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (250025856074776584, 2, 'tenant:ops:template:delete', '删除', '40', 249954310509559811, '01', '', '', '', '', '',
        b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559811/', 2, '',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (281886056620490965, 2, 'tenant:application:resource:move', '移动', '40', 137848577387921414, '01', '', '', '',
        '', '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921414/', 2,
        '', 1452186486253289472, '2022-10-14 16:22:44', 1452186486253289472, '2022-10-14 16:22:44');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (281886056620490972, 2, 'tenant:application:application:resource:move', '移动', '40', 137848577387921421, '01',
        '', '', '', '', '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/137848577387921421/', 3, '', 1452186486253289472, '2022-10-14 16:23:29',
        1452186486253289472, '2022-10-14 16:23:29');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (440245452193945600, 2, 'tenant:ops:template:test', '测试消息', '40', 249954310509559811, '01', '', '', '', '',
        '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/249954310509559808/249954310509559811/', 2, '',
        1452186486253289472, '2023-12-15 09:17:08', 1452186486253289472, '2023-12-15 09:17:08');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (529783477227333632, 2, 'tenant:system:online', '在线用户', '20', 143911967403278336, '01', '', '/system/online',
        '/devOperation/system/online/index', '', 'ant-design:user-outlined', b'0', b'0', b'1', 7, '', b'0', b'1', NULL,
        NULL, b'0', '/143911967403278336/', 1, '{}', 2, '2024-08-12 16:19:57', 2, '2025-05-10 13:16:47');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (529783477227333635, 2, 'tenant:system:online:kickout', '踢人下线', '40', 529783477227333632, '01', '', '', '',
        '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, b'0', '/143911967403278336/529783477227333632/', 2,
        '', 2, '2024-08-12 16:20:22', 2, '2024-08-12 16:20:22');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (529783477227333637, 2, 'tenant:system:online:logout', '强制注销', '40', 529783477227333632, '01', '', '', '',
        '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, b'0', '/143911967403278336/529783477227333632/', 2,
        '', 2, '2024-08-12 16:20:53', 2, '2024-08-12 16:20:53');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1448315264151060480, 2, 'tenant:system:param', '参数维护', '20', 143911967403278336, '01', '',
        '/system/parameter', '/devOperation/system/defParameter/index', '', 'ant-design:profile-outlined', b'0', b'0',
        b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1448315406962917376, 2, 'tenant:system:area', '地区维护', '20', 143911967403278336, '01', '', '/system/area',
        '/devOperation/system/defArea/index', '', 'ant-design:area-chart-outlined', b'0', b'0', b'1', 3, '', b'0', b'1',
        NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1448315861369618432, 2, 'tenant:system:client', '客户端维护', '20', 143911967403278336, '01', '',
        '/system/client', '/devOperation/system/defClient/index', '', 'ant-design:android-outlined', b'0', b'0', b'1',
        4, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2021-12-12 12:12:12',
        1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449391740313141248, 2, 'tenant:system:dict', '字典维护', '20', 143911967403278336, '01', '', '/system/dict',
        '/devOperation/system/dict/index', '', 'ant-design:book-twotone', b'0', b'0', b'1', 1, '', b'0', b'1', NULL,
        NULL, NULL, '/143911967403278336/', 1, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449723704727568384, 2, 'tenant:system:dict:add', '新增字典', '40', 1449391740313141248, '01', '', '', '', '',
        '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449723831227777024, 2, 'tenant:system:dict:edit', '编辑字典', '40', 1449391740313141248, '01', '', '', '', '',
        '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449723907798990848, 2, 'tenant:system:dict:delete', '删除字典', '40', 1449391740313141248, '01', '', '', '',
        '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449724021556903936, 2, 'tenant:system:dict:addItem', '新增字典项', '40', 1449391740313141248, '01', '', '', '',
        '', '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/', 2,
        '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449724119569399808, 2, 'tenant:system:dict:editItem', '编辑字典项', '40', 1449391740313141248, '01', '', '',
        '', '', '', b'0', b'0', b'1', 104, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/',
        2, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449724196207722496, 2, 'tenant:system:dict:deleteItem', '删除字典项', '40', 1449391740313141248, '01', '', '',
        '', '', '', b'0', b'0', b'1', 105, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1449391740313141248/',
        2, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449732267470487552, 1, 'basic:user', '用户中心', '20', 0, '01', '', '/user', 'LAYOUT', '/user/employee',
        'ant-design:usergroup-add-outlined', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2,
        '2021-12-12 12:12:12', 2, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449733521265393664, 1, 'basic:msg', '消息中心', '20', 0, '01', '', '/basic/msg', 'LAYOUT', '/basic/msg/myMsg',
        'ant-design:message-outlined', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL, '/', 0, '{}', 2,
        '2021-12-12 12:12:12', 2, '2025-05-10 13:28:22');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449733787893104640, 1, 'basic:msg:myMsg', '我的消息', '20', 1449733521265393664, '01', '', '/basic/msg/myMsg',
        '/basic/msg/extendNotice/index', '', 'wpf-my-topic', b'0', b'0', b'1', 1, '', b'0', b'1', NULL, NULL, NULL,
        '/1449733521265393664/', 1, '{}', 2, '2021-12-12 12:12:12', 2, '2025-05-10 13:27:54');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449734007292952576, 1, 'basic:msg:msg', '消息管理', '20', 1449733521265393664, '01', '', '/basic/msg/msg',
        '/basic/msg/extendMsg/index', '', 'codicon-repo-push', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL, NULL,
        '/1449733521265393664/', 1, '{\"content\":\"数据权限\"}', 2, '2021-12-12 12:12:12', 2, '2025-05-10 13:27:33');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449734450995789824, 1, 'basic:system:role', '角色权限维护', '20', 144313439471271947, '01', '',
        '/basic/system/role', '/basic/system/baseRole/index', '', 'ant-design:lock-outlined', b'0', b'0', b'1', 1, '',
        b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2, '2021-12-12 12:12:12', 2,
        '2025-05-10 13:26:52');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449734707225821184, 1, 'basic:system:appendix', '附件管理', '20', 144313439471271947, '01', '',
        '/basic/system/file', '/basic/system/baseFile/index', '', 'ant-design:file-sync-outlined', b'0', b'0', b'1', 2,
        '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2, '2021-10-17 21:51:04', 2,
        '2025-05-10 13:25:53');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449734944434683904, 1, 'basic:system:webLog', '操作日志', '20', 144313439471271947, '01', '',
        '/basic/system/operationLog', '/basic/system/baseOperationLog/index', '', 'ant-design:reconciliation-outlined',
        b'0', b'0', b'1', 3, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2,
        '2021-12-12 12:12:12', 2, '2025-05-10 13:26:16');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449735103088427008, 1, 'basic:system:loginLog', '登录日志', '20', 144313439471271947, '01', '',
        '/basic/sysFunction/loginLog', '/basic/system/baseLoginLog/index', '', 'ant-design:login-outlined', b'0', b'0',
        b'1', 4, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/', 1, '{}', 2, '2021-12-12 12:12:12', 2,
        '2025-05-10 13:26:39');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449738119237599232, 1, 'basic:user:org', '组织机构', '20', 1449732267470487552, '01', '', '/user/org',
        '/basic/user/baseOrg/index', '', 'ant-design:cluster-outlined', b'0', b'0', b'1', 2, '', b'0', b'1', NULL, NULL,
        NULL, '/1449732267470487552/', 1, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449738581135327232, 1, 'basic:user:employee', '员工维护', '20', 1449732267470487552, '01', '',
        '/user/employee', '/basic/user/baseEmployee/index', '', 'ant-design:user-add-outlined', b'0', b'0', b'1', 1, '',
        b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/', 1, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1449739134456299520, 1, 'basic:user:position', '岗位维护', '20', 1449732267470487552, '01', '',
        '/user/position', '/basic/user/basePosition/index', '', 'eos-icons:job', b'0', b'0', b'1', 3, '', b'0', b'1',
        NULL, NULL, NULL, '/1449732267470487552/', 1, '{}', 2, '2021-12-12 12:12:12', 1452186486253289472,
        '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457620408604819456, 1, 'basic:user:employee:add', '新增', '40', 1449738581135327232, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457620470995091456, 1, 'basic:user:employee:edit', '编辑', '40', 1449738581135327232, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457620528469639168, 1, 'basic:user:employee:delete', '删除', '40', 1449738581135327232, '01', '', '', '', '',
        '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2,
        '{}', 1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457620585302458368, 1, 'basic:user:employee:view', '查看', '40', 1449738581135327232, '01', '', '', '', '', '',
        b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665354649042944, 1, 'basic:user:position:add', '新增', '40', 1449739134456299520, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665399683284992, 1, 'basic:user:position:edit', '编辑', '40', 1449739134456299520, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665444381982720, 1, 'basic:user:position:delete', '删除', '40', 1449739134456299520, '01', '', '', '', '',
        '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2,
        '{}', 1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665503664275456, 1, 'basic:user:position:view', '查看', '40', 1449739134456299520, '01', '', '', '', '', '',
        b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449739134456299520/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1451549146992345088, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665587088982016, 1, 'basic:user:org:add', '新增', '40', 1449738119237599232, '01', '', '', '', '', '', b'0',
        b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665635705159680, 1, 'basic:user:org:edit', '编辑', '40', 1449738119237599232, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665696765837312, 1, 'basic:user:org:delete', '删除', '40', 1449738119237599232, '01', '', '', '', '', '',
        b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457665749857337344, 1, 'basic:user:org:switch', '切换', '40', 1449738119237599232, '01', '', '', '', '', '',
        b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738119237599232/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457668537614073856, 1, 'basic:system:role:add', '新增', '40', 1449734450995789824, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457668602952941568, 1, 'basic:system:role:edit', '编辑', '40', 1449734450995789824, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457668655000059904, 1, 'basic:system:role:delete', '删除', '40', 1449734450995789824, '01', '', '', '', '', '',
        b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2, '{}',
        1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457668749124435968, 1, 'basic:system:role:bindUser', '绑定用户', '40', 1449734450995789824, '01', '', '', '',
        '', '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/', 2,
        '{}', 1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1457668844297388032, 1, 'basic:system:role:bindResource', '配置资源', '40', 1449734450995789824, '01', '', '',
        '', '', '', b'0', b'0', b'1', 104, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734450995789824/',
        2, '{}', 1451549146992345088, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1459061181095346176, 2, 'tenant:system:loginLog', '全局登录日志', '20', 143911967403278336, '01', '',
        '/system/loginLog', '/devOperation/system/defLoginLog/index', '', 'ant-design:login-outlined', b'0', b'0', b'1',
        5, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/', 1, '{}', 1452186486253289472,
        '2021-12-12 12:12:12', 2, '2024-01-16 09:48:00');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460436763976663040, 1, 'basic:msg:msg:add', '发布消息', '20', 1449734007292952576, '01', '',
        '/basic/msg/msg/:type/:id', '/basic/msg/extendMsg/Edit', '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL,
        NULL, NULL, '/1449733521265393664/1449734007292952576/', 2, '{\"currentActiveMenu\":\"/msg/msg\"}',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2025-05-10 13:27:42');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460436856054218752, 1, 'basic:msg:msg:edit', '编辑', '40', 1449734007292952576, '01', '', '', '', '', '', b'0',
        b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449734007292952576/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460436934051495936, 1, 'basic:msg:msg:delete', '删除', '40', 1449734007292952576, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449734007292952576/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460468030063509504, 1, 'basic:msg:myMsg:edit', '查看我的消息', '20', 1449733787893104640, '01', '',
        '/basic/msg/myMsg/:type/:id', '/basic/msg/extendNotice/Edit', '', '', b'1', b'0', b'1', 1, '', b'0', b'1', NULL,
        NULL, NULL, '/1449733521265393664/1449733787893104640/', 2, '{\"currentActiveMenu\":\"/msg/myMsg\"}',
        1452186486253289472, '2021-12-12 12:12:12', 2, '2025-05-10 13:28:08');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460537476991942656, 1, 'basic:msg:myMsg:delete', '删除', '40', 1449733787893104640, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449733787893104640/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460537873248813056, 1, 'basic:msg:msg:view', '查看', '40', 1449734007292952576, '01', '', '', '', '', '', b'0',
        b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/1449733521265393664/1449734007292952576/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460538960118808576, 1, 'basic:system:webLog:delete', '删除', '40', 1449734944434683904, '01', '', '', '', '',
        '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734944434683904/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460539047851065344, 1, 'basic:system:webLog:view', '查看', '40', 1449734944434683904, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734944434683904/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460540557393657856, 1, 'basic:system:loginLog:delete', '删除', '40', 1449735103088427008, '01', '', '', '', '',
        '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449735103088427008/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460540612146102272, 1, 'basic:system:loginLog:view', '查看', '40', 1449735103088427008, '01', '', '', '', '',
        '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449735103088427008/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460540797257515008, 1, 'basic:system:appendix:upload', '上传', '40', 1449734707225821184, '01', '', '', '', '',
        '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734707225821184/', 2,
        '{}', 1452186486253289472, '2021-11-16 17:30:36', 1452186486253289472, '2021-11-16 17:30:36');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460540870838190080, 1, 'basic:system:appendix:debug:upload', '调试上传', '40', 1449734707225821184, '01', '',
        '', '', '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL,
        '/144313439471271947/1449734707225821184/', 2, '{}', 1452186486253289472, '2021-11-16 17:30:54',
        1452186486253289472, '2021-11-16 17:30:54');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460540935568883712, 1, 'basic:system:appendix:download', '下载', '40', 1449734707225821184, '01', '', '', '',
        '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734707225821184/', 2,
        '{}', 1452186486253289472, '2021-11-16 17:31:09', 1452186486253289472, '2021-11-16 17:31:09');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460540979420332032, 1, 'basic:system:appendix:delete', '删除', '40', 1449734707225821184, '01', '', '', '', '',
        '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/144313439471271947/1449734707225821184/', 2,
        '{}', 1452186486253289472, '2021-11-16 17:31:20', 1452186486253289472, '2021-12-12 00:57:27');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460542581971615744, 2, 'tenant:tenant:user:add', '新增', '40', 137848577387921412, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921412/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460542629845401600, 2, 'tenant:tenant:user:edit', '编辑', '40', 137848577387921412, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921412/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460542675554926592, 2, 'tenant:tenant:user:delete', '删除', '40', 137848577387921412, '01', '', '', '', '', '',
        b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921412/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460543317040168960, 2, 'tenant:tenant:user:view', '查看', '40', 137848577387921412, '01', '', '', '', '', '',
        b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/137848577387921409/137848577387921412/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547251804831744, 2, 'tenant:application:application:resource:edit', '编辑', '40', 137848577387921421, '01',
        '', '', '', '', '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547377491345408, 2, 'tenant:application:application:resource:delete', '删除', '40', 137848577387921421,
        '01', '', '', '', '', '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL,
        '/137848577387921409/137848577387921413/137848577387921421/', 3, '{}', 1452186486253289472,
        '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547739937931264, 2, 'tenant:system:param:add', '新增', '40', 1448315264151060480, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547794912673792, 2, 'tenant:system:param:edit', '编辑', '40', 1448315264151060480, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547848918532096, 2, 'tenant:system:param:view', '查看', '40', 1448315264151060480, '01', '', '', '', '', '',
        b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547893147467776, 2, 'tenant:system:param:delete', '删除', '40', 1448315264151060480, '01', '', '', '', '',
        '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315264151060480/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460547974479216640, 2, 'tenant:system:area:add', '新增', '40', 1448315406962917376, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315406962917376/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548071271170048, 2, 'tenant:system:area:edit', '编辑', '40', 1448315406962917376, '01', '', '', '', '', '',
        b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315406962917376/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548273847664640, 2, 'tenant:system:area:delete', '删除', '40', 1448315406962917376, '01', '', '', '', '',
        '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315406962917376/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548462427766784, 2, 'tenant:system:client:add', '新增', '40', 1448315861369618432, '01', '', '', '', '', '',
        b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2, '{}',
        1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548519843594240, 2, 'tenant:system:client:edit', '编辑', '40', 1448315861369618432, '01', '', '', '', '',
        '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548553880371200, 2, 'tenant:system:client:delete', '删除', '40', 1448315861369618432, '01', '', '', '', '',
        '', b'0', b'0', b'1', 102, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548589812973568, 2, 'tenant:system:client:view', '查看', '40', 1448315861369618432, '01', '', '', '', '',
        '', b'0', b'0', b'1', 103, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1448315861369618432/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548658754748416, 2, 'tenant:system:loginLog:delete', '删除', '40', 1459061181095346176, '01', '', '', '',
        '', '', b'0', b'0', b'1', 100, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1459061181095346176/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1460548689041817600, 2, 'tenant:system:loginLog:view', '查看', '40', 1459061181095346176, '01', '', '', '', '',
        '', b'0', b'0', b'1', 101, '', b'0', b'1', NULL, NULL, NULL, '/143911967403278336/1459061181095346176/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
INSERT INTO `def_resource` (`id`, `application_id`, `code`, `name`, `resource_type`, `parent_id`, `open_with`,
                            `describe_`, `path`, `component`, `redirect`, `icon`, `is_hidden`, `is_general`, `state`,
                            `sort_value`, `sub_group`, `field_is_secret`, `field_is_edit`, `data_scope`, `custom_class`,
                            `is_def`, `tree_path`, `tree_grade`, `meta_json`, `created_by`, `created_time`,
                            `updated_by`, `updated_time`)
VALUES (1461609523809615872, 1, 'basic:user:employee:bindRole', '绑定角色', '40', 1449738581135327232, '01', '', '', '',
        '', '', b'0', b'0', b'1', 105, '', b'0', b'1', NULL, NULL, NULL, '/1449732267470487552/1449738581135327232/', 2,
        '{}', 1452186486253289472, '2021-12-12 12:12:12', 1452186486253289472, '2021-12-12 12:12:12');
COMMIT;

-- ----------------------------
-- Table structure for def_resource_api
-- ----------------------------
DROP TABLE IF EXISTS `def_resource_api`;
CREATE TABLE `def_resource_api`
(
    `id`                      bigint       NOT NULL COMMENT 'ID',
    `resource_id`             bigint       NOT NULL COMMENT '资源ID',
    `controller`              varchar(255) DEFAULT NULL COMMENT '控制器类名',
    `spring_application_name` varchar(255) DEFAULT NULL COMMENT '所属服务;取配置文件中 spring.application.name ',
    `request_method`          varchar(255) NOT NULL COMMENT '请求类型',
    `name`                    varchar(255) DEFAULT NULL COMMENT '接口名;接口上的注释',
    `uri`                     varchar(255) NOT NULL COMMENT '接口地址;kpu-cloud版：uri需要拼接上gateway中路径前缀kpu-boot版: uri需要不需要拼接前缀',
    `is_input`                bit(1)       DEFAULT NULL COMMENT '是否手动录入',
    `created_by`              bigint       DEFAULT NULL COMMENT '创建人',
    `created_time`            datetime     DEFAULT NULL COMMENT '创建时间',
    `updated_by`              bigint       DEFAULT NULL COMMENT '最后更新人',
    `updated_time`            datetime     DEFAULT NULL COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `idx_res_api_resource_id` (`resource_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='资源接口';

-- ----------------------------
-- Records of def_resource_api
-- ----------------------------
BEGIN;
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167906188749438980, 1460537873248813056, 'DefUserController', 'kpu-system-server', 'POST',
        '用户-查找同一企业下的用户', '/system/defUser/pageUser', b'0', 1452186486253289472, '2021-12-11 13:27:53',
        1452186486253289472, '2021-12-11 13:27:53');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167906188749438981, 1460537873248813056, 'MsgController', 'kpu-base-server', 'GET', '消息表-查询消息中心',
        '/base/msg/{id}', b'0', 1452186486253289472, '2021-12-11 13:27:53', 1452186486253289472, '2021-12-11 13:27:53');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167906188749438982, 1460537873248813056, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-批量查询',
        '/base/baseRole/query', b'0', 1452186486253289472, '2021-12-11 13:27:53', 1452186486253289472,
        '2021-12-11 13:27:53');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225477, 1457620585302458368, 'BaseEmployeeController', 'kpu-base-server', 'GET', '员工-单体查询',
        '/base/baseEmployee/{id}', b'0', 1452186486253289472, '2021-12-11 20:40:32', 1452186486253289472,
        '2021-12-11 20:40:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225478, 1457620528469639168, 'BaseEmployeeController', 'kpu-base-server', 'DELETE', '员工-删除',
        '/base/baseEmployee', b'0', 1452186486253289472, '2021-12-11 20:45:26', 1452186486253289472,
        '2021-12-11 20:45:26');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225479, 1457620470995091456, 'BaseEmployeeController', 'kpu-base-server', 'PUT', '员工-修改',
        '/base/baseEmployee', b'0', 1452186486253289472, '2021-12-11 20:46:52', 1452186486253289472,
        '2021-12-11 20:46:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225480, 1461609523809615872, 'BaseEmployeeController', 'kpu-base-server', 'GET',
        '员工-查询员工的角色', '/base/baseEmployee/findEmployeeRoleByEmployeeId', b'0', 1452186486253289472,
        '2021-12-11 20:49:19', 1452186486253289472, '2021-12-11 20:49:19');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225481, 1461609523809615872, 'BaseRoleController', 'kpu-base-server', 'POST',
        '角色-分页查询员工的角色', '/base/baseRole/pageMyRole', b'0', 1452186486253289472, '2021-12-11 20:49:19',
        1452186486253289472, '2021-12-11 20:49:19');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225482, 1461609523809615872, 'BaseEmployeeController', 'kpu-base-server', 'POST',
        '员工-给员工分配角色', '/base/baseEmployee/employeeRole', b'0', 1452186486253289472, '2021-12-11 20:49:19',
        1452186486253289472, '2021-12-11 20:49:19');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225483, 1449738119237599232, 'BaseOrgController', 'kpu-base-server', 'POST',
        '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 1452186486253289472, '2021-12-11 23:22:45',
        1452186486253289472, '2021-12-11 23:22:45');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225484, 1457665587088982016, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-新增',
        '/base/baseOrg', b'0', 1452186486253289472, '2021-12-11 23:30:43', 1452186486253289472, '2021-12-11 23:30:43');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225485, 1457665635705159680, 'BaseOrgController', 'kpu-base-server', 'PUT', '组织-修改',
        '/base/baseOrg', b'0', 1452186486253289472, '2021-12-11 23:31:01', 1452186486253289472, '2021-12-11 23:31:01');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225486, 1457665696765837312, 'BaseOrgController', 'kpu-base-server', 'DELETE', '组织-删除',
        '/base/baseOrg', b'0', 1452186486253289472, '2021-12-11 23:31:16', 1452186486253289472, '2021-12-11 23:31:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225487, 1449739134456299520, 'BasePositionController', 'kpu-base-server', 'POST',
        '岗位-分页列表查询', '/base/basePosition/page', b'0', 1452186486253289472, '2021-12-11 23:39:12',
        1452186486253289472, '2021-12-11 23:39:12');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225488, 1457665354649042944, 'BaseOrgController', 'kpu-base-server', 'POST',
        '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 1452186486253289472, '2021-12-11 23:39:45',
        1452186486253289472, '2021-12-11 23:39:45');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225489, 1457665354649042944, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-新增',
        '/base/basePosition', b'0', 1452186486253289472, '2021-12-11 23:39:45', 1452186486253289472,
        '2021-12-11 23:39:45');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225490, 1457665399683284992, 'BasePositionController', 'kpu-base-server', 'PUT', '岗位-修改',
        '/base/basePosition', b'0', 1452186486253289472, '2021-12-11 23:41:09', 1452186486253289472,
        '2021-12-11 23:41:09');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225491, 1457665444381982720, 'BasePositionController', 'kpu-base-server', 'DELETE', '岗位-删除',
        '/base/basePosition', b'0', 1452186486253289472, '2021-12-11 23:41:21', 1452186486253289472,
        '2021-12-11 23:41:21');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225505, 1460540557393657856, 'BaseLoginLogController', 'kpu-base-server', 'DELETE',
        '登录日志-清空日志', '/base/baseLoginLog/clear', b'0', 1452186486253289472, '2021-12-12 00:29:25',
        1452186486253289472, '2021-12-12 00:29:25');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225506, 1460540557393657856, 'BaseLoginLogController', 'kpu-base-server', 'DELETE', '登录日志-删除',
        '/base/baseLoginLog', b'0', 1452186486253289472, '2021-12-12 00:29:25', 1452186486253289472,
        '2021-12-12 00:29:25');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225507, 1460540612146102272, 'BaseLoginLogController', 'kpu-base-server', 'GET',
        '登录日志-查询单体详情', '/base/baseLoginLog/detail', b'0', 1452186486253289472, '2021-12-12 00:30:14',
        1452186486253289472, '2021-12-12 00:30:14');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225509, 1460538960118808576, 'BaseOperationLogController', 'kpu-base-server', 'DELETE',
        '操作日志-清空日志', '/base/baseOperationLog/clear', b'0', 1452186486253289472, '2021-12-12 00:31:01',
        1452186486253289472, '2021-12-12 00:31:01');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225510, 1460538960118808576, 'BaseOperationLogController', 'kpu-base-server', 'DELETE',
        '操作日志-删除', '/base/baseOperationLog', b'0', 1452186486253289472, '2021-12-12 00:31:01',
        1452186486253289472, '2021-12-12 00:31:01');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225511, 1460539047851065344, 'BaseOperationLogController', 'kpu-base-server', 'GET',
        '操作日志-查询单体详情', '/base/baseOperationLog/detail', b'0', 1452186486253289472, '2021-12-12 00:31:30',
        1452186486253289472, '2021-12-12 00:31:30');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225513, 1460540979420332032, 'FileController', 'kpu-base-server', 'DELETE', '文件实时上传-删除',
        '/base/file', b'0', 1452186486253289472, '2021-12-12 00:57:27', 1452186486253289472, '2021-12-12 00:57:27');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225517, 1457668537614073856, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-新增',
        '/base/baseRole', b'0', 1452186486253289472, '2021-12-12 01:00:43', 1452186486253289472, '2021-12-12 01:00:43');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225518, 1457668602952941568, 'BaseRoleController', 'kpu-base-server', 'PUT', '角色-修改',
        '/base/baseRole', b'0', 1452186486253289472, '2021-12-12 01:00:58', 1452186486253289472, '2021-12-12 01:00:58');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225519, 1457668655000059904, 'BaseRoleController', 'kpu-base-server', 'DELETE', '角色-删除',
        '/base/baseRole', b'0', 1452186486253289472, '2021-12-12 01:01:13', 1452186486253289472, '2021-12-12 01:01:13');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225520, 1457668749124435968, 'BaseOrgController', 'kpu-base-server', 'POST',
        '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 1452186486253289472, '2021-12-12 01:04:05',
        1452186486253289472, '2021-12-12 01:04:05');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225521, 1457668749124435968, 'BaseRoleController', 'kpu-base-server', 'GET',
        '角色-查询角色绑定的员工', '/base/baseRole/employeeList', b'0', 1452186486253289472, '2021-12-12 01:04:05',
        1452186486253289472, '2021-12-12 01:04:05');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225522, 1457668749124435968, 'BaseEmployeeController', 'kpu-base-server', 'POST',
        '员工-分页列表查询', '/base/baseEmployee/page', b'0', 1452186486253289472, '2021-12-12 01:04:05',
        1452186486253289472, '2021-12-12 01:04:05');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225523, 1457668749124435968, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-给角色分配员工',
        '/base/baseRole/roleEmployee', b'0', 1452186486253289472, '2021-12-12 01:04:05', 1452186486253289472,
        '2021-12-12 01:04:05');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225524, 1457668844297388032, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-给角色配置资源',
        '/base/baseRole/roleResource', b'0', 1452186486253289472, '2021-12-12 01:04:38', 1452186486253289472,
        '2021-12-12 01:04:38');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225551, 137848577387921412, 'DefUserController', 'kpu-system-server', 'POST', '用户-分页列表查询',
        '/system/defUser/page', b'0', 1452186486253289472, '2021-12-12 13:14:03', 1452186486253289472,
        '2021-12-12 13:14:03');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225552, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'POST', '用户-新增',
        '/system/defUser', b'0', 1452186486253289472, '2021-12-12 13:15:38', 1452186486253289472,
        '2021-12-12 13:15:38');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225553, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'PUT', '用户-修改',
        '/system/defUser', b'0', 1452186486253289472, '2021-12-12 13:21:18', 1452186486253289472,
        '2021-12-12 13:21:18');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225554, 1460542675554926592, 'DefUserController', 'kpu-system-server', 'DELETE', '用户-删除',
        '/system/defUser', b'0', 1452186486253289472, '2021-12-12 13:21:32', 1452186486253289472,
        '2021-12-12 13:21:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225555, 160561957882036227, 'DefUserController', 'kpu-system-server', 'PUT', '用户-重置密码',
        '/system/defUser/resetPassword', b'0', 1452186486253289472, '2021-12-12 13:22:52', 1452186486253289472,
        '2021-12-12 13:22:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225556, 137848577387921413, 'DefApplicationController', 'kpu-system-server', 'POST',
        '应用-分页列表查询', '/system/defApplication/page', b'0', 1452186486253289472, '2021-12-12 13:24:38',
        1452186486253289472, '2021-12-12 13:24:38');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225557, 137848577387921417, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-新增',
        '/system/defApplication', b'0', 1452186486253289472, '2021-12-12 13:26:16', 1452186486253289472,
        '2021-12-12 13:26:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225558, 137848577387921419, 'DefApplicationController', 'kpu-system-server', 'POST', '应用-新增',
        '/system/defApplication', b'0', 1452186486253289472, '2021-12-12 15:48:50', 1452186486253289472,
        '2021-12-12 15:48:50');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225559, 137848577387921418, 'DefApplicationController', 'kpu-system-server', 'PUT', '应用-修改',
        '/system/defApplication', b'0', 1452186486253289472, '2021-12-12 15:49:05', 1452186486253289472,
        '2021-12-12 15:49:05');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225562, 137848577387921421, 'DefApplicationController', 'kpu-system-server', 'POST',
        '应用-批量查询', '/system/defApplication/query', b'0', 1452186486253289472, '2021-12-12 15:53:35',
        1452186486253289472, '2021-12-12 15:53:35');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225563, 137848577387921421, 'DefResourceController', 'kpu-system-server', 'POST',
        '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 1452186486253289472, '2021-12-12 15:53:35',
        1452186486253289472, '2021-12-12 15:53:35');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225564, 137848577387921421, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询',
        '/system/defResource/{id}', b'0', 1452186486253289472, '2021-12-12 15:53:35', 1452186486253289472,
        '2021-12-12 15:53:35');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225568, 1460547377491345408, 'DefResourceController', 'kpu-system-server', 'DELETE', '资源-删除',
        '/system/defResource', b'0', 1452186486253289472, '2021-12-12 15:57:35', 1452186486253289472,
        '2021-12-12 15:57:35');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225569, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'POST', '资源-新增',
        '/system/defResource', b'0', 1452186486253289472, '2021-12-12 15:58:48', 1452186486253289472,
        '2021-12-12 15:58:48');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225570, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 1452186486253289472, '2021-12-12 15:58:48',
        1452186486253289472, '2021-12-12 15:58:48');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225571, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 1452186486253289472, '2021-12-12 15:58:48',
        1452186486253289472, '2021-12-12 15:58:48');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225572, 137848577387921422, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 1452186486253289472, '2021-12-12 15:58:48',
        1452186486253289472, '2021-12-12 15:58:48');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225573, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-修改',
        '/system/defResource', b'0', 1452186486253289472, '2021-12-12 15:59:08', 1452186486253289472,
        '2021-12-12 15:59:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225574, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询',
        '/system/defResource/{id}', b'0', 1452186486253289472, '2021-12-12 15:59:08', 1452186486253289472,
        '2021-12-12 15:59:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225575, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 1452186486253289472, '2021-12-12 15:59:08',
        1452186486253289472, '2021-12-12 15:59:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225576, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 1452186486253289472, '2021-12-12 15:59:08',
        1452186486253289472, '2021-12-12 15:59:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225577, 1460547251804831744, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 1452186486253289472, '2021-12-12 15:59:08',
        1452186486253289472, '2021-12-12 15:59:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225578, 137848577387921414, 'DefApplicationController', 'kpu-system-server', 'POST',
        '应用-批量查询', '/system/defApplication/query', b'0', 1452186486253289472, '2021-12-12 17:29:18',
        1452186486253289472, '2021-12-12 17:29:18');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225579, 137848577387921414, 'DefResourceController', 'kpu-system-server', 'POST',
        '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 1452186486253289472, '2021-12-12 17:29:18',
        1452186486253289472, '2021-12-12 17:29:18');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225580, 137848577387921414, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询',
        '/system/defResource/{id}', b'0', 1452186486253289472, '2021-12-12 17:29:18', 1452186486253289472,
        '2021-12-12 17:29:18');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225581, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'POST', '资源-新增',
        '/system/defResource', b'0', 1452186486253289472, '2021-12-12 17:29:49', 1452186486253289472,
        '2021-12-12 17:29:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225582, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 1452186486253289472, '2021-12-12 17:29:49',
        1452186486253289472, '2021-12-12 17:29:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225583, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 1452186486253289472, '2021-12-12 17:29:49',
        1452186486253289472, '2021-12-12 17:29:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225584, 139496646533709824, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 1452186486253289472, '2021-12-12 17:29:49',
        1452186486253289472, '2021-12-12 17:29:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225590, 139702946697838593, 'DefResourceController', 'kpu-system-server', 'DELETE', '资源-删除',
        '/system/defResource', b'0', 1452186486253289472, '2021-12-12 17:30:39', 1452186486253289472,
        '2021-12-12 17:30:39');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225605, 1449391740313141248, 'DefDictController', 'kpu-system-server', 'POST', '字典-分页列表查询',
        '/system/defDict/page', b'0', 1452186486253289472, '2021-12-12 17:43:22', 1452186486253289472,
        '2021-12-12 17:43:22');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225606, 1449391740313141248, 'DefDictItemController', 'kpu-system-server', 'POST',
        '字典项-分页列表查询', '/system/defDictItem/page', b'0', 1452186486253289472, '2021-12-12 17:43:22',
        1452186486253289472, '2021-12-12 17:43:22');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225609, 1449723907798990848, 'DefDictController', 'kpu-system-server', 'DELETE', '字典-删除',
        '/system/defDict', b'0', 1452186486253289472, '2021-12-12 17:44:32', 1452186486253289472,
        '2021-12-12 17:44:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225610, 1449723704727568384, 'DefDictController', 'kpu-system-server', 'POST', '字典-新增',
        '/system/defDict', b'0', 1452186486253289472, '2021-12-12 17:57:01', 1452186486253289472,
        '2021-12-12 17:57:01');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225611, 1449723704727568384, 'DefDictController', 'kpu-system-server', 'GET',
        '字典-检测字典标识是否可用', '/system/defDict/check', b'0', 1452186486253289472, '2021-12-12 17:57:01',
        1452186486253289472, '2021-12-12 17:57:01');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225612, 1449723831227777024, 'DefDictController', 'kpu-system-server', 'PUT', '字典-修改',
        '/system/defDict', b'0', 1452186486253289472, '2021-12-12 17:57:13', 1452186486253289472,
        '2021-12-12 17:57:13');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225613, 1449723831227777024, 'DefDictController', 'kpu-system-server', 'GET',
        '字典-检测字典标识是否可用', '/system/defDict/check', b'0', 1452186486253289472, '2021-12-12 17:57:13',
        1452186486253289472, '2021-12-12 17:57:13');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225614, 1449724021556903936, 'DefDictItemController', 'kpu-system-server', 'POST', '字典项-新增',
        '/system/defDictItem', b'0', 1452186486253289472, '2021-12-12 18:12:49', 1452186486253289472,
        '2021-12-12 18:12:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225615, 1449724119569399808, 'DefDictItemController', 'kpu-system-server', 'PUT', '字典项-修改',
        '/system/defDictItem', b'0', 1452186486253289472, '2021-12-12 18:13:02', 1452186486253289472,
        '2021-12-12 18:13:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225616, 1449724196207722496, 'DefDictItemController', 'kpu-system-server', 'DELETE', '字典项-删除',
        '/system/defDictItem', b'0', 1452186486253289472, '2021-12-12 18:13:17', 1452186486253289472,
        '2021-12-12 18:13:17');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225617, 1448315264151060480, 'DefParameterController', 'kpu-system-server', 'POST',
        '参数配置-分页列表查询', '/system/defParameter/page', b'0', 1452186486253289472, '2021-12-12 18:13:51',
        1452186486253289472, '2021-12-12 18:13:51');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225618, 1460547739937931264, 'DefParameterController', 'kpu-system-server', 'POST', '参数配置-新增',
        '/system/defParameter', b'0', 1452186486253289472, '2021-12-12 18:14:07', 1452186486253289472,
        '2021-12-12 18:14:07');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225619, 1460547794912673792, 'DefParameterController', 'kpu-system-server', 'PUT', '参数配置-修改',
        '/system/defParameter', b'0', 1452186486253289472, '2021-12-12 18:14:20', 1452186486253289472,
        '2021-12-12 18:14:20');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225620, 1460547893147467776, 'DefParameterController', 'kpu-system-server', 'DELETE',
        '参数配置-删除', '/system/defParameter', b'0', 1452186486253289472, '2021-12-12 18:14:36', 1452186486253289472,
        '2021-12-12 18:14:36');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225621, 1448315406962917376, 'DefAreaController', 'kpu-system-server', 'POST',
        '地区表-按树结构查询地区', '/system/defArea/tree', b'0', 1452186486253289472, '2021-12-12 18:15:18',
        1452186486253289472, '2021-12-12 18:15:18');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225622, 1460547974479216640, 'DefAreaController', 'kpu-system-server', 'POST', '地区表-新增',
        '/system/defArea', b'0', 1452186486253289472, '2021-12-12 18:15:32', 1452186486253289472,
        '2021-12-12 18:15:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225623, 1460548071271170048, 'DefAreaController', 'kpu-system-server', 'PUT', '地区表-修改',
        '/system/defArea', b'0', 1452186486253289472, '2021-12-12 18:15:48', 1452186486253289472,
        '2021-12-12 18:15:48');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225624, 1460548273847664640, 'DefAreaController', 'kpu-system-server', 'DELETE', '地区表-删除',
        '/system/defArea', b'0', 1452186486253289472, '2021-12-12 18:16:00', 1452186486253289472,
        '2021-12-12 18:16:00');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225625, 1448315861369618432, 'DefClientController', 'kpu-system-server', 'POST',
        '客户端-分页列表查询', '/system/defClient/page', b'0', 1452186486253289472, '2021-12-12 18:16:25',
        1452186486253289472, '2021-12-12 18:16:25');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225626, 1460548462427766784, 'DefClientController', 'kpu-system-server', 'POST', '客户端-新增',
        '/system/defClient', b'0', 1452186486253289472, '2021-12-12 18:59:33', 1452186486253289472,
        '2021-12-12 18:59:33');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225627, 1460548519843594240, 'DefClientController', 'kpu-system-server', 'PUT', '客户端-修改',
        '/system/defClient', b'0', 1452186486253289472, '2021-12-12 19:00:03', 1452186486253289472,
        '2021-12-12 19:00:03');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225628, 1460548553880371200, 'DefClientController', 'kpu-system-server', 'DELETE', '客户端-删除',
        '/system/defClient', b'0', 1452186486253289472, '2021-12-12 19:00:24', 1452186486253289472,
        '2021-12-12 19:00:24');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225629, 1459061181095346176, 'DefLoginLogController', 'kpu-system-server', 'POST',
        '登录日志-分页列表查询', '/system/defLoginLog/page', b'0', 1452186486253289472, '2021-12-12 20:20:49',
        1452186486253289472, '2021-12-12 20:20:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225630, 1460548658754748416, 'DefLoginLogController', 'kpu-system-server', 'DELETE',
        '登录日志-清空日志', '/system/defLoginLog/clear', b'0', 1452186486253289472, '2021-12-12 20:21:06',
        1452186486253289472, '2021-12-12 20:21:06');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225631, 1460548658754748416, 'DefLoginLogController', 'kpu-system-server', 'DELETE',
        '登录日志-删除', '/system/defLoginLog', b'0', 1452186486253289472, '2021-12-12 20:21:06', 1452186486253289472,
        '2021-12-12 20:21:06');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (167990267029225632, 1460548689041817600, 'DefLoginLogController', 'kpu-system-server', 'GET',
        '登录日志-查询单体详情', '/system/defLoginLog/detail', b'0', 1452186486253289472, '2021-12-12 20:21:42',
        1452186486253289472, '2021-12-12 20:21:42');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707717, 1457620408604819456, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-批量查询',
        '/base/basePosition/query', b'0', 1452186486253289472, '2021-12-14 23:16:27', 1452186486253289472,
        '2021-12-14 23:16:27');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707718, 1457620408604819456, 'BaseOrgController', 'kpu-base-server', 'POST',
        '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 1452186486253289472, '2021-12-14 23:16:27',
        1452186486253289472, '2021-12-14 23:16:27');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707719, 1457620408604819456, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工-新增',
        '/base/baseEmployee', b'0', 1452186486253289472, '2021-12-14 23:16:27', 1452186486253289472,
        '2021-12-14 23:16:27');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707720, 1457620408604819456, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测手机号是否存在', '/system/defUser/checkMobile', b'0', 1452186486253289472, '2021-12-14 23:16:27',
        1452186486253289472, '2021-12-14 23:16:27');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707721, 1449738581135327232, 'BaseEmployeeController', 'kpu-base-server', 'POST',
        '员工-分页列表查询', '/base/baseEmployee/page', b'0', 1452186486253289472, '2021-12-14 23:31:16',
        1452186486253289472, '2021-12-14 23:31:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707722, 1449738581135327232, 'BasePositionController', 'kpu-base-server', 'POST', '岗位-批量查询',
        '/base/basePosition/query', b'0', 1452186486253289472, '2021-12-14 23:31:16', 1452186486253289472,
        '2021-12-14 23:31:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169176494046707723, 1449738581135327232, 'BaseOrgController', 'kpu-base-server', 'POST',
        '组织-按树结构查询地区', '/base/baseOrg/tree', b'0', 1452186486253289472, '2021-12-14 23:31:16',
        1452186486253289472, '2021-12-14 23:31:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374660, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测手机号是否存在', '/system/defUser/checkMobile', b'0', 1452186486253289472, '2021-12-15 16:44:28',
        1452186486253289472, '2021-12-15 16:44:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374661, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测用户名是否存在', '/system/defUser/checkUsername', b'0', 1452186486253289472, '2021-12-15 16:44:28',
        1452186486253289472, '2021-12-15 16:44:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374662, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测邮箱是否存在', '/system/defUser/checkEmail', b'0', 1452186486253289472, '2021-12-15 16:44:28',
        1452186486253289472, '2021-12-15 16:44:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374663, 1460542581971615744, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测身份证是否存在', '/system/defUser/checkIdCard', b'0', 1452186486253289472, '2021-12-15 16:44:28',
        1452186486253289472, '2021-12-15 16:44:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374665, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测手机号是否存在', '/system/defUser/checkMobile', b'0', 1452186486253289472, '2021-12-15 16:47:16',
        1452186486253289472, '2021-12-15 16:47:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374666, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测用户名是否存在', '/system/defUser/checkUsername', b'0', 1452186486253289472, '2021-12-15 16:47:16',
        1452186486253289472, '2021-12-15 16:47:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374667, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测邮箱是否存在', '/system/defUser/checkEmail', b'0', 1452186486253289472, '2021-12-15 16:47:16',
        1452186486253289472, '2021-12-15 16:47:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374668, 1460542629845401600, 'DefUserController', 'kpu-system-server', 'GET',
        '用户-检测身份证是否存在', '/system/defUser/checkIdCard', b'0', 1452186486253289472, '2021-12-15 16:47:16',
        1452186486253289472, '2021-12-15 16:47:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374673, 137848577387921420, 'DefApplicationController', 'kpu-system-server', 'DELETE', '应用-删除',
        '/system/defApplication', b'0', 1452186486253289472, '2021-12-15 17:01:38', 1452186486253289472,
        '2021-12-15 17:01:38');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374676, 1449724021556903936, 'DefDictItemController', 'kpu-system-server', 'GET',
        '字典项-检测字典项标识是否可用', '/system/defDictItem/check', b'0', 1452186486253289472, '2021-12-15 17:13:15',
        1452186486253289472, '2021-12-15 17:13:15');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374678, 1449724119569399808, 'DefDictItemController', 'kpu-system-server', 'GET',
        '字典项-检测字典项标识是否可用', '/system/defDictItem/check', b'0', 1452186486253289472, '2021-12-15 17:13:36',
        1452186486253289472, '2021-12-15 17:13:36');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374682, 1460547739937931264, 'DefParameterController', 'kpu-system-server', 'GET',
        '参数配置-检测参数键是否可用', '/system/defParameter/check', b'0', 1452186486253289472, '2021-12-15 17:16:37',
        1452186486253289472, '2021-12-15 17:16:37');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (169380096971374684, 1460547794912673792, 'DefParameterController', 'kpu-system-server', 'GET',
        '参数配置-检测参数键是否可用', '/system/defParameter/check', b'0', 1452186486253289472, '2021-12-15 17:16:55',
        1452186486253289472, '2021-12-15 17:16:55');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (172353511420329990, 172353511420329989, 'FileDefController', 'kpu-base-server', 'DELETE',
        '默认库-文件操作接口-删除', '/base/file/def', b'0', 1452186486253289472, '2021-12-23 11:19:09',
        1452186486253289472, '2021-12-23 11:19:09');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (199848844077301780, 199848844077301779, 'BaseEmployeeController', 'kpu-boot-server', 'POST',
        '员工-租户绑定或解绑用户', '/base/baseEmployee/invitationUser', b'0', 1452186486253289472,
        '2022-03-07 14:13:32', 1452186486253289472, '2022-03-07 14:13:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (199848844077301781, 199848844077301779, 'DefUserController', 'kpu-boot-server', 'POST',
        '用户-邀请员工进入企业前精确查询用户', '/system/defUser/queryUser', b'0', 1452186486253289472,
        '2022-03-07 14:13:32', 1452186486253289472, '2022-03-07 14:13:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504256, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-修改',
        '/system/defResource', b'0', 1452186486253289472, '2022-03-28 11:21:57', 1452186486253289472,
        '2022-03-28 11:21:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504257, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源路径是否可用', '/system/defResource/checkPath', b'0', 1452186486253289472, '2022-03-28 11:21:57',
        1452186486253289472, '2022-03-28 11:21:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504258, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源编码是否可用', '/system/defResource/check', b'0', 1452186486253289472, '2022-03-28 11:21:57',
        1452186486253289472, '2022-03-28 11:21:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504259, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET',
        '资源-检测资源名称是否可用', '/system/defResource/checkName', b'0', 1452186486253289472, '2022-03-28 11:21:57',
        1452186486253289472, '2022-03-28 11:21:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504260, 139702946697838592, 'DefResourceController', 'kpu-system-server', 'GET', '资源-单体查询',
        '/system/defResource/{id}', b'0', 1452186486253289472, '2022-03-28 11:21:57', 1452186486253289472,
        '2022-03-28 11:21:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504261, 139702946697838592, 'GeneratorController', 'kpu-gateway-server', 'GET',
        '查询在线服务的前缀', '/gateway/findOnlineService', b'0', 1452186486253289472, '2022-03-28 11:21:57',
        1452186486253289472, '2022-03-28 11:21:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207592996529504371, 207592996529504370, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-同步表的字段', '/generator/defGenTable/syncField', b'0', 1452186486253289472, '2022-03-28 11:47:13',
        1452186486253289472, '2022-03-28 11:47:13');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207644798130061313, 207644798130061312, 'DefGenTableController', 'kpu-generator-server', 'DELETE',
        '代码生成-删除', '/generator/defGenTable', b'0', 1452186486253289472, '2022-03-28 14:14:35',
        1452186486253289472, '2022-03-28 14:14:35');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207644798130061319, 207644798130061318, 'DefGenTableColumnController', 'kpu-generator-server', 'DELETE',
        '代码生成字段-删除', '/generator/defGenTableColumn', b'0', 1452186486253289472, '2022-03-28 14:20:22',
        1452186486253289472, '2022-03-28 14:20:22');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (207644798130061324, 207644798130061323, 'DefGenTableColumnController', 'kpu-generator-server', 'PUT',
        '代码生成字段-修改', '/generator/defGenTableColumn', b'0', 1452186486253289472, '2022-03-28 14:21:34',
        1452186486253289472, '2022-03-28 14:21:34');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197696, 198310764748996609, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-分页列表查询', '/generator/defGenTable/page', b'0', 1452186486253289472, '2022-04-11 13:54:00',
        1452186486253289472, '2022-04-11 13:54:00');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197697, 198310764748996609, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-查询单体详情', '/generator/defGenTable/detail', b'0', 1452186486253289472, '2022-04-11 13:54:00',
        1452186486253289472, '2022-04-11 13:54:00');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197704, 207592996529504364, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-导入检测', '/generator/defGenTable/importCheck', b'0', 1452186486253289472, '2022-04-11 14:20:56',
        1452186486253289472, '2022-04-11 14:20:56');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197705, 207592996529504364, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-导入表结构', '/generator/defGenTable/importTable', b'0', 1452186486253289472, '2022-04-11 14:20:56',
        1452186486253289472, '2022-04-11 14:20:56');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197706, 207592996529504364, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-分页查询代码生成表', '/generator/defGenTable/selectTableList', b'0', 1452186486253289472,
        '2022-04-11 14:20:56', 1452186486253289472, '2022-04-11 14:20:56');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197707, 207592996529504364, 'DefDatasourceConfigController', 'kpu-system-server', 'POST',
        '数据源-批量查询', '/system/defDatasourceConfig/query', b'0', 1452186486253289472, '2022-04-11 14:20:56',
        1452186486253289472, '2022-04-11 14:20:56');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197717, 207644798130061314, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-预览', '/generator/defGenTable/previewCode', b'0', 1452186486253289472, '2022-04-11 15:13:28',
        1452186486253289472, '2022-04-11 15:13:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197718, 207644798130061314, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-批量生成代码', '/generator/defGenTable/generatorCode', b'0', 1452186486253289472,
        '2022-04-11 15:13:28', 1452186486253289472, '2022-04-11 15:13:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (212844732215197719, 207644798130061314, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-批量下载代码', '/generator/defGenTable/downloadZip', b'0', 1452186486253289472, '2022-04-11 15:13:28',
        1452186486253289472, '2022-04-11 15:13:28');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (214351621490999296, 207644798130061325, 'DefGenTableColumnController', 'kpu-generator-server', 'POST',
        '代码生成字段-同步字段结构', '/generator/defGenTableColumn/syncField', b'0', 1452186486253289472,
        '2022-04-15 17:17:39', 1452186486253289472, '2022-04-15 17:17:39');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (219171794567823361, 219171794567823360, 'BaseRoleController', 'kpu-base-server', 'POST',
        '角色-分页查询员工的角色', '/base/baseRole/pageMyRole', b'0', 1452186486253289472, '2022-04-28 17:59:32',
        1452186486253289472, '2022-04-28 17:59:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (219171794567823362, 219171794567823360, 'BaseOrgController', 'kpu-base-server', 'GET', '组织-查询机构的角色',
        '/base/baseOrg/findOrgRoleByOrgId', b'0', 1452186486253289472, '2022-04-28 17:59:32', 1452186486253289472,
        '2022-04-28 17:59:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (219171794567823363, 219171794567823360, 'BaseOrgController', 'kpu-base-server', 'POST', '组织-给机构分配角色',
        '/base/baseOrg/orgRole', b'0', 1452186486253289472, '2022-04-28 17:59:32', 1452186486253289472,
        '2022-04-28 17:59:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (221743822848131075, 221743822848131074, 'DefDatasourceConfigController', 'kpu-system-server', 'POST',
        '数据源-新增', '/system/defDatasourceConfig', b'0', 1452186486253289472, '2022-05-05 16:05:50',
        1452186486253289472, '2022-05-05 16:05:50');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (221743822848131077, 221743822848131076, 'DefDatasourceConfigController', 'kpu-system-server', 'PUT',
        '数据源-修改', '/system/defDatasourceConfig', b'0', 1452186486253289472, '2022-05-05 16:07:00',
        1452186486253289472, '2022-05-05 16:07:00');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (221743822848131079, 221743822848131078, 'DefDatasourceConfigController', 'kpu-system-server', 'DELETE',
        '数据源-删除', '/system/defDatasourceConfig', b'0', 1452186486253289472, '2022-05-05 16:07:32',
        1452186486253289472, '2022-05-05 16:07:32');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (221743822848131081, 221743822848131080, 'DefDatasourceConfigController', 'kpu-system-server', 'POST',
        '数据源-测试数据库链接', '/system/defDatasourceConfig/testConnect', b'0', 1452186486253289472,
        '2022-05-05 16:07:58', 1452186486253289472, '2022-05-05 16:07:58');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (221743822848131082, 221743822848131072, 'DefDatasourceConfigController', 'kpu-system-server', 'POST',
        '数据源-分页列表查询', '/system/defDatasourceConfig/page', b'0', 1452186486253289472, '2022-05-05 16:08:17',
        1452186486253289472, '2022-05-05 16:08:17');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799442, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-查询单体详情', '/generator/defGenTable/detail', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799443, 201343651610099712, 'DefGenTableColumnController', 'kpu-generator-server', 'POST',
        '代码生成字段-分页列表查询', '/generator/defGenTableColumn/page', b'0', 1452186486253289472,
        '2022-06-16 20:41:02', 1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799444, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'PUT', '代码生成-修改',
        '/generator/defGenTable', b'0', 1452186486253289472, '2022-06-16 20:41:02', 1452186486253289472,
        '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799445, 201343651610099712, 'DefResourceController', 'kpu-system-server', 'POST',
        '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799446, 201343651610099712, 'DefApplicationController', 'kpu-system-server', 'POST',
        '应用-批量查询', '/system/defApplication/query', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799447, 201343651610099712, 'GeneratorController', 'system', 'GET', '查询在线服务',
        '/gateway/findOnlineService', b'1', 1452186486253289472, '2022-06-16 20:41:02', 1452186486253289472,
        '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799448, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-预览', '/generator/defGenTable/previewCode', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799449, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-批量生成代码', '/generator/defGenTable/generatorCode', b'0', 1452186486253289472,
        '2022-06-16 20:41:02', 1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799450, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-批量下载代码', '/generator/defGenTable/downloadZip', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799451, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-获取生成代码是否覆盖的默认配置', '/generator/defGenTable/getDefFileOverrideStrategy', b'0',
        1452186486253289472, '2022-06-16 20:41:02', 1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799452, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'GET',
        '代码生成-获取字段模板映射', '/generator/defGenTable/getFieldTemplate', b'0', 1452186486253289472,
        '2022-06-16 20:41:02', 1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799453, 201343651610099712, 'DefGenTableController', 'kpu-generator-server', 'POST',
        '代码生成-批量查询', '/generator/defGenTable/query', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (237425014733799454, 201343651610099712, 'DefGenTableController', 'kpu-boot-server-none', 'POST',
        '代码生成-批量查询', '/generator/defGenTable/findTableList', b'0', 1452186486253289472, '2022-06-16 20:41:02',
        1452186486253289472, '2022-06-16 20:41:02');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (242540067380264963, 242181583639937024, 'DefServerController', 'kpu-system-server', 'GET', '服务监控-server',
        '/system/defServer', b'0', 1452186486253289472, '2022-06-30 14:22:57', 1452186486253289472,
        '2022-06-30 14:22:57');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213194, 249954310509559809, 'DefInterfaceController', 'kpu-system-server', 'POST',
        '接口-分页列表查询', '/system/defInterface/page', b'0', 1452186486253289472, '2022-07-30 23:41:11',
        1452186486253289472, '2022-07-30 23:41:11');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213197, 250025856074776579, 'DefInterfaceController', 'kpu-system-server', 'DELETE', '接口-删除',
        '/system/defInterface', b'0', 1452186486253289472, '2022-07-30 23:44:00', 1452186486253289472,
        '2022-07-30 23:44:00');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213198, 249954310509559812, 'DefInterfacePropertyController', 'kpu-system-server', 'POST',
        '接口属性-保存', '/system/defInterfaceProperty/batchSave', b'0', 1452186486253289472, '2022-07-30 23:44:33',
        1452186486253289472, '2022-07-30 23:44:33');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213199, 249954310509559812, 'DefInterfacePropertyController', 'kpu-system-server', 'POST',
        '接口属性-分页列表查询', '/system/defInterfaceProperty/page', b'0', 1452186486253289472, '2022-07-30 23:44:33',
        1452186486253289472, '2022-07-30 23:44:33');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213202, 250025856074776580, 'ExtendInterfaceLogController', 'kpu-base-server', 'DELETE',
        '接口执行日志-删除', '/base/extendInterfaceLog', b'0', 1452186486253289472, '2022-07-30 23:46:48',
        1452186486253289472, '2022-07-30 23:46:48');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213203, 249954310509559813, 'ExtendInterfaceLoggingController', 'kpu-base-server', 'POST',
        '接口执行日志记录-分页列表查询', '/base/extendInterfaceLogging/page', b'0', 1452186486253289472,
        '2022-07-30 23:47:07', 1452186486253289472, '2022-07-30 23:47:07');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213204, 250025856074776581, 'ExtendInterfaceLoggingController', 'kpu-base-server', 'DELETE',
        '接口执行日志记录-删除', '/base/extendInterfaceLogging', b'0', 1452186486253289472, '2022-07-30 23:47:29',
        1452186486253289472, '2022-07-30 23:47:29');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213205, 249954310509559811, 'DefMsgTemplateController', 'kpu-system-server', 'POST',
        '消息模板-分页列表查询', '/system/defMsgTemplate/page', b'0', 1452186486253289472, '2022-07-30 23:47:54',
        1452186486253289472, '2022-07-30 23:47:54');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213208, 250025856074776584, 'DefMsgTemplateController', 'kpu-system-server', 'DELETE',
        '消息模板-删除', '/system/defMsgTemplate', b'0', 1452186486253289472, '2022-07-30 23:48:49',
        1452186486253289472, '2022-07-30 23:48:49');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213234, 250025856074776577, 'DefInterfaceController', 'kpu-system-server', 'PUT', '接口-修改',
        '/system/defInterface', b'0', 1452186486253289472, '2022-07-31 00:01:13', 1452186486253289472,
        '2022-07-31 00:01:13');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213235, 250025856074776577, 'DefInterfaceController', 'kpu-system-server', 'GET',
        '接口-检测资源编码是否可用', '/system/defInterface/check', b'0', 1452186486253289472, '2022-07-31 00:01:13',
        1452186486253289472, '2022-07-31 00:01:13');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213236, 250025856074776576, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-新增',
        '/system/defInterface', b'0', 1452186486253289472, '2022-07-31 00:01:34', 1452186486253289472,
        '2022-07-31 00:01:34');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213237, 250025856074776576, 'DefInterfaceController', 'kpu-system-server', 'GET',
        '接口-检测资源编码是否可用', '/system/defInterface/check', b'0', 1452186486253289472, '2022-07-31 00:01:34',
        1452186486253289472, '2022-07-31 00:01:34');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213238, 249954310509559810, 'ExtendInterfaceLogController', 'kpu-base-server', 'POST',
        '接口执行日志-分页列表查询', '/base/extendInterfaceLog/page', b'0', 1452186486253289472, '2022-07-31 00:02:14',
        1452186486253289472, '2022-07-31 00:02:14');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213239, 249954310509559810, 'DefTenantController', 'kpu-system-server', 'POST', '企业-批量查询',
        '/system/defTenant/query', b'0', 1452186486253289472, '2022-07-31 00:02:14', 1452186486253289472,
        '2022-07-31 00:02:14');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213240, 250025856074776582, 'DefMsgTemplateController', 'kpu-system-server', 'POST',
        '消息模板-新增', '/system/defMsgTemplate', b'0', 1452186486253289472, '2022-07-31 00:02:55',
        1452186486253289472, '2022-07-31 00:02:55');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213241, 250025856074776582, 'DefMsgTemplateController', 'kpu-system-server', 'GET',
        '消息模板-检测资源编码是否可用', '/system/defMsgTemplate/check', b'0', 1452186486253289472,
        '2022-07-31 00:02:55', 1452186486253289472, '2022-07-31 00:02:55');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213242, 250025856074776582, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-批量查询',
        '/system/defInterface/query', b'0', 1452186486253289472, '2022-07-31 00:02:55', 1452186486253289472,
        '2022-07-31 00:02:55');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213243, 250025856074776583, 'DefMsgTemplateController', 'kpu-system-server', 'PUT', '消息模板-修改',
        '/system/defMsgTemplate', b'0', 1452186486253289472, '2022-07-31 00:03:15', 1452186486253289472,
        '2022-07-31 00:03:15');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213244, 250025856074776583, 'DefInterfaceController', 'kpu-system-server', 'POST', '接口-批量查询',
        '/system/defInterface/query', b'0', 1452186486253289472, '2022-07-31 00:03:15', 1452186486253289472,
        '2022-07-31 00:03:15');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (253596752014213245, 250025856074776583, 'DefMsgTemplateController', 'kpu-system-server', 'GET',
        '消息模板-检测资源编码是否可用', '/system/defMsgTemplate/check', b'0', 1452186486253289472,
        '2022-07-31 00:03:15', 1452186486253289472, '2022-07-31 00:03:15');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (254523790640283653, 1460436856054218752, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-发布站内信',
        '/base/extendMsg/publish', b'0', 1452186486253289472, '2022-08-01 21:52:20', 1452186486253289472,
        '2022-08-01 21:52:20');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (254523790640283654, 1460436856054218752, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询消息中心',
        '/base/extendMsg/{id}', b'0', 1452186486253289472, '2022-08-01 21:52:20', 1452186486253289472,
        '2022-08-01 21:52:20');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (254523790640283655, 1460436856054218752, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询单体详情',
        '/base/extendMsg/detail', b'0', 1452186486253289472, '2022-08-01 21:52:20', 1452186486253289472,
        '2022-08-01 21:52:20');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (254523790640283656, 1460436934051495936, 'ExtendMsgController', 'kpu-base-server', 'DELETE', '消息-删除',
        '/base/extendMsg', b'0', 1452186486253289472, '2022-08-01 21:52:35', 1452186486253289472,
        '2022-08-01 21:52:35');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281886056620490966, 281886056620490965, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-移动资源',
        '/system/defResource/moveResource', b'0', 1452186486253289472, '2022-10-14 16:22:44', 1452186486253289472,
        '2022-10-14 16:22:44');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281886056620490967, 281886056620490965, 'DefResourceController', 'kpu-system-server', 'POST',
        '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 1452186486253289472, '2022-10-14 16:22:44',
        1452186486253289472, '2022-10-14 16:22:44');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281886056620490973, 281886056620490972, 'DefResourceController', 'kpu-system-server', 'PUT', '资源-移动资源',
        '/system/defResource/moveResource', b'0', 1452186486253289472, '2022-10-14 16:23:29', 1452186486253289472,
        '2022-10-14 16:23:29');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (281886056620490974, 281886056620490972, 'DefResourceController', 'kpu-system-server', 'POST',
        '资源-查询系统所有的资源', '/system/defResource/tree', b'0', 1452186486253289472, '2022-10-14 16:23:29',
        1452186486253289472, '2022-10-14 16:23:29');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (440245452193945601, 440245452193945600, 'DefMsgTemplateController', 'kpu-system-server', 'GET',
        '消息模板查询单体详情', '/system/defMsgTemplate/detail', b'0', 1452186486253289472, '2023-12-15 09:17:08',
        1452186486253289472, '2023-12-15 09:17:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (440245452193945602, 440245452193945600, 'ExtendMsgController', 'kpu-base-server', 'POST',
        '消息根据模板发送消息', '/base/extendMsg/sendByTemplate', b'0', 1452186486253289472, '2023-12-15 09:17:08',
        1452186486253289472, '2023-12-15 09:17:08');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (529783477227333636, 529783477227333635, 'DefUserController', 'kpu-system-server', 'POST', '用户踢人下线',
        '/system/defUser/onlineUsers/kickout', b'0', 2, '2024-08-12 16:20:22', 2, '2024-08-12 16:20:22');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (529783477227333638, 529783477227333637, 'DefUserController', 'kpu-system-server', 'POST', '用户强制注销',
        '/system/defUser/onlineUsers/logout', b'0', 2, '2024-08-12 16:20:53', 2, '2024-08-12 16:20:53');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576768, 206499429136465920, 'DefGenProjectController', 'kpu-generator-server', 'POST',
        '项目生成-生成项目', '/generator/defGenProject/generator', b'0', 2, '2025-05-10 13:14:19', 2,
        '2025-05-10 13:14:19');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576769, 206499429136465920, 'DefGenProjectController', 'kpu-generator-server', 'POST',
        '项目生成-获取默认配置', '/generator/defGenProject/getDef', b'0', 2, '2025-05-10 13:14:19', 2,
        '2025-05-10 13:14:19');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576770, 206499429136465920, 'DefGenProjectController', 'kpu-boot-server-none', 'POST',
        '项目生成-下载项目', '/generator/defGenProject/download', b'0', 2, '2025-05-10 13:14:19', 2,
        '2025-05-10 13:14:19');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576771, 529783477227333632, 'DefUserController', 'kpu-system-server', 'POST',
        '用户获取此 Session 绑定的 Token 签名列表 ', '/system/defUser/onlineUsers/getTokenSignList', b'0', 2,
        '2025-05-10 13:16:47', 2, '2025-05-10 13:16:47');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576772, 529783477227333632, 'DefUserController', 'kpu-system-server', 'POST', '用户获取在线人员',
        '/system/defUser/onlineUsers/page', b'0', 2, '2025-05-10 13:16:47', 2, '2025-05-10 13:16:47');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576775, 1449734707225821184, 'FileController', 'kpu-base-server', 'POST',
        '文件实时上传-分页列表查询', '/base/file/page', b'0', 2, '2025-05-10 13:25:53', 2, '2025-05-10 13:25:53');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576776, 1449734944434683904, 'BaseOperationLogController', 'kpu-base-server', 'POST',
        '操作日志-分页列表查询', '/base/baseOperationLog/page', b'0', 2, '2025-05-10 13:26:16', 2,
        '2025-05-10 13:26:16');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576777, 1449735103088427008, 'BaseLoginLogController', 'kpu-base-server', 'POST',
        '登录日志-分页列表查询', '/base/baseLoginLog/page', b'0', 2, '2025-05-10 13:26:39', 2, '2025-05-10 13:26:39');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576778, 1449734450995789824, 'DefApplicationController', 'kpu-system-server', 'GET',
        '应用-查询可用的应用资源列表', '/system/defApplication/findAvailableApplicationResourceList', b'0', 2,
        '2025-05-10 13:26:52', 2, '2025-05-10 13:26:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576779, 1449734450995789824, 'BaseRoleController', 'kpu-base-server', 'GET',
        '角色-查询角色拥有的资源id集合', '/base/baseRole/resourceList', b'0', 2, '2025-05-10 13:26:52', 2,
        '2025-05-10 13:26:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576780, 1449734450995789824, 'BaseRoleController', 'kpu-base-server', 'POST', '角色-分页列表查询',
        '/base/baseRole/page', b'0', 2, '2025-05-10 13:26:52', 2, '2025-05-10 13:26:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576781, 1449734450995789824, 'BaseRoleController', 'kpu-base-server', 'GET',
        '角色-查询角色拥有的数据权限ID', '/base/baseRole/findResourceDataScopeIdByRoleId', b'0', 2,
        '2025-05-10 13:26:52', 2, '2025-05-10 13:26:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576782, 1449734450995789824, 'DefApplicationController', 'kpu-system-server', 'GET',
        '应用-查询可用的应用数据权限列表', '/system/defApplication/findAvailableApplicationDataScopeList', b'0', 2,
        '2025-05-10 13:26:52', 2, '2025-05-10 13:26:52');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576783, 1449734007292952576, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-分页列表查询',
        '/base/extendMsg/page', b'0', 2, '2025-05-10 13:27:33', 2, '2025-05-10 13:27:33');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576784, 1449734007292952576, 'BaseEmployeeController', 'kpu-base-server', 'POST', '员工批量查询',
        '/base/baseEmployee/query', b'0', 2, '2025-05-10 13:27:33', 2, '2025-05-10 13:27:33');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576785, 1449734007292952576, 'BaseEmployeeController', 'kpu-base-server', 'POST',
        '员工根据Id批量查询', '/base/baseEmployee/findByIds', b'0', 2, '2025-05-10 13:27:33', 2, '2025-05-10 13:27:33');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576786, 1460436763976663040, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询消息中心',
        '/base/extendMsg/{id}', b'0', 2, '2025-05-10 13:27:42', 2, '2025-05-10 13:27:42');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576787, 1460436763976663040, 'ExtendMsgController', 'kpu-base-server', 'POST', '消息-发布站内信',
        '/base/extendMsg/publish', b'0', 2, '2025-05-10 13:27:42', 2, '2025-05-10 13:27:42');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576788, 1460436763976663040, 'ExtendMsgController', 'kpu-base-server', 'GET', '消息-查询单体详情',
        '/base/extendMsg/detail', b'0', 2, '2025-05-10 13:27:42', 2, '2025-05-10 13:27:42');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576789, 1460436763976663040, 'BaseEmployeeController', 'kpu-base-server', 'POST',
        '员工根据Id批量查询', '/base/baseEmployee/findByIds', b'0', 2, '2025-05-10 13:27:42', 2, '2025-05-10 13:27:42');
INSERT INTO `def_resource_api` (`id`, `resource_id`, `controller`, `spring_application_name`, `request_method`, `name`,
                                `uri`, `is_input`, `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (630298777244576790, 172353511420329984, 'FileDefController', 'kpu-base-server', 'POST',
        '默认库-文件操作接口-分页列表查询', '/base/file/def/page', b'0', 2, '2025-05-10 13:30:07', 2,
        '2025-05-10 13:30:07');
COMMIT;

-- ----------------------------
-- Table structure for def_user
-- ----------------------------
DROP TABLE IF EXISTS `def_user`;
CREATE TABLE `def_user`
(
    `id`                       bigint       NOT NULL COMMENT 'ID',
    `username`                 varchar(255) NOT NULL COMMENT '用户名;大小写数字下划线',
    `nick_name`                varchar(255) NOT NULL COMMENT '昵称',
    `email`                    varchar(255)          DEFAULT NULL COMMENT '邮箱',
    `mobile`                   varchar(11)           DEFAULT NULL COMMENT '手机;1开头11位纯数字',
    `id_card`                  varchar(18)           DEFAULT NULL COMMENT '身份证;15或18位',
    `wx_open_id`               varchar(255)          DEFAULT NULL COMMENT '微信OpenId',
    `dd_open_id`               varchar(255)          DEFAULT NULL COMMENT '钉钉OpenId',
    `readonly`                 bit(1)       NOT NULL DEFAULT b'0' COMMENT '内置;[0-否 1-是]',
    `nation`                   char(2)               DEFAULT '' COMMENT '民族;[01-汉族 99-其他]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.NATION)',
    `education`                char(2)               DEFAULT '' COMMENT '学历;[01-小学 02-中学 03-高中 04-专科 05-本科 06-硕士 07-博士 08-博士后 99-其他]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.EDUCATION)',
    `sex`                      char(1)               DEFAULT '1' COMMENT '性别;[1-男 2-女 3-未知]\n@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Global.SEX)',
    `state`                    bit(1)                DEFAULT b'1' COMMENT '状态;[0-禁用 1-启用]',
    `work_describe`            varchar(255)          DEFAULT '' COMMENT '工作描述',
    `password_error_last_time` datetime              DEFAULT NULL COMMENT '输错密码时间',
    `password_error_num`       int                   DEFAULT '0' COMMENT '密码错误次数',
    `password_expire_time`     datetime              DEFAULT NULL COMMENT '密码过期时间',
    `password`                 varchar(64)  NOT NULL DEFAULT '' COMMENT '密码',
    `salt`                     varchar(20)  NOT NULL DEFAULT '' COMMENT '密码盐',
    `last_login_time`          datetime              DEFAULT NULL COMMENT '最后登录时间',
    `created_by`               bigint                DEFAULT NULL COMMENT '创建人id',
    `created_time`             datetime              DEFAULT NULL COMMENT '创建时间',
    `updated_by`               bigint                DEFAULT NULL COMMENT '更新人id',
    `updated_time`             datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_user_username` (`username`) USING BTREE,
    UNIQUE KEY `uk_user_mobile` (`mobile`) USING BTREE,
    UNIQUE KEY `uk_user_email` (`email`) USING BTREE,
    UNIQUE KEY `uk_user_id_card` (`id_card`) USING BTREE
) ENGINE = InnoDB COMMENT ='用户';

-- ----------------------------
-- Records of def_user
-- ----------------------------
BEGIN;
INSERT INTO `def_user` (`id`, `username`, `nick_name`, `email`, `mobile`, `id_card`, `wx_open_id`, `dd_open_id`,
                        `readonly`, `nation`, `education`, `sex`, `state`, `work_describe`, `password_error_last_time`,
                        `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`,
                        `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1, 'superAdmin', '超管', NULL, '13000000000', NULL, NULL, NULL, b'0', '01', '02', '1', b'1', '', NULL, 0, NULL,
        'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU',
        '2025-03-28 06:00:04', 1, '2021-11-21 16:45:24', 1, '2021-11-21 16:45:24');
INSERT INTO `def_user` (`id`, `username`, `nick_name`, `email`, `mobile`, `id_card`, `wx_open_id`, `dd_open_id`,
                        `readonly`, `nation`, `education`, `sex`, `state`, `work_describe`, `password_error_last_time`,
                        `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`,
                        `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (2, 'admin', '内置超管', 'admin@qq.com', '15211111111', NULL, '1', '2', b'0', '01', '02', '1', b'1',
        '老子今天不上班，爽翻，巴适得板。', NULL, 0, NULL,
        'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU',
        '2025-05-10 16:26:33', 1, '2021-10-24 16:13:33', 2, '2025-05-10 14:37:07');
INSERT INTO `def_user` (`id`, `username`, `nick_name`, `email`, `mobile`, `id_card`, `wx_open_id`, `dd_open_id`,
                        `readonly`, `nation`, `education`, `sex`, `state`, `work_describe`, `password_error_last_time`,
                        `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`,
                        `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1454329823852756992, 'test1', '门店管理员', NULL, '15211111112', NULL, '', '', b'0', '02', '02', '1', b'1', '',
        NULL, 0, NULL, 'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU',
        '2021-11-16 23:22:58', 1, '2021-10-30 14:10:25', 1, '2021-11-22 13:14:04');
INSERT INTO `def_user` (`id`, `username`, `nick_name`, `email`, `mobile`, `id_card`, `wx_open_id`, `dd_open_id`,
                        `readonly`, `nation`, `education`, `sex`, `state`, `work_describe`, `password_error_last_time`,
                        `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`,
                        `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1457904455960756224, 'test2', '普通用户', NULL, '15211111113', NULL, '', '', b'0', '02', '06', '1', b'1', '',
        NULL, 0, NULL, 'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU',
        '2024-05-21 12:33:24', 1, '2021-11-09 10:54:44', 1, '2021-11-22 13:14:05');
INSERT INTO `def_user` (`id`, `username`, `nick_name`, `email`, `mobile`, `id_card`, `wx_open_id`, `dd_open_id`,
                        `readonly`, `nation`, `education`, `sex`, `state`, `work_describe`, `password_error_last_time`,
                        `password_error_num`, `password_expire_time`, `password`, `salt`, `last_login_time`,
                        `created_by`, `created_time`, `updated_by`, `updated_time`)
VALUES (1459157721822527488, 'test3', '测试号', NULL, '15211111114', NULL, '', '', b'0', '', NULL, '2', b'1', '', NULL,
        0, NULL, 'd3cf98806ab5ea6094bdfaa8d321b3e86142c7cd9032e333fb79eb8ab4f326aa', 'd0OAyArl0f0X9594rfQU',
        '2022-03-06 22:08:04', 1, '2021-11-12 21:54:45', 1, '2021-11-21 17:08:32');
COMMIT;

-- ----------------------------
-- Table structure for def_user_application
-- ----------------------------
DROP TABLE IF EXISTS `def_user_application`;
CREATE TABLE `def_user_application`
(
    `id`             bigint NOT NULL COMMENT 'ID',
    `user_id`        bigint NOT NULL COMMENT '所属用户ID',
    `application_id` bigint NOT NULL COMMENT '所属应用ID',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '最后更新人',
    `updated_time`   datetime DEFAULT NULL COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='用户的默认应用';

-- ----------------------------
-- Records of def_user_application
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for extend_interface_log
-- ----------------------------
DROP TABLE IF EXISTS `extend_interface_log`;
CREATE TABLE `extend_interface_log`
(
    `id`             bigint       NOT NULL,
    `interface_id`   bigint       NOT NULL COMMENT '接口ID;\n#extend_interface',
    `name`           varchar(255) NOT NULL COMMENT '接口名称',
    `success_count`  int      DEFAULT '0' COMMENT '成功次数',
    `fail_count`     int      DEFAULT '0' COMMENT '失败次数',
    `last_exec_time` datetime DEFAULT NULL COMMENT '最后执行时间',
    `created_time`   datetime DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint   DEFAULT NULL COMMENT '创建人',
    `updated_time`   datetime DEFAULT NULL COMMENT '修改时间',
    `updated_by`     bigint   DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UK_EIL_INTERFACE_ID` (`interface_id`) USING BTREE
) ENGINE = InnoDB COMMENT ='接口执行日志';

-- ----------------------------
-- Records of extend_interface_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for extend_interface_logging
-- ----------------------------
DROP TABLE IF EXISTS `extend_interface_logging`;
CREATE TABLE `extend_interface_logging`
(
    `id`           bigint   NOT NULL,
    `log_id`       bigint   NOT NULL COMMENT '接口日志ID;\n#extend_interface_log',
    `exec_time`    datetime NOT NULL COMMENT '执行时间',
    `status`       char(2)  DEFAULT '01' COMMENT '执行状态;[01-初始化 02-成功 03-失败]@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_INTERFACE_LOGGING_STATUS)',
    `params`       longtext COMMENT '请求参数',
    `result`       longtext COMMENT '接口返回',
    `error_msg`    longtext COMMENT '异常信息',
    `biz_id`       bigint   DEFAULT NULL COMMENT '业务ID',
    `created_time` datetime DEFAULT NULL COMMENT '创建时间',
    `created_by`   bigint   DEFAULT NULL COMMENT '创建人',
    `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
    `updated_by`   bigint   DEFAULT NULL COMMENT '修改人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='接口执行日志记录';

-- ----------------------------
-- Records of extend_interface_logging
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for extend_msg
-- ----------------------------
DROP TABLE IF EXISTS `extend_msg`;
CREATE TABLE `extend_msg`
(
    `id`             bigint NOT NULL COMMENT '短信记录ID',
    `template_code`  varchar(255) DEFAULT NULL COMMENT '消息模板;\n#extend_msg_template',
    `type`           char(2)      DEFAULT NULL COMMENT '消息类型;[01-短信 02-邮件 03-站内信];@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.MSG_TEMPLATE_TYPE)',
    `status`         varchar(10)  DEFAULT NULL COMMENT '执行状态;\n#TaskStatus{DRAFT:草稿;WAITING:等待执行;SUCCESS:执行成功;FAIL:执行失败}',
    `channel`        varchar(255) DEFAULT NULL COMMENT '发送渠道;\n#SourceType{APP:应用;SERVICE:服务}',
    `param`          text COMMENT '参数;需要封装为[{‘key’:‘‘,;’value’:‘‘}, {’key2’:‘‘, ’value2’:‘‘}]格式',
    `title`          varchar(255) DEFAULT NULL COMMENT '标题',
    `content`        longtext COMMENT '发送内容',
    `send_time`      datetime     DEFAULT NULL COMMENT '发送时间',
    `biz_id`         bigint       DEFAULT NULL COMMENT '业务ID',
    `biz_type`       varchar(255) DEFAULT NULL COMMENT '业务类型',
    `remind_mode`    char(2)      DEFAULT NULL COMMENT '提醒方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_REMIND_MODE)[01-待办 02-预警 03-提醒]',
    `author`         varchar(255) DEFAULT NULL COMMENT '发布人姓名',
    `created_by`     bigint       DEFAULT NULL COMMENT '创建人ID',
    `created_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `updated_by`     bigint       DEFAULT NULL COMMENT '最后修改人',
    `updated_time`   datetime     DEFAULT NULL COMMENT '最后修改时间',
    `created_org_id` bigint       DEFAULT NULL COMMENT '创建人所属机构',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `tempate_id_topic_content` (`template_code`, `title`) USING BTREE
) ENGINE = InnoDB COMMENT ='消息';

-- ----------------------------
-- Records of extend_msg
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for extend_msg_recipient
-- ----------------------------
DROP TABLE IF EXISTS `extend_msg_recipient`;
CREATE TABLE `extend_msg_recipient`
(
    `id`           bigint       NOT NULL COMMENT 'ID',
    `msg_id`       bigint       NOT NULL COMMENT '任务ID;\n#extend_msg',
    `recipient`    varchar(255) NOT NULL COMMENT '接收人;\n可能是手机号、邮箱、用户ID等',
    `ext`          varchar(255) DEFAULT NULL COMMENT '扩展信息',
    `created_by`   bigint       DEFAULT NULL COMMENT '创建人',
    `created_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `updated_by`   bigint       DEFAULT NULL COMMENT '最后修改人',
    `updated_time` datetime     DEFAULT NULL COMMENT '最后修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `task_id_tel_num` (`msg_id`, `recipient`) USING BTREE
) ENGINE = InnoDB COMMENT ='消息接收人';

-- ----------------------------
-- Records of extend_msg_recipient
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for extend_notice
-- ----------------------------
DROP TABLE IF EXISTS `extend_notice`;
CREATE TABLE `extend_notice`
(
    `id`             bigint  NOT NULL COMMENT 'ID',
    `msg_id`         bigint       DEFAULT NULL COMMENT '消息ID',
    `biz_id`         varchar(64)  DEFAULT NULL COMMENT '业务ID',
    `biz_type`       varchar(64)  DEFAULT NULL COMMENT '业务类型',
    `recipient_id`   bigint  NOT NULL COMMENT '接收人',
    `remind_mode`    char(2) NOT NULL COMMENT '提醒方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_REMIND_MODE)[01-待办 02-预警 03-提醒]',
    `title`          varchar(255) DEFAULT NULL COMMENT '标题',
    `content`        mediumtext COMMENT '内容',
    `author`         varchar(255) DEFAULT NULL COMMENT '发布人',
    `url`            varchar(255) DEFAULT NULL COMMENT '处理地址',
    `target_`        char(2)      DEFAULT NULL COMMENT '打开方式;@Echo(api = EchoApi.DICTIONARY_ITEM_FEIGN_CLASS, dictType = EchoDictType.Base.NOTICE_TARGET)[01-页面 02-弹窗 03-新开窗口]',
    `auto_read`      bit(1)       DEFAULT NULL COMMENT '自动已读',
    `handle_time`    datetime     DEFAULT NULL COMMENT '处理时间',
    `read_time`      datetime     DEFAULT NULL COMMENT '读取时间',
    `is_read`        bit(1)       DEFAULT b'0' COMMENT '是否已读',
    `is_handle`      bit(1)       DEFAULT b'0' COMMENT '是否处理',
    `created_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `created_by`     bigint       DEFAULT NULL COMMENT '创建人id',
    `updated_time`   datetime     DEFAULT NULL COMMENT '最后修改时间',
    `updated_by`     bigint       DEFAULT NULL COMMENT '最后修改人',
    `created_org_id` bigint       DEFAULT NULL COMMENT '所属组织',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='通知表';

-- ----------------------------
-- Records of extend_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT 'increment id',
    `branch_id`     bigint       NOT NULL COMMENT 'branch transaction id',
    `xid`           varchar(100) NOT NULL COMMENT 'global transaction id',
    `context`       varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
    `rollback_info` longblob     NOT NULL COMMENT 'rollback info',
    `log_status`    int          NOT NULL COMMENT '0:normal status,1:defense status',
    `log_created`   datetime(6)  NOT NULL COMMENT 'create datetime',
    `log_modified`  datetime(6)  NOT NULL COMMENT 'modify datetime',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3 COMMENT ='AT transaction mode undo table';

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for worker_node
-- ----------------------------
DROP TABLE IF EXISTS `worker_node`;
CREATE TABLE `worker_node`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT 'auto;increment id',
    `host_name`   varchar(64) NOT NULL COMMENT '主机名',
    `port`        varchar(64) NOT NULL COMMENT '端口',
    `type`        int         NOT NULL COMMENT '节点类型:;ACTUAL 或者 CONTAINER',
    `launch_date` date        NOT NULL COMMENT '上线日期',
    `modified`    timestamp   NULL DEFAULT NULL COMMENT '修改时间',
    `created`     timestamp   NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT ='DB;WorkerID Assigner for UID Generator';

-- ----------------------------
-- Records of worker_node
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
