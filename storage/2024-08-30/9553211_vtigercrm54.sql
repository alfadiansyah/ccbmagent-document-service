/*
 Navicat Premium Data Transfer

 Source Server         : 10.15.43.30 (CCBM DEV)
 Source Server Type    : MySQL
 Source Server Version : 50614 (5.6.14-log)
 Source Host           : 10.15.43.30:3306
 Source Schema         : vtigercrm54

 Target Server Type    : MySQL
 Target Server Version : 50614 (5.6.14-log)
 File Encoding         : 65001

 Date: 27/08/2024 10:56:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for PIC_hold
-- ----------------------------
DROP TABLE IF EXISTS `PIC_hold`;
CREATE TABLE `PIC_hold`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PIC` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUG` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for WaiveAF
-- ----------------------------
DROP TABLE IF EXISTS `WaiveAF`;
CREATE TABLE `WaiveAF`  (
  `No_kartu` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `No_Tiket` int(19) NULL DEFAULT NULL,
  `Tgl_Upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Sukses` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Flag_DWH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Severity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_Waive` bigint(20) NOT NULL AUTO_INCREMENT,
  `No_TicketCF` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JlhHari` int(11) NULL DEFAULT NULL,
  `Jenis_Kartu` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Nominal_AnnualFee` int(11) NULL DEFAULT NULL,
  `TglUploadMemo` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Waive`) USING BTREE,
  INDEX `NoKartu`(`No_kartu`) USING BTREE,
  INDEX `NoTiket`(`No_Tiket`) USING BTREE,
  INDEX `Flag`(`Sukses`) USING BTREE,
  INDEX `KartuTanggal`(`No_kartu`, `Tgl_Upload`) USING BTREE,
  INDEX `TglMemo`(`TglUploadMemo`) USING BTREE,
  INDEX `TiketCF`(`No_TicketCF`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 518590 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for WaiveAF_BackUp
-- ----------------------------
DROP TABLE IF EXISTS `WaiveAF_BackUp`;
CREATE TABLE `WaiveAF_BackUp`  (
  `No_kartu` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `No_Tiket` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tgl_Upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Sukses` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Flag_DWH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Severity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_Waive` bigint(20) NOT NULL AUTO_INCREMENT,
  `No_TicketCF` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JlhHari` int(11) NULL DEFAULT NULL,
  `Jenis_Kartu` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Nominal_AnnualFee` int(11) NULL DEFAULT NULL,
  `TglUploadMemo` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Waive`) USING BTREE,
  INDEX `NoKartu`(`No_kartu`) USING BTREE,
  INDEX `NoTiket`(`No_Tiket`) USING BTREE,
  INDEX `Flag`(`Sukses`) USING BTREE,
  INDEX `KartuTanggal`(`No_kartu`, `Tgl_Upload`) USING BTREE,
  INDEX `TglMemo`(`TglUploadMemo`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 145611 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assigment_history
-- ----------------------------
DROP TABLE IF EXISTS `assigment_history`;
CREATE TABLE `assigment_history`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ownerid` int(11) NOT NULL,
  `previous_id` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_group` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'owner itu group atau user',
  `start_date` datetime NOT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `id_user_login` int(11) NOT NULL DEFAULT 0,
  `user_name_login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7711531 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `noteid` int(11) NULL DEFAULT NULL,
  `ticketid` int(11) NULL DEFAULT NULL,
  `datetime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 359254 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for automation_sending_message
-- ----------------------------
DROP TABLE IF EXISTS `automation_sending_message`;
CREATE TABLE `automation_sending_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_wa_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_sms_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_fitur` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_action`(`action`) USING BTREE,
  INDEX `idx_send_wa_status`(`send_wa_status`) USING BTREE,
  INDEX `idx_send_sms_status`(`send_sms_status`) USING BTREE,
  INDEX `idx_flag_fitur`(`flag_fitur`) USING BTREE,
  INDEX `idx_ticketid`(`ticketid`) USING BTREE,
  INDEX `idx_ticket_no`(`ticket_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bincard
-- ----------------------------
DROP TABLE IF EXISTS `bincard`;
CREATE TABLE `bincard`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(176) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `brid` int(19) NOT NULL DEFAULT 0,
  `branch_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regional_id` int(19) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for callerid
-- ----------------------------
DROP TABLE IF EXISTS `callerid`;
CREATE TABLE `callerid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_from_cti` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `callerid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_on` datetime NULL DEFAULT NULL,
  `ip_detected` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 445322 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ccbm_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ccbm_ticket`;
CREATE TABLE `ccbm_ticket`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `severity` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `solution` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `version_id` int(11) NULL DEFAULT NULL,
  `hours` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_portal` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_644` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_658` date NULL DEFAULT NULL,
  `cf_659` decimal(15, 2) NULL DEFAULT NULL,
  `cf_660` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_663` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_666` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_667` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_701` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_704` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_705` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_706` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_707` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_708` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_709` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_713` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_714` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_715` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_717` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_718` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_720` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_721` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_722` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_723` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_725` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_726` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_727` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_729` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_730` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_731` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_733` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_734` decimal(21, 0) NULL DEFAULT NULL,
  `cf_735` date NULL DEFAULT NULL,
  `cf_736` date NULL DEFAULT NULL,
  `cf_737` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_738` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ccckategoripermasalahan
-- ----------------------------
DROP TABLE IF EXISTS `ccckategoripermasalahan`;
CREATE TABLE `ccckategoripermasalahan`  (
  `id` int(2) NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kategori_id` tinyint(4) NOT NULL,
  `vtiger_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clone_vtiger_activity
-- ----------------------------
DROP TABLE IF EXISTS `clone_vtiger_activity`;
CREATE TABLE `clone_vtiger_activity`  (
  `activityid` int(19) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `semodule` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activitytype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_start` date NOT NULL,
  `due_date` date NULL DEFAULT NULL,
  `time_start` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_end` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendnotification` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `duration_hours` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration_minutes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notime` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `visibility` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'all',
  `recurringtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activityid`) USING BTREE,
  INDEX `activity_activityid_subject_idx`(`activityid`, `subject`) USING BTREE,
  INDEX `activity_activitytype_date_start_idx`(`activitytype`, `date_start`) USING BTREE,
  INDEX `activity_date_start_due_date_idx`(`date_start`, `due_date`) USING BTREE,
  INDEX `activity_date_start_time_start_idx`(`date_start`, `time_start`) USING BTREE,
  INDEX `activity_eventstatus_idx`(`eventstatus`) USING BTREE,
  INDEX `activity_status_idx`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 728 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflow_activatedonce
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflow_activatedonce`;
CREATE TABLE `com_vtiger_workflow_activatedonce`  (
  `workflow_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`workflow_id`, `entity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflows
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflows`;
CREATE TABLE `com_vtiger_workflows`  (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `test` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `execution_condition` int(11) NOT NULL,
  `defaultworkflow` int(1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`workflow_id`) USING BTREE,
  UNIQUE INDEX `com_vtiger_workflows_idx`(`workflow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2750 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflows_seq
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflows_seq`;
CREATE TABLE `com_vtiger_workflows_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for com_vtiger_workflowtask_queue
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtask_queue`;
CREATE TABLE `com_vtiger_workflowtask_queue`  (
  `task_id` int(11) NULL DEFAULT NULL,
  `entity_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `do_after` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `com_vtiger_workflowtask_queue_idx`(`task_id`, `entity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflowtasks
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtasks`;
CREATE TABLE `com_vtiger_workflowtasks`  (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NULL DEFAULT NULL,
  `summary` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`task_id`) USING BTREE,
  UNIQUE INDEX `com_vtiger_workflowtasks_idx`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2751 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflowtasks_entitymethod
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtasks_entitymethod`;
CREATE TABLE `com_vtiger_workflowtasks_entitymethod`  (
  `workflowtasks_entitymethod_id` int(11) NOT NULL,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function_path` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`workflowtasks_entitymethod_id`) USING BTREE,
  UNIQUE INDEX `com_vtiger_workflowtasks_entitymethod_idx`(`workflowtasks_entitymethod_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflowtasks_entitymethod_seq
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtasks_entitymethod_seq`;
CREATE TABLE `com_vtiger_workflowtasks_entitymethod_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for com_vtiger_workflowtasks_seq
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtasks_seq`;
CREATE TABLE `com_vtiger_workflowtasks_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for com_vtiger_workflowtemplates
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtemplates`;
CREATE TABLE `com_vtiger_workflowtemplates`  (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for com_vtiger_workflowtemplates_seq
-- ----------------------------
DROP TABLE IF EXISTS `com_vtiger_workflowtemplates_seq`;
CREATE TABLE `com_vtiger_workflowtemplates_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for config_paperless_accessListButton
-- ----------------------------
DROP TABLE IF EXISTS `config_paperless_accessListButton`;
CREATE TABLE `config_paperless_accessListButton`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeWhiteList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Type : NIP / Role User',
  `dataWhitelist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Data White List',
  `createdDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for config_paperless_mapping_ccEmail
-- ----------------------------
DROP TABLE IF EXISTS `config_paperless_mapping_ccEmail`;
CREATE TABLE `config_paperless_mapping_ccEmail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAtasan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleAgent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdDate` datetime NULL DEFAULT NULL,
  `updatedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for config_paperless_profileAtasan
-- ----------------------------
DROP TABLE IF EXISTS `config_paperless_profileAtasan`;
CREATE TABLE `config_paperless_profileAtasan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `namaLengkap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdDate` datetime NULL DEFAULT NULL,
  `updatedDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for custom_customer_emoticon
-- ----------------------------
DROP TABLE IF EXISTS `custom_customer_emoticon`;
CREATE TABLE `custom_customer_emoticon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emoticon` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 296 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_privileges
-- ----------------------------
DROP TABLE IF EXISTS `custom_privileges`;
CREATE TABLE `custom_privileges`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `module_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `page_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'Tipe Page,misal: report all,report unit kerja dsb',
  `is_all_page` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `is_all_group` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1214 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_account_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `data_account_maintenance`;
CREATE TABLE `data_account_maintenance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `fldCurrentHomeAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeKota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewHomeAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewHomeAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowHomeAddr3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowHomeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowHomeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowHomePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaRelasi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr6` varchar(58) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNamaRelasi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewMailAddr` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewMailAddr2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewMailAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewMailAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewMailAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewMailAddr6` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOffice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOffice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOfficeAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOfficeAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOfficeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNowOfficePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpRmh` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpkantor` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoFax` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldOtherPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoTelpRmh` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoTelpkantor` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoFax` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewOtherPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoHp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaCH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNamaCH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldDataDOB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewDataDOB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldIdNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewIdNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaibu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNamaibu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturnAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturnAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturnAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturnAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturnAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturnAddr6` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturnAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturnAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturnAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturnAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturnAddr5` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturnAddr6` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaRelasiAddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldRelasiAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldRelasiAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldRelasiAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldRelasiAddr4` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldRelasiAddr5` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldRelasiAddr6` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNamaRelasiAddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewRelasiAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewRelasiAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewRelasiAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewRelasiAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewRelasiAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewRelasiAddr6` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr6` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldReturOfficeAddr7` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr6` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewReturOfficeAddr7` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custemail` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_cust_email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycledate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_statement` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewCycleDate` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewBillCode` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewBillType` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoKartuSupl1` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHpSupl1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoHpSupl1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoKartuSupl2` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHpSupl2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoHpSupl2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoKartuSupl3` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHpSupl3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoHpSupl3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoKartuSupl4` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHpSupl4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewNoHpSupl4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FILE_BUFFER_Pekerjaan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FILE_BUFFER_Jabatan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FILE_BUFFER_BidangUsaha` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FILE_BUFFER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewPekerjaan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewJabatan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNewBidangUsaha` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `ticket_id`) USING BTREE,
  INDEX `ticket_id`(`ticket_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 573152 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_sla_real
-- ----------------------------
DROP TABLE IF EXISTS `data_sla_real`;
CREATE TABLE `data_sla_real`  (
  `ticket_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sla` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_no`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_test_eod
-- ----------------------------
DROP TABLE IF EXISTS `data_test_eod`;
CREATE TABLE `data_test_eod`  (
  `timenow` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ticketid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ticket_no` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `inserted_date` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `no_kartu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sub_kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jenis_kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `smownerid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `assignedTo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custlname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `crdstatus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custaddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custcity` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custzip` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custmphone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `crdexpdte` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `acctdtopen` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custdob` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cycledate` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custsex` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custmom` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cc_limit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `custemail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date_maint` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `customer_number` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `issued_date` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `crdblk` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentHomeAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentHomeAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentHomeAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentHomeAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentHomeKota` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentHomePostCd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewHomeAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewHomeAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowHomeAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowHomeAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowHomeKota` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowHomePostCd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNamaRelasi` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentMailAddr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentMailAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentMailAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentMailAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentMailAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentMailAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ziprelnumber` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNamaRelasi` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewMailAddr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewMailAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewMailAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewMailAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewMailAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewMailAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOffice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOfficeAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOfficeAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOfficeAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOfficeAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOfficeKota` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldCurrentOfficePostCd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOffice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOfficeAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOfficeAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOfficeAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOfficeAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOfficeKota` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNowOfficePostCd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNoTelpRmh` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNoTelpkantor` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNoFax` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldOtherPhone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNoTelpRmh` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNoTelpkantor` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNoFax` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewOtherPhone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNoHp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNoHp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNamaCH` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNamaCH` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldDataDOB` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewDataDOB` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldIdNumber` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewIdNumber` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNamaibu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNamaibu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturnAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturnAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturnAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturnAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturnAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturnAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturnAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturnAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturnAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturnAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturnAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturnAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNamaRelasiAddr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldRelasiAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldRelasiAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldRelasiAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldRelasiAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldRelasiAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldRelasiAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewNamaRelasiAddr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewRelasiAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewRelasiAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewRelasiAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewRelasiAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewRelasiAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewRelasiAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldReturOfficeAddr7` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fldNewReturOfficeAddr7` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_to_drm_temp_testing
-- ----------------------------
DROP TABLE IF EXISTS `data_to_drm_temp_testing`;
CREATE TABLE `data_to_drm_temp_testing`  (
  `ticketNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kategori` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complain_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `statusTicket` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_kasus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_pelapor` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kanwil` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_to_drm_temp_testing_copy1
-- ----------------------------
DROP TABLE IF EXISTS `data_to_drm_temp_testing_copy1`;
CREATE TABLE `data_to_drm_temp_testing_copy1`  (
  `ticketNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kategori` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complain_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `statusTicket` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_kasus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_pelapor` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kanwil` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_to_drm_temp_testing_copy2
-- ----------------------------
DROP TABLE IF EXISTS `data_to_drm_temp_testing_copy2`;
CREATE TABLE `data_to_drm_temp_testing_copy2`  (
  `ticketNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kategori` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complain_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `statusTicket` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_kasus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_pelapor` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kanwil` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_to_drm_temp_testing_copy3
-- ----------------------------
DROP TABLE IF EXISTS `data_to_drm_temp_testing_copy3`;
CREATE TABLE `data_to_drm_temp_testing_copy3`  (
  `ticketNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kategori` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complain_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `statusTicket` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_kasus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_pelapor` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `kanwil` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for datapicklist
-- ----------------------------
DROP TABLE IF EXISTS `datapicklist`;
CREATE TABLE `datapicklist`  (
  `picklistvalueid` int(11) NULL DEFAULT NULL,
  `picklistid` int(11) NULL DEFAULT NULL,
  INDEX `picklistvalueid`(`picklistvalueid`) USING BTREE,
  INDEX `picklistid`(`picklistid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for email_attachment_new
-- ----------------------------
DROP TABLE IF EXISTS `email_attachment_new`;
CREATE TABLE `email_attachment_new`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recordid` int(100) NOT NULL,
  `nama_file` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for eskalasi_reffNo
-- ----------------------------
DROP TABLE IF EXISTS `eskalasi_reffNo`;
CREATE TABLE `eskalasi_reffNo`  (
  `nomor` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eskalasi_stadging_email
-- ----------------------------
DROP TABLE IF EXISTS `eskalasi_stadging_email`;
CREATE TABLE `eskalasi_stadging_email`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isi` mediumblob NULL,
  `status` tinyint(1) NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eskalasi_stadging_sms
-- ----------------------------
DROP TABLE IF EXISTS `eskalasi_stadging_sms`;
CREATE TABLE `eskalasi_stadging_sms`  (
  `hp` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isi` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for funding_account
-- ----------------------------
DROP TABLE IF EXISTS `funding_account`;
CREATE TABLE `funding_account`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CFACC` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CIF` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SNAM1` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFINSC` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACTYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTZIP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNTRY` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CITIZEN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IDTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTHD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTPLACE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DTEOPEN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACC_BAL` decimal(19, 2) NULL DEFAULT NULL,
  `MINBAL` decimal(19, 2) NULL DEFAULT NULL,
  `MAXBAL` decimal(19, 2) NULL DEFAULT NULL,
  `BRANCHID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BRANCHNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RELIGION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_STAT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MOTHERSNME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MAXMTD` decimal(19, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CFACC`(`CFACC`) USING BTREE,
  INDEX `CARD_NBR`(`CARD_NBR`) USING BTREE,
  INDEX `NAME`(`NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 664375 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for funding_account_temp
-- ----------------------------
DROP TABLE IF EXISTS `funding_account_temp`;
CREATE TABLE `funding_account_temp`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CFACC` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CIF` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SNAM1` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFINSC` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACTYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTZIP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNTRY` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CITIZEN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IDTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTHD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTPLACE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DTEOPEN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACC_BAL` decimal(19, 2) NULL DEFAULT NULL,
  `MINBAL` decimal(19, 2) NULL DEFAULT NULL,
  `MAXBAL` decimal(19, 2) NULL DEFAULT NULL,
  `BRANCHID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BRANCHNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RELIGION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUSTOMER_STAT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MOTHERSNME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MAXMTD` decimal(19, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `CFACC`(`CFACC`) USING BTREE,
  INDEX `CARD_NBR`(`CARD_NBR`) USING BTREE,
  INDEX `NAME`(`NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 655441 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for funding_card
-- ----------------------------
DROP TABLE IF EXISTS `funding_card`;
CREATE TABLE `funding_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MIS_DATE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARDD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CDSTAT` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SNAM1` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYP` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXMO` decimal(2, 0) NULL DEFAULT NULL,
  `EXYR` decimal(2, 0) NULL DEFAULT NULL,
  `ACTY1` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SHRTNM` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUNM1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUNM2` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LGCD` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACST1` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD2` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD3` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AD4` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PINO` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CTLN` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LGLID` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LGTYP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNTRY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CITIZEN` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RELIGION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTHD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTPLACE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BRANCHID` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BRANCHNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DTEOPEN` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MOTHERSNME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CARDD`(`CARDD`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 636956 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for history_vtiger_crmentity
-- ----------------------------
DROP TABLE IF EXISTS `history_vtiger_crmentity`;
CREATE TABLE `history_vtiger_crmentity`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `crmid`(`crmid`) USING BTREE,
  INDEX `smownerid_idx`(`smownerid`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`setype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_data_akses
-- ----------------------------
DROP TABLE IF EXISTS `log_data_akses`;
CREATE TABLE `log_data_akses`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_card` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tanggal_akses` datetime NULL DEFAULT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `session_id`(`session_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18837 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_ms_perubahandata
-- ----------------------------
DROP TABLE IF EXISTS `log_ms_perubahandata`;
CREATE TABLE `log_ms_perubahandata`  (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no_hp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_hp_new` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_send` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_ticket_syariah
-- ----------------------------
DROP TABLE IF EXISTS `log_ticket_syariah`;
CREATE TABLE `log_ticket_syariah`  (
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tokentrx',
  `createdtime` datetime NULL DEFAULT NULL,
  `ticket_no` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `sla` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mapping_fromweb
-- ----------------------------
DROP TABLE IF EXISTS `mapping_fromweb`;
CREATE TABLE `mapping_fromweb`  (
  `id_kasus` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kasus`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 904 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mega_ccbm_token_verify
-- ----------------------------
DROP TABLE IF EXISTS `mega_ccbm_token_verify`;
CREATE TABLE `mega_ccbm_token_verify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticketid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 571 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_current_one_obligor
-- ----------------------------
DROP TABLE IF EXISTS `mega_current_one_obligor`;
CREATE TABLE `mega_current_one_obligor`  (
  `ACCOUNT_NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `BI_COLLECTABILITY` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUCKET` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OUTSTANDING` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_NUMBER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_field
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_field`;
CREATE TABLE `mega_custom_field`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flyer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jumlah_poin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nominal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_nasabah` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_rek_tujuan` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_ahli_waris` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_ahli_waris` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_vonis` date NOT NULL,
  `jns_vonis` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_sms` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2885 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_field_cicilan
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_field_cicilan`;
CREATE TABLE `mega_custom_field_cicilan`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ticketid` int(20) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merchant_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txn_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inst_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interest` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prod_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txn_amount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenor` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenor_tertagih` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inst_amount` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mord_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_field_increase_limit
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_field_increase_limit`;
CREATE TABLE `mega_custom_field_increase_limit`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ticketid` int(20) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe` int(1) NULL DEFAULT NULL,
  `new_limit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `status_kirim` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3486 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_list_ticket_to_ams
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_list_ticket_to_ams`;
CREATE TABLE `mega_custom_list_ticket_to_ams`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_campaign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_to_ams` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticketid`(`ticketid`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  INDEX `flag_campaign`(`flag_campaign`) USING BTREE,
  INDEX `status_to_ams`(`status_to_ams`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_mutasi_unbilled_trx
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_mutasi_unbilled_trx`;
CREATE TABLE `mega_custom_mutasi_unbilled_trx`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NULL DEFAULT NULL,
  `ticket_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no_monitoring` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posting_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merchant_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mcc_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` decimal(20, 2) NULL DEFAULT NULL,
  `amount_idr` decimal(20, 2) NULL DEFAULT NULL,
  `auth_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_send_microsite` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 = Success\r\n2 = Failed\r\n3 = Unique Status',
  `date_send_microsite` datetime NULL DEFAULT NULL,
  `status_send_sms` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 = Success\r\n2 = Failed\r\n3 = Unique Status',
  `id_microsite` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date_send_sms` datetime NULL DEFAULT NULL,
  `status_send_drm` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 = Success\r\n2 = Failed\r\n3 = Unique Status',
  `date_send_drm` datetime NULL DEFAULT NULL,
  `status_send_drm_ticketmonitoring` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_send_drm_ticketmonitoring` datetime NULL DEFAULT NULL,
  `name_proccess` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticketid`(`ticketid`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  INDEX `name_proccess`(`name_proccess`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1007 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_paperless
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_paperless`;
CREATE TABLE `mega_custom_paperless`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_fitur` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_pengiriman` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'True or False (1 || 0)',
  `user_accept_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'True, False and Expired (1, 0, 2)',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username_user_send` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_tujuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_send_date` datetime NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 357 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_pendaftaran_pembatalan_mcs
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_pendaftaran_pembatalan_mcs`;
CREATE TABLE `mega_custom_pendaftaran_pembatalan_mcs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_kirim` int(1) NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status_kirim`(`status_kirim`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_priority_pass
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_priority_pass`;
CREATE TABLE `mega_custom_priority_pass`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_kirim` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_custom_reff_bifast
-- ----------------------------
DROP TABLE IF EXISTS `mega_custom_reff_bifast`;
CREATE TABLE `mega_custom_reff_bifast`  (
  `idReffBifast` int(20) NOT NULL AUTO_INCREMENT,
  `ticketid` int(19) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `namaNasabahTujuan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `noRekeningTujuan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `namaBankTujuan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaksiCode` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nominal` decimal(15, 2) NULL DEFAULT NULL,
  `trx_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_trx` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statusKirim` int(1) NULL DEFAULT NULL,
  `response_api_drm` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `flagTicket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idReffBifast`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 210 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mega_field_collection
-- ----------------------------
DROP TABLE IF EXISTS `mega_field_collection`;
CREATE TABLE `mega_field_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bucket` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `center_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tagging_nasabah` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_mapping_center_code
-- ----------------------------
DROP TABLE IF EXISTS `mega_mapping_center_code`;
CREATE TABLE `mega_mapping_center_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_number_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1264 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_pengajuan_supplement
-- ----------------------------
DROP TABLE IF EXISTS `mega_pengajuan_supplement`;
CREATE TABLE `mega_pengajuan_supplement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_basic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `data_supplement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `log_supplement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status_kirim` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_sms` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mega_users
-- ----------------------------
DROP TABLE IF EXISTS `mega_users`;
CREATE TABLE `mega_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nama` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mega_user_idx`(`user_name`) USING BTREE,
  INDEX `mega_password_idx`(`user_password`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_analisa
-- ----------------------------
DROP TABLE IF EXISTS `mk_analisa`;
CREATE TABLE `mk_analisa`  (
  `ticketid` int(19) NOT NULL,
  `produk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createdtime` datetime NOT NULL,
  `jenis_produk` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori_permasalahan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `penyebab_gangguan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `publikasi_negatif` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `detail` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rekomendasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe_pengaduan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `flag` int(19) NOT NULL DEFAULT 0,
  `penyelesaian_sengketa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `flag_system_pembayaran` int(19) NOT NULL,
  `closeddate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ticketid`) USING BTREE,
  UNIQUE INDEX `ticketid`(`ticketid`) USING BTREE,
  INDEX `produk`(`produk`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `jenis_produk`(`jenis_produk`) USING BTREE,
  INDEX `kategori_permasalahan`(`kategori_permasalahan`) USING BTREE,
  INDEX `penyebab_gangguan`(`penyebab_gangguan`) USING BTREE,
  INDEX `tipe_pengaduan`(`tipe_pengaduan`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_autoclosed_ticket
-- ----------------------------
DROP TABLE IF EXISTS `mk_autoclosed_ticket`;
CREATE TABLE `mk_autoclosed_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `severitiesid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kasusid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subkasusid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jeniskasusid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `update_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mk_complain_methods
-- ----------------------------
DROP TABLE IF EXISTS `mk_complain_methods`;
CREATE TABLE `mk_complain_methods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complain_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `groups`(`groups`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mk_detailjenispenyebab
-- ----------------------------
DROP TABLE IF EXISTS `mk_detailjenispenyebab`;
CREATE TABLE `mk_detailjenispenyebab`  (
  `detailjenispenyebabid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenispenyebabid` int(19) NOT NULL,
  PRIMARY KEY (`detailjenispenyebabid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1193 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_detailpenyebab
-- ----------------------------
DROP TABLE IF EXISTS `mk_detailpenyebab`;
CREATE TABLE `mk_detailpenyebab`  (
  `id` int(19) NOT NULL,
  `penyebab_gangguan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` int(19) NOT NULL,
  `detail_penyebab` int(19) NULL DEFAULT NULL,
  `detail_jenis` int(19) NULL DEFAULT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_divisi
-- ----------------------------
DROP TABLE IF EXISTS `mk_divisi`;
CREATE TABLE `mk_divisi`  (
  `divisiid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`divisiid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_divisi_hide
-- ----------------------------
DROP TABLE IF EXISTS `mk_divisi_hide`;
CREATE TABLE `mk_divisi_hide`  (
  `divisiid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`divisiid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_emailfraud
-- ----------------------------
DROP TABLE IF EXISTS `mk_emailfraud`;
CREATE TABLE `mk_emailfraud`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_exclude_user
-- ----------------------------
DROP TABLE IF EXISTS `mk_exclude_user`;
CREATE TABLE `mk_exclude_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_user`(`id_user`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mk_jaringanatm
-- ----------------------------
DROP TABLE IF EXISTS `mk_jaringanatm`;
CREATE TABLE `mk_jaringanatm`  (
  `jaringanatmid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`jaringanatmid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_jeniskasus
-- ----------------------------
DROP TABLE IF EXISTS `mk_jeniskasus`;
CREATE TABLE `mk_jeniskasus`  (
  `jeniskasusid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slabusiness` int(5) NOT NULL,
  `slatarget` int(5) NOT NULL,
  `subkasusid` int(19) NOT NULL,
  `kelompokkasusid` int(19) NOT NULL,
  `kasusid` int(19) NOT NULL,
  PRIMARY KEY (`jeniskasusid`) USING BTREE,
  INDEX `kss`(`kasusid`) USING BTREE,
  INDEX `sbkss`(`subkasusid`) USING BTREE,
  INDEX `sla1`(`slabusiness`) USING BTREE,
  INDEX `sla2`(`slatarget`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3794 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_jeniskasus_hide
-- ----------------------------
DROP TABLE IF EXISTS `mk_jeniskasus_hide`;
CREATE TABLE `mk_jeniskasus_hide`  (
  `jeniskasusid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`jeniskasusid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_jenispenyebab
-- ----------------------------
DROP TABLE IF EXISTS `mk_jenispenyebab`;
CREATE TABLE `mk_jenispenyebab`  (
  `jenispenyebabid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`jenispenyebabid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 53 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_kasus
-- ----------------------------
DROP TABLE IF EXISTS `mk_kasus`;
CREATE TABLE `mk_kasus`  (
  `kasusid` int(19) NOT NULL AUTO_INCREMENT,
  `kelompokkasusid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nbr` int(3) NOT NULL,
  PRIMARY KEY (`kasusid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_kasus_group
-- ----------------------------
DROP TABLE IF EXISTS `mk_kasus_group`;
CREATE TABLE `mk_kasus_group`  (
  `kasusid` int(11) NOT NULL,
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`kasusid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mk_kasus_hide
-- ----------------------------
DROP TABLE IF EXISTS `mk_kasus_hide`;
CREATE TABLE `mk_kasus_hide`  (
  `kasusid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kasusid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_kelompokkasus
-- ----------------------------
DROP TABLE IF EXISTS `mk_kelompokkasus`;
CREATE TABLE `mk_kelompokkasus`  (
  `kelompokkasusid` int(19) NOT NULL AUTO_INCREMENT,
  `tipekasusid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nbr` int(3) NOT NULL,
  PRIMARY KEY (`kelompokkasusid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_labelparameter
-- ----------------------------
DROP TABLE IF EXISTS `mk_labelparameter`;
CREATE TABLE `mk_labelparameter`  (
  `lblid` int(19) NOT NULL,
  `label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`lblid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_loganalisa
-- ----------------------------
DROP TABLE IF EXISTS `mk_loganalisa`;
CREATE TABLE `mk_loganalisa`  (
  `logid` int(19) NOT NULL AUTO_INCREMENT,
  `hk` int(19) NOT NULL,
  `ticketid` int(19) NOT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  UNIQUE INDEX `id_unique`(`ticketid`) USING BTREE,
  INDEX `hk`(`hk`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61986 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mk_lokasiatm
-- ----------------------------
DROP TABLE IF EXISTS `mk_lokasiatm`;
CREATE TABLE `mk_lokasiatm`  (
  `lokasiatmid` smallint(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`lokasiatmid`) USING BTREE,
  UNIQUE INDEX `name`(`nama`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_mapping_mail
-- ----------------------------
DROP TABLE IF EXISTS `mk_mapping_mail`;
CREATE TABLE `mk_mapping_mail`  (
  `kategori` int(19) NOT NULL,
  `sub_kategori` int(19) NOT NULL,
  `kasusid` int(19) NOT NULL,
  `jeniskasusid` int(19) NOT NULL,
  PRIMARY KEY (`sub_kategori`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mk_matauang
-- ----------------------------
DROP TABLE IF EXISTS `mk_matauang`;
CREATE TABLE `mk_matauang`  (
  `matauangid` int(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`matauangid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_namabank
-- ----------------------------
DROP TABLE IF EXISTS `mk_namabank`;
CREATE TABLE `mk_namabank`  (
  `namabankid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`namabankid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_parameter
-- ----------------------------
DROP TABLE IF EXISTS `mk_parameter`;
CREATE TABLE `mk_parameter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter_description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_parameteranalisa
-- ----------------------------
DROP TABLE IF EXISTS `mk_parameteranalisa`;
CREATE TABLE `mk_parameteranalisa`  (
  `parameteranalisaid` int(19) NOT NULL AUTO_INCREMENT,
  `sublblid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value` int(19) NOT NULL COMMENT 'link ke: kategori_permasalahan,penyebab_gangguan,publikasi_negatf,penyelesaian_sengketa',
  `parent` int(19) NULL DEFAULT 0,
  PRIMARY KEY (`parameteranalisaid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 106 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_parameteranalisaojk
-- ----------------------------
DROP TABLE IF EXISTS `mk_parameteranalisaojk`;
CREATE TABLE `mk_parameteranalisaojk`  (
  `parameteranalisaojkid` int(19) NOT NULL AUTO_INCREMENT,
  `sublblidd` int(19) NOT NULL,
  `namaa` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `valuee` int(19) NOT NULL COMMENT 'link ke: kategori_permasalahan,penyebab_gangguan,publikasi_negatf,penyelesaian_sengketa',
  `parentt` int(19) NULL DEFAULT 0,
  PRIMARY KEY (`parameteranalisaojkid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mk_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `mk_pembayaran`;
CREATE TABLE `mk_pembayaran`  (
  `pembayaranid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pembayaranid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_pic
-- ----------------------------
DROP TABLE IF EXISTS `mk_pic`;
CREATE TABLE `mk_pic`  (
  `picid` int(19) NOT NULL AUTO_INCREMENT,
  `divisiid` int(19) NOT NULL,
  `kelompokkasusid` int(19) NOT NULL,
  `kasusid` int(19) NOT NULL,
  `subkasusid` int(19) NOT NULL,
  `jeniskasusid` int(19) NOT NULL,
  `wkflid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`picid`) USING BTREE,
  INDEX `kss`(`kasusid`) USING BTREE,
  INDEX `sbkss`(`subkasusid`) USING BTREE,
  INDEX `jnskss`(`jeniskasusid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2750 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mk_subdivisi
-- ----------------------------
DROP TABLE IF EXISTS `mk_subdivisi`;
CREATE TABLE `mk_subdivisi`  (
  `subdivisiid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `divisiid` int(19) NOT NULL,
  `code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`subdivisiid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 142 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_subkasus
-- ----------------------------
DROP TABLE IF EXISTS `mk_subkasus`;
CREATE TABLE `mk_subkasus`  (
  `subkasusid` int(19) NOT NULL AUTO_INCREMENT,
  `kelompokkasusid` int(19) NOT NULL,
  `kasusid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`subkasusid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 806 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_subkasus_hide
-- ----------------------------
DROP TABLE IF EXISTS `mk_subkasus_hide`;
CREATE TABLE `mk_subkasus_hide`  (
  `subkasusid` int(19) NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`subkasusid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_sublabelparameter
-- ----------------------------
DROP TABLE IF EXISTS `mk_sublabelparameter`;
CREATE TABLE `mk_sublabelparameter`  (
  `sublblid` int(19) NOT NULL AUTO_INCREMENT,
  `lblid` int(19) NOT NULL,
  `namasub` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `link` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gambar` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`sublblid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_tipekasus
-- ----------------------------
DROP TABLE IF EXISTS `mk_tipekasus`;
CREATE TABLE `mk_tipekasus`  (
  `tipekasusid` int(19) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sublblid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`tipekasusid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mk_tweets
-- ----------------------------
DROP TABLE IF EXISTS `mk_tweets`;
CREATE TABLE `mk_tweets`  (
  `recld` int(11) NOT NULL AUTO_INCREMENT,
  `tweetid` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tweet` varchar(140) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tweetowner` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tweetdatecreated` datetime NOT NULL,
  `dateinserted` datetime NOT NULL,
  `createticket` tinyint(1) NOT NULL,
  `tweetcategory` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tweetstatus` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tweetnote` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`recld`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nasabah_tabungan
-- ----------------------------
DROP TABLE IF EXISTS `nasabah_tabungan`;
CREATE TABLE `nasabah_tabungan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cif` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_rekening` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_kartu` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alamat_lengkap` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kode_pos` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_lahir` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kelamin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_ibu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_identitas` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_buka` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_rekening` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_buka_rekening` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_nasabah` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_expired_card` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cif`(`cif`) USING BTREE,
  INDEX `no_rekening`(`no_rekening`) USING BTREE,
  INDEX `no_kartu`(`no_kartu`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `no_identitas`(`no_identitas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3172449 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nasabah_tabungan_temp
-- ----------------------------
DROP TABLE IF EXISTS `nasabah_tabungan_temp`;
CREATE TABLE `nasabah_tabungan_temp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cif` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_rekening` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_kartu` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alamat_lengkap` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kode_pos` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_lahir` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kelamin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_ibu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_identitas` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_buka` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_rekening` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_buka_rekening` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tipe_nasabah` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_expired_card` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cif`(`cif`) USING BTREE,
  INDEX `no_rekening`(`no_rekening`) USING BTREE,
  INDEX `no_kartu`(`no_kartu`) USING BTREE,
  INDEX `nama`(`nama`) USING BTREE,
  INDEX `no_identitas`(`no_identitas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for profil_risiko_bidang_usaha
-- ----------------------------
DROP TABLE IF EXISTS `profil_risiko_bidang_usaha`;
CREATE TABLE `profil_risiko_bidang_usaha`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Bidang Usaha',
  `risk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for profil_risiko_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `profil_risiko_jabatan`;
CREATE TABLE `profil_risiko_jabatan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Jabatan',
  `risk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for profil_risiko_pekerjaan
-- ----------------------------
DROP TABLE IF EXISTS `profil_risiko_pekerjaan`;
CREATE TABLE `profil_risiko_pekerjaan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `risk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qKasusEmail
-- ----------------------------
DROP TABLE IF EXISTS `qKasusEmail`;
CREATE TABLE `qKasusEmail`  (
  `nomor` bigint(21) NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `no_kartu` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `no_rek` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SLA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `assign_to` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qPicdev
-- ----------------------------
DROP TABLE IF EXISTS `qPicdev`;
CREATE TABLE `qPicdev`  (
  `jumlah` bigint(21) NOT NULL DEFAULT 0,
  `hp` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picid` int(10) UNSIGNED NULL DEFAULT NULL,
  `hp2` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hp3` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hp4` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for regional
-- ----------------------------
DROP TABLE IF EXISTS `regional`;
CREATE TABLE `regional`  (
  `regional_id` int(19) NOT NULL,
  `regional_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`regional_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scmcaccp
-- ----------------------------
DROP TABLE IF EXISTS `scmcaccp`;
CREATE TABLE `scmcaccp`  (
  `JULIAN_MIS_DATE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MIS_DATE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BANK_NBR` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PDT_NBR` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CUST_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COR_CUST_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_CYC` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BRANCH_NBR` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OPER_CODE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CHGOFF_IND` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_BIL` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PAY_DD_FLAG` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DD_BANK` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DD_ACC` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UP_PROD` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UP_ACC` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UP_EFFDTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_INTRODUCER` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_INTRODUCER_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_OPEN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_CLOSE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_WRTO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CI_FLAG_RTL` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_INT_RATE_RTL` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CI_FLAG_CASH` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_INT_RATE_CASH` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BLK_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_BLK_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PRV_BLK_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_PRVBLK_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_PRVBLK_CODE_END` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_1` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EFF1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EXP1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_2` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EFF2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EXP2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_3` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EFF3` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EXP3` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_4` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EFF4` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EXP4` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_5` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EFF5` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_EXP5` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_ACCR` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_ACCR_UNTIL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_PURCHASE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_CASH_ADV` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_AGED` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_DLQ` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_PRIOR_DLQ` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_ACTIVE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_PYMT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_CASH_PYMT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_RTL_PYMT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_CURR_CREDIT_LIMIT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_CREDIT_LIMIT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_STMT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_PRV_STMT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_PYMT_DUE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_HIGH_BAL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_RTN_CHQ` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_RATE_CHG_RTL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_RATE_CHG_CASH` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_TEMP_CRLIMIT_EFF` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_TEMP_CRLIMIT_EXP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TEMP_CRLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_CRLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_CRLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASHLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_HI_BALANCE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_RTN_CHQ` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_DB_DAYS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LATE_CHG_GENERATED` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_FIRST_NOTICE_SENT` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_SECOND_NOTICE_SENT` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_1_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_2_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_3_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_4_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_5_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_6_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_7_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_8_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_9_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_10_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_11_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_12_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_13_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_14_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_15_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_16_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_17_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_18_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_19_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_20_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_21_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_22_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_23_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_24_MNTH_AGO` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TOT_AMT_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CYC_DUE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_CYC_DUE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PAST_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_30DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_60DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_90DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_120DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_150DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_180DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_210DAYS_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PAST_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_30DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_60DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_90DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_120DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_150DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_180DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_210DAYS_DUE_CNTER` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_CYC_AGED` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_BAL_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_BAL_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_DB_PUR_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_DB_PUR_RTL` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_CR_PUR_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_CR_PUR_RTL` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_DB_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_DB_RTL` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_CR_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_CR_RTL` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_PYMT_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_PYMT_REV_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BILLED_CR_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_PURCHASES` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_INT_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_SVC_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_MSCF_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_INS_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_MJ_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BAL_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_INT_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_SVC_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_MSCF_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_INS_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_MEMBJOIN_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DISPUTE_BAL_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_DISPUTE_BAL_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_INT_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_UNPDINT_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_UNPDSVC_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_UNPDMSF_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_UNPDINS_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_MEMBJOIN_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_ACCR_INT_RTL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ACCR_INT_RTL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLY_CTD_ACCR_INT_RTL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLY_STM_ACCR_INT_RTL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DAILY_ACCR_INT_RTL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_STMT_RTL_BAL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_STMT_RTL_DAYS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_CTD_RTL_BAL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_CTD_RTL_DAYS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_BAL_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_BAL_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_DB_ADV_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_DB_ADV_CASH` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_CR_ADV_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_CR_ADV_CASH` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_DB_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_DB_CASH` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_CR_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NBR_CR_CASH` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_PYMT_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_PYMT_REV_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BILLED_CR_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_CASH_ADV` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_INT_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_SVC_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BAL_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_INT_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_SVC_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DISPUTE_BAL_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_DISPUTE_BAL_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_INT_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_UNPDINT_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_STMT_UNPDSVC_CASH` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_ACCR_INT_CASH` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ACCR_INT_CASH` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLY_CTD_ACCR_INT_CASH` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLY_STM_ACCR_INT_CASH` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DAILY_ACCR_INT_CASH` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_STMT_CASH_BAL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_STMT_CASH_DAYS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_CTD_CASH_BAL` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCUM_CTD_CASH_DAYS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_BAL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TOTAL_DAILY_ACCR_INT` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DAILY_OVERLIMIT_AMT` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACCR_OVERLIMIT` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DAILY_OLMT_PER_DIEM` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AGGR_OLMT_AMT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TOTAL_AMT_DISPUTE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TOTAL_NBR_DISPUTE` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_CHGOFF_RTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AMT_CHGOFF_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_PYMT_AMT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CONV_BAL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_DEBIT_AMT` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LST_PURCHASE_AMT` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LAST_ADVANCE_AMT` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_AUTH_BAL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_AUTH_NBR` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_PYMT_TDY` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OTHER_PYMT_TDY` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_CREDIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_OUTSTD_AUTH_BAL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_OUTSTD_AUTH_NBR` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_AUTH_AMT_TDY` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_CASH` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_GRACE_DAYS` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OL_AMT_BILLED` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OVERPAY_AMT` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CARD_RNWAL_MESG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ODD_DOLLAR` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLY_CREDIT_INT_ACCR` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CREDIT_INT_ACCR` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CREDIT_AGGR_BAL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CREDIT_AGGR_DAYS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BPS_JOIN_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BPS_END_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PRIOR_YR_BP` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_YTD_BP_STMT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BP_ADD` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BP_DED` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MTD_BP_ADD` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MTD_BP_DED` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MTD_BP_MDB` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_COLL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_COLL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_INTO_COLL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_RSN_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_CLASS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_HST_CODE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_BLK_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_BALANCE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_TOT_AMT_DUE` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_OL_AMT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_OL_PERCENT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_COLL_RST_BAL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DD_AMT_IND` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MGM_GEN_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MGM_PRV_COUNT` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MGM_CUR_COUNT` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UTL_GEN_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UTLT_PRV_COUNT` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UTLT_CUR_COUNT` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UTLS_PRV_SPEND` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UTLS_CUR_SPEND` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BP_EXP_DTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_BP_CUR_DED` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MTD_BP_CUR_DED` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_MTD_BP_CUR_MDB` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_LAST_BP_EXP_DTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_INSTL_LMT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_INSTL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_INSTL_BAL` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_INSTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_AMT_INSTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPAID_BILL_INSTL_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_UNPD_BIL_STD_INS_RTL` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STDALN_INST` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVL_STDALN_INSR` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_STDALN` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CTD_AMT_STDALN` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ACP` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DELAY_LATE_PYMT_GEN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DELAY_LATE_PYMT_DTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_YTD_SPEND` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PRV_YTD_SPEND` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_NODE_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PAYM_SKIP_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PAYM_SKIP_EXP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ADDR_FLG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_ESTMT_FLG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CARD_DLVRY_FLG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_SHIELD` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EFF_DTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EXP_DTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASA_ACCT_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_GUARANTEE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_RECURRING_PGM` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DATE_MAINT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_USER_MAINT` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TIME_MAINT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_FILE_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scmcardp
-- ----------------------------
DROP TABLE IF EXISTS `scmcardp`;
CREATE TABLE `scmcardp`  (
  `JULIAN_MIS_DATE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MIS_DATE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_BANK_NBR` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_PDT_NBR` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_ACCT_NBR` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SHORT_NAME` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_CUST_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SUP_REL` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_COM_BIL` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_CHGOFF_IND` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_USR_DTA` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_OPEN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_CLOSE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_WARN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_MEMB` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_WRTO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER3` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LAST_ST_CHG` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME1` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ1` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR_OUT1` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC1` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_LSTREQ1` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME2` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ2` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR_OUT2` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC2` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_LSTREQ2` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME3` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ3` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR_OUT3` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC3` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ3` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_LSTREQ3` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME4` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ4` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NBR_OUT4` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC4` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ4` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_LSTREQ4` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_TERM` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EXP_DATE` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_LAST_EXP_DATE` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_MEMB_FEE_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_JOIN_FEE_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_LST_ACT_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_BLK_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_BLK_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_PRV_BLK_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_PRVBLK_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_PRVBLK_CODE_END` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_AUTH_USG_LMTCDE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_WAIVE_MEMB_FEE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_WAIVE_JOIN_FEE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_WAIVE_SVC_FEE` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NEW_NBR` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NEW_NBR_EFFDTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_ORG_NBR` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_ORG_NBR_EFFDTE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_BPS` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_FORMAT_ID` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_BANK_ACCOUNT_1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_BANK_ACCOUNT_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_ATM_LANGUAGE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_PHOTO_IND` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SPRT_LIMIT` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SUPP_PERM_CRLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SUPP_PERM_CSHLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SUPP_TEMP_CRLIMIT` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SUPP_TEMP_CRLIMIT_EFF` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_SUPP_TEMP_CRLIMIT_EXP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_NODE_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_CLOSE_REASON` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_FILE_BUFFER` varchar(68) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_APPL_NBR` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_APPL_SRC_CD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_REL_TO_BASIC` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_PIN_GEN_IND` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_PRIORITY_PASS_IND` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_FEE_CD` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_PIN_OFFSET` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DATE_MAINT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_USER_MAINT` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_TIME_MAINT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_FILE_DATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for segmen_produk
-- ----------------------------
DROP TABLE IF EXISTS `segmen_produk`;
CREATE TABLE `segmen_produk`  (
  `kode_produk` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bin_card` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_produk` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inisial` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `segmen` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_content
-- ----------------------------
DROP TABLE IF EXISTS `sms_content`;
CREATE TABLE `sms_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'nok',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95106 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_pic
-- ----------------------------
DROP TABLE IF EXISTS `sms_pic`;
CREATE TABLE `sms_pic`  (
  `picid` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hp` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hp2` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hp3` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hp4` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`picid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_pic_bak
-- ----------------------------
DROP TABLE IF EXISTS `sms_pic_bak`;
CREATE TABLE `sms_pic_bak`  (
  `picid` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hp` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hp2` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hp3` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hp4` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`picid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_pic_dev
-- ----------------------------
DROP TABLE IF EXISTS `sms_pic_dev`;
CREATE TABLE `sms_pic_dev`  (
  `picid` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hp` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hp2` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`picid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_reff_seq
-- ----------------------------
DROP TABLE IF EXISTS `sms_reff_seq`;
CREATE TABLE `sms_reff_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for sms_reg_assign_to
-- ----------------------------
DROP TABLE IF EXISTS `sms_reg_assign_to`;
CREATE TABLE `sms_reg_assign_to`  (
  `id` int(10) UNSIGNED NOT NULL,
  `rolename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picid` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_reg_assign_to_bak
-- ----------------------------
DROP TABLE IF EXISTS `sms_reg_assign_to_bak`;
CREATE TABLE `sms_reg_assign_to_bak`  (
  `id` int(10) UNSIGNED NOT NULL,
  `rolename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picid` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_registerkasus
-- ----------------------------
DROP TABLE IF EXISTS `sms_registerkasus`;
CREATE TABLE `sms_registerkasus`  (
  `id` int(10) UNSIGNED NOT NULL,
  `kasus_utama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picid` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_reminder
-- ----------------------------
DROP TABLE IF EXISTS `sms_reminder`;
CREATE TABLE `sms_reminder`  (
  `ticketid` int(11) NOT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_nasabah` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `waktu_pengiriman` date NULL DEFAULT NULL,
  `waktu_terkirim` datetime NULL DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`ticketid`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  INDEX `waktu_pengiriman`(`waktu_pengiriman`) USING BTREE,
  INDEX `waktu_terkirim`(`waktu_terkirim`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sosmed_ticket
-- ----------------------------
DROP TABLE IF EXISTS `sosmed_ticket`;
CREATE TABLE `sosmed_ticket`  (
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tokentrx',
  `createdtime` datetime NULL DEFAULT NULL,
  `ticket_no` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `sla` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`token`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  INDEX `creator`(`creator`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage_data_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `stage_data_maintenance`;
CREATE TABLE `stage_data_maintenance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `ticket_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `next_update_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tipe_kasus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6026 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for staging_detail_report
-- ----------------------------
DROP TABLE IF EXISTS `staging_detail_report`;
CREATE TABLE `staging_detail_report`  (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_nasabah` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no_kartu` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_rek` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kasus_utama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nama_pelapor` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cabang_pelapor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tanggalkejadian` datetime NULL DEFAULT NULL,
  `nominal` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tanggal_closedby_divisi` datetime NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comments` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `slatarget` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sla_internal` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `pic_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `grup_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `severity` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `history_assigment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime NULL DEFAULT NULL,
  `tgl_closed` datetime NULL DEFAULT NULL,
  `total_sla` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for staging_detail_transaction
-- ----------------------------
DROP TABLE IF EXISTS `staging_detail_transaction`;
CREATE TABLE `staging_detail_transaction`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `severity` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `solution` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `version_id` int(11) NULL DEFAULT NULL,
  `hours` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_portal` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_644` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_658` date NULL DEFAULT NULL,
  `cf_659` decimal(15, 2) NULL DEFAULT NULL,
  `cf_660` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_663` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_666` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_667` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_701` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_704` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_705` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_706` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_707` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_708` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_709` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_713` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_714` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_715` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_717` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_718` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_720` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_721` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_722` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_723` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_725` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_726` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_727` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_729` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_730` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_731` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_733` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_734` decimal(21, 0) NULL DEFAULT NULL,
  `cf_735` date NULL DEFAULT NULL,
  `cf_736` date NULL DEFAULT NULL,
  `cf_737` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_738` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-',
  `ticketid` int(19) NOT NULL DEFAULT 1,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`smownerid`, `setype`) USING BTREE,
  INDEX `cf_720`(`cf_720`) USING BTREE,
  INDEX `cf_731`(`cf_731`) USING BTREE,
  INDEX `cf_644`(`cf_644`) USING BTREE,
  INDEX `cf_663`(`cf_663`) USING BTREE,
  INDEX `cf_701`(`cf_701`) USING BTREE,
  INDEX `severity`(`severity`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for syariah_stage_cardinfo
-- ----------------------------
DROP TABLE IF EXISTS `syariah_stage_cardinfo`;
CREATE TABLE `syariah_stage_cardinfo`  (
  `crdnbr` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `custlname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custaddr1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custcity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custzip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custdob` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custsex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misdate` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custnbr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdacct` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custidnbr` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_nbr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maintenance_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdexpdte` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycledate` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctoutbal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctdtopen` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctcrlmt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdblk` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdpdtnbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friendliness` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'smiley',
  `date_maint` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr1` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr2` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeKota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaRelasi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr6` varchar(58) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOffice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr1` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpRmh` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpkantor` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoFax` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldOtherPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaCH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldDataDOB` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldIdNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaibu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sup_rel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cif` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acct_blk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_flag` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `issued_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_statement` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldPhoneRelasi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_employee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autopay_ind` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pin_gen` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ori_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BRANCH_NBR` int(5) NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_STMT` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CARD_DLVRY_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ADDR_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ1` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ2` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ3` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ4` int(1) NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ1` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ2` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ3` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ4` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_BLK_CODE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_1` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_2` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_3` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_4` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_5` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_CREDIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_1_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_2_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_3_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_4_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_5_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_6_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_7_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER1` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME1` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC1` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TEMP_CRLIMIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_CYC_DUE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_BAL_CASH` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_OUTSTD_AUTH_BAL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_INSTL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_SHIELD` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EFF_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EXP_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_PERIOD` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_MARITAL_ST` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_NATIONALITY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OCC_PER` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_ANN_SALARY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OTH_INCOME` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GRLNSHIP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_CITY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_ZIPCODE` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GMARITAL_ST` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GID_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_PLC_BIRTH` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FAMILY_SIZE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_TITLE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`crdnbr`) USING BTREE,
  INDEX `crdacct`(`crdacct`) USING BTREE,
  INDEX `custmphone`(`custmphone`) USING BTREE,
  INDEX `custlname`(`custlname`) USING BTREE,
  INDEX `crdpdtnbr`(`crdpdtnbr`) USING BTREE,
  INDEX `custemail`(`custemail`) USING BTREE,
  INDEX `custmom`(`custmom`) USING BTREE,
  INDEX `crdstatus`(`crdstatus`) USING BTREE,
  INDEX `cif`(`cif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_acctmaintenancetemp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_acctmaintenancetemp`;
CREATE TABLE `tbl_acctmaintenancetemp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tanggalLapor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrCity` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrZip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_City` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Zip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_CurrTelHom` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_TelHom` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_CurrTelOff` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_TelOff` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_CurrTelFax` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_TelFax` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_CurrTelOth` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form1_TelOth` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form2_CurrTelMob` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form2_TelMob` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_CurrCustName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_CustName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_CurrIDNbr` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_IDNbr` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_CurrDOB` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_DOB` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_CurrMomName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form6_MomName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardNum` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custNumber` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jnsLaporan` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subJnsLaporan` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flagCCBM` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memoCCBM` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentCCBM` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Form3_CurrAddr1_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr2_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr3_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrAddr4_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr1_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr2_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr3_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Addr4_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrCity_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_CurrZip_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_City_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form3_Zip_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardDtOpen` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrRelationName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_RelationName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrOfficeName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_OfficeName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrCity` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrZip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_City` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Zip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrCity` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr1` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr2` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr3` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr4` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_City` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Zip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrRelationName_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr1_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr2_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr3_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrAddr4_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrCity_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrZip_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_RelationName_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr1_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr2_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr3_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Addr4_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_City_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_Zip_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrOfficeName_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr1_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr2_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr3_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrAddr4_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrCity_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_CurrZip_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_OfficeName_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr1_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr2_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr3_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Addr4_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_City_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form4_Zip_retur` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Form5_CurrZip` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tanggalLahir` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardLimit` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardBlocked` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignedTo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_acctmaintenancetemp_old
-- ----------------------------
DROP TABLE IF EXISTS `tbl_acctmaintenancetemp_old`;
CREATE TABLE `tbl_acctmaintenancetemp_old`  (
  `ticketNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jnsLaporan` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `subJnsLaporan` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tanggalLapor` date NULL DEFAULT NULL,
  INDEX `ticketNo`(`ticketNo`) USING BTREE,
  INDEX `tanggalLapor`(`tanggalLapor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for tbl_direktorat
-- ----------------------------
DROP TABLE IF EXISTS `tbl_direktorat`;
CREATE TABLE `tbl_direktorat`  (
  `kode_direktorat` int(11) NOT NULL,
  `nama_direktorat` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_direktorat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_fungsi
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fungsi`;
CREATE TABLE `tbl_fungsi`  (
  `kode_fungsi` int(11) NOT NULL,
  `nama_fungsi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_fungsi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_gedung
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gedung`;
CREATE TABLE `tbl_gedung`  (
  `kode_gedung` int(11) NOT NULL,
  `nama_gedung` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_gedung`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_keluhan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_keluhan`;
CREATE TABLE `tbl_keluhan`  (
  `no_tiket` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `pegawai` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agen` int(11) NOT NULL,
  `teknisi` int(11) NULL DEFAULT NULL,
  `gedung` int(11) NOT NULL,
  `lantai` int(11) NOT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Proses','Selesai') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Proses',
  PRIMARY KEY (`no_tiket`) USING BTREE,
  INDEX `pegawai`(`pegawai`, `agen`, `teknisi`, `gedung`) USING BTREE,
  INDEX `gedung`(`gedung`) USING BTREE,
  INDEX `lantai`(`lantai`) USING BTREE,
  INDEX `agen`(`agen`) USING BTREE,
  INDEX `teknisi`(`teknisi`) USING BTREE,
  CONSTRAINT `tbl_keluhan_ibfk_1` FOREIGN KEY (`gedung`) REFERENCES `tbl_gedung` (`kode_gedung`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_keluhan_ibfk_3` FOREIGN KEY (`lantai`) REFERENCES `tbl_lantai` (`kode_lantai`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_keluhan_ibfk_4` FOREIGN KEY (`agen`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_keluhan_ibfk_5` FOREIGN KEY (`teknisi`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_keluhan_ibfk_6` FOREIGN KEY (`pegawai`) REFERENCES `tbl_pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_lantai
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lantai`;
CREATE TABLE `tbl_lantai`  (
  `kode_lantai` int(11) NOT NULL,
  `nama_lantai` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_lantai`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pegawai`;
CREATE TABLE `tbl_pegawai`  (
  `nip` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pegawai` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telepon` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fungsi` int(11) NOT NULL,
  `direktorat` int(11) NOT NULL,
  PRIMARY KEY (`nip`) USING BTREE,
  INDEX `fungsi`(`fungsi`, `direktorat`) USING BTREE,
  INDEX `direktorat`(`direktorat`) USING BTREE,
  CONSTRAINT `tbl_pegawai_ibfk_1` FOREIGN KEY (`fungsi`) REFERENCES `tbl_fungsi` (`kode_fungsi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_pegawai_ibfk_2` FOREIGN KEY (`direktorat`) REFERENCES `tbl_direktorat` (`kode_direktorat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nip` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `nip`(`nip`) USING BTREE,
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `tbl_pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tblsegmen
-- ----------------------------
DROP TABLE IF EXISTS `tblsegmen`;
CREATE TABLE `tblsegmen`  (
  `segmen_id` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `segmen_name` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `segmen_product_id` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `segmen_group` char(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `segmen_urut` decimal(3, 0) NULL DEFAULT NULL,
  `segmen_flag1` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `segmen_flag2` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `segmen_flag3` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`segmen_id`, `segmen_product_id`) USING BTREE,
  UNIQUE INDEX `segmen_name`(`segmen_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tblsystem
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem`;
CREATE TABLE `tblsystem`  (
  `system_id` char(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `system_value` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `system_name` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `system_desc` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `system_flag` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `system_product_id` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `system_int` int(4) NOT NULL,
  PRIMARY KEY (`system_id`, `system_product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for temp_stage_data_pelapor
-- ----------------------------
DROP TABLE IF EXISTS `temp_stage_data_pelapor`;
CREATE TABLE `temp_stage_data_pelapor`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `crmid` int(11) UNSIGNED NOT NULL,
  `smcreatorid` int(11) UNSIGNED NULL DEFAULT 0,
  `smownerid` int(11) UNSIGNED NULL DEFAULT 0,
  `ticket_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pelapor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kategori_kasus` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 760655 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tabel penyimpan data staging jumlah pelapor tertinggi' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_stage_data_terlapor
-- ----------------------------
DROP TABLE IF EXISTS `temp_stage_data_terlapor`;
CREATE TABLE `temp_stage_data_terlapor`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `crmid` int(11) UNSIGNED NOT NULL,
  `smcreatorid` int(11) UNSIGNED NULL DEFAULT 0,
  `smownerid` int(11) UNSIGNED NULL DEFAULT 0,
  `ticket_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `terlapor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kategori_kasus` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tabel penyimpan data staging jumlah pelapor tertinggi' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temtable
-- ----------------------------
DROP TABLE IF EXISTS `temtable`;
CREATE TABLE `temtable`  (
  `norev` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Kasus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `SubKasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `JenisKasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_rep
-- ----------------------------
DROP TABLE IF EXISTS `test_rep`;
CREATE TABLE `test_rep`  (
  `test_rep` decimal(10, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for testing321
-- ----------------------------
DROP TABLE IF EXISTS `testing321`;
CREATE TABLE `testing321`  (
  `id` int(19) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime NULL DEFAULT NULL,
  `nasabah` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `nokartu` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `norek` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kasus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `kategori` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jenis_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `tanggalkejadian` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nominal` decimal(15, 2) NULL DEFAULT NULL,
  `tanggal_closedby_divisi` date NULL DEFAULT NULL,
  `OWNER` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `slatarget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sla_internal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `rname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_pelapor` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sub_kasus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `role` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` int(19) NULL DEFAULT 0,
  `complain_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `STATUS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `severity` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_closed` datetime NULL DEFAULT NULL,
  `modifiedtime` datetime NULL DEFAULT NULL,
  `ticketid` int(19) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trx_webinstalment
-- ----------------------------
DROP TABLE IF EXISTS `trx_webinstalment`;
CREATE TABLE `trx_webinstalment`  (
  `id_trx` int(11) NOT NULL AUTO_INCREMENT,
  `auth_nbr` int(11) NULL DEFAULT NULL,
  `cardno` int(11) NULL DEFAULT NULL,
  `trx_date` date NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `merchant_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merchant_nbr` int(11) NULL DEFAULT NULL,
  `plan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cicilan` double NULL DEFAULT NULL,
  `suku_bunga` double NULL DEFAULT NULL,
  `req_date` datetime NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_trx`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for updateSLA
-- ----------------------------
DROP TABLE IF EXISTS `updateSLA`;
CREATE TABLE `updateSLA`  (
  `nama` varchar(110) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slabusiness` int(5) NOT NULL,
  `slatarget` int(5) NOT NULL,
  PRIMARY KEY (`nama`) USING BTREE,
  INDEX `sla1`(`slabusiness`) USING BTREE,
  INDEX `sla2`(`slatarget`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `pwd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `group` smallint(6) NOT NULL,
  `divisi` smallint(6) NULL DEFAULT NULL,
  `type` tinyint(4) NULL DEFAULT NULL,
  `sender_id` tinyint(4) NULL DEFAULT NULL,
  `authorized_id` tinyint(4) NULL DEFAULT NULL,
  `call_center` tinyint(4) NULL DEFAULT NULL,
  `card_center` tinyint(4) NULL DEFAULT NULL,
  `opsd` tinyint(4) NULL DEFAULT NULL,
  `admin` tinyint(4) NULL DEFAULT NULL,
  `active` tinyint(4) NULL DEFAULT NULL,
  `flag` tinyint(4) NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2667 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for validasi
-- ----------------------------
DROP TABLE IF EXISTS `validasi`;
CREATE TABLE `validasi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NULL DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371758 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_account
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_account`;
CREATE TABLE `vtiger_account`  (
  `accountid` int(19) NOT NULL DEFAULT 0,
  `account_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parentid` int(19) NULL DEFAULT 0,
  `account_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `industry` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annualrevenue` int(19) NULL DEFAULT 0,
  `rating` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownership` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `siccode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tickersymbol` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherphone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employees` int(10) NULL DEFAULT 0,
  `emailoptout` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `notify_owner` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`accountid`) USING BTREE,
  INDEX `account_account_type_idx`(`account_type`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_account` FOREIGN KEY (`accountid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountbillads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountbillads`;
CREATE TABLE `vtiger_accountbillads`  (
  `accountaddressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accountaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_accountbillads` FOREIGN KEY (`accountaddressid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountdepstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountdepstatus`;
CREATE TABLE `vtiger_accountdepstatus`  (
  `deploymentstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `deploymentstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`deploymentstatusid`) USING BTREE,
  UNIQUE INDEX `accountdepstatus_deploymentstatus_idx`(`deploymentstatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountownership
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountownership`;
CREATE TABLE `vtiger_accountownership`  (
  `acctownershipid` int(19) NOT NULL AUTO_INCREMENT,
  `ownership` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`acctownershipid`) USING BTREE,
  UNIQUE INDEX `accountownership_ownership_idx`(`ownership`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountrating
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountrating`;
CREATE TABLE `vtiger_accountrating`  (
  `accountratingid` int(19) NOT NULL AUTO_INCREMENT,
  `rating` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`accountratingid`) USING BTREE,
  UNIQUE INDEX `accountrating_rating_idx`(`rating`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountregion
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountregion`;
CREATE TABLE `vtiger_accountregion`  (
  `accountregionid` int(19) NOT NULL AUTO_INCREMENT,
  `region` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`accountregionid`) USING BTREE,
  UNIQUE INDEX `accountregion_region_idx`(`region`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountscf`;
CREATE TABLE `vtiger_accountscf`  (
  `accountid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`accountid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_accountscf` FOREIGN KEY (`accountid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accountshipads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accountshipads`;
CREATE TABLE `vtiger_accountshipads`  (
  `accountaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accountaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_accountshipads` FOREIGN KEY (`accountaddressid`) REFERENCES `vtiger_account` (`accountid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accounttype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accounttype`;
CREATE TABLE `vtiger_accounttype`  (
  `accounttypeid` int(19) NOT NULL AUTO_INCREMENT,
  `accounttype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`accounttypeid`) USING BTREE,
  UNIQUE INDEX `accounttype_accounttype_idx`(`accounttype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_accounttype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_accounttype_seq`;
CREATE TABLE `vtiger_accounttype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_actionmapping
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_actionmapping`;
CREATE TABLE `vtiger_actionmapping`  (
  `actionid` int(19) NOT NULL,
  `actionname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `securitycheck` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`actionid`, `actionname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activity
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activity`;
CREATE TABLE `vtiger_activity`  (
  `activityid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `semodule` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activitytype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_start` date NOT NULL,
  `due_date` date NULL DEFAULT NULL,
  `time_start` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_end` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendnotification` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `duration_hours` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration_minutes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notime` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `visibility` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'all',
  `recurringtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activityid`) USING BTREE,
  INDEX `activity_activityid_subject_idx`(`activityid`, `subject`) USING BTREE,
  INDEX `activity_activitytype_date_start_idx`(`activitytype`, `date_start`) USING BTREE,
  INDEX `activity_date_start_due_date_idx`(`date_start`, `due_date`) USING BTREE,
  INDEX `activity_date_start_time_start_idx`(`date_start`, `time_start`) USING BTREE,
  INDEX `activity_eventstatus_idx`(`eventstatus`) USING BTREE,
  INDEX `activity_status_idx`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activity_reminder
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activity_reminder`;
CREATE TABLE `vtiger_activity_reminder`  (
  `activity_id` int(11) NOT NULL,
  `reminder_time` int(11) NOT NULL,
  `reminder_sent` int(2) NOT NULL,
  `recurringid` int(19) NOT NULL,
  PRIMARY KEY (`activity_id`, `recurringid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activity_reminder_popup
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activity_reminder_popup`;
CREATE TABLE `vtiger_activity_reminder_popup`  (
  `reminderid` int(19) NOT NULL AUTO_INCREMENT,
  `semodule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recordid` int(19) NOT NULL,
  `date_start` date NOT NULL,
  `time_start` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`reminderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activity_view
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activity_view`;
CREATE TABLE `vtiger_activity_view`  (
  `activity_viewid` int(19) NOT NULL AUTO_INCREMENT,
  `activity_view` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`activity_viewid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activity_view_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activity_view_seq`;
CREATE TABLE `vtiger_activity_view_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_activitycf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activitycf`;
CREATE TABLE `vtiger_activitycf`  (
  `activityid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activityproductrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activityproductrel`;
CREATE TABLE `vtiger_activityproductrel`  (
  `activityid` int(19) NOT NULL DEFAULT 0,
  `productid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activityid`, `productid`) USING BTREE,
  INDEX `activityproductrel_activityid_idx`(`activityid`) USING BTREE,
  INDEX `activityproductrel_productid_idx`(`productid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_activityproductrel` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activitytype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activitytype`;
CREATE TABLE `vtiger_activitytype`  (
  `activitytypeid` int(19) NOT NULL AUTO_INCREMENT,
  `activitytype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activitytypeid`) USING BTREE,
  UNIQUE INDEX `activitytype_activitytype_idx`(`activitytype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_activitytype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activitytype_seq`;
CREATE TABLE `vtiger_activitytype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_activsubtype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_activsubtype`;
CREATE TABLE `vtiger_activsubtype`  (
  `activesubtypeid` int(19) NOT NULL AUTO_INCREMENT,
  `activsubtype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`activesubtypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_analyze
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_analyze`;
CREATE TABLE `vtiger_analyze`  (
  `analyzeid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_analyzecf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_analyzecf`;
CREATE TABLE `vtiger_analyzecf`  (
  `analyzeid` int(11) NOT NULL,
  PRIMARY KEY (`analyzeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_announcement
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_announcement`;
CREATE TABLE `vtiger_announcement`  (
  `creatorid` int(19) NOT NULL,
  `announcement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`creatorid`) USING BTREE,
  INDEX `announcement_creatorid_idx`(`creatorid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_assets
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_assets`;
CREATE TABLE `vtiger_assets`  (
  `assetsid` int(11) NOT NULL,
  `asset_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` int(19) NOT NULL,
  `product` int(19) NOT NULL,
  `serialnumber` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `datesold` date NOT NULL,
  `dateinservice` date NOT NULL,
  `assetstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'In Service',
  `tagnumber` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoiceid` int(19) NULL DEFAULT NULL,
  `shippingmethod` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shippingtrackingnumber` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assetname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`assetsid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_assets` FOREIGN KEY (`assetsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_assetscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_assetscf`;
CREATE TABLE `vtiger_assetscf`  (
  `assetsid` int(19) NOT NULL,
  PRIMARY KEY (`assetsid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_assetstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_assetstatus`;
CREATE TABLE `vtiger_assetstatus`  (
  `assetstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `assetstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`assetstatusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_assetstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_assetstatus_seq`;
CREATE TABLE `vtiger_assetstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_asterisk
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_asterisk`;
CREATE TABLE `vtiger_asterisk`  (
  `server` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_asteriskextensions
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_asteriskextensions`;
CREATE TABLE `vtiger_asteriskextensions`  (
  `userid` int(11) NULL DEFAULT NULL,
  `asterisk_extension` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_asterisk` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_asteriskincomingcalls
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_asteriskincomingcalls`;
CREATE TABLE `vtiger_asteriskincomingcalls`  (
  `from_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `callertype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` int(19) NULL DEFAULT NULL,
  `timer` int(19) NULL DEFAULT NULL,
  `refuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_asteriskincomingevents
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_asteriskincomingevents`;
CREATE TABLE `vtiger_asteriskincomingevents`  (
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_number` bigint(20) NULL DEFAULT NULL,
  `from_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_number` bigint(20) NULL DEFAULT NULL,
  `callertype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timer` int(20) NULL DEFAULT NULL,
  `flag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pbxrecordid` int(19) NULL DEFAULT NULL,
  `relcrmid` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_attachments
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_attachments`;
CREATE TABLE `vtiger_attachments`  (
  `attachmentsid` int(19) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attachmentsid`) USING BTREE,
  INDEX `attachments_attachmentsid_idx`(`attachmentsid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_attachments` FOREIGN KEY (`attachmentsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_attachmentsfolder
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_attachmentsfolder`;
CREATE TABLE `vtiger_attachmentsfolder`  (
  `folderid` int(19) NOT NULL AUTO_INCREMENT,
  `foldername` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdby` int(19) NOT NULL,
  `sequence` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`folderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_attachmentsfolder_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_attachmentsfolder_seq`;
CREATE TABLE `vtiger_attachmentsfolder_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_audit_trial
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_audit_trial`;
CREATE TABLE `vtiger_audit_trial`  (
  `auditid` int(19) NOT NULL,
  `userid` int(19) NULL DEFAULT NULL,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recordid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actiondate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`auditid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_audit_trial_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_audit_trial_seq`;
CREATE TABLE `vtiger_audit_trial_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_blocks
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_blocks`;
CREATE TABLE `vtiger_blocks`  (
  `blockid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `blocklabel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence` int(10) NULL DEFAULT NULL,
  `show_title` int(2) NULL DEFAULT NULL,
  `visible` int(2) NOT NULL DEFAULT 0,
  `create_view` int(2) NOT NULL DEFAULT 0,
  `edit_view` int(2) NOT NULL DEFAULT 0,
  `detail_view` int(2) NOT NULL DEFAULT 0,
  `display_status` int(1) NOT NULL DEFAULT 1,
  `iscustom` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`blockid`) USING BTREE,
  INDEX `block_tabid_idx`(`tabid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_blocks` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_blocks_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_blocks_seq`;
CREATE TABLE `vtiger_blocks_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_businesstype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_businesstype`;
CREATE TABLE `vtiger_businesstype`  (
  `businesstypeid` int(19) NOT NULL AUTO_INCREMENT,
  `businesstype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`businesstypeid`) USING BTREE,
  UNIQUE INDEX `businesstype_businesstype_idx`(`businesstype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaign
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaign`;
CREATE TABLE `vtiger_campaign`  (
  `campaign_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `campaignname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `campaigntype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `campaignstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expectedrevenue` decimal(25, 3) NULL DEFAULT NULL,
  `budgetcost` decimal(25, 3) NULL DEFAULT NULL,
  `actualcost` decimal(25, 3) NULL DEFAULT NULL,
  `expectedresponse` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `numsent` decimal(11, 0) NULL DEFAULT NULL,
  `product_id` int(19) NULL DEFAULT NULL,
  `sponsor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `targetaudience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `targetsize` int(19) NULL DEFAULT NULL,
  `expectedresponsecount` int(19) NULL DEFAULT NULL,
  `expectedsalescount` int(19) NULL DEFAULT NULL,
  `expectedroi` decimal(25, 3) NULL DEFAULT NULL,
  `actualresponsecount` int(19) NULL DEFAULT NULL,
  `actualsalescount` int(19) NULL DEFAULT NULL,
  `actualroi` decimal(25, 3) NULL DEFAULT NULL,
  `campaignid` int(19) NOT NULL,
  `closingdate` date NULL DEFAULT NULL,
  PRIMARY KEY (`campaignid`) USING BTREE,
  INDEX `campaign_campaignstatus_idx`(`campaignstatus`) USING BTREE,
  INDEX `campaign_campaignname_idx`(`campaignname`) USING BTREE,
  INDEX `campaign_campaignid_idx`(`campaignid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaignaccountrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignaccountrel`;
CREATE TABLE `vtiger_campaignaccountrel`  (
  `campaignid` int(19) NULL DEFAULT NULL,
  `accountid` int(19) NULL DEFAULT NULL,
  `campaignrelstatusid` int(19) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaigncontrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaigncontrel`;
CREATE TABLE `vtiger_campaigncontrel`  (
  `campaignid` int(19) NOT NULL DEFAULT 0,
  `contactid` int(19) NOT NULL DEFAULT 0,
  `campaignrelstatusid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignid`, `contactid`, `campaignrelstatusid`) USING BTREE,
  INDEX `campaigncontrel_contractid_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_campaigncontrel` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaignleadrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignleadrel`;
CREATE TABLE `vtiger_campaignleadrel`  (
  `campaignid` int(19) NOT NULL DEFAULT 0,
  `leadid` int(19) NOT NULL DEFAULT 0,
  `campaignrelstatusid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignid`, `leadid`, `campaignrelstatusid`) USING BTREE,
  INDEX `campaignleadrel_leadid_campaignid_idx`(`leadid`, `campaignid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_campaignleadrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaignrelstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignrelstatus`;
CREATE TABLE `vtiger_campaignrelstatus`  (
  `campaignrelstatusid` int(19) NULL DEFAULT NULL,
  `campaignrelstatus` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortorderid` int(19) NULL DEFAULT NULL,
  `presence` int(19) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaignrelstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignrelstatus_seq`;
CREATE TABLE `vtiger_campaignrelstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_campaignscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignscf`;
CREATE TABLE `vtiger_campaignscf`  (
  `campaignid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_campaignscf` FOREIGN KEY (`campaignid`) REFERENCES `vtiger_campaign` (`campaignid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaignstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignstatus`;
CREATE TABLE `vtiger_campaignstatus`  (
  `campaignstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `campaignstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaignstatusid`) USING BTREE,
  INDEX `campaignstatus_campaignstatus_idx`(`campaignstatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaignstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaignstatus_seq`;
CREATE TABLE `vtiger_campaignstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_campaigntype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaigntype`;
CREATE TABLE `vtiger_campaigntype`  (
  `campaigntypeid` int(19) NOT NULL AUTO_INCREMENT,
  `campaigntype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`campaigntypeid`) USING BTREE,
  UNIQUE INDEX `campaigntype_campaigntype_idx`(`campaigntype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_campaigntype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_campaigntype_seq`;
CREATE TABLE `vtiger_campaigntype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_carrier
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_carrier`;
CREATE TABLE `vtiger_carrier`  (
  `carrierid` int(19) NOT NULL AUTO_INCREMENT,
  `carrier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`carrierid`) USING BTREE,
  UNIQUE INDEX `carrier_carrier_idx`(`carrier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_carrier_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_carrier_seq`;
CREATE TABLE `vtiger_carrier_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_641
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_641`;
CREATE TABLE `vtiger_cf_641`  (
  `cf_641id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_641` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_641id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_641_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_641_seq`;
CREATE TABLE `vtiger_cf_641_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_645_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_645_seq`;
CREATE TABLE `vtiger_cf_645_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_648_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_648_seq`;
CREATE TABLE `vtiger_cf_648_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_651_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_651_seq`;
CREATE TABLE `vtiger_cf_651_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_653_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_653_seq`;
CREATE TABLE `vtiger_cf_653_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_655_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_655_seq`;
CREATE TABLE `vtiger_cf_655_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_658_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_658_seq`;
CREATE TABLE `vtiger_cf_658_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_661
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_661`;
CREATE TABLE `vtiger_cf_661`  (
  `cf_661id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_661` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_661id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_661_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_661_seq`;
CREATE TABLE `vtiger_cf_661_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_662_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_662_seq`;
CREATE TABLE `vtiger_cf_662_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_663
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_663`;
CREATE TABLE `vtiger_cf_663`  (
  `cf_663id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_663` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_663id`) USING BTREE,
  INDEX `nama`(`cf_663`) USING BTREE,
  INDEX `picklist_valueid`(`picklist_valueid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2490 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_663_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_663_seq`;
CREATE TABLE `vtiger_cf_663_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_664_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_664_seq`;
CREATE TABLE `vtiger_cf_664_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_665
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_665`;
CREATE TABLE `vtiger_cf_665`  (
  `cf_665id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_665` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_665id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_665_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_665_seq`;
CREATE TABLE `vtiger_cf_665_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_666
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_666`;
CREATE TABLE `vtiger_cf_666`  (
  `cf_666id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_666` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_666id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_666_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_666_seq`;
CREATE TABLE `vtiger_cf_666_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_671
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_671`;
CREATE TABLE `vtiger_cf_671`  (
  `cf_671id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_671` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_671id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_671_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_671_seq`;
CREATE TABLE `vtiger_cf_671_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_675
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_675`;
CREATE TABLE `vtiger_cf_675`  (
  `cf_675id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_675` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_675id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_675_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_675_seq`;
CREATE TABLE `vtiger_cf_675_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_679
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_679`;
CREATE TABLE `vtiger_cf_679`  (
  `cf_679id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_679` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_679id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_679_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_679_seq`;
CREATE TABLE `vtiger_cf_679_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_680
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_680`;
CREATE TABLE `vtiger_cf_680`  (
  `cf_680id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_680` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_680id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_680_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_680_seq`;
CREATE TABLE `vtiger_cf_680_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_698
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_698`;
CREATE TABLE `vtiger_cf_698`  (
  `cf_698id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_698` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_698id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_698_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_698_seq`;
CREATE TABLE `vtiger_cf_698_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_699
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_699`;
CREATE TABLE `vtiger_cf_699`  (
  `cf_699id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_699` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_699id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_699_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_699_seq`;
CREATE TABLE `vtiger_cf_699_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_702
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_702`;
CREATE TABLE `vtiger_cf_702`  (
  `cf_702id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_702` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_702id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_702_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_702_seq`;
CREATE TABLE `vtiger_cf_702_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_703
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_703`;
CREATE TABLE `vtiger_cf_703`  (
  `cf_703id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_703` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_703id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_703_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_703_seq`;
CREATE TABLE `vtiger_cf_703_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_704
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_704`;
CREATE TABLE `vtiger_cf_704`  (
  `cf_704id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_704` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 1,
  PRIMARY KEY (`cf_704id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_704_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_704_seq`;
CREATE TABLE `vtiger_cf_704_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_705
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_705`;
CREATE TABLE `vtiger_cf_705`  (
  `cf_705id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_705` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_705id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_705_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_705_seq`;
CREATE TABLE `vtiger_cf_705_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_706
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_706`;
CREATE TABLE `vtiger_cf_706`  (
  `cf_706id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_706` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_706id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_706_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_706_seq`;
CREATE TABLE `vtiger_cf_706_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_710_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_710_seq`;
CREATE TABLE `vtiger_cf_710_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_711_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_711_seq`;
CREATE TABLE `vtiger_cf_711_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_712_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_712_seq`;
CREATE TABLE `vtiger_cf_712_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_717
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_717`;
CREATE TABLE `vtiger_cf_717`  (
  `cf_717id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_717` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_717id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_717_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_717_seq`;
CREATE TABLE `vtiger_cf_717_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_718
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_718`;
CREATE TABLE `vtiger_cf_718`  (
  `cf_718id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_718` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_718id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_718_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_718_seq`;
CREATE TABLE `vtiger_cf_718_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_721
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_721`;
CREATE TABLE `vtiger_cf_721`  (
  `cf_721id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_721` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_721id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 248 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_721_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_721_seq`;
CREATE TABLE `vtiger_cf_721_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_722
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_722`;
CREATE TABLE `vtiger_cf_722`  (
  `cf_722id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_722` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_722id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_722_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_722_seq`;
CREATE TABLE `vtiger_cf_722_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_723
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_723`;
CREATE TABLE `vtiger_cf_723`  (
  `cf_723id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_723` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_723id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_723_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_723_seq`;
CREATE TABLE `vtiger_cf_723_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_728_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_728_seq`;
CREATE TABLE `vtiger_cf_728_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_729
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_729`;
CREATE TABLE `vtiger_cf_729`  (
  `cf_729id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_729` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_729id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_729_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_729_seq`;
CREATE TABLE `vtiger_cf_729_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_730
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_730`;
CREATE TABLE `vtiger_cf_730`  (
  `cf_730id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_730` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_730id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_730_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_730_seq`;
CREATE TABLE `vtiger_cf_730_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_731
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_731`;
CREATE TABLE `vtiger_cf_731`  (
  `cf_731id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_731` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_731id`) USING BTREE,
  INDEX `nama`(`cf_731`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 518 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_cf_731_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_731_seq`;
CREATE TABLE `vtiger_cf_731_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cf_742
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_742`;
CREATE TABLE `vtiger_cf_742`  (
  `cf_742id` int(19) NOT NULL AUTO_INCREMENT,
  `cf_742` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cf_742id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_cf_742_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cf_742_seq`;
CREATE TABLE `vtiger_cf_742_seq`  (
  `id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_changepassword
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_changepassword`;
CREATE TABLE `vtiger_changepassword`  (
  `changepasswordid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_changepasswordcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_changepasswordcf`;
CREATE TABLE `vtiger_changepasswordcf`  (
  `changepasswordid` int(11) NOT NULL,
  PRIMARY KEY (`changepasswordid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_chat_msg`;
CREATE TABLE `vtiger_chat_msg`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `chat_from` int(20) NOT NULL DEFAULT 0,
  `chat_to` int(20) NOT NULL DEFAULT 0,
  `born` datetime NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `chat_msg_chat_from_idx`(`chat_from`) USING BTREE,
  INDEX `chat_msg_chat_to_idx`(`chat_to`) USING BTREE,
  INDEX `chat_msg_born_idx`(`born`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_chat_msg` FOREIGN KEY (`chat_from`) REFERENCES `vtiger_chat_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_chat_pchat
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_chat_pchat`;
CREATE TABLE `vtiger_chat_pchat`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `msg` int(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chat_pchat_msg_idx`(`msg`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_chat_pchat` FOREIGN KEY (`msg`) REFERENCES `vtiger_chat_msg` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_chat_pvchat
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_chat_pvchat`;
CREATE TABLE `vtiger_chat_pvchat`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `msg` int(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chat_pvchat_msg_idx`(`msg`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_chat_pvchat` FOREIGN KEY (`msg`) REFERENCES `vtiger_chat_msg` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_chat_users
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_chat_users`;
CREATE TABLE `vtiger_chat_users`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nick` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '000.000.000.000',
  `ping` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `chat_users_nick_idx`(`nick`) USING BTREE,
  INDEX `chat_users_session_idx`(`session`) USING BTREE,
  INDEX `chat_users_ping_idx`(`ping`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 602 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_cntactivityrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cntactivityrel`;
CREATE TABLE `vtiger_cntactivityrel`  (
  `contactid` int(19) NOT NULL DEFAULT 0,
  `activityid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactid`, `activityid`) USING BTREE,
  INDEX `cntactivityrel_contactid_idx`(`contactid`) USING BTREE,
  INDEX `cntactivityrel_activityid_idx`(`activityid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_cntactivityrel` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_competitor
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_competitor`;
CREATE TABLE `vtiger_competitor`  (
  `competitorid` int(19) NOT NULL,
  `competitorname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strength` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weakness` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`competitorid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_competitor` FOREIGN KEY (`competitorid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contactaddress
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contactaddress`;
CREATE TABLE `vtiger_contactaddress`  (
  `contactaddressid` int(19) NOT NULL DEFAULT 0,
  `mailingcity` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailingstreet` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailingcountry` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `othercountry` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailingstate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailingpobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `othercity` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherstate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailingzip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherzip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherstreet` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherpobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contactaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_contactaddress` FOREIGN KEY (`contactaddressid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contactdetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contactdetails`;
CREATE TABLE `vtiger_contactdetails`  (
  `contactid` int(19) NOT NULL DEFAULT 0,
  `contact_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` int(19) NULL DEFAULT NULL,
  `salutation` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reportsto` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `training` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usertype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacttype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otheremail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondaryemail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `donotcall` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emailoptout` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `imagename` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reference` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notify_owner` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`contactid`) USING BTREE,
  INDEX `contactdetails_accountid_idx`(`accountid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_contactdetails` FOREIGN KEY (`contactid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contactscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contactscf`;
CREATE TABLE `vtiger_contactscf`  (
  `contactid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_contactscf` FOREIGN KEY (`contactid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contactsubdetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contactsubdetails`;
CREATE TABLE `vtiger_contactsubdetails`  (
  `contactsubscriptionid` int(19) NOT NULL DEFAULT 0,
  `homephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assistant` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assistantphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `laststayintouchrequest` int(30) NULL DEFAULT 0,
  `laststayintouchsavedate` int(19) NULL DEFAULT 0,
  `leadsource` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contactsubscriptionid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_contactsubdetails` FOREIGN KEY (`contactsubscriptionid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contacttype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contacttype`;
CREATE TABLE `vtiger_contacttype`  (
  `contacttypeid` int(19) NOT NULL AUTO_INCREMENT,
  `contacttype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`contacttypeid`) USING BTREE,
  UNIQUE INDEX `contacttype_contacttype_idx`(`contacttype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contpotentialrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contpotentialrel`;
CREATE TABLE `vtiger_contpotentialrel`  (
  `contactid` int(19) NOT NULL DEFAULT 0,
  `potentialid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactid`, `potentialid`) USING BTREE,
  INDEX `contpotentialrel_potentialid_idx`(`potentialid`) USING BTREE,
  INDEX `contpotentialrel_contactid_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_contpotentialrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contract_priority
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contract_priority`;
CREATE TABLE `vtiger_contract_priority`  (
  `contract_priorityid` int(11) NOT NULL AUTO_INCREMENT,
  `contract_priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contract_priorityid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contract_priority_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contract_priority_seq`;
CREATE TABLE `vtiger_contract_priority_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_contract_status
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contract_status`;
CREATE TABLE `vtiger_contract_status`  (
  `contract_statusid` int(11) NOT NULL AUTO_INCREMENT,
  `contract_status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contract_statusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contract_status_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contract_status_seq`;
CREATE TABLE `vtiger_contract_status_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_contract_type
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contract_type`;
CREATE TABLE `vtiger_contract_type`  (
  `contract_typeid` int(11) NOT NULL AUTO_INCREMENT,
  `contract_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contract_typeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_contract_type_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_contract_type_seq`;
CREATE TABLE `vtiger_contract_type_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_convertleadmapping
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_convertleadmapping`;
CREATE TABLE `vtiger_convertleadmapping`  (
  `cfmid` int(19) NOT NULL AUTO_INCREMENT,
  `leadfid` int(19) NOT NULL,
  `accountfid` int(19) NULL DEFAULT NULL,
  `contactfid` int(19) NULL DEFAULT NULL,
  `potentialfid` int(19) NULL DEFAULT NULL,
  `editable` int(19) NULL DEFAULT 1,
  PRIMARY KEY (`cfmid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentity
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentity`;
CREATE TABLE `vtiger_crmentity`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `crmid`(`crmid`) USING BTREE,
  INDEX `smownerid_idx`(`smownerid`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`setype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentity_2020
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentity_2020`;
CREATE TABLE `vtiger_crmentity_2020`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `crmid`(`crmid`) USING BTREE,
  INDEX `smownerid_idx`(`smownerid`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`setype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentity_2022
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentity_2022`;
CREATE TABLE `vtiger_crmentity_2022`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `crmid`(`crmid`) USING BTREE,
  INDEX `smownerid_idx`(`smownerid`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`setype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentity_copy
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentity_copy`;
CREATE TABLE `vtiger_crmentity_copy`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `crmid`(`crmid`) USING BTREE,
  INDEX `smownerid_idx`(`smownerid`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`setype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentity_copy1
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentity_copy1`;
CREATE TABLE `vtiger_crmentity_copy1`  (
  `crmid` int(19) NOT NULL,
  `smcreatorid` int(19) NOT NULL DEFAULT 0,
  `smownerid` int(19) NOT NULL DEFAULT 0,
  `modifiedby` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  `modifiedtime` datetime NOT NULL,
  `viewedtime` datetime NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`) USING BTREE,
  INDEX `crmentity_smcreatorid_idx`(`smcreatorid`) USING BTREE,
  INDEX `crmentity_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `crmentity_deleted_idx`(`deleted`) USING BTREE,
  INDEX `createdtime`(`createdtime`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `crmid`(`crmid`) USING BTREE,
  INDEX `smownerid_idx`(`smownerid`) USING BTREE,
  INDEX `crm_ownerid_del_setype_idx`(`setype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentity_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentity_seq`;
CREATE TABLE `vtiger_crmentity_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_crmentitynotesrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentitynotesrel`;
CREATE TABLE `vtiger_crmentitynotesrel`  (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `notesid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`, `notesid`) USING BTREE,
  INDEX `crmentitynotesrel_notesid_idx`(`notesid`) USING BTREE,
  INDEX `crmentitynotesrel_crmid_idx`(`crmid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_crmentitynotesrel` FOREIGN KEY (`notesid`) REFERENCES `vtiger_notes` (`notesid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_crmentityrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_crmentityrel`;
CREATE TABLE `vtiger_crmentityrel`  (
  `crmid` int(11) NOT NULL,
  `module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relcrmid` int(11) NOT NULL,
  `relmodule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_cron_task
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cron_task`;
CREATE TABLE `vtiger_cron_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler_file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `frequency` int(11) NULL DEFAULT NULL,
  `laststart` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lastend` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NULL DEFAULT NULL,
  `module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `handler_file`(`handler_file`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currencies
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currencies`;
CREATE TABLE `vtiger_currencies`  (
  `currencyid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`currencyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currencies_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currencies_seq`;
CREATE TABLE `vtiger_currencies_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_currency
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency`;
CREATE TABLE `vtiger_currency`  (
  `currencyid` int(19) NOT NULL AUTO_INCREMENT,
  `currency` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currencyid`) USING BTREE,
  UNIQUE INDEX `currency_currency_idx`(`currency`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currency_decimal_separator
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_decimal_separator`;
CREATE TABLE `vtiger_currency_decimal_separator`  (
  `currency_decimal_separatorid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_decimal_separator` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_decimal_separatorid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currency_decimal_separator_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_decimal_separator_seq`;
CREATE TABLE `vtiger_currency_decimal_separator_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_currency_grouping_pattern
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_grouping_pattern`;
CREATE TABLE `vtiger_currency_grouping_pattern`  (
  `currency_grouping_patternid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_grouping_pattern` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_grouping_patternid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currency_grouping_pattern_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_grouping_pattern_seq`;
CREATE TABLE `vtiger_currency_grouping_pattern_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_currency_grouping_separator
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_grouping_separator`;
CREATE TABLE `vtiger_currency_grouping_separator`  (
  `currency_grouping_separatorid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_grouping_separator` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_grouping_separatorid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currency_grouping_separator_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_grouping_separator_seq`;
CREATE TABLE `vtiger_currency_grouping_separator_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_currency_info
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_info`;
CREATE TABLE `vtiger_currency_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `conversion_rate` decimal(10, 3) NULL DEFAULT NULL,
  `currency_status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `defaultid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currency_info_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_info_seq`;
CREATE TABLE `vtiger_currency_info_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_currency_symbol_placement
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_symbol_placement`;
CREATE TABLE `vtiger_currency_symbol_placement`  (
  `currency_symbol_placementid` int(19) NOT NULL AUTO_INCREMENT,
  `currency_symbol_placement` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`currency_symbol_placementid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_currency_symbol_placement_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_currency_symbol_placement_seq`;
CREATE TABLE `vtiger_currency_symbol_placement_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_customaction
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customaction`;
CREATE TABLE `vtiger_customaction`  (
  `cvid` int(19) NOT NULL,
  `subject` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  INDEX `customaction_cvid_idx`(`cvid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_customaction` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_customerdetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customerdetails`;
CREATE TABLE `vtiger_customerdetails`  (
  `customerid` int(19) NOT NULL,
  `portal` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `support_start_date` date NULL DEFAULT NULL,
  `support_end_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`customerid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_customerdetails` FOREIGN KEY (`customerid`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_customerportal_fields
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customerportal_fields`;
CREATE TABLE `vtiger_customerportal_fields`  (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) NULL DEFAULT NULL,
  `visible` int(1) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_customerportal_prefs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customerportal_prefs`;
CREATE TABLE `vtiger_customerportal_prefs`  (
  `tabid` int(19) NOT NULL,
  `prefkey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prefvalue` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`tabid`, `prefkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_customerportal_tabs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customerportal_tabs`;
CREATE TABLE `vtiger_customerportal_tabs`  (
  `tabid` int(19) NOT NULL,
  `visible` int(1) NULL DEFAULT 1,
  `sequence` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`tabid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_customview
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customview`;
CREATE TABLE `vtiger_customview`  (
  `cvid` int(19) NOT NULL,
  `viewname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setdefault` int(1) NULL DEFAULT 0,
  `setmetrics` int(1) NULL DEFAULT 0,
  `entitytype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(1) NULL DEFAULT 1,
  `userid` int(19) NULL DEFAULT 1,
  PRIMARY KEY (`cvid`) USING BTREE,
  INDEX `customview_entitytype_idx`(`entitytype`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_customview` FOREIGN KEY (`entitytype`) REFERENCES `vtiger_tab` (`name`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_customview_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_customview_seq`;
CREATE TABLE `vtiger_customview_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_cvadvfilter
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cvadvfilter`;
CREATE TABLE `vtiger_cvadvfilter`  (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `comparator` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `groupid` int(11) NULL DEFAULT 1,
  `column_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'and',
  PRIMARY KEY (`cvid`, `columnindex`) USING BTREE,
  INDEX `cvadvfilter_cvid_idx`(`cvid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_cvadvfilter` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_cvadvfilter_grouping
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cvadvfilter_grouping`;
CREATE TABLE `vtiger_cvadvfilter_grouping`  (
  `groupid` int(11) NOT NULL,
  `cvid` int(19) NOT NULL,
  `group_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_expression` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`groupid`, `cvid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_cvcolumnlist
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cvcolumnlist`;
CREATE TABLE `vtiger_cvcolumnlist`  (
  `cvid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`cvid`, `columnindex`) USING BTREE,
  INDEX `cvcolumnlist_columnindex_idx`(`columnindex`) USING BTREE,
  INDEX `cvcolumnlist_cvid_idx`(`cvid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_cvcolumnlist` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_cvstdfilter
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_cvstdfilter`;
CREATE TABLE `vtiger_cvstdfilter`  (
  `cvid` int(19) NOT NULL,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `stdfilter` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `startdate` date NULL DEFAULT NULL,
  `enddate` date NULL DEFAULT NULL,
  PRIMARY KEY (`cvid`) USING BTREE,
  INDEX `cvstdfilter_cvid_idx`(`cvid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_cvstdfilter` FOREIGN KEY (`cvid`) REFERENCES `vtiger_customview` (`cvid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_grp2grp
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_grp2grp`;
CREATE TABLE `vtiger_datashare_grp2grp`  (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) NULL DEFAULT NULL,
  `to_groupid` int(19) NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_grp2grp_share_groupid_idx`(`share_groupid`) USING BTREE,
  INDEX `datashare_grp2grp_to_groupid_idx`(`to_groupid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_grp2grp` FOREIGN KEY (`to_groupid`) REFERENCES `vtiger_groups` (`groupid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_grp2role
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_grp2role`;
CREATE TABLE `vtiger_datashare_grp2role`  (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) NULL DEFAULT NULL,
  `to_roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `idx_datashare_grp2role_share_groupid`(`share_groupid`) USING BTREE,
  INDEX `idx_datashare_grp2role_to_roleid`(`to_roleid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_grp2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_grp2rs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_grp2rs`;
CREATE TABLE `vtiger_datashare_grp2rs`  (
  `shareid` int(19) NOT NULL,
  `share_groupid` int(19) NULL DEFAULT NULL,
  `to_roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_grp2rs_share_groupid_idx`(`share_groupid`) USING BTREE,
  INDEX `datashare_grp2rs_to_roleandsubid_idx`(`to_roleandsubid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_grp2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_module_rel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_module_rel`;
CREATE TABLE `vtiger_datashare_module_rel`  (
  `shareid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `relationtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `idx_datashare_module_rel_tabid`(`tabid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_datashare_module_rel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_module_rel_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_module_rel_seq`;
CREATE TABLE `vtiger_datashare_module_rel_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_datashare_relatedmodule_permission
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_relatedmodule_permission`;
CREATE TABLE `vtiger_datashare_relatedmodule_permission`  (
  `shareid` int(19) NOT NULL,
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`, `datashare_relatedmodule_id`) USING BTREE,
  INDEX `datashare_relatedmodule_permission_shareid_permissions_idx`(`shareid`, `permission`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_relatedmodules
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_relatedmodules`;
CREATE TABLE `vtiger_datashare_relatedmodules`  (
  `datashare_relatedmodule_id` int(19) NOT NULL,
  `tabid` int(19) NULL DEFAULT NULL,
  `relatedto_tabid` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`datashare_relatedmodule_id`) USING BTREE,
  INDEX `datashare_relatedmodules_tabid_idx`(`tabid`) USING BTREE,
  INDEX `datashare_relatedmodules_relatedto_tabid_idx`(`relatedto_tabid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_datashare_relatedmodules` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_relatedmodules_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_relatedmodules_seq`;
CREATE TABLE `vtiger_datashare_relatedmodules_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_datashare_role2group
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_role2group`;
CREATE TABLE `vtiger_datashare_role2group`  (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_groupid` int(19) NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `idx_datashare_role2group_share_roleid`(`share_roleid`) USING BTREE,
  INDEX `idx_datashare_role2group_to_groupid`(`to_groupid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_role2group` FOREIGN KEY (`share_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_role2role
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_role2role`;
CREATE TABLE `vtiger_datashare_role2role`  (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_role2role_share_roleid_idx`(`share_roleid`) USING BTREE,
  INDEX `datashare_role2role_to_roleid_idx`(`to_roleid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_role2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_role2rs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_role2rs`;
CREATE TABLE `vtiger_datashare_role2rs`  (
  `shareid` int(19) NOT NULL,
  `share_roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_role2s_share_roleid_idx`(`share_roleid`) USING BTREE,
  INDEX `datashare_role2s_to_roleandsubid_idx`(`to_roleandsubid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_role2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_rs2grp
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_rs2grp`;
CREATE TABLE `vtiger_datashare_rs2grp`  (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_groupid` int(19) NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_rs2grp_share_roleandsubid_idx`(`share_roleandsubid`) USING BTREE,
  INDEX `datashare_rs2grp_to_groupid_idx`(`to_groupid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_rs2grp` FOREIGN KEY (`share_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_rs2role
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_rs2role`;
CREATE TABLE `vtiger_datashare_rs2role`  (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_rs2role_share_roleandsubid_idx`(`share_roleandsubid`) USING BTREE,
  INDEX `datashare_rs2role_to_roleid_idx`(`to_roleid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_rs2role` FOREIGN KEY (`to_roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_datashare_rs2rs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_datashare_rs2rs`;
CREATE TABLE `vtiger_datashare_rs2rs`  (
  `shareid` int(19) NOT NULL,
  `share_roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`shareid`) USING BTREE,
  INDEX `datashare_rs2rs_share_roleandsubid_idx`(`share_roleandsubid`) USING BTREE,
  INDEX `idx_datashare_rs2rs_to_roleandsubid_idx`(`to_roleandsubid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_datashare_rs2rs` FOREIGN KEY (`to_roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_date_format
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_date_format`;
CREATE TABLE `vtiger_date_format`  (
  `date_formatid` int(19) NOT NULL AUTO_INCREMENT,
  `date_format` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`date_formatid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_date_format_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_date_format_seq`;
CREATE TABLE `vtiger_date_format_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_dealintimation
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_dealintimation`;
CREATE TABLE `vtiger_dealintimation`  (
  `dealintimationid` int(19) NOT NULL DEFAULT 0,
  `dealname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intimationamount` int(19) NOT NULL DEFAULT 0,
  `dealprobability` decimal(3, 2) NOT NULL DEFAULT 0.00,
  `dealintimationactive` int(1) NULL DEFAULT NULL,
  `fromname` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fromemailid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notifyemails` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notifybccemails` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notifyccmails` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notifypotentialowner` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`dealintimationid`) USING BTREE,
  UNIQUE INDEX `dealintimation_dealname_idx`(`dealname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_def_org_field
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_def_org_field`;
CREATE TABLE `vtiger_def_org_field`  (
  `tabid` int(10) NULL DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) NULL DEFAULT NULL,
  `readonly` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`fieldid`) USING BTREE,
  INDEX `def_org_field_tabid_fieldid_idx`(`tabid`, `fieldid`) USING BTREE,
  INDEX `def_org_field_tabid_idx`(`tabid`) USING BTREE,
  INDEX `def_org_field_visible_fieldid_idx`(`visible`, `fieldid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_def_org_share
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_def_org_share`;
CREATE TABLE `vtiger_def_org_share`  (
  `ruleid` int(11) NOT NULL AUTO_INCREMENT,
  `tabid` int(11) NOT NULL,
  `permission` int(19) NULL DEFAULT NULL,
  `editstatus` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`ruleid`) USING BTREE,
  INDEX `fk_1_vtiger_def_org_share`(`permission`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_def_org_share` FOREIGN KEY (`permission`) REFERENCES `vtiger_org_share_action_mapping` (`share_action_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_def_org_share_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_def_org_share_seq`;
CREATE TABLE `vtiger_def_org_share_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_defaultcv
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_defaultcv`;
CREATE TABLE `vtiger_defaultcv`  (
  `tabid` int(19) NOT NULL,
  `defaultviewname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`tabid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_defaultcv` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_downloadpurpose
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_downloadpurpose`;
CREATE TABLE `vtiger_downloadpurpose`  (
  `downloadpurposeid` int(19) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`downloadpurposeid`) USING BTREE,
  UNIQUE INDEX `downloadpurpose_purpose_idx`(`purpose`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_duration_minutes
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_duration_minutes`;
CREATE TABLE `vtiger_duration_minutes`  (
  `minutesid` int(19) NOT NULL AUTO_INCREMENT,
  `duration_minutes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`minutesid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_duration_minutes_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_duration_minutes_seq`;
CREATE TABLE `vtiger_duration_minutes_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_durationhrs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_durationhrs`;
CREATE TABLE `vtiger_durationhrs`  (
  `hrsid` int(19) NOT NULL AUTO_INCREMENT,
  `hrs` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`hrsid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_durationmins
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_durationmins`;
CREATE TABLE `vtiger_durationmins`  (
  `minsid` int(19) NOT NULL AUTO_INCREMENT,
  `mins` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`minsid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_email_access
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_email_access`;
CREATE TABLE `vtiger_email_access`  (
  `crmid` int(11) NULL DEFAULT NULL,
  `mailid` int(11) NULL DEFAULT NULL,
  `accessdate` date NULL DEFAULT NULL,
  `accesstime` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_email_track
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_email_track`;
CREATE TABLE `vtiger_email_track`  (
  `crmid` int(11) NULL DEFAULT NULL,
  `mailid` int(11) NULL DEFAULT NULL,
  `access_count` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `link_tabidtype_idx`(`crmid`, `mailid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_emaildetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_emaildetails`;
CREATE TABLE `vtiger_emaildetails`  (
  `emailid` int(19) NOT NULL,
  `from_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `to_email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cc_email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bcc_email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `assigned_user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `idlists` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email_flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`emailid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_emailtemplates
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_emailtemplates`;
CREATE TABLE `vtiger_emailtemplates`  (
  `foldername` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `templatename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `templateid` int(19) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`templateid`) USING BTREE,
  INDEX `emailtemplates_foldernamd_templatename_subject_idx`(`foldername`, `templatename`, `subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_emailtemplates_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_emailtemplates_seq`;
CREATE TABLE `vtiger_emailtemplates_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_entityname
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_entityname`;
CREATE TABLE `vtiger_entityname`  (
  `tabid` int(19) NOT NULL DEFAULT 0,
  `modulename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldname` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entityidfield` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entityidcolumn` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tabid`) USING BTREE,
  INDEX `entityname_tabid_idx`(`tabid`) USING BTREE,
  INDEX `modulename`(`modulename`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_entityname` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_evaluationstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_evaluationstatus`;
CREATE TABLE `vtiger_evaluationstatus`  (
  `evalstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`evalstatusid`) USING BTREE,
  UNIQUE INDEX `evaluationstatus_status_idx`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_eventhandler_module
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_eventhandler_module`;
CREATE TABLE `vtiger_eventhandler_module`  (
  `eventhandler_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eventhandler_module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_eventhandler_module_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_eventhandler_module_seq`;
CREATE TABLE `vtiger_eventhandler_module_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_eventhandlers
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_eventhandlers`;
CREATE TABLE `vtiger_eventhandlers`  (
  `eventhandler_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handler_path` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handler_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cond` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_active` int(1) NOT NULL,
  `dependent_on` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '[]',
  PRIMARY KEY (`eventhandler_id`, `event_name`, `handler_class`) USING BTREE,
  UNIQUE INDEX `eventhandler_idx`(`eventhandler_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_eventhandlers_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_eventhandlers_seq`;
CREATE TABLE `vtiger_eventhandlers_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_eventstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_eventstatus`;
CREATE TABLE `vtiger_eventstatus`  (
  `eventstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `eventstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventstatusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_eventstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_eventstatus_seq`;
CREATE TABLE `vtiger_eventstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_expectedresponse
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_expectedresponse`;
CREATE TABLE `vtiger_expectedresponse`  (
  `expectedresponseid` int(19) NOT NULL AUTO_INCREMENT,
  `expectedresponse` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`expectedresponseid`) USING BTREE,
  UNIQUE INDEX `CampaignExpRes_UK01`(`expectedresponse`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_expectedresponse_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_expectedresponse_seq`;
CREATE TABLE `vtiger_expectedresponse_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_faq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faq`;
CREATE TABLE `vtiger_faq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `faq_id_idx`(`id`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_faq` FOREIGN KEY (`id`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4148280 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_faqcategories
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faqcategories`;
CREATE TABLE `vtiger_faqcategories`  (
  `faqcategories_id` int(19) NOT NULL AUTO_INCREMENT,
  `faqcategories` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`faqcategories_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_faqcategories_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faqcategories_seq`;
CREATE TABLE `vtiger_faqcategories_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_faqcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faqcf`;
CREATE TABLE `vtiger_faqcf`  (
  `faqid` int(11) NOT NULL,
  PRIMARY KEY (`faqid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_faqcomments
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faqcomments`;
CREATE TABLE `vtiger_faqcomments`  (
  `commentid` int(19) NOT NULL AUTO_INCREMENT,
  `faqid` int(19) NULL DEFAULT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`commentid`) USING BTREE,
  INDEX `faqcomments_faqid_idx`(`faqid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_faqcomments` FOREIGN KEY (`faqid`) REFERENCES `vtiger_faq` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_faqstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faqstatus`;
CREATE TABLE `vtiger_faqstatus`  (
  `faqstatus_id` int(19) NOT NULL AUTO_INCREMENT,
  `faqstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`faqstatus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_faqstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_faqstatus_seq`;
CREATE TABLE `vtiger_faqstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_field
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_field`;
CREATE TABLE `vtiger_field`  (
  `tabid` int(19) NOT NULL,
  `fieldid` int(19) NOT NULL AUTO_INCREMENT,
  `columnname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tablename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `generatedtype` int(19) NOT NULL DEFAULT 0,
  `uitype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldlabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `readonly` int(1) NOT NULL,
  `presence` int(19) NOT NULL DEFAULT 1,
  `defaultvalue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `maximumlength` int(19) NULL DEFAULT NULL,
  `sequence` int(19) NULL DEFAULT NULL,
  `block` int(19) NULL DEFAULT NULL,
  `displaytype` int(19) NULL DEFAULT NULL,
  `typeofdata` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quickcreate` int(10) NOT NULL DEFAULT 1,
  `quickcreatesequence` int(19) NULL DEFAULT NULL,
  `info_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `masseditable` int(10) NOT NULL DEFAULT 1,
  `helpinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`fieldid`) USING BTREE,
  INDEX `field_tabid_idx`(`tabid`) USING BTREE,
  INDEX `field_fieldname_idx`(`fieldname`) USING BTREE,
  INDEX `field_block_idx`(`block`) USING BTREE,
  INDEX `field_displaytype_idx`(`displaytype`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_field` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 744 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_field_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_field_seq`;
CREATE TABLE `vtiger_field_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_fieldformulas
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_fieldformulas`;
CREATE TABLE `vtiger_fieldformulas`  (
  `expressionid` int(11) NOT NULL DEFAULT 0,
  `modulename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expression_engine` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`expressionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_fieldformulas_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_fieldformulas_seq`;
CREATE TABLE `vtiger_fieldformulas_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_fieldmodulerel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_fieldmodulerel`;
CREATE TABLE `vtiger_fieldmodulerel`  (
  `fieldid` int(11) NOT NULL,
  `module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relmodule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_files
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_files`;
CREATE TABLE `vtiger_files`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longblob NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assigned_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `files_assigned_user_id_name_deleted_idx`(`assigned_user_id`, `name`, `deleted`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_freetagged_objects
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_freetagged_objects`;
CREATE TABLE `vtiger_freetagged_objects`  (
  `tag_id` int(20) NOT NULL DEFAULT 0,
  `tagger_id` int(20) NOT NULL DEFAULT 0,
  `object_id` int(20) NOT NULL DEFAULT 0,
  `tagged_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`, `tagger_id`, `object_id`) USING BTREE,
  INDEX `freetagged_objects_tag_id_tagger_id_object_id_idx`(`tag_id`, `tagger_id`, `object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_freetags
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_freetags`;
CREATE TABLE `vtiger_freetags`  (
  `id` int(19) NOT NULL,
  `tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `raw_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_freetags_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_freetags_seq`;
CREATE TABLE `vtiger_freetags_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_glacct
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_glacct`;
CREATE TABLE `vtiger_glacct`  (
  `glacctid` int(19) NOT NULL AUTO_INCREMENT,
  `glacct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`glacctid`) USING BTREE,
  UNIQUE INDEX `glacct_glacct_idx`(`glacct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_glacct_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_glacct_seq`;
CREATE TABLE `vtiger_glacct_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_group2grouprel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_group2grouprel`;
CREATE TABLE `vtiger_group2grouprel`  (
  `groupid` int(19) NOT NULL,
  `containsgroupid` int(19) NOT NULL,
  PRIMARY KEY (`groupid`, `containsgroupid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_group2grouprel` FOREIGN KEY (`groupid`) REFERENCES `vtiger_groups` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_group2role
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_group2role`;
CREATE TABLE `vtiger_group2role`  (
  `groupid` int(19) NOT NULL,
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`groupid`, `roleid`) USING BTREE,
  INDEX `fk_2_vtiger_group2role`(`roleid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_group2role` FOREIGN KEY (`roleid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_group2rs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_group2rs`;
CREATE TABLE `vtiger_group2rs`  (
  `groupid` int(19) NOT NULL,
  `roleandsubid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`groupid`, `roleandsubid`) USING BTREE,
  INDEX `fk_2_vtiger_group2rs`(`roleandsubid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_group2rs` FOREIGN KEY (`roleandsubid`) REFERENCES `vtiger_role` (`roleid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_groups
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_groups`;
CREATE TABLE `vtiger_groups`  (
  `groupid` int(19) NOT NULL,
  `groupname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`groupid`) USING BTREE,
  UNIQUE INDEX `groups_groupname_idx`(`groupname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_headers
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_headers`;
CREATE TABLE `vtiger_headers`  (
  `fileid` int(3) NOT NULL AUTO_INCREMENT,
  `headernames` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fileid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_home_layout
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_home_layout`;
CREATE TABLE `vtiger_home_layout`  (
  `userid` int(19) NOT NULL,
  `layout` int(19) NOT NULL DEFAULT 4,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homedashbd
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homedashbd`;
CREATE TABLE `vtiger_homedashbd`  (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `dashbdname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dashbdtype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stuffid`) USING BTREE,
  INDEX `stuff_stuffid_idx`(`stuffid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_homedashbd` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homedefault
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homedefault`;
CREATE TABLE `vtiger_homedefault`  (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `hometype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maxentries` int(19) NULL DEFAULT NULL,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stuffid`) USING BTREE,
  INDEX `stuff_stuffid_idx`(`stuffid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_homedefault` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homemodule
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homemodule`;
CREATE TABLE `vtiger_homemodule`  (
  `stuffid` int(19) NOT NULL,
  `modulename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  `customviewid` int(19) NOT NULL,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`stuffid`) USING BTREE,
  INDEX `stuff_stuffid_idx`(`stuffid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_homemodule` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homemoduleflds
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homemoduleflds`;
CREATE TABLE `vtiger_homemoduleflds`  (
  `stuffid` int(19) NULL DEFAULT NULL,
  `fieldname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `stuff_stuffid_idx`(`stuffid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_homemoduleflds` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homemodule` (`stuffid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homereportchart
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homereportchart`;
CREATE TABLE `vtiger_homereportchart`  (
  `stuffid` int(11) NOT NULL,
  `reportid` int(19) NULL DEFAULT NULL,
  `reportcharttype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stuffid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homerss
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homerss`;
CREATE TABLE `vtiger_homerss`  (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxentries` int(19) NOT NULL,
  PRIMARY KEY (`stuffid`) USING BTREE,
  INDEX `stuff_stuffid_idx`(`stuffid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_homerss` FOREIGN KEY (`stuffid`) REFERENCES `vtiger_homestuff` (`stuffid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homestuff
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homestuff`;
CREATE TABLE `vtiger_homestuff`  (
  `stuffid` int(19) NOT NULL DEFAULT 0,
  `stuffsequence` int(19) NOT NULL DEFAULT 0,
  `stufftype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(19) NOT NULL,
  `visible` int(10) NOT NULL DEFAULT 0,
  `stufftitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stuffid`) USING BTREE,
  INDEX `stuff_stuffid_idx`(`stuffid`) USING BTREE,
  INDEX `fk_1_vtiger_homestuff`(`userid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_homestuff` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_homestuff_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_homestuff_seq`;
CREATE TABLE `vtiger_homestuff_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_import_2172
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_2172`;
CREATE TABLE `vtiger_import_2172`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NULL DEFAULT 0,
  `recordid` int(11) NULL DEFAULT NULL,
  `cf_667` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `assigned_user_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ticketstatus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ticketseverities` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ticketpriorities` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_731` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_717` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_663` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_718` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_706` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `createdtime` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_658` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_705` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_721` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_704` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_722` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_723` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_659` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_735` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_734` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_644` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_727` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_720` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_708` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_701` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_714` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_709` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_707` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_726` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_715` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_725` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_713` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_660` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `cf_733` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_import_7029
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_7029`;
CREATE TABLE `vtiger_import_7029`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NULL DEFAULT 0,
  `recordid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_import_9581
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_9581`;
CREATE TABLE `vtiger_import_9581`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NULL DEFAULT 0,
  `recordid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_import_locks
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_locks`;
CREATE TABLE `vtiger_import_locks`  (
  `vtiger_import_lock_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `importid` int(11) NOT NULL,
  `locked_since` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`vtiger_import_lock_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_import_locks_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_locks_seq`;
CREATE TABLE `vtiger_import_locks_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_import_maps
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_maps`;
CREATE TABLE `vtiger_import_maps`  (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longblob NULL,
  `has_header` int(1) NOT NULL DEFAULT 1,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `assigned_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_published` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `import_maps_assigned_user_id_module_name_deleted_idx`(`assigned_user_id`, `module`, `name`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_import_queue
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_queue`;
CREATE TABLE `vtiger_import_queue`  (
  `importid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `field_mapping` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `default_values` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `merge_type` int(11) NULL DEFAULT NULL,
  `merge_fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`importid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_import_queue_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_import_queue_seq`;
CREATE TABLE `vtiger_import_queue_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_industry
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_industry`;
CREATE TABLE `vtiger_industry`  (
  `industryid` int(19) NOT NULL AUTO_INCREMENT,
  `industry` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`industryid`) USING BTREE,
  UNIQUE INDEX `industry_industry_idx`(`industry`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_industry_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_industry_seq`;
CREATE TABLE `vtiger_industry_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_inventory_tandc
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventory_tandc`;
CREATE TABLE `vtiger_inventory_tandc`  (
  `id` int(19) NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tandc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_inventory_tandc_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventory_tandc_seq`;
CREATE TABLE `vtiger_inventory_tandc_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_inventorynotification
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventorynotification`;
CREATE TABLE `vtiger_inventorynotification`  (
  `notificationid` int(19) NOT NULL AUTO_INCREMENT,
  `notificationname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notificationsubject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notificationbody` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`notificationid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_inventorynotification_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventorynotification_seq`;
CREATE TABLE `vtiger_inventorynotification_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_inventoryproductrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventoryproductrel`;
CREATE TABLE `vtiger_inventoryproductrel`  (
  `id` int(19) NULL DEFAULT NULL,
  `productid` int(19) NULL DEFAULT NULL,
  `sequence_no` int(4) NULL DEFAULT NULL,
  `quantity` decimal(25, 3) NULL DEFAULT NULL,
  `listprice` decimal(25, 3) NULL DEFAULT NULL,
  `discount_percent` decimal(7, 3) NULL DEFAULT NULL,
  `discount_amount` decimal(25, 3) NULL DEFAULT NULL,
  `comment` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `incrementondel` int(11) NOT NULL DEFAULT 0,
  `lineitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax1` decimal(7, 3) NULL DEFAULT NULL,
  `tax2` decimal(7, 3) NULL DEFAULT NULL,
  `tax3` decimal(7, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`lineitem_id`) USING BTREE,
  INDEX `inventoryproductrel_id_idx`(`id`) USING BTREE,
  INDEX `inventoryproductrel_productid_idx`(`productid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_inventoryshippingrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventoryshippingrel`;
CREATE TABLE `vtiger_inventoryshippingrel`  (
  `id` int(19) NULL DEFAULT NULL,
  `shtax1` decimal(7, 3) NULL DEFAULT NULL,
  `shtax2` decimal(7, 3) NULL DEFAULT NULL,
  `shtax3` decimal(7, 3) NULL DEFAULT NULL,
  INDEX `inventoryishippingrel_id_idx`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_inventorysubproductrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventorysubproductrel`;
CREATE TABLE `vtiger_inventorysubproductrel`  (
  `id` int(19) NOT NULL,
  `sequence_no` int(10) NOT NULL,
  `productid` int(19) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_inventorytaxinfo
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventorytaxinfo`;
CREATE TABLE `vtiger_inventorytaxinfo`  (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxlabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `percentage` decimal(7, 3) NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`taxid`) USING BTREE,
  INDEX `inventorytaxinfo_taxname_idx`(`taxname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_inventorytaxinfo_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_inventorytaxinfo_seq`;
CREATE TABLE `vtiger_inventorytaxinfo_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_invitees
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invitees`;
CREATE TABLE `vtiger_invitees`  (
  `activityid` int(19) NOT NULL,
  `inviteeid` int(19) NOT NULL,
  PRIMARY KEY (`activityid`, `inviteeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoice
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoice`;
CREATE TABLE `vtiger_invoice`  (
  `invoiceid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salesorderid` int(19) NULL DEFAULT NULL,
  `customerno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactid` int(19) NULL DEFAULT NULL,
  `notes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoicedate` date NULL DEFAULT NULL,
  `duedate` date NULL DEFAULT NULL,
  `invoiceterms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adjustment` decimal(25, 3) NULL DEFAULT NULL,
  `salescommission` decimal(25, 3) NULL DEFAULT NULL,
  `exciseduty` decimal(25, 3) NULL DEFAULT NULL,
  `subtotal` decimal(25, 3) NULL DEFAULT NULL,
  `total` decimal(25, 3) NULL DEFAULT NULL,
  `taxtype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount_percent` decimal(25, 3) NULL DEFAULT NULL,
  `discount_amount` decimal(25, 3) NULL DEFAULT NULL,
  `s_h_amount` decimal(25, 3) NULL DEFAULT NULL,
  `shipping` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accountid` int(19) NULL DEFAULT NULL,
  `terms_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `purchaseorder` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoicestatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10, 3) NOT NULL DEFAULT 1.000,
  PRIMARY KEY (`invoiceid`) USING BTREE,
  INDEX `invoice_purchaseorderid_idx`(`invoiceid`) USING BTREE,
  INDEX `fk_2_vtiger_invoice`(`salesorderid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_invoice` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoice_recurring_info
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoice_recurring_info`;
CREATE TABLE `vtiger_invoice_recurring_info`  (
  `salesorderid` int(11) NULL DEFAULT NULL,
  `recurring_frequency` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_period` date NULL DEFAULT NULL,
  `end_period` date NULL DEFAULT NULL,
  `last_recurring_date` date NULL DEFAULT NULL,
  `payment_duration` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice_status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoicebillads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoicebillads`;
CREATE TABLE `vtiger_invoicebillads`  (
  `invoicebilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`invoicebilladdressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_invoicebillads` FOREIGN KEY (`invoicebilladdressid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoicecf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoicecf`;
CREATE TABLE `vtiger_invoicecf`  (
  `invoiceid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`invoiceid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_invoicecf` FOREIGN KEY (`invoiceid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoiceshipads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoiceshipads`;
CREATE TABLE `vtiger_invoiceshipads`  (
  `invoiceshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`invoiceshipaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_invoiceshipads` FOREIGN KEY (`invoiceshipaddressid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoicestatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoicestatus`;
CREATE TABLE `vtiger_invoicestatus`  (
  `invoicestatusid` int(19) NOT NULL AUTO_INCREMENT,
  `invoicestatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`invoicestatusid`) USING BTREE,
  UNIQUE INDEX `invoicestatus_invoiestatus_idx`(`invoicestatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_invoicestatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoicestatus_seq`;
CREATE TABLE `vtiger_invoicestatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_invoicestatushistory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_invoicestatushistory`;
CREATE TABLE `vtiger_invoicestatushistory`  (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(19) NOT NULL,
  `accountname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(10, 0) NULL DEFAULT NULL,
  `invoicestatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`historyid`) USING BTREE,
  INDEX `invoicestatushistory_invoiceid_idx`(`invoiceid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_invoicestatushistory` FOREIGN KEY (`invoiceid`) REFERENCES `vtiger_invoice` (`invoiceid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_language
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_language`;
CREATE TABLE `vtiger_language`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastupdated` datetime NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL,
  `isdefault` int(1) NULL DEFAULT NULL,
  `active` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_language_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_language_seq`;
CREATE TABLE `vtiger_language_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_lar
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_lar`;
CREATE TABLE `vtiger_lar`  (
  `larid` int(19) NOT NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdby` int(19) NOT NULL DEFAULT 0,
  `createdon` date NOT NULL,
  PRIMARY KEY (`larid`) USING BTREE,
  UNIQUE INDEX `lar_name_idx`(`name`) USING BTREE,
  INDEX `lar_createdby_idx`(`createdby`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_lar` FOREIGN KEY (`createdby`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_lastcomment
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_lastcomment`;
CREATE TABLE `vtiger_lastcomment`  (
  `lastcommentid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_lastcommentcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_lastcommentcf`;
CREATE TABLE `vtiger_lastcommentcf`  (
  `lastcommentid` int(11) NOT NULL,
  PRIMARY KEY (`lastcommentid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_lead_view
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_lead_view`;
CREATE TABLE `vtiger_lead_view`  (
  `lead_viewid` int(19) NOT NULL AUTO_INCREMENT,
  `lead_view` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`lead_viewid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_lead_view_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_lead_view_seq`;
CREATE TABLE `vtiger_lead_view_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_leadacctrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadacctrel`;
CREATE TABLE `vtiger_leadacctrel`  (
  `leadid` int(19) NOT NULL DEFAULT 0,
  `accountid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`leadid`) USING BTREE,
  INDEX `leadacctrel_accountid_idx`(`accountid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_leadacctrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadaddress
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadaddress`;
CREATE TABLE `vtiger_leadaddress`  (
  `leadaddressid` int(19) NOT NULL DEFAULT 0,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lane` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leadaddresstype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Billing',
  PRIMARY KEY (`leadaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_leadaddress` FOREIGN KEY (`leadaddressid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadcontrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadcontrel`;
CREATE TABLE `vtiger_leadcontrel`  (
  `leadid` int(19) NOT NULL DEFAULT 0,
  `contactid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`leadid`) USING BTREE,
  INDEX `leadcontrel_contactid_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_leadcontrel` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leaddetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leaddetails`;
CREATE TABLE `vtiger_leaddetails`  (
  `leadid` int(19) NOT NULL,
  `lead_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interest` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salutation` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `annualrevenue` int(19) NULL DEFAULT 0,
  `industry` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `campaign` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rating` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leadstatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leadsource` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `converted` int(1) NULL DEFAULT 0,
  `designation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SalesMan',
  `licencekeystatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `space` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `priority` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `demorequest` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `partnercontact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productversion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maildate` date NULL DEFAULT NULL,
  `nextstepdate` date NULL DEFAULT NULL,
  `fundingsituation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purpose` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `evaluationstatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transferdate` date NULL DEFAULT NULL,
  `revenuetype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `noofemployees` int(50) NULL DEFAULT NULL,
  `secondaryemail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignleadchk` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`leadid`) USING BTREE,
  INDEX `leaddetails_converted_leadstatus_idx`(`converted`, `leadstatus`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_leaddetails` FOREIGN KEY (`leadid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadpotrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadpotrel`;
CREATE TABLE `vtiger_leadpotrel`  (
  `leadid` int(19) NOT NULL DEFAULT 0,
  `potentialid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`potentialid`) USING BTREE,
  UNIQUE INDEX `leadpotrel_leadid_idx`(`leadid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_leadpotrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadscf`;
CREATE TABLE `vtiger_leadscf`  (
  `leadid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`leadid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_leadscf` FOREIGN KEY (`leadid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadsource
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadsource`;
CREATE TABLE `vtiger_leadsource`  (
  `leadsourceid` int(19) NOT NULL AUTO_INCREMENT,
  `leadsource` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`leadsourceid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadsource_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadsource_seq`;
CREATE TABLE `vtiger_leadsource_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_leadstage
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadstage`;
CREATE TABLE `vtiger_leadstage`  (
  `leadstageid` int(19) NOT NULL AUTO_INCREMENT,
  `stage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`leadstageid`) USING BTREE,
  UNIQUE INDEX `leadstage_stage_idx`(`stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadstatus`;
CREATE TABLE `vtiger_leadstatus`  (
  `leadstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `leadstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`leadstatusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_leadstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadstatus_seq`;
CREATE TABLE `vtiger_leadstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_leadsubdetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_leadsubdetails`;
CREATE TABLE `vtiger_leadsubdetails`  (
  `leadsubscriptionid` int(19) NOT NULL DEFAULT 0,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `callornot` int(1) NULL DEFAULT 0,
  `readornot` int(1) NULL DEFAULT 0,
  `empct` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`leadsubscriptionid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_leadsubdetails` FOREIGN KEY (`leadsubscriptionid`) REFERENCES `vtiger_leaddetails` (`leadid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_licencekeystatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_licencekeystatus`;
CREATE TABLE `vtiger_licencekeystatus`  (
  `licencekeystatusid` int(19) NOT NULL AUTO_INCREMENT,
  `licencekeystatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`licencekeystatusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_links
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_links`;
CREATE TABLE `vtiger_links`  (
  `linkid` int(11) NOT NULL,
  `tabid` int(11) NULL DEFAULT NULL,
  `linktype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linklabel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkicon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL,
  `handler_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler_class` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`linkid`) USING BTREE,
  INDEX `link_tabidtype_idx`(`tabid`, `linktype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_links_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_links_seq`;
CREATE TABLE `vtiger_links_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_loginhistory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_loginhistory`;
CREATE TABLE `vtiger_loginhistory`  (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_ip` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logout_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3347141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mail_accounts
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mail_accounts`;
CREATE TABLE `vtiger_mail_accounts`  (
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail_protocol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mail_password` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mail_servername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `box_refresh` int(10) NULL DEFAULT NULL,
  `mails_per_page` int(10) NULL DEFAULT NULL,
  `ssltype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sslmeth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_mailer` int(1) NULL DEFAULT 0,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `set_default` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailmanager_mailattachments
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailmanager_mailattachments`;
CREATE TABLE `vtiger_mailmanager_mailattachments`  (
  `userid` int(11) NULL DEFAULT NULL,
  `muid` int(11) NULL DEFAULT NULL,
  `aname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastsavedtime` int(11) NULL DEFAULT NULL,
  `attachid` int(19) NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `userid_muid_idx`(`userid`, `muid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailmanager_mailrecord
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailmanager_mailrecord`;
CREATE TABLE `vtiger_mailmanager_mailrecord`  (
  `userid` int(11) NULL DEFAULT NULL,
  `mfrom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mcc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mbcc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mdate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msubject` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mbody` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mcharset` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misbodyhtml` int(1) NULL DEFAULT NULL,
  `mplainmessage` int(1) NULL DEFAULT NULL,
  `mhtmlmessage` int(1) NULL DEFAULT NULL,
  `muniqueid` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mbodyparsed` int(1) NULL DEFAULT NULL,
  `muid` int(11) NULL DEFAULT NULL,
  `lastsavedtime` int(11) NULL DEFAULT NULL,
  INDEX `userid_lastsavedtime_idx`(`userid`, `lastsavedtime`) USING BTREE,
  INDEX `userid_muid_idx`(`userid`, `muid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailmanager_mailrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailmanager_mailrel`;
CREATE TABLE `vtiger_mailmanager_mailrel`  (
  `mailuid` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crmid` int(11) NULL DEFAULT NULL,
  `emailid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailscanner
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailscanner`;
CREATE TABLE `vtiger_mailscanner`  (
  `scannerid` int(11) NOT NULL AUTO_INCREMENT,
  `scannername` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `protocol` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ssltype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sslmethod` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `connecturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `searchfor` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `markas` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isvalid` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`scannerid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailscanner_actions
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailscanner_actions`;
CREATE TABLE `vtiger_mailscanner_actions`  (
  `actionid` int(11) NOT NULL AUTO_INCREMENT,
  `scannerid` int(11) NULL DEFAULT NULL,
  `actiontype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lookup` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`actionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailscanner_folders
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailscanner_folders`;
CREATE TABLE `vtiger_mailscanner_folders`  (
  `folderid` int(11) NOT NULL AUTO_INCREMENT,
  `scannerid` int(11) NULL DEFAULT NULL,
  `foldername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastscan` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rescan` int(1) NULL DEFAULT NULL,
  `enabled` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`folderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailscanner_ids
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailscanner_ids`;
CREATE TABLE `vtiger_mailscanner_ids`  (
  `scannerid` int(11) NULL DEFAULT NULL,
  `messageid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `crmid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailscanner_ruleactions
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailscanner_ruleactions`;
CREATE TABLE `vtiger_mailscanner_ruleactions`  (
  `ruleid` int(11) NULL DEFAULT NULL,
  `actionid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mailscanner_rules
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mailscanner_rules`;
CREATE TABLE `vtiger_mailscanner_rules`  (
  `ruleid` int(11) NOT NULL AUTO_INCREMENT,
  `scannerid` int(11) NULL DEFAULT NULL,
  `fromaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subjectop` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bodyop` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matchusing` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ruleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_manufacturer`;
CREATE TABLE `vtiger_manufacturer`  (
  `manufacturerid` int(19) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`manufacturerid`) USING BTREE,
  UNIQUE INDEX `manufacturer_manufacturer_idx`(`manufacturer`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_manufacturer_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_manufacturer_seq`;
CREATE TABLE `vtiger_manufacturer_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_mobile_alerts
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mobile_alerts`;
CREATE TABLE `vtiger_mobile_alerts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handler_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handler_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(11) NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_modcomments
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modcomments`;
CREATE TABLE `vtiger_modcomments`  (
  `modcommentsid` int(11) NULL DEFAULT NULL,
  `commentcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `related_to` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_comments` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_modcommentscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modcommentscf`;
CREATE TABLE `vtiger_modcommentscf`  (
  `modcommentsid` int(11) NOT NULL,
  PRIMARY KEY (`modcommentsid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_modentity_num
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modentity_num`;
CREATE TABLE `vtiger_modentity_num`  (
  `num_id` int(19) NOT NULL,
  `semodule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `start_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cur_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`num_id`) USING BTREE,
  UNIQUE INDEX `num_idx`(`num_id`) USING BTREE,
  INDEX `semodule_active_idx`(`semodule`, `active`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_modentity_num_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modentity_num_seq`;
CREATE TABLE `vtiger_modentity_num_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_modtracker_basic
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modtracker_basic`;
CREATE TABLE `vtiger_modtracker_basic`  (
  `id` int(20) NOT NULL,
  `crmid` int(20) NULL DEFAULT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whodid` int(20) NULL DEFAULT NULL,
  `changedon` datetime NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_modtracker_detail
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modtracker_detail`;
CREATE TABLE `vtiger_modtracker_detail`  (
  `id` int(11) NULL DEFAULT NULL,
  `fieldname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prevalue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postvalue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_modtracker_tabs
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_modtracker_tabs`;
CREATE TABLE `vtiger_modtracker_tabs`  (
  `tabid` int(11) NOT NULL,
  `visible` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`tabid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mypending
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mypending`;
CREATE TABLE `vtiger_mypending`  (
  `mypendingid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_mypendingcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_mypendingcf`;
CREATE TABLE `vtiger_mypendingcf`  (
  `mypendingid` int(11) NOT NULL,
  PRIMARY KEY (`mypendingid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_notebook_contents
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_notebook_contents`;
CREATE TABLE `vtiger_notebook_contents`  (
  `userid` int(19) NOT NULL,
  `notebookid` int(19) NOT NULL,
  `contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_notes
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_notes`;
CREATE TABLE `vtiger_notes`  (
  `notesid` int(19) NOT NULL DEFAULT 0,
  `note_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notecontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `folderid` int(19) NOT NULL DEFAULT 1,
  `filetype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filelocationtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filedownloadcount` int(19) NULL DEFAULT NULL,
  `filestatus` int(19) NULL DEFAULT NULL,
  `filesize` int(19) NOT NULL DEFAULT 0,
  `fileversion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`notesid`) USING BTREE,
  INDEX `notes_title_idx`(`title`) USING BTREE,
  INDEX `notes_notesid_idx`(`notesid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_notes` FOREIGN KEY (`notesid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_notescf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_notescf`;
CREATE TABLE `vtiger_notescf`  (
  `notesid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`notesid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_notificationscheduler
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_notificationscheduler`;
CREATE TABLE `vtiger_notificationscheduler`  (
  `schedulednotificationid` int(19) NOT NULL AUTO_INCREMENT,
  `schedulednotificationname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` int(1) NULL DEFAULT NULL,
  `notificationsubject` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notificationbody` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`schedulednotificationid`) USING BTREE,
  UNIQUE INDEX `notificationscheduler_schedulednotificationname_idx`(`schedulednotificationname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_notificationscheduler_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_notificationscheduler_seq`;
CREATE TABLE `vtiger_notificationscheduler_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_opportunity_type
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_opportunity_type`;
CREATE TABLE `vtiger_opportunity_type`  (
  `opptypeid` int(19) NOT NULL AUTO_INCREMENT,
  `opportunity_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`opptypeid`) USING BTREE,
  UNIQUE INDEX `opportunity_type_opportunity_type_idx`(`opportunity_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_opportunity_type_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_opportunity_type_seq`;
CREATE TABLE `vtiger_opportunity_type_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_opportunitystage
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_opportunitystage`;
CREATE TABLE `vtiger_opportunitystage`  (
  `potstageid` int(19) NOT NULL AUTO_INCREMENT,
  `stage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `probability` decimal(3, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`potstageid`) USING BTREE,
  UNIQUE INDEX `opportunitystage_stage_idx`(`stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_org_share_action2tab
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_org_share_action2tab`;
CREATE TABLE `vtiger_org_share_action2tab`  (
  `share_action_id` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  PRIMARY KEY (`share_action_id`, `tabid`) USING BTREE,
  INDEX `fk_2_vtiger_org_share_action2tab`(`tabid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_org_share_action2tab` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_org_share_action_mapping
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_org_share_action_mapping`;
CREATE TABLE `vtiger_org_share_action_mapping`  (
  `share_action_id` int(19) NOT NULL,
  `share_action_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`share_action_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_organizationdetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_organizationdetails`;
CREATE TABLE `vtiger_organizationdetails`  (
  `organization_id` int(11) NOT NULL,
  `organizationname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logoname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`organization_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_organizationdetails_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_organizationdetails_seq`;
CREATE TABLE `vtiger_organizationdetails_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ownernotify
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ownernotify`;
CREATE TABLE `vtiger_ownernotify`  (
  `crmid` int(19) NULL DEFAULT NULL,
  `smownerid` int(19) NULL DEFAULT NULL,
  `flag` int(3) NULL DEFAULT NULL,
  INDEX `ownernotify_crmid_flag_idx`(`crmid`, `flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_parenttab
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_parenttab`;
CREATE TABLE `vtiger_parenttab`  (
  `parenttabid` int(19) NOT NULL,
  `parenttab_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence` int(10) NOT NULL,
  `visible` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`parenttabid`) USING BTREE,
  INDEX `parenttab_parenttabid_parenttabl_label_visible_idx`(`parenttabid`, `parenttab_label`, `visible`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_parenttabrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_parenttabrel`;
CREATE TABLE `vtiger_parenttabrel`  (
  `parenttabid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sequence` int(3) NOT NULL,
  INDEX `parenttabrel_tabid_parenttabid_idx`(`tabid`, `parenttabid`) USING BTREE,
  INDEX `fk_2_vtiger_parenttabrel`(`parenttabid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_parenttabrel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_2_vtiger_parenttabrel` FOREIGN KEY (`parenttabid`) REFERENCES `vtiger_parenttab` (`parenttabid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_payment_duration
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_payment_duration`;
CREATE TABLE `vtiger_payment_duration`  (
  `payment_duration_id` int(11) NULL DEFAULT NULL,
  `payment_duration` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortorderid` int(11) NULL DEFAULT NULL,
  `presence` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_payment_duration_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_payment_duration_seq`;
CREATE TABLE `vtiger_payment_duration_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_payslip
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_payslip`;
CREATE TABLE `vtiger_payslip`  (
  `payslipid` int(11) NULL DEFAULT NULL,
  `payslipname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paysliptype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `month` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_payslipcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_payslipcf`;
CREATE TABLE `vtiger_payslipcf`  (
  `payslipid` int(11) NOT NULL,
  `cf_698` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_699` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`payslipid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_paysliptype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_paysliptype`;
CREATE TABLE `vtiger_paysliptype`  (
  `paysliptypeid` int(11) NOT NULL AUTO_INCREMENT,
  `paysliptype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`paysliptypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_paysliptype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_paysliptype_seq`;
CREATE TABLE `vtiger_paysliptype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_pbxmanager
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_pbxmanager`;
CREATE TABLE `vtiger_pbxmanager`  (
  `pbxmanagerid` int(11) NULL DEFAULT NULL,
  `callfrom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `callto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeofcall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_picklist
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_picklist`;
CREATE TABLE `vtiger_picklist`  (
  `picklistid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`picklistid`) USING BTREE,
  UNIQUE INDEX `picklist_name_idx`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_picklist_dependency
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_picklist_dependency`;
CREATE TABLE `vtiger_picklist_dependency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabid` int(19) NOT NULL,
  `sourcefield` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `targetfield` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sourcevalue` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `targetvalues` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `criteria` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `source`(`sourcevalue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7749 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_picklist_dependency_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_picklist_dependency_seq`;
CREATE TABLE `vtiger_picklist_dependency_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_picklist_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_picklist_seq`;
CREATE TABLE `vtiger_picklist_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_picklistvalues_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_picklistvalues_seq`;
CREATE TABLE `vtiger_picklistvalues_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_pobillads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_pobillads`;
CREATE TABLE `vtiger_pobillads`  (
  `pobilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pobilladdressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_pobillads` FOREIGN KEY (`pobilladdressid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_portal
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_portal`;
CREATE TABLE `vtiger_portal`  (
  `portalid` int(19) NOT NULL,
  `portalname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `portalurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence` int(3) NOT NULL,
  `setdefault` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`portalid`) USING BTREE,
  INDEX `portal_portalname_idx`(`portalname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_portal_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_portal_seq`;
CREATE TABLE `vtiger_portal_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_portalinfo
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_portalinfo`;
CREATE TABLE `vtiger_portalinfo`  (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_time` datetime NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL,
  `logout_time` datetime NULL DEFAULT NULL,
  `isactive` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_portalinfo` FOREIGN KEY (`id`) REFERENCES `vtiger_contactdetails` (`contactid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_poshipads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_poshipads`;
CREATE TABLE `vtiger_poshipads`  (
  `poshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`poshipaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_poshipads` FOREIGN KEY (`poshipaddressid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_postatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_postatus`;
CREATE TABLE `vtiger_postatus`  (
  `postatusid` int(19) NOT NULL AUTO_INCREMENT,
  `postatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`postatusid`) USING BTREE,
  UNIQUE INDEX `postatus_postatus_idx`(`postatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_postatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_postatus_seq`;
CREATE TABLE `vtiger_postatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_postatushistory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_postatushistory`;
CREATE TABLE `vtiger_postatushistory`  (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `purchaseorderid` int(19) NOT NULL,
  `vendorname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(10, 0) NULL DEFAULT NULL,
  `postatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`historyid`) USING BTREE,
  INDEX `postatushistory_purchaseorderid_idx`(`purchaseorderid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_postatushistory` FOREIGN KEY (`purchaseorderid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_potcompetitorrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_potcompetitorrel`;
CREATE TABLE `vtiger_potcompetitorrel`  (
  `potentialid` int(19) NOT NULL,
  `competitorid` int(19) NOT NULL,
  PRIMARY KEY (`potentialid`, `competitorid`) USING BTREE,
  INDEX `potcompetitorrel_potentialid_idx`(`potentialid`) USING BTREE,
  INDEX `potcompetitorrel_competitorid_idx`(`competitorid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_potcompetitorrel` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_potential
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_potential`;
CREATE TABLE `vtiger_potential`  (
  `potentialid` int(19) NOT NULL DEFAULT 0,
  `potential_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `related_to` int(19) NULL DEFAULT NULL,
  `potentialname` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` decimal(14, 2) NULL DEFAULT 0.00,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `closingdate` date NULL DEFAULT NULL,
  `typeofrevenue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextstep` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `private` int(1) NULL DEFAULT 0,
  `probability` decimal(7, 3) NULL DEFAULT 0.000,
  `campaignid` int(19) NULL DEFAULT NULL,
  `sales_stage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `potentialtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leadsource` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productid` int(50) NULL DEFAULT NULL,
  `productversion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quotationref` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `partnercontact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `runtimefee` int(19) NULL DEFAULT 0,
  `followupdate` date NULL DEFAULT NULL,
  `evaluationstatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forecastcategory` int(19) NULL DEFAULT 0,
  `outcomeanalysis` int(19) NULL DEFAULT 0,
  PRIMARY KEY (`potentialid`) USING BTREE,
  INDEX `potential_relatedto_idx`(`related_to`) USING BTREE,
  INDEX `potentail_sales_stage_idx`(`sales_stage`) USING BTREE,
  INDEX `potentail_sales_stage_amount_idx`(`amount`, `sales_stage`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_potential` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_potentialscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_potentialscf`;
CREATE TABLE `vtiger_potentialscf`  (
  `potentialid` int(19) NOT NULL DEFAULT 0,
  `cf_669` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_670` date NULL DEFAULT NULL,
  `cf_671` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_672` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_673` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_674` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_675` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_676` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_677` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_678` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_679` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_680` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_681` decimal(12, 0) NULL DEFAULT NULL,
  `cf_682` decimal(12, 0) NULL DEFAULT NULL,
  `cf_683` decimal(12, 0) NULL DEFAULT NULL,
  `cf_684` decimal(12, 0) NULL DEFAULT NULL,
  `cf_685` date NULL DEFAULT NULL,
  `cf_686` date NULL DEFAULT NULL,
  `cf_687` date NULL DEFAULT NULL,
  `cf_688` decimal(3, 0) NULL DEFAULT NULL,
  `cf_689` decimal(12, 0) NULL DEFAULT NULL,
  `cf_690` decimal(12, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`potentialid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_potentialscf` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_potstagehistory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_potstagehistory`;
CREATE TABLE `vtiger_potstagehistory`  (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `potentialid` int(19) NOT NULL,
  `amount` decimal(10, 0) NULL DEFAULT NULL,
  `stage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `probability` decimal(7, 3) NULL DEFAULT NULL,
  `expectedrevenue` decimal(10, 0) NULL DEFAULT NULL,
  `closedate` date NULL DEFAULT NULL,
  `lastmodified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`historyid`) USING BTREE,
  INDEX `potstagehistory_potentialid_idx`(`potentialid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_potstagehistory` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_pricebook
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_pricebook`;
CREATE TABLE `vtiger_pricebook`  (
  `pricebookid` int(19) NOT NULL DEFAULT 0,
  `pricebook_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` int(1) NULL DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pricebookid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_pricebook` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_pricebookcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_pricebookcf`;
CREATE TABLE `vtiger_pricebookcf`  (
  `pricebookid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pricebookid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_pricebookcf` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_pricebook` (`pricebookid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_pricebookproductrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_pricebookproductrel`;
CREATE TABLE `vtiger_pricebookproductrel`  (
  `pricebookid` int(19) NOT NULL,
  `productid` int(19) NOT NULL,
  `listprice` decimal(25, 3) NULL DEFAULT NULL,
  `usedcurrency` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pricebookid`, `productid`) USING BTREE,
  INDEX `pricebookproductrel_pricebookid_idx`(`pricebookid`) USING BTREE,
  INDEX `pricebookproductrel_productid_idx`(`productid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_pricebookproductrel` FOREIGN KEY (`pricebookid`) REFERENCES `vtiger_pricebook` (`pricebookid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_priority
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_priority`;
CREATE TABLE `vtiger_priority`  (
  `priorityid` int(19) NOT NULL AUTO_INCREMENT,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`priorityid`) USING BTREE,
  UNIQUE INDEX `priority_priority_idx`(`priority`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_productcategory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_productcategory`;
CREATE TABLE `vtiger_productcategory`  (
  `productcategoryid` int(19) NOT NULL AUTO_INCREMENT,
  `productcategory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`productcategoryid`) USING BTREE,
  UNIQUE INDEX `productcategory_productcategory_idx`(`productcategory`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_productcategory_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_productcategory_seq`;
CREATE TABLE `vtiger_productcategory_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_productcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_productcf`;
CREATE TABLE `vtiger_productcf`  (
  `productid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`productid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_productcf` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_productcollaterals
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_productcollaterals`;
CREATE TABLE `vtiger_productcollaterals`  (
  `productid` int(11) NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longblob NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `filename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filesize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filetype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productcollaterals_productid_filename_idx`(`productid`, `filename`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_productcollaterals` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_productcurrencyrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_productcurrencyrel`;
CREATE TABLE `vtiger_productcurrencyrel`  (
  `productid` int(11) NOT NULL,
  `currencyid` int(11) NOT NULL,
  `converted_price` decimal(25, 2) NULL DEFAULT NULL,
  `actual_price` decimal(25, 2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_products
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_products`;
CREATE TABLE `vtiger_products`  (
  `productid` int(11) NOT NULL,
  `product_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productcode` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productcategory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manufacturer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qty_per_unit` decimal(11, 2) NULL DEFAULT 0.00,
  `unit_price` decimal(25, 2) NULL DEFAULT NULL,
  `weight` decimal(11, 3) NULL DEFAULT NULL,
  `pack_size` int(11) NULL DEFAULT NULL,
  `sales_start_date` date NULL DEFAULT NULL,
  `sales_end_date` date NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `cost_factor` int(11) NULL DEFAULT NULL,
  `commissionrate` decimal(7, 3) NULL DEFAULT NULL,
  `commissionmethod` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT 0,
  `usageunit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reorderlevel` int(11) NULL DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxclass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mfr_part_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_part_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serialno` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qtyinstock` decimal(25, 3) NULL DEFAULT NULL,
  `productsheet` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qtyindemand` int(11) NULL DEFAULT NULL,
  `glacct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_id` int(11) NULL DEFAULT NULL,
  `imagename` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  PRIMARY KEY (`productid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_products` FOREIGN KEY (`productid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_producttaxrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_producttaxrel`;
CREATE TABLE `vtiger_producttaxrel`  (
  `productid` int(11) NOT NULL,
  `taxid` int(3) NOT NULL,
  `taxpercentage` decimal(7, 3) NULL DEFAULT NULL,
  INDEX `producttaxrel_productid_idx`(`productid`) USING BTREE,
  INDEX `producttaxrel_taxid_idx`(`taxid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile`;
CREATE TABLE `vtiger_profile`  (
  `profileid` int(10) NOT NULL AUTO_INCREMENT,
  `profilename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`profileid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile2field
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile2field`;
CREATE TABLE `vtiger_profile2field`  (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) NULL DEFAULT NULL,
  `fieldid` int(19) NOT NULL,
  `visible` int(19) NULL DEFAULT NULL,
  `readonly` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`profileid`, `fieldid`) USING BTREE,
  INDEX `profile2field_profileid_tabid_fieldname_idx`(`profileid`, `tabid`) USING BTREE,
  INDEX `profile2field_tabid_profileid_idx`(`tabid`, `profileid`) USING BTREE,
  INDEX `profile2field_visible_profileid_idx`(`visible`, `profileid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile2globalpermissions
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile2globalpermissions`;
CREATE TABLE `vtiger_profile2globalpermissions`  (
  `profileid` int(19) NOT NULL,
  `globalactionid` int(19) NOT NULL,
  `globalactionpermission` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`profileid`, `globalactionid`) USING BTREE,
  INDEX `idx_profile2globalpermissions`(`profileid`, `globalactionid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_profile2globalpermissions` FOREIGN KEY (`profileid`) REFERENCES `vtiger_profile` (`profileid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile2standardpermissions
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile2standardpermissions`;
CREATE TABLE `vtiger_profile2standardpermissions`  (
  `profileid` int(11) NOT NULL,
  `tabid` int(10) NOT NULL,
  `operation` int(10) NOT NULL,
  `permissions` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`profileid`, `tabid`, `operation`) USING BTREE,
  INDEX `profile2standardpermissions_profileid_tabid_operation_idx`(`profileid`, `tabid`, `operation`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile2tab
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile2tab`;
CREATE TABLE `vtiger_profile2tab`  (
  `profileid` int(11) NULL DEFAULT NULL,
  `tabid` int(10) NULL DEFAULT NULL,
  `permissions` int(10) NOT NULL DEFAULT 0,
  INDEX `profile2tab_profileid_tabid_idx`(`profileid`, `tabid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile2utility
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile2utility`;
CREATE TABLE `vtiger_profile2utility`  (
  `profileid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `permission` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`profileid`, `tabid`, `activityid`) USING BTREE,
  INDEX `profile2utility_profileid_tabid_activityid_idx`(`profileid`, `tabid`, `activityid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_profile_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_profile_seq`;
CREATE TABLE `vtiger_profile_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_progress
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_progress`;
CREATE TABLE `vtiger_progress`  (
  `progressid` int(11) NOT NULL AUTO_INCREMENT,
  `progress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`progressid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_progress_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_progress_seq`;
CREATE TABLE `vtiger_progress_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_project
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_project`;
CREATE TABLE `vtiger_project`  (
  `projectid` int(11) NULL DEFAULT NULL,
  `projectname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startdate` date NULL DEFAULT NULL,
  `targetenddate` date NULL DEFAULT NULL,
  `actualenddate` date NULL DEFAULT NULL,
  `targetbudget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectstatus` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectpriority` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `progress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linktoaccountscontacts` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectcf`;
CREATE TABLE `vtiger_projectcf`  (
  `projectid` int(11) NOT NULL,
  PRIMARY KEY (`projectid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectmilestone
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectmilestone`;
CREATE TABLE `vtiger_projectmilestone`  (
  `projectmilestoneid` int(11) NOT NULL,
  `projectmilestonename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectmilestone_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectmilestonedate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projectmilestonetype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`projectmilestoneid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectmilestonecf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectmilestonecf`;
CREATE TABLE `vtiger_projectmilestonecf`  (
  `projectmilestoneid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projectmilestoneid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectmilestonetype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectmilestonetype`;
CREATE TABLE `vtiger_projectmilestonetype`  (
  `projectmilestonetypeid` int(11) NOT NULL AUTO_INCREMENT,
  `projectmilestonetype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projectmilestonetypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectmilestonetype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectmilestonetype_seq`;
CREATE TABLE `vtiger_projectmilestonetype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_projectpriority
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectpriority`;
CREATE TABLE `vtiger_projectpriority`  (
  `projectpriorityid` int(11) NOT NULL AUTO_INCREMENT,
  `projectpriority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projectpriorityid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectpriority_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectpriority_seq`;
CREATE TABLE `vtiger_projectpriority_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_projectstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectstatus`;
CREATE TABLE `vtiger_projectstatus`  (
  `projectstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `projectstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projectstatusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projectstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projectstatus_seq`;
CREATE TABLE `vtiger_projectstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_projecttask
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttask`;
CREATE TABLE `vtiger_projecttask`  (
  `projecttaskid` int(11) NOT NULL,
  `projecttaskname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttask_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttasktype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttaskpriority` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttaskprogress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttaskhours` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startdate` date NULL DEFAULT NULL,
  `enddate` date NULL DEFAULT NULL,
  `projectid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projecttasknumber` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`projecttaskid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projecttaskcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttaskcf`;
CREATE TABLE `vtiger_projecttaskcf`  (
  `projecttaskid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projecttaskid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projecttaskpriority
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttaskpriority`;
CREATE TABLE `vtiger_projecttaskpriority`  (
  `projecttaskpriorityid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttaskpriority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projecttaskpriorityid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projecttaskpriority_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttaskpriority_seq`;
CREATE TABLE `vtiger_projecttaskpriority_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_projecttaskprogress
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttaskprogress`;
CREATE TABLE `vtiger_projecttaskprogress`  (
  `projecttaskprogressid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttaskprogress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projecttaskprogressid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projecttaskprogress_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttaskprogress_seq`;
CREATE TABLE `vtiger_projecttaskprogress_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_projecttasktype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttasktype`;
CREATE TABLE `vtiger_projecttasktype`  (
  `projecttasktypeid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttasktype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projecttasktypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projecttasktype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttasktype_seq`;
CREATE TABLE `vtiger_projecttasktype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_projecttype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttype`;
CREATE TABLE `vtiger_projecttype`  (
  `projecttypeid` int(11) NOT NULL AUTO_INCREMENT,
  `projecttype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`projecttypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_projecttype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_projecttype_seq`;
CREATE TABLE `vtiger_projecttype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_purchaseorder
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_purchaseorder`;
CREATE TABLE `vtiger_purchaseorder`  (
  `purchaseorderid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quoteid` int(19) NULL DEFAULT NULL,
  `vendorid` int(19) NULL DEFAULT NULL,
  `requisition_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchaseorder_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tracking_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactid` int(19) NULL DEFAULT NULL,
  `duedate` date NULL DEFAULT NULL,
  `carrier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adjustment` decimal(25, 3) NULL DEFAULT NULL,
  `salescommission` decimal(25, 3) NULL DEFAULT NULL,
  `exciseduty` decimal(25, 3) NULL DEFAULT NULL,
  `total` decimal(25, 3) NULL DEFAULT NULL,
  `subtotal` decimal(25, 3) NULL DEFAULT NULL,
  `taxtype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount_percent` decimal(25, 3) NULL DEFAULT NULL,
  `discount_amount` decimal(25, 3) NULL DEFAULT NULL,
  `s_h_amount` decimal(25, 3) NULL DEFAULT NULL,
  `terms_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `postatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10, 3) NOT NULL DEFAULT 1.000,
  PRIMARY KEY (`purchaseorderid`) USING BTREE,
  INDEX `purchaseorder_vendorid_idx`(`vendorid`) USING BTREE,
  INDEX `purchaseorder_quoteid_idx`(`quoteid`) USING BTREE,
  INDEX `purchaseorder_contactid_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_4_vtiger_purchaseorder` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_purchaseordercf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_purchaseordercf`;
CREATE TABLE `vtiger_purchaseordercf`  (
  `purchaseorderid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`purchaseorderid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_purchaseordercf` FOREIGN KEY (`purchaseorderid`) REFERENCES `vtiger_purchaseorder` (`purchaseorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quickview
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quickview`;
CREATE TABLE `vtiger_quickview`  (
  `fieldid` int(19) NOT NULL,
  `related_fieldid` int(19) NOT NULL,
  `sequence` int(19) NOT NULL,
  `currentview` int(19) NOT NULL,
  INDEX `fk_1_vtiger_quickview`(`fieldid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_quickview` FOREIGN KEY (`fieldid`) REFERENCES `vtiger_field` (`fieldid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quotes
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotes`;
CREATE TABLE `vtiger_quotes`  (
  `quoteid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `potentialid` int(19) NULL DEFAULT NULL,
  `quotestage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validtill` date NULL DEFAULT NULL,
  `contactid` int(19) NULL DEFAULT NULL,
  `quote_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subtotal` decimal(25, 3) NULL DEFAULT NULL,
  `carrier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipping` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inventorymanager` int(19) NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adjustment` decimal(25, 3) NULL DEFAULT NULL,
  `total` decimal(25, 3) NULL DEFAULT NULL,
  `taxtype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount_percent` decimal(25, 3) NULL DEFAULT NULL,
  `discount_amount` decimal(25, 3) NULL DEFAULT NULL,
  `s_h_amount` decimal(25, 3) NULL DEFAULT NULL,
  `accountid` int(19) NULL DEFAULT NULL,
  `terms_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10, 3) NOT NULL DEFAULT 1.000,
  PRIMARY KEY (`quoteid`) USING BTREE,
  INDEX `quote_quotestage_idx`(`quotestage`) USING BTREE,
  INDEX `quotes_potentialid_idx`(`potentialid`) USING BTREE,
  INDEX `quotes_contactid_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_quotes` FOREIGN KEY (`potentialid`) REFERENCES `vtiger_potential` (`potentialid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quotesbillads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotesbillads`;
CREATE TABLE `vtiger_quotesbillads`  (
  `quotebilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`quotebilladdressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_quotesbillads` FOREIGN KEY (`quotebilladdressid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quotescf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotescf`;
CREATE TABLE `vtiger_quotescf`  (
  `quoteid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`quoteid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_quotescf` FOREIGN KEY (`quoteid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quotesshipads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotesshipads`;
CREATE TABLE `vtiger_quotesshipads`  (
  `quoteshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`quoteshipaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_quotesshipads` FOREIGN KEY (`quoteshipaddressid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quotestage
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotestage`;
CREATE TABLE `vtiger_quotestage`  (
  `quotestageid` int(19) NOT NULL AUTO_INCREMENT,
  `quotestage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`quotestageid`) USING BTREE,
  UNIQUE INDEX `quotestage_quotestage_idx`(`quotestage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_quotestage_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotestage_seq`;
CREATE TABLE `vtiger_quotestage_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_quotestagehistory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_quotestagehistory`;
CREATE TABLE `vtiger_quotestagehistory`  (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `quoteid` int(19) NOT NULL,
  `accountname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(10, 0) NULL DEFAULT NULL,
  `quotestage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`historyid`) USING BTREE,
  INDEX `quotestagehistory_quoteid_idx`(`quoteid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_quotestagehistory` FOREIGN KEY (`quoteid`) REFERENCES `vtiger_quotes` (`quoteid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_rating
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_rating`;
CREATE TABLE `vtiger_rating`  (
  `rating_id` int(19) NOT NULL AUTO_INCREMENT,
  `rating` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rating_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_rating_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_rating_seq`;
CREATE TABLE `vtiger_rating_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_recurring_frequency
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_recurring_frequency`;
CREATE TABLE `vtiger_recurring_frequency`  (
  `recurring_frequency_id` int(11) NULL DEFAULT NULL,
  `recurring_frequency` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sortorderid` int(11) NULL DEFAULT NULL,
  `presence` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_recurring_frequency_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_recurring_frequency_seq`;
CREATE TABLE `vtiger_recurring_frequency_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_recurringevents
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_recurringevents`;
CREATE TABLE `vtiger_recurringevents`  (
  `recurringid` int(19) NOT NULL AUTO_INCREMENT,
  `activityid` int(19) NOT NULL,
  `recurringdate` date NULL DEFAULT NULL,
  `recurringtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recurringfreq` int(19) NULL DEFAULT NULL,
  `recurringinfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`recurringid`) USING BTREE,
  INDEX `fk_1_vtiger_recurringevents`(`activityid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_recurringevents` FOREIGN KEY (`activityid`) REFERENCES `vtiger_activity` (`activityid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_recurringtype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_recurringtype`;
CREATE TABLE `vtiger_recurringtype`  (
  `recurringeventid` int(19) NOT NULL AUTO_INCREMENT,
  `recurringtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`recurringeventid`) USING BTREE,
  UNIQUE INDEX `recurringtype_status_idx`(`recurringtype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_recurringtype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_recurringtype_seq`;
CREATE TABLE `vtiger_recurringtype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_relatedlists
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_relatedlists`;
CREATE TABLE `vtiger_relatedlists`  (
  `relation_id` int(19) NOT NULL,
  `tabid` int(10) NULL DEFAULT NULL,
  `related_tabid` int(10) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(10) NULL DEFAULT NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(10) NOT NULL DEFAULT 0,
  `actions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`relation_id`) USING BTREE,
  INDEX `relatedlists_relation_id_idx`(`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_relatedlists_rb
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_relatedlists_rb`;
CREATE TABLE `vtiger_relatedlists_rb`  (
  `entityid` int(19) NULL DEFAULT NULL,
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rel_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rel_column` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ref_column` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `related_crm_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_relatedlists_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_relatedlists_seq`;
CREATE TABLE `vtiger_relatedlists_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_relcriteria
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_relcriteria`;
CREATE TABLE `vtiger_relcriteria`  (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `comparator` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `groupid` int(11) NULL DEFAULT 1,
  `column_condition` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'and',
  PRIMARY KEY (`queryid`, `columnindex`) USING BTREE,
  INDEX `relcriteria_queryid_idx`(`queryid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_relcriteria` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_relcriteria_grouping
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_relcriteria_grouping`;
CREATE TABLE `vtiger_relcriteria_grouping`  (
  `groupid` int(11) NOT NULL,
  `queryid` int(19) NOT NULL,
  `group_condition` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_expression` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`groupid`, `queryid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_remainder
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_remainder`;
CREATE TABLE `vtiger_remainder`  (
  `remainderid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_remaindercf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_remaindercf`;
CREATE TABLE `vtiger_remaindercf`  (
  `remainderid` int(11) NOT NULL,
  PRIMARY KEY (`remainderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reminder_interval
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reminder_interval`;
CREATE TABLE `vtiger_reminder_interval`  (
  `reminder_intervalid` int(19) NOT NULL AUTO_INCREMENT,
  `reminder_interval` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL,
  `presence` int(1) NOT NULL,
  PRIMARY KEY (`reminder_intervalid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reminder_interval_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reminder_interval_seq`;
CREATE TABLE `vtiger_reminder_interval_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_report
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_report`;
CREATE TABLE `vtiger_report`  (
  `reportid` int(19) NOT NULL,
  `folderid` int(19) NOT NULL,
  `reportname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reporttype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `queryid` int(19) NOT NULL DEFAULT 0,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SAVED',
  `customizable` int(1) NULL DEFAULT 1,
  `category` int(11) NULL DEFAULT 1,
  `owner` int(11) NULL DEFAULT 1,
  `sharingtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Private',
  PRIMARY KEY (`reportid`) USING BTREE,
  INDEX `report_queryid_idx`(`queryid`) USING BTREE,
  INDEX `report_folderid_idx`(`folderid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_report` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportdatefilter
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportdatefilter`;
CREATE TABLE `vtiger_reportdatefilter`  (
  `datefilterid` int(19) NOT NULL,
  `datecolumnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `datefilter` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `startdate` date NULL DEFAULT NULL,
  `enddate` date NULL DEFAULT NULL,
  PRIMARY KEY (`datefilterid`) USING BTREE,
  INDEX `reportdatefilter_datefilterid_idx`(`datefilterid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_reportdatefilter` FOREIGN KEY (`datefilterid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportfilters
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportfilters`;
CREATE TABLE `vtiger_reportfilters`  (
  `filterid` int(19) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportfolder
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportfolder`;
CREATE TABLE `vtiger_reportfolder`  (
  `folderid` int(19) NOT NULL AUTO_INCREMENT,
  `foldername` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SAVED',
  PRIMARY KEY (`folderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportgroupbycolumn
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportgroupbycolumn`;
CREATE TABLE `vtiger_reportgroupbycolumn`  (
  `reportid` int(19) NULL DEFAULT NULL,
  `sortid` int(19) NULL DEFAULT NULL,
  `sortcolname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dategroupbycriteria` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `fk_1_vtiger_reportgroupbycolumn`(`reportid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_reportgroupbycolumn` FOREIGN KEY (`reportid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reporting
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reporting`;
CREATE TABLE `vtiger_reporting`  (
  `reportingid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportingcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportingcf`;
CREATE TABLE `vtiger_reportingcf`  (
  `reportingid` int(11) NOT NULL,
  PRIMARY KEY (`reportingid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportmodules
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportmodules`;
CREATE TABLE `vtiger_reportmodules`  (
  `reportmodulesid` int(19) NOT NULL,
  `primarymodule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `secondarymodules` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`reportmodulesid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_reportmodules` FOREIGN KEY (`reportmodulesid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportsharing
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportsharing`;
CREATE TABLE `vtiger_reportsharing`  (
  `reportid` int(19) NOT NULL,
  `shareid` int(19) NOT NULL,
  `setype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportsortcol
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportsortcol`;
CREATE TABLE `vtiger_reportsortcol`  (
  `sortcolid` int(19) NOT NULL,
  `reportid` int(19) NOT NULL,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sortorder` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Asc',
  PRIMARY KEY (`sortcolid`, `reportid`) USING BTREE,
  INDEX `fk_1_vtiger_reportsortcol`(`reportid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_reportsortcol` FOREIGN KEY (`reportid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_reportsummary
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_reportsummary`;
CREATE TABLE `vtiger_reportsummary`  (
  `reportsummaryid` int(19) NOT NULL,
  `summarytype` int(19) NOT NULL,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`reportsummaryid`, `summarytype`, `columnname`) USING BTREE,
  INDEX `reportsummary_reportsummaryid_idx`(`reportsummaryid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_reportsummary` FOREIGN KEY (`reportsummaryid`) REFERENCES `vtiger_report` (`reportid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_retur
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_retur`;
CREATE TABLE `vtiger_retur`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suratid` int(11) NULL DEFAULT NULL,
  `tgl_retur` date NULL DEFAULT NULL,
  `tgl_analisaretur` date NULL DEFAULT NULL,
  `alasan_retur` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_revenuetype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_revenuetype`;
CREATE TABLE `vtiger_revenuetype`  (
  `revenuetypeid` int(19) NOT NULL AUTO_INCREMENT,
  `revenuetype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`revenuetypeid`) USING BTREE,
  UNIQUE INDEX `revenuetype_revenuetype_idx`(`revenuetype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_role
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_role`;
CREATE TABLE `vtiger_role`  (
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rolename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentrole` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depth` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_role2picklist
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_role2picklist`;
CREATE TABLE `vtiger_role2picklist`  (
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `picklistvalueid` int(11) NOT NULL,
  `picklistid` int(11) NOT NULL,
  `sortid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sortid`) USING BTREE,
  INDEX `picklistvalue`(`picklistvalueid`) USING BTREE,
  INDEX `picklist`(`picklistid`) USING BTREE,
  INDEX `role`(`roleid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2370562 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_role2profile
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_role2profile`;
CREATE TABLE `vtiger_role2profile`  (
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profileid` int(11) NOT NULL,
  PRIMARY KEY (`roleid`, `profileid`) USING BTREE,
  INDEX `role2profile_roleid_profileid_idx`(`roleid`, `profileid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_role2role_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_role2role_seq`;
CREATE TABLE `vtiger_role2role_seq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seqcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seqnum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_role_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_role_seq`;
CREATE TABLE `vtiger_role_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_rss
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_rss`;
CREATE TABLE `vtiger_rss`  (
  `rssid` int(19) NOT NULL,
  `rssurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rsstitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rsstype` int(10) NULL DEFAULT 0,
  `starred` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`rssid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_rss_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_rss_seq`;
CREATE TABLE `vtiger_rss_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_sales_stage
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sales_stage`;
CREATE TABLE `vtiger_sales_stage`  (
  `sales_stage_id` int(19) NOT NULL AUTO_INCREMENT,
  `sales_stage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sales_stage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_sales_stage_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sales_stage_seq`;
CREATE TABLE `vtiger_sales_stage_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_salesmanactivityrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salesmanactivityrel`;
CREATE TABLE `vtiger_salesmanactivityrel`  (
  `smid` int(19) NOT NULL DEFAULT 0,
  `activityid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`smid`, `activityid`) USING BTREE,
  INDEX `salesmanactivityrel_activityid_idx`(`activityid`) USING BTREE,
  INDEX `salesmanactivityrel_smid_idx`(`smid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_salesmanactivityrel` FOREIGN KEY (`smid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_salesmanattachmentsrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salesmanattachmentsrel`;
CREATE TABLE `vtiger_salesmanattachmentsrel`  (
  `smid` int(19) NOT NULL DEFAULT 0,
  `attachmentsid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`smid`, `attachmentsid`) USING BTREE,
  INDEX `salesmanattachmentsrel_smid_idx`(`smid`) USING BTREE,
  INDEX `salesmanattachmentsrel_attachmentsid_idx`(`attachmentsid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_salesmanattachmentsrel` FOREIGN KEY (`attachmentsid`) REFERENCES `vtiger_attachments` (`attachmentsid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_salesmanticketrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salesmanticketrel`;
CREATE TABLE `vtiger_salesmanticketrel`  (
  `smid` int(19) NOT NULL DEFAULT 0,
  `id` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`smid`, `id`) USING BTREE,
  INDEX `salesmanticketrel_smid_idx`(`smid`) USING BTREE,
  INDEX `salesmanticketrel_id_idx`(`id`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_salesmanticketrel` FOREIGN KEY (`smid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_salesorder
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salesorder`;
CREATE TABLE `vtiger_salesorder`  (
  `salesorderid` int(19) NOT NULL DEFAULT 0,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `potentialid` int(19) NULL DEFAULT NULL,
  `customerno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salesorder_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quoteid` int(19) NULL DEFAULT NULL,
  `vendorterms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactid` int(19) NULL DEFAULT NULL,
  `vendorid` int(19) NULL DEFAULT NULL,
  `duedate` date NULL DEFAULT NULL,
  `carrier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pending` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adjustment` decimal(25, 3) NULL DEFAULT NULL,
  `salescommission` decimal(25, 3) NULL DEFAULT NULL,
  `exciseduty` decimal(25, 3) NULL DEFAULT NULL,
  `total` decimal(25, 3) NULL DEFAULT NULL,
  `subtotal` decimal(25, 3) NULL DEFAULT NULL,
  `taxtype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount_percent` decimal(25, 3) NULL DEFAULT NULL,
  `discount_amount` decimal(25, 3) NULL DEFAULT NULL,
  `s_h_amount` decimal(25, 3) NULL DEFAULT NULL,
  `accountid` int(19) NULL DEFAULT NULL,
  `terms_conditions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `purchaseorder` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sostatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `conversion_rate` decimal(10, 3) NOT NULL DEFAULT 1.000,
  `enable_recurring` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`salesorderid`) USING BTREE,
  INDEX `salesorder_vendorid_idx`(`vendorid`) USING BTREE,
  INDEX `salesorder_contactid_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_salesorder` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_salesordercf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salesordercf`;
CREATE TABLE `vtiger_salesordercf`  (
  `salesorderid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`salesorderid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_salesordercf` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_salutationtype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salutationtype`;
CREATE TABLE `vtiger_salutationtype`  (
  `salutationid` int(19) NOT NULL AUTO_INCREMENT,
  `salutationtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`salutationid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_salutationtype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_salutationtype_seq`;
CREATE TABLE `vtiger_salutationtype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_scheduled_reports
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_scheduled_reports`;
CREATE TABLE `vtiger_scheduled_reports`  (
  `reportid` int(11) NOT NULL,
  `recipients` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `schedule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `format` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_trigger_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_seactivityrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_seactivityrel`;
CREATE TABLE `vtiger_seactivityrel`  (
  `crmid` int(19) NOT NULL,
  `activityid` int(19) NOT NULL,
  PRIMARY KEY (`crmid`, `activityid`) USING BTREE,
  INDEX `seactivityrel_activityid_idx`(`activityid`) USING BTREE,
  INDEX `seactivityrel_crmid_idx`(`crmid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_seactivityrel` FOREIGN KEY (`crmid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_seactivityrel_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_seactivityrel_seq`;
CREATE TABLE `vtiger_seactivityrel_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_seattachmentsrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_seattachmentsrel`;
CREATE TABLE `vtiger_seattachmentsrel`  (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `attachmentsid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`, `attachmentsid`) USING BTREE,
  INDEX `seattachmentsrel_attachmentsid_idx`(`attachmentsid`) USING BTREE,
  INDEX `seattachmentsrel_crmid_idx`(`crmid`) USING BTREE,
  INDEX `seattachmentsrel_attachmentsid_crmid_idx`(`attachmentsid`, `crmid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_seattachmentsrel` FOREIGN KEY (`crmid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_selectcolumn
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_selectcolumn`;
CREATE TABLE `vtiger_selectcolumn`  (
  `queryid` int(19) NOT NULL,
  `columnindex` int(11) NOT NULL DEFAULT 0,
  `columnname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`queryid`, `columnindex`) USING BTREE,
  INDEX `selectcolumn_queryid_idx`(`queryid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_selectcolumn` FOREIGN KEY (`queryid`) REFERENCES `vtiger_selectquery` (`queryid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_selectquery
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_selectquery`;
CREATE TABLE `vtiger_selectquery`  (
  `queryid` int(19) NOT NULL,
  `startindex` int(19) NULL DEFAULT 0,
  `numofobjects` int(19) NULL DEFAULT 0,
  PRIMARY KEY (`queryid`) USING BTREE,
  INDEX `selectquery_queryid_idx`(`queryid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_selectquery_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_selectquery_seq`;
CREATE TABLE `vtiger_selectquery_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_senotesrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_senotesrel`;
CREATE TABLE `vtiger_senotesrel`  (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `notesid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`, `notesid`) USING BTREE,
  INDEX `senotesrel_notesid_idx`(`notesid`) USING BTREE,
  INDEX `senotesrel_crmid_idx`(`crmid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_senotesrel` FOREIGN KEY (`notesid`) REFERENCES `vtiger_notes` (`notesid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_seproductsrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_seproductsrel`;
CREATE TABLE `vtiger_seproductsrel`  (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `productid` int(19) NOT NULL DEFAULT 0,
  `setype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`crmid`, `productid`) USING BTREE,
  INDEX `seproductsrel_productid_idx`(`productid`) USING BTREE,
  INDEX `seproductrel_crmid_idx`(`crmid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_seproductsrel` FOREIGN KEY (`productid`) REFERENCES `vtiger_products` (`productid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_service
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_service`;
CREATE TABLE `vtiger_service`  (
  `serviceid` int(11) NOT NULL,
  `service_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `servicename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `servicecategory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qty_per_unit` decimal(11, 2) NULL DEFAULT 0.00,
  `unit_price` decimal(25, 2) NULL DEFAULT NULL,
  `sales_start_date` date NULL DEFAULT NULL,
  `sales_end_date` date NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `discontinued` int(1) NOT NULL DEFAULT 0,
  `service_usageunit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxclass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `commissionrate` decimal(7, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`serviceid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_service` FOREIGN KEY (`serviceid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_service_usageunit
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_service_usageunit`;
CREATE TABLE `vtiger_service_usageunit`  (
  `service_usageunitid` int(11) NOT NULL AUTO_INCREMENT,
  `service_usageunit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`service_usageunitid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_service_usageunit_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_service_usageunit_seq`;
CREATE TABLE `vtiger_service_usageunit_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_servicecategory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_servicecategory`;
CREATE TABLE `vtiger_servicecategory`  (
  `servicecategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `servicecategory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`servicecategoryid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_servicecategory_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_servicecategory_seq`;
CREATE TABLE `vtiger_servicecategory_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_servicecf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_servicecf`;
CREATE TABLE `vtiger_servicecf`  (
  `serviceid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`serviceid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_servicecontracts
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_servicecontracts`;
CREATE TABLE `vtiger_servicecontracts`  (
  `servicecontractsid` int(11) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `sc_related_to` int(11) NULL DEFAULT NULL,
  `tracking_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_units` decimal(5, 2) NULL DEFAULT NULL,
  `used_units` decimal(5, 2) NULL DEFAULT NULL,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `planned_duration` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actual_duration` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `progress` decimal(5, 2) NULL DEFAULT NULL,
  `contract_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_servicecontractscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_servicecontractscf`;
CREATE TABLE `vtiger_servicecontractscf`  (
  `servicecontractsid` int(11) NOT NULL,
  PRIMARY KEY (`servicecontractsid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_seticketsrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_seticketsrel`;
CREATE TABLE `vtiger_seticketsrel`  (
  `crmid` int(19) NOT NULL DEFAULT 0,
  `ticketid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`crmid`, `ticketid`) USING BTREE,
  INDEX `seticketsrel_crmid_idx`(`crmid`) USING BTREE,
  INDEX `seticketsrel_ticketid_idx`(`ticketid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_seticketsrel` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_settings_blocks
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_settings_blocks`;
CREATE TABLE `vtiger_settings_blocks`  (
  `blockid` int(19) NOT NULL,
  `label` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sequence` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`blockid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_settings_blocks_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_settings_blocks_seq`;
CREATE TABLE `vtiger_settings_blocks_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_settings_field
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_settings_field`;
CREATE TABLE `vtiger_settings_field`  (
  `fieldid` int(19) NOT NULL,
  `blockid` int(19) NULL DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconpath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `linkto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sequence` int(19) NULL DEFAULT NULL,
  `active` int(19) NULL DEFAULT 0,
  PRIMARY KEY (`fieldid`) USING BTREE,
  INDEX `fk_1_vtiger_settings_field`(`blockid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_settings_field` FOREIGN KEY (`blockid`) REFERENCES `vtiger_settings_blocks` (`blockid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_settings_field_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_settings_field_seq`;
CREATE TABLE `vtiger_settings_field_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_setupparameter
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_setupparameter`;
CREATE TABLE `vtiger_setupparameter`  (
  `setupparameterid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_setupparametercf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_setupparametercf`;
CREATE TABLE `vtiger_setupparametercf`  (
  `setupparameterid` int(11) NOT NULL,
  PRIMARY KEY (`setupparameterid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_setuptipekasus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_setuptipekasus`;
CREATE TABLE `vtiger_setuptipekasus`  (
  `setuptipekasusid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_setuptipekasuscf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_setuptipekasuscf`;
CREATE TABLE `vtiger_setuptipekasuscf`  (
  `setuptipekasusid` int(11) NOT NULL,
  PRIMARY KEY (`setuptipekasusid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_sharedcalendar
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sharedcalendar`;
CREATE TABLE `vtiger_sharedcalendar`  (
  `userid` int(19) NOT NULL,
  `sharedid` int(19) NOT NULL,
  PRIMARY KEY (`userid`, `sharedid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_shippingtaxinfo
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_shippingtaxinfo`;
CREATE TABLE `vtiger_shippingtaxinfo`  (
  `taxid` int(3) NOT NULL,
  `taxname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taxlabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `percentage` decimal(7, 3) NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`taxid`) USING BTREE,
  INDEX `shippingtaxinfo_taxname_idx`(`taxname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_shippingtaxinfo_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_shippingtaxinfo_seq`;
CREATE TABLE `vtiger_shippingtaxinfo_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_smsnotifier
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_smsnotifier`;
CREATE TABLE `vtiger_smsnotifier`  (
  `smsnotifierid` int(11) NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_smsnotifier_servers
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_smsnotifier_servers`;
CREATE TABLE `vtiger_smsnotifier_servers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isactive` int(1) NULL DEFAULT NULL,
  `providertype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_smsnotifier_status
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_smsnotifier_status`;
CREATE TABLE `vtiger_smsnotifier_status`  (
  `smsnotifierid` int(11) NULL DEFAULT NULL,
  `tonumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smsmessageid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `needlookup` int(1) NULL DEFAULT 1,
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `statusmessage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`statusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_smsnotifiercf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_smsnotifiercf`;
CREATE TABLE `vtiger_smsnotifiercf`  (
  `smsnotifierid` int(11) NOT NULL,
  PRIMARY KEY (`smsnotifierid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_soapservice
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_soapservice`;
CREATE TABLE `vtiger_soapservice`  (
  `id` int(19) NULL DEFAULT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sessionid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_sobillads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sobillads`;
CREATE TABLE `vtiger_sobillads`  (
  `sobilladdressid` int(19) NOT NULL DEFAULT 0,
  `bill_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bill_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sobilladdressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_sobillads` FOREIGN KEY (`sobilladdressid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_soshipads
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_soshipads`;
CREATE TABLE `vtiger_soshipads`  (
  `soshipaddressid` int(19) NOT NULL DEFAULT 0,
  `ship_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_street` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ship_pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`soshipaddressid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_soshipads` FOREIGN KEY (`soshipaddressid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_sostatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sostatus`;
CREATE TABLE `vtiger_sostatus`  (
  `sostatusid` int(19) NOT NULL AUTO_INCREMENT,
  `sostatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sostatusid`) USING BTREE,
  UNIQUE INDEX `sostatus_sostatus_idx`(`sostatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_sostatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sostatus_seq`;
CREATE TABLE `vtiger_sostatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_sostatushistory
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_sostatushistory`;
CREATE TABLE `vtiger_sostatushistory`  (
  `historyid` int(19) NOT NULL AUTO_INCREMENT,
  `salesorderid` int(19) NOT NULL,
  `accountname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(10, 0) NULL DEFAULT NULL,
  `sostatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`historyid`) USING BTREE,
  INDEX `sostatushistory_salesorderid_idx`(`salesorderid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_sostatushistory` FOREIGN KEY (`salesorderid`) REFERENCES `vtiger_salesorder` (`salesorderid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_stage_bankinfo_card
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_stage_bankinfo_card`;
CREATE TABLE `vtiger_stage_bankinfo_card`  (
  `CARDD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFSNME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFNA2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFNA3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFNA5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ZIPCODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFBIR6` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CFSEX` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TELPRUMAH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JDNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC1` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAT_AC1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC2` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAT_AC2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC3` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAT_AC3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC4` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC5` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC6` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC7` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC8` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC9` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AC10` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NOREK` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Kota` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friendliness` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'smiley',
  INDEX `CUID`(`CUID`) USING BTREE,
  INDEX `AC1`(`AC1`) USING BTREE,
  INDEX `CARDD`(`CARDD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_stage_bankinfo_rek
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_stage_bankinfo_rek`;
CREATE TABLE `vtiger_stage_bankinfo_rek`  (
  `nama` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tlp_rumah` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tlp_seluler` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tlp_kantor` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_buka` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rek_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identitas` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identitas_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_lahir` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cif` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zipcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cif1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acct_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MMmom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friendliness` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'smiley',
  INDEX `cif`(`cif`) USING BTREE,
  INDEX `acct_no`(`acct_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_stage_cardinfo
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_stage_cardinfo`;
CREATE TABLE `vtiger_stage_cardinfo`  (
  `crdnbr` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `custlname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custaddr1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custcity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custzip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custdob` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custsex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misdate` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custnbr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdacct` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custidnbr` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_nbr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maintenance_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdexpdte` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycledate` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctoutbal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctdtopen` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctcrlmt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdblk` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdpdtnbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friendliness` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'smiley',
  `date_maint` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr1` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr2` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeKota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaRelasi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr6` varchar(58) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOffice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr1` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpRmh` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpkantor` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoFax` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldOtherPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaCH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldDataDOB` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldIdNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaibu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sup_rel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cif` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acct_blk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_flag` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `issued_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_statement` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldPhoneRelasi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_employee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autopay_ind` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pin_gen` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ori_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BRANCH_NBR` int(5) NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_STMT` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CARD_DLVRY_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ADDR_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ1` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ2` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ3` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ4` int(1) NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ1` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ2` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ3` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ4` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_BLK_CODE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_1` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_2` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_3` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_4` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_5` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_CREDIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_1_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_2_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_3_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_4_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_5_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_6_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_7_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER1` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME1` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC1` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TEMP_CRLIMIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_CYC_DUE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_BAL_CASH` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_OUTSTD_AUTH_BAL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_INSTL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_SHIELD` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EFF_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EXP_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_PERIOD` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_MARITAL_ST` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_NATIONALITY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OCC_PER` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_ANN_SALARY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OTH_INCOME` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GRLNSHIP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_CITY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_ZIPCODE` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GMARITAL_ST` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GID_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_PLC_BIRTH` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FAMILY_SIZE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_TITLE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FILE_BUFFER` text CHARACTER SET utf16le COLLATE utf16le_general_ci NULL,
  `BUCKET` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OUTSTANDING` decimal(14, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`crdnbr`) USING BTREE,
  INDEX `crdacct`(`crdacct`) USING BTREE,
  INDEX `custnbr`(`custnbr`) USING BTREE,
  INDEX `custmphone`(`custmphone`) USING BTREE,
  INDEX `custlname`(`custlname`) USING BTREE,
  INDEX `crdpdtnbr`(`crdpdtnbr`) USING BTREE,
  INDEX `custemail`(`custemail`) USING BTREE,
  INDEX `custmom`(`custmom`) USING BTREE,
  INDEX `crdstatus`(`crdstatus`) USING BTREE,
  INDEX `cif`(`cif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_stage_cardinfo_supplement
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_stage_cardinfo_supplement`;
CREATE TABLE `vtiger_stage_cardinfo_supplement`  (
  `crdnbr` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `custlname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custaddr1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custcity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custzip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custdob` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custsex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misdate` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custnbr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdacct` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custidnbr` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_nbr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maintenance_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdexpdte` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycledate` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctoutbal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctdtopen` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctcrlmt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdblk` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdpdtnbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friendliness` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'smiley',
  `date_maint` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr1` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr2` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeKota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaRelasi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr6` varchar(58) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOffice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr1` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpRmh` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpkantor` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoFax` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldOtherPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaCH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldDataDOB` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldIdNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaibu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sup_rel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cif` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acct_blk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_flag` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `issued_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_statement` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldPhoneRelasi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_employee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autopay_ind` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pin_gen` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ori_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BRANCH_NBR` int(5) NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_STMT` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CARD_DLVRY_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ADDR_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ1` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ2` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ3` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ4` int(1) NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ1` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ2` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ3` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ4` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_BLK_CODE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_1` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_2` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_3` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_4` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_5` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_CREDIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_1_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_2_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_3_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_4_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_5_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_6_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_7_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER1` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME1` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC1` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TEMP_CRLIMIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_CYC_DUE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_BAL_CASH` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_OUTSTD_AUTH_BAL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_INSTL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_SHIELD` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EFF_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EXP_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_PERIOD` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_MARITAL_ST` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_NATIONALITY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OCC_PER` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_ANN_SALARY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OTH_INCOME` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GRLNSHIP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_CITY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_ZIPCODE` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GMARITAL_ST` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GID_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_PLC_BIRTH` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FAMILY_SIZE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_TITLE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FILE_BUFFER` text CHARACTER SET utf16le COLLATE utf16le_general_ci NULL,
  PRIMARY KEY (`crdnbr`) USING BTREE,
  INDEX `crdacct`(`crdacct`) USING BTREE,
  INDEX `custnbr`(`custnbr`) USING BTREE,
  INDEX `custmphone`(`custmphone`) USING BTREE,
  INDEX `custlname`(`custlname`) USING BTREE,
  INDEX `crdpdtnbr`(`crdpdtnbr`) USING BTREE,
  INDEX `custemail`(`custemail`) USING BTREE,
  INDEX `custmom`(`custmom`) USING BTREE,
  INDEX `crdstatus`(`crdstatus`) USING BTREE,
  INDEX `cif`(`cif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_stage_cardinfo_temp
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_stage_cardinfo_temp`;
CREATE TABLE `vtiger_stage_cardinfo_temp`  (
  `crdnbr` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `custlname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custaddr1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custcity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custzip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custdob` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custsex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custmom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misdate` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custnbr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdacct` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custidnbr` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_nbr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maintenance_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdexpdte` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycledate` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctoutbal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctdtopen` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acctcrlmt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdblk` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crdpdtnbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friendliness` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'smiley',
  `date_maint` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr1` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr2` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeAddr4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomeKota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentHomePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaRelasi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentMailAddr6` varchar(58) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOffice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr1` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeAddr4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficeKota` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldCurrentOfficePostCd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpRmh` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoTelpkantor` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoFax` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldOtherPhone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNoHp` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaCH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldDataDOB` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldIdNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldNamaibu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sup_rel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cif` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billing_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acct_blk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_flag` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annual_fee_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `issued_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_statement` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fldPhoneRelasi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_employee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autopay_ind` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pin_gen` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ori_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `new_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basic_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_BRANCH_NBR` int(5) NULL DEFAULT NULL,
  `CRDACCT_DTE_LST_STMT` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CARD_DLVRY_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_ADDR_FLG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_REQ1` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ2` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ3` int(1) NULL DEFAULT NULL,
  `CARD_EMB_REQ4` int(1) NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ1` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ2` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ3` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_LSTREQ4` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DTE_BLK_CODE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_1` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_2` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_3` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_4` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_PERM_PGM_5` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_AVAIL_CREDIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_1_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_2_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_3_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_4_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_5_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_6_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_DLQ_CYC_7_MNTH_AGO` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_DTE_USER1` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_NAME1` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD_EMB_USRC1` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_TEMP_CRLIMIT` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_STMT_CYC_DUE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CURR_BAL_CASH` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CASH_OUTSTD_AUTH_BAL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_OUTSTD_INSTL` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_SHIELD` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EFF_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CRDACCT_CRDT_EXP_DTE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_RES_PERIOD` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_MARITAL_ST` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_NATIONALITY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OCC_PER` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_ANN_SALARY` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_OTH_INCOME` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GRLNSHIP` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_CITY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GADD_ZIPCODE` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GMARITAL_ST` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GID_NBR` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_PLC_BIRTH` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_GEMP_ADDR2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_FAMILY_SIZE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CUST_TITLE` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`crdnbr`) USING BTREE,
  INDEX `crdacct`(`crdacct`) USING BTREE,
  INDEX `custnbr`(`custnbr`) USING BTREE,
  INDEX `custmphone`(`custmphone`) USING BTREE,
  INDEX `custlname`(`custlname`) USING BTREE,
  INDEX `crdpdtnbr`(`crdpdtnbr`) USING BTREE,
  INDEX `custemail`(`custemail`) USING BTREE,
  INDEX `custmom`(`custmom`) USING BTREE,
  INDEX `crdstatus`(`crdstatus`) USING BTREE,
  INDEX `cif`(`cif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_status
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_status`;
CREATE TABLE `vtiger_status`  (
  `statusid` int(19) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`statusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_status_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_status_seq`;
CREATE TABLE `vtiger_status_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_surat
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_surat`;
CREATE TABLE `vtiger_surat`  (
  `suratid` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_surat` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_surat` date NULL DEFAULT NULL,
  `surat` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `nama_nasabah` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count_surat` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `retur` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alasan_retur` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `alamat_nasabah` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `no_rekening` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_buka` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cabang_lapor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tgl_retur_akhr` date NULL DEFAULT NULL,
  PRIMARY KEY (`suratid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 419 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_suratcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_suratcf`;
CREATE TABLE `vtiger_suratcf`  (
  `suratid` int(11) NOT NULL,
  PRIMARY KEY (`suratid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_suratcount
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_suratcount`;
CREATE TABLE `vtiger_suratcount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `divisi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jml` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_systems
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_systems`;
CREATE TABLE `vtiger_systems`  (
  `id` int(19) NOT NULL,
  `server` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_port` int(19) NULL DEFAULT NULL,
  `server_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_auth` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_email_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_systems_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_systems_seq`;
CREATE TABLE `vtiger_systems_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_tab
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tab`;
CREATE TABLE `vtiger_tab`  (
  `tabid` int(19) NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(19) NOT NULL DEFAULT 1,
  `tabsequence` int(10) NULL DEFAULT NULL,
  `tablabel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modifiedby` int(19) NULL DEFAULT NULL,
  `modifiedtime` int(19) NULL DEFAULT NULL,
  `customized` int(19) NULL DEFAULT NULL,
  `ownedby` int(19) NULL DEFAULT NULL,
  `isentitytype` int(11) NOT NULL DEFAULT 1,
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tabid`) USING BTREE,
  UNIQUE INDEX `tab_name_idx`(`name`) USING BTREE,
  INDEX `tab_modifiedby_idx`(`modifiedby`) USING BTREE,
  INDEX `tab_tabid_idx`(`tabid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tab_info
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tab_info`;
CREATE TABLE `vtiger_tab_info`  (
  `tabid` int(19) NULL DEFAULT NULL,
  `prefname` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prefvalue` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `fk_1_vtiger_tab_info`(`tabid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_tab_info` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_taskpriority
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_taskpriority`;
CREATE TABLE `vtiger_taskpriority`  (
  `taskpriorityid` int(19) NOT NULL AUTO_INCREMENT,
  `taskpriority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`taskpriorityid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_taskpriority_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_taskpriority_seq`;
CREATE TABLE `vtiger_taskpriority_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_taskstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_taskstatus`;
CREATE TABLE `vtiger_taskstatus`  (
  `taskstatusid` int(19) NOT NULL AUTO_INCREMENT,
  `taskstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`taskstatusid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_taskstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_taskstatus_seq`;
CREATE TABLE `vtiger_taskstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_taxclass
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_taxclass`;
CREATE TABLE `vtiger_taxclass`  (
  `taxclassid` int(19) NOT NULL AUTO_INCREMENT,
  `taxclass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`taxclassid`) USING BTREE,
  UNIQUE INDEX `taxclass_carrier_idx`(`taxclass`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_taxclass_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_taxclass_seq`;
CREATE TABLE `vtiger_taxclass_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_template
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template`;
CREATE TABLE `vtiger_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_temp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `date_created` datetime NULL DEFAULT NULL,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 214 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template_detail`;
CREATE TABLE `vtiger_template_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketid` int(10) UNSIGNED NOT NULL,
  `jenis_sms` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `template_id` tinyint(3) UNSIGNED NOT NULL,
  `approver` int(11) NULL DEFAULT NULL,
  `approved` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destination_number` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jenis_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text_email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `destination_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `approved_date` datetime NULL DEFAULT NULL,
  `send_date` datetime NULL DEFAULT NULL,
  `send_date_email` datetime NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_reject` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rejected_date` datetime NULL DEFAULT NULL,
  `edited_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edited_time` datetime NULL DEFAULT NULL,
  `kirim_sms` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kirim_email` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54220 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_template_detail_wa
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template_detail_wa`;
CREATE TABLE `vtiger_template_detail_wa`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketid` int(100) NULL DEFAULT NULL,
  `jenis_wa` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_id` tinyint(3) NULL DEFAULT NULL,
  `approver` int(11) NULL DEFAULT NULL,
  `approved` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `title_wa` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter_wa` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `text_wa` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `destination_wa` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `approved_date` datetime NULL DEFAULT NULL,
  `send_date_wa` datetime NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_reject` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rejected_date` datetime NULL DEFAULT NULL,
  `edited_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edited_time` datetime NULL DEFAULT NULL,
  `flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reff_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responseApiWa` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_template_email
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template_email`;
CREATE TABLE `vtiger_template_email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_temp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `date_created` datetime NULL DEFAULT NULL,
  `date_modified` datetime NULL DEFAULT NULL,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_template_email_detail
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template_email_detail`;
CREATE TABLE `vtiger_template_email_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketid` int(10) UNSIGNED NOT NULL,
  `jenis_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `template_id` tinyint(3) UNSIGNED NOT NULL,
  `approver` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approved` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `destination_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `approved_date` datetime NULL DEFAULT NULL,
  `send_date` datetime NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_reject` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rejected_date` datetime NULL DEFAULT NULL,
  `edited_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edited_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_template_wa
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template_wa`;
CREATE TABLE `vtiger_template_wa`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_template` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_temp` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parameter` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `isi_template_wa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `date_created` datetime NULL DEFAULT NULL,
  `date_modified` datetime NULL DEFAULT NULL,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_template_wa_old
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_template_wa_old`;
CREATE TABLE `vtiger_template_wa_old`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_temp` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `surat` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `date_created` datetime NULL DEFAULT NULL,
  `date_modified` datetime NULL DEFAULT NULL,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vtiger_ticketcategories
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketcategories`;
CREATE TABLE `vtiger_ticketcategories`  (
  `ticketcategories_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketcategories` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticketcategories_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketcategories_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketcategories_seq`;
CREATE TABLE `vtiger_ticketcategories_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ticketcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketcf`;
CREATE TABLE `vtiger_ticketcf`  (
  `ticketid` int(19) NOT NULL DEFAULT 0,
  `cf_644` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_658` date NULL DEFAULT NULL,
  `cf_659` decimal(15, 2) NULL DEFAULT NULL,
  `cf_660` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_663` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_666` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_667` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_701` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_704` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_705` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_706` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_707` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_708` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_709` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_713` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_714` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_715` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_717` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_718` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_720` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_721` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_722` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_723` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_725` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_726` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_727` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_729` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_730` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_731` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_733` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_734` decimal(21, 0) NULL DEFAULT NULL,
  `cf_735` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_736` date NULL DEFAULT NULL,
  `cf_737` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_738` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-',
  `cf_742` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_743` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ticketid`) USING BTREE,
  INDEX `cf_720`(`cf_720`) USING BTREE,
  INDEX `cf_644`(`cf_644`) USING BTREE,
  INDEX `cf_731`(`cf_731`) USING BTREE,
  INDEX `cf_701`(`cf_701`) USING BTREE,
  INDEX `cf_663`(`cf_663`) USING BTREE,
  INDEX `cf_666`(`cf_666`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_ticketcf` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 7168 kB; (`ticketid`) REFER `vtigercrm540/vtige' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketcf_2022
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketcf_2022`;
CREATE TABLE `vtiger_ticketcf_2022`  (
  `ticketid` int(19) NOT NULL DEFAULT 0,
  `cf_644` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_658` date NULL DEFAULT NULL,
  `cf_659` decimal(15, 2) NULL DEFAULT NULL,
  `cf_660` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_663` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_666` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_667` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_701` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_704` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_705` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_706` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_707` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_708` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_709` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_713` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_714` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_715` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_717` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_718` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_720` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_721` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_722` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_723` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_725` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_726` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_727` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_729` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_730` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_731` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_733` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_734` decimal(21, 0) NULL DEFAULT NULL,
  `cf_735` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_736` date NULL DEFAULT NULL,
  `cf_737` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cf_738` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-',
  `cf_742` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cf_743` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ticketid`) USING BTREE,
  INDEX `cf_720`(`cf_720`) USING BTREE,
  INDEX `cf_644`(`cf_644`) USING BTREE,
  INDEX `cf_731`(`cf_731`) USING BTREE,
  INDEX `cf_701`(`cf_701`) USING BTREE,
  INDEX `cf_663`(`cf_663`) USING BTREE,
  INDEX `cf_666`(`cf_666`) USING BTREE,
  CONSTRAINT `vtiger_ticketcf_2022_ibfk_1` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 7168 kB; (`ticketid`) REFER `vtigercrm540/vtige' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketcomments
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketcomments`;
CREATE TABLE `vtiger_ticketcomments`  (
  `commentid` int(19) NOT NULL AUTO_INCREMENT,
  `ticketid` int(19) NULL DEFAULT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ownerid` int(19) NOT NULL DEFAULT 0,
  `ownertype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`commentid`) USING BTREE,
  INDEX `ticketcomments_ticketid_idx`(`ticketid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_ticketcomments` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_troubletickets` (`ticketid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17399837 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketpriorities
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketpriorities`;
CREATE TABLE `vtiger_ticketpriorities`  (
  `ticketpriorities_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketpriorities` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticketpriorities_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketpriorities_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketpriorities_seq`;
CREATE TABLE `vtiger_ticketpriorities_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ticketseverities
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketseverities`;
CREATE TABLE `vtiger_ticketseverities`  (
  `ticketseverities_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketseverities` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticketseverities_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketseverities_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketseverities_seq`;
CREATE TABLE `vtiger_ticketseverities_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ticketstatus
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketstatus`;
CREATE TABLE `vtiger_ticketstatus`  (
  `ticketstatus_id` int(19) NOT NULL AUTO_INCREMENT,
  `ticketstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presence` int(1) NOT NULL DEFAULT 0,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticketstatus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ticketstatus_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketstatus_seq`;
CREATE TABLE `vtiger_ticketstatus_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ticketstracktime
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ticketstracktime`;
CREATE TABLE `vtiger_ticketstracktime`  (
  `ticket_id` int(11) NOT NULL DEFAULT 0,
  `supporter_id` int(11) NOT NULL DEFAULT 0,
  `minutes` int(11) NULL DEFAULT 0,
  `date_logged` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `ticketstracktime_ticket_id_idx`(`ticket_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_time_zone
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_time_zone`;
CREATE TABLE `vtiger_time_zone`  (
  `time_zoneid` int(19) NOT NULL AUTO_INCREMENT,
  `time_zone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`time_zoneid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_time_zone_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_time_zone_seq`;
CREATE TABLE `vtiger_time_zone_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_tmp_read_group_rel_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_read_group_rel_sharing_per`;
CREATE TABLE `vtiger_tmp_read_group_rel_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `relatedtabid`, `sharedgroupid`) USING BTREE,
  INDEX `tmp_read_group_rel_sharing_per_userid_sharedgroupid_tabid`(`userid`, `sharedgroupid`, `tabid`) USING BTREE,
  CONSTRAINT `fk_4_vtiger_tmp_read_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_read_group_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_read_group_sharing_per`;
CREATE TABLE `vtiger_tmp_read_group_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `sharedgroupid`) USING BTREE,
  INDEX `tmp_read_group_sharing_per_userid_sharedgroupid_idx`(`userid`, `sharedgroupid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_tmp_read_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_read_user_rel_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_read_user_rel_sharing_per`;
CREATE TABLE `vtiger_tmp_read_user_rel_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `relatedtabid`, `shareduserid`) USING BTREE,
  INDEX `tmp_read_user_rel_sharing_per_userid_shared_reltabid_idx`(`userid`, `shareduserid`, `relatedtabid`) USING BTREE,
  CONSTRAINT `fk_4_vtiger_tmp_read_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_read_user_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_read_user_sharing_per`;
CREATE TABLE `vtiger_tmp_read_user_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `shareduserid`) USING BTREE,
  INDEX `tmp_read_user_sharing_per_userid_shareduserid_idx`(`userid`, `shareduserid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_tmp_read_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_write_group_rel_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_write_group_rel_sharing_per`;
CREATE TABLE `vtiger_tmp_write_group_rel_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `relatedtabid`, `sharedgroupid`) USING BTREE,
  INDEX `tmp_write_group_rel_sharing_per_userid_sharedgroupid_tabid_idx`(`userid`, `sharedgroupid`, `tabid`) USING BTREE,
  CONSTRAINT `fk_4_vtiger_tmp_write_group_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_write_group_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_write_group_sharing_per`;
CREATE TABLE `vtiger_tmp_write_group_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `sharedgroupid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `sharedgroupid`) USING BTREE,
  INDEX `tmp_write_group_sharing_per_UK1`(`userid`, `sharedgroupid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_tmp_write_group_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_write_user_rel_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_write_user_rel_sharing_per`;
CREATE TABLE `vtiger_tmp_write_user_rel_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `relatedtabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `relatedtabid`, `shareduserid`) USING BTREE,
  INDEX `tmp_write_user_rel_sharing_per_userid_sharduserid_tabid_idx`(`userid`, `shareduserid`, `tabid`) USING BTREE,
  CONSTRAINT `fk_4_vtiger_tmp_write_user_rel_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tmp_write_user_sharing_per
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tmp_write_user_sharing_per`;
CREATE TABLE `vtiger_tmp_write_user_sharing_per`  (
  `userid` int(11) NOT NULL,
  `tabid` int(11) NOT NULL,
  `shareduserid` int(11) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`, `shareduserid`) USING BTREE,
  INDEX `tmp_write_user_sharing_per_userid_shareduserid_idx`(`userid`, `shareduserid`) USING BTREE,
  CONSTRAINT `fk_3_vtiger_tmp_write_user_sharing_per` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tracker
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tracker`;
CREATE TABLE `vtiger_tracker`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15447817 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tracking_unit
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tracking_unit`;
CREATE TABLE `vtiger_tracking_unit`  (
  `tracking_unitid` int(11) NOT NULL AUTO_INCREMENT,
  `tracking_unit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tracking_unitid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_tracking_unit_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_tracking_unit_seq`;
CREATE TABLE `vtiger_tracking_unit_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_troubletickets
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_troubletickets`;
CREATE TABLE `vtiger_troubletickets`  (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `severity` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `solution` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `version_id` int(11) NULL DEFAULT NULL,
  `hours` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_portal` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ticketid`) USING BTREE,
  INDEX `troubletickets_status_idx`(`status`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_troubletickets` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_troubletickets_2022
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_troubletickets_2022`;
CREATE TABLE `vtiger_troubletickets_2022`  (
  `ticketid` int(19) NOT NULL,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `severity` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `solution` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `version_id` int(11) NULL DEFAULT NULL,
  `hours` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_portal` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ticketid`) USING BTREE,
  INDEX `troubletickets_status_idx`(`status`) USING BTREE,
  INDEX `ticket_no`(`ticket_no`) USING BTREE,
  CONSTRAINT `vtiger_troubletickets_2022_ibfk_1` FOREIGN KEY (`ticketid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_twitter
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_twitter`;
CREATE TABLE `vtiger_twitter`  (
  `twitterid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_twittercf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_twittercf`;
CREATE TABLE `vtiger_twittercf`  (
  `twitterid` int(11) NOT NULL,
  PRIMARY KEY (`twitterid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_uploading
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_uploading`;
CREATE TABLE `vtiger_uploading`  (
  `uploadingid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_uploadingcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_uploadingcf`;
CREATE TABLE `vtiger_uploadingcf`  (
  `uploadingid` int(11) NOT NULL,
  PRIMARY KEY (`uploadingid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_usageunit
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_usageunit`;
CREATE TABLE `vtiger_usageunit`  (
  `usageunitid` int(19) NOT NULL AUTO_INCREMENT,
  `usageunit` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `picklist_valueid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`usageunitid`) USING BTREE,
  UNIQUE INDEX `usageunit_usageunit_idx`(`usageunit`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_usageunit_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_usageunit_seq`;
CREATE TABLE `vtiger_usageunit_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_user2mergefields
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_user2mergefields`;
CREATE TABLE `vtiger_user2mergefields`  (
  `userid` int(11) NULL DEFAULT NULL,
  `tabid` int(19) NULL DEFAULT NULL,
  `fieldid` int(19) NULL DEFAULT NULL,
  `visible` int(2) NULL DEFAULT NULL,
  INDEX `userid_tabid_idx`(`userid`, `tabid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_user2role
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_user2role`;
CREATE TABLE `vtiger_user2role`  (
  `userid` int(11) NOT NULL,
  `roleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  INDEX `user2role_roleid_idx`(`roleid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_user2role` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_user_module_preferences
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_user_module_preferences`;
CREATE TABLE `vtiger_user_module_preferences`  (
  `userid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `default_cvid` int(19) NOT NULL,
  PRIMARY KEY (`userid`, `tabid`) USING BTREE,
  INDEX `fk_2_vtiger_user_module_preferences`(`tabid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_user_module_preferences` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_users
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_users`;
CREATE TABLE `vtiger_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cal_color` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#E6FAD8',
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reports_to_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `currency_id` int(19) NOT NULL DEFAULT 1,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_home` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_work` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_other` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondaryemail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signature` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_street` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_state` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_country` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_postalcode` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_preferences` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tz` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `holidays` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `namedays` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workdays` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weekstart` int(11) NULL DEFAULT NULL,
  `date_format` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hour_format` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'am/pm',
  `start_hour` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '10:00',
  `end_hour` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '23:00',
  `activity_view` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Today',
  `lead_view` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Today',
  `imagename` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `confirm_password` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `internal_mailer` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `reminder_interval` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reminder_next_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `crypt_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'MD5',
  `accesskey` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `theme` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_zone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_grouping_pattern` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_decimal_separator` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_grouping_separator` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency_symbol_placement` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_user_name_idx`(`user_name`) USING BTREE,
  INDEX `user_user_password_idx`(`user_password`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10251 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_users2group
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_users2group`;
CREATE TABLE `vtiger_users2group`  (
  `groupid` int(19) NOT NULL,
  `userid` int(19) NOT NULL,
  PRIMARY KEY (`groupid`, `userid`) USING BTREE,
  INDEX `users2group_groupname_uerid_idx`(`groupid`, `userid`) USING BTREE,
  INDEX `fk_2_vtiger_users2group`(`userid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_users2group` FOREIGN KEY (`userid`) REFERENCES `vtiger_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_users_last_import
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_users_last_import`;
CREATE TABLE `vtiger_users_last_import`  (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `assigned_user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bean_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bean_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`assigned_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_users_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_users_seq`;
CREATE TABLE `vtiger_users_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_usertype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_usertype`;
CREATE TABLE `vtiger_usertype`  (
  `usertypeid` int(19) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`usertypeid`) USING BTREE,
  UNIQUE INDEX `usertype_usertype_idx`(`usertype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_vendor
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_vendor`;
CREATE TABLE `vtiger_vendor`  (
  `vendorid` int(19) NOT NULL DEFAULT 0,
  `vendor_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vendorname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `glacct` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pobox` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postalcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`vendorid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_vendor` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_vendorcf
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_vendorcf`;
CREATE TABLE `vtiger_vendorcf`  (
  `vendorid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vendorid`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_vendorcf` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_vendorcontactrel
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_vendorcontactrel`;
CREATE TABLE `vtiger_vendorcontactrel`  (
  `vendorid` int(19) NOT NULL DEFAULT 0,
  `contactid` int(19) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vendorid`, `contactid`) USING BTREE,
  INDEX `vendorcontactrel_vendorid_idx`(`vendorid`) USING BTREE,
  INDEX `vendorcontactrel_contact_idx`(`contactid`) USING BTREE,
  CONSTRAINT `fk_2_vtiger_vendorcontactrel` FOREIGN KEY (`vendorid`) REFERENCES `vtiger_vendor` (`vendorid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_version
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_version`;
CREATE TABLE `vtiger_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_version` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `current_version` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_version_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_version_seq`;
CREATE TABLE `vtiger_version_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_visibility
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_visibility`;
CREATE TABLE `vtiger_visibility`  (
  `visibilityid` int(19) NOT NULL AUTO_INCREMENT,
  `visibility` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortorderid` int(19) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`visibilityid`) USING BTREE,
  UNIQUE INDEX `visibility_visibility_idx`(`visibility`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_visibility_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_visibility_seq`;
CREATE TABLE `vtiger_visibility_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_webforms
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_webforms`;
CREATE TABLE `vtiger_webforms`  (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publicid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `targetmodule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownerid` int(19) NOT NULL,
  `returnurl` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `webformname`(`name`) USING BTREE,
  UNIQUE INDEX `publicid`(`id`) USING BTREE,
  INDEX `webforms_webforms_id_idx`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_webforms_field
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_webforms_field`;
CREATE TABLE `vtiger_webforms_field`  (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `webformid` int(19) NOT NULL,
  `fieldname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `neutralizedfield` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `defaultvalue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `required` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `webforms_webforms_field_idx`(`id`) USING BTREE,
  INDEX `fk_1_vtiger_webforms_field`(`webformid`) USING BTREE,
  INDEX `fk_2_vtiger_webforms_field`(`fieldname`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_webforms_field` FOREIGN KEY (`webformid`) REFERENCES `vtiger_webforms` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_3_vtiger_webforms_field` FOREIGN KEY (`fieldname`) REFERENCES `vtiger_field` (`fieldname`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wordtemplates
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wordtemplates`;
CREATE TABLE `vtiger_wordtemplates`  (
  `templateid` int(19) NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parent_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` longblob NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `filesize` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filetype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`templateid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wordtemplates_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wordtemplates_seq`;
CREATE TABLE `vtiger_wordtemplates_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ws_entity
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity`;
CREATE TABLE `vtiger_ws_entity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handler_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handler_class` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ismodule` int(3) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_entity_fieldtype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity_fieldtype`;
CREATE TABLE `vtiger_ws_entity_fieldtype`  (
  `fieldtypeid` int(19) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fieldtypeid`) USING BTREE,
  UNIQUE INDEX `vtiger_idx_1_tablename_fieldname`(`table_name`, `field_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_entity_fieldtype_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity_fieldtype_seq`;
CREATE TABLE `vtiger_ws_entity_fieldtype_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ws_entity_name
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity_name`;
CREATE TABLE `vtiger_ws_entity_name`  (
  `entity_id` int(11) NOT NULL,
  `name_fields` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`entity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_entity_referencetype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity_referencetype`;
CREATE TABLE `vtiger_ws_entity_referencetype`  (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fieldtypeid`, `type`) USING BTREE,
  CONSTRAINT `vtiger_fk_1_actors_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES `vtiger_ws_entity_fieldtype` (`fieldtypeid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_entity_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity_seq`;
CREATE TABLE `vtiger_ws_entity_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ws_entity_tables
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_entity_tables`;
CREATE TABLE `vtiger_ws_entity_tables`  (
  `webservice_entity_id` int(11) NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`webservice_entity_id`, `table_name`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_ws_actor_tables` FOREIGN KEY (`webservice_entity_id`) REFERENCES `vtiger_ws_entity` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_fieldinfo
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_fieldinfo`;
CREATE TABLE `vtiger_ws_fieldinfo`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `property_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `property_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_fieldtype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_fieldtype`;
CREATE TABLE `vtiger_ws_fieldtype`  (
  `fieldtypeid` int(19) NOT NULL AUTO_INCREMENT,
  `uitype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fieldtypeid`) USING BTREE,
  UNIQUE INDEX `uitype_idx`(`uitype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_operation
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_operation`;
CREATE TABLE `vtiger_ws_operation`  (
  `operationid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handler_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handler_method` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prelogin` int(3) NOT NULL,
  PRIMARY KEY (`operationid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_operation_parameters
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_operation_parameters`;
CREATE TABLE `vtiger_ws_operation_parameters`  (
  `operationid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`operationid`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_operation_seq
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_operation_seq`;
CREATE TABLE `vtiger_ws_operation_seq`  (
  `id` int(11) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for vtiger_ws_referencetype
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_referencetype`;
CREATE TABLE `vtiger_ws_referencetype`  (
  `fieldtypeid` int(19) NOT NULL,
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`fieldtypeid`, `type`) USING BTREE,
  CONSTRAINT `fk_1_vtiger_referencetype` FOREIGN KEY (`fieldtypeid`) REFERENCES `vtiger_ws_fieldtype` (`fieldtypeid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_ws_userauthtoken
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_ws_userauthtoken`;
CREATE TABLE `vtiger_ws_userauthtoken`  (
  `userid` int(19) NOT NULL,
  `token` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiretime` int(19) NOT NULL,
  PRIMARY KEY (`userid`, `expiretime`) USING BTREE,
  UNIQUE INDEX `userid_idx`(`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wsapp
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wsapp`;
CREATE TABLE `vtiger_wsapp`  (
  `appid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`appid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wsapp_handlerdetails
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wsapp_handlerdetails`;
CREATE TABLE `vtiger_wsapp_handlerdetails`  (
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `handlerclass` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `handlerpath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wsapp_queuerecords
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wsapp_queuerecords`;
CREATE TABLE `vtiger_wsapp_queuerecords`  (
  `syncserverid` int(19) NULL DEFAULT NULL,
  `details` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appid` int(19) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wsapp_recordmapping
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wsapp_recordmapping`;
CREATE TABLE `vtiger_wsapp_recordmapping`  (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `serverid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientmodifiedtime` datetime NULL DEFAULT NULL,
  `appid` int(11) NULL DEFAULT NULL,
  `servermodifiedtime` datetime NULL DEFAULT NULL,
  `serverappid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_wsapp_sync_state
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_wsapp_sync_state`;
CREATE TABLE `vtiger_wsapp_sync_state`  (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stateencodedvalues` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userid` int(19) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vtiger_zx
-- ----------------------------
DROP TABLE IF EXISTS `vtiger_zx`;
CREATE TABLE `vtiger_zx`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `roleid` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow`  (
  `ticketid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdtime` date NOT NULL,
  `prod_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `inserted_date` date NOT NULL COMMENT 'Tanggal kapan data teraakkhir diupdate',
  `ownerid` int(11) NULL DEFAULT NULL,
  `insert_time` time NULL DEFAULT NULL,
  PRIMARY KEY (`ticketid`) USING BTREE,
  UNIQUE INDEX `ticket_no`(`ticket_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 491247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wrkfl_task
-- ----------------------------
DROP TABLE IF EXISTS `wrkfl_task`;
CREATE TABLE `wrkfl_task`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `wkfl` int(11) NULL DEFAULT NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `count_summary` int(11) NULL DEFAULT NULL,
  `count_lastsummary` int(11) NULL DEFAULT NULL,
  `jum_countsummary` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for v_AEPPin
-- ----------------------------
DROP VIEW IF EXISTS `v_AEPPin`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_AEPPin` AS select `vtigercrm54`.`vtiger_stage_cardinfo`.`crdnbr` AS `crdnbr`,`vtigercrm54`.`vtiger_stage_cardinfo`.`custdob` AS `custdob`,`vtigercrm54`.`vtiger_stage_cardinfo`.`crdblk` AS `crdblk`,`vtigercrm54`.`vtiger_stage_cardinfo`.`acct_blk` AS `acct_blk` from `vtiger_stage_cardinfo`;

-- ----------------------------
-- View structure for v_case_pooling
-- ----------------------------
DROP VIEW IF EXISTS `v_case_pooling`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_case_pooling` AS select `vtiger_crmentity`.`crmid` AS `crmid`,`vtiger_ticketcf`.`cf_701` AS `nama`,`vtiger_crmentity`.`createdtime` AS `date` from (`vtiger_crmentity` join `vtiger_ticketcf` on((`vtiger_crmentity`.`crmid` = `vtiger_ticketcf`.`ticketid`))) where (`vtiger_crmentity`.`createdtime` like '2014-02%');

-- ----------------------------
-- View structure for v_listTicketDashboard
-- ----------------------------
DROP VIEW IF EXISTS `v_listTicketDashboard`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_listTicketDashboard` AS select `c`.`cf_701` AS `nama`,`b`.`createdtime` AS `createdtime`,`c`.`cf_644` AS `no_rekening`,`c`.`cf_720` AS `no_kartu`,`a`.`status` AS `STATUS`,`a`.`priority` AS `priority`,`b`.`smownerid` AS `assignedto`,`a`.`ticket_no` AS `ticket_no` from (((`vtiger_troubletickets` `a` left join `vtiger_crmentity` `b` on((`b`.`crmid` = `a`.`ticketid`))) left join `vtiger_ticketcf` `c` on((`c`.`ticketid` = `a`.`ticketid`))) left join `vtiger_user2role` `d` on((`d`.`userid` = `b`.`smcreatorid`))) where ((1 = 1) and (`b`.`deleted` <> '1')) order by `b`.`createdtime` desc;

-- ----------------------------
-- View structure for v_mk_jeniskasus
-- ----------------------------
DROP VIEW IF EXISTS `v_mk_jeniskasus`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_mk_jeniskasus` AS select max(`mk_jeniskasus`.`jeniskasusid`) AS `jeniskasus`,`mk_jeniskasus`.`nama` AS `nama`,max(`mk_jeniskasus`.`slabusiness`) AS `slabusiness`,max(`mk_jeniskasus`.`slatarget`) AS `slatarget`,max(`mk_jeniskasus`.`subkasusid`) AS `subkasusid`,max(`mk_jeniskasus`.`kasusid`) AS `kasusid` from `mk_jeniskasus` group by `mk_jeniskasus`.`nama`;

-- ----------------------------
-- Function structure for addWorkdayWithoutWeekendAndHolidays
-- ----------------------------
DROP FUNCTION IF EXISTS `addWorkdayWithoutWeekendAndHolidays`;
delimiter ;;
CREATE FUNCTION `addWorkdayWithoutWeekendAndHolidays`(`myDate` date,`numDays` int)
 RETURNS date
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE j INT;
    DECLARE nextDate DATE;
    
    SET nextDate = myDate;
    
    WHILE i < numDays DO
        SET nextDate = ADDDATE(nextDate, 1);
        
        SET j = (SELECT COUNT(*) FROM clone_vtiger_activity WHERE date_start = nextDate);
        IF j > 0 OR DAYOFWEEK(nextDate) IN (1,7) THEN
            SET i = i - 1;
        END IF;
        
        SET i = i + 1;
    END WHILE;
    
    RETURN nextDate;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for add_workday
-- ----------------------------
DROP FUNCTION IF EXISTS `add_workday`;
delimiter ;;
CREATE FUNCTION `add_workday`(mydate DATE, numday INT)
 RETURNS date
BEGIN
DECLARE num_week INT DEFAULT 0;
DECLARE num_day INT DEFAULT 0;
DECLARE adj INT DEFAULT 0;
DECLARE total INT DEFAULT 0;
SET num_week = numday DIV 5;
SET num_day = MOD(numday, 5);
IF (WEEKDAY(mydate) + num_day >= 5) then
SET adj = 2;
END IF;
SET total = num_week * 7 + adj + num_day;
RETURN DATE_ADD(mydate, INTERVAL total DAY);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getReffNo
-- ----------------------------
DROP PROCEDURE IF EXISTS `getReffNo`;
delimiter ;;
CREATE PROCEDURE `getReffNo`()
BEGIN
  Set @abc = 0;
     Select nomor into @abc from eskalasi_reffNo;
     if @abc = 0 then insert into eskalasi_reffNo value (1);
     end if;
     Set @abc = @abc+1;
     Update eskalasi_reffNo set nomor = @abc;
     Select @abc as Nomor;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for getWorkdays
-- ----------------------------
DROP FUNCTION IF EXISTS `getWorkdays`;
delimiter ;;
CREATE FUNCTION `getWorkdays`(first_date DATETIME, second_date DATETIME)
 RETURNS int(11)
  DETERMINISTIC
BEGIN

DECLARE start_date DATE;
DECLARE end_date DATE;
DECLARE diff INT;
DECLARE NumberOfWeeks INT;
DECLARE RemainingDays INT;
DECLARE firstDayOfTheWeek INT;
DECLARE lastDayOfTheWeek INT;
DECLARE WorkingDays INT;
DECLARE holiday INT;

IF (first_date < second_date) THEN
SET start_date = first_date;
SET end_date = second_date;
ELSE
SET start_date = second_date;
SET end_date = first_date;
END IF;
SET diff = DATEDIFF(end_date, start_date);
SET NumberOfWeeks=FLOOR(diff/7);
SET RemainingDays=MOD(diff,7);
SET firstDayOfTheWeek=DAYOFWEEK(start_date);
SET lastDayOfTheWeek=DAYOFWEEK(end_date);
IF(firstDayOfTheWeek <= lastDayOfTheWeek) THEN
   IF( firstDayOfTheWeek<=6 AND 6 <=lastDayOfTheWeek) THEN SET        RemainingDays=RemainingDays-1; END IF;
   IF( firstDayOfTheWeek<=7 AND 7 <=lastDayOfTheWeek) THEN SET RemainingDays=RemainingDays-1; END IF;
   ELSE
       IF( firstDayOfTheWeek=7) THEN SET RemainingDays=RemainingDays-1;
         IF (lastDayOfTheWeek=6) THEN  SET RemainingDays=RemainingDays-1; END IF;
       ELSE SET RemainingDays=RemainingDays-2;
       END IF;
   END IF;
SELECT COUNT(date_start) INTO @DESC
FROM clone_vtiger_activity
WHERE date_start BETWEEN start_date AND end_date;
SET holiday=@DESC;
   SET WorkingDays=NumberOfWeeks*5;
#Here we substract the number of holidays from the working week
   IF(RemainingDays>0) THEN RETURN WorkingDays+RemainingDays-holiday;
   ELSE RETURN WorkingDays-holiday; END IF;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for getWorkingday
-- ----------------------------
DROP FUNCTION IF EXISTS `getWorkingday`;
delimiter ;;
CREATE FUNCTION `getWorkingday`(d1 datetime,d2 datetime, retType varchar(20))
 RETURNS varchar(255) CHARSET utf8
BEGIN
 DECLARE dow1, dow2,daydiff,workdays, weekenddays, retdays,hourdiff INT;
    declare newstrt_dt datetime;
   SELECT dd.iDiff, dd.iDiff - dd.iWeekEndDays AS iWorkDays, dd.iWeekEndDays into daydiff, workdays, weekenddays
  FROM (
   SELECT
     dd.iDiff,
     ((dd.iWeeks * 2) + 
      IF(dd.iSatDiff >= 0 AND dd.iSatDiff < dd.iDays, 1, 0) + 
      IF (dd.iSunDiff >= 0 AND dd.iSunDiff < dd.iDays, 1, 0)) AS iWeekEndDays
       FROM (
      SELECT  dd.iDiff, FLOOR(dd.iDiff / 7) AS iWeeks, dd.iDiff % 7 iDays, 5 - dd.iStartDay AS iSatDiff,  6 - dd.iStartDay AS iSunDiff
     FROM (
      SELECT
        1 + DATEDIFF(d2, d1) AS iDiff,
        WEEKDAY(d1) AS iStartDay
      ) AS dd
    ) AS dd
  ) AS dd ;
  if(retType = 'day_diffs') then
  set retdays = daydiff; 
 elseif(retType = 'work_days') then
  set retdays = workdays; 
 elseif(retType = 'weekend_days') then  
  set retdays = weekenddays; 
 end if; 
    RETURN retdays; 
    END
;;
delimiter ;

-- ----------------------------
-- Function structure for Test
-- ----------------------------
DROP FUNCTION IF EXISTS `Test`;
delimiter ;;
CREATE FUNCTION `Test`()
 RETURNS int(11)
BEGIN

DECLARE start_date DATE;
DECLARE end_date DATE;
DECLARE diff INT;
DECLARE NumberOfWeeks INT;
DECLARE RemainingDays INT;
DECLARE firstDayOfTheWeek INT;
DECLARE lastDayOfTheWeek INT;
DECLARE WorkingDays INT;
DECLARE holiday INT;

IF (first_date < second_date) THEN
SET start_date = first_date;
SET end_date = second_date;
ELSE
SET start_date = second_date;
SET end_date = first_date;
END IF;
## In the original code one was added at the end of the statement to include both days in interval
SET diff = DATEDIFF(end_date, start_date);
SET NumberOfWeeks=FLOOR(diff/7);
SET RemainingDays=MOD(diff,7);
SET firstDayOfTheWeek=DAYOFWEEK(start_date);
SET lastDayOfTheWeek=DAYOFWEEK(end_date);
IF(firstDayOfTheWeek <= lastDayOfTheWeek) THEN
   IF( firstDayOfTheWeek<=6 AND 6 <=lastDayOfTheWeek) THEN SET        RemainingDays=RemainingDays-1; END IF;
   IF( firstDayOfTheWeek<=7 AND 7 <=lastDayOfTheWeek) THEN SET RemainingDays=RemainingDays-1; END IF;
   ELSE
       IF( firstDayOfTheWeek=7) THEN SET RemainingDays=RemainingDays-1;
         IF (lastDayOfTheWeek=6) THEN  SET RemainingDays=RemainingDays-1; END IF;
       ELSE SET RemainingDays=RemainingDays-2;
       END IF;
   END IF;
#Here we count the holidays that had occured during the period where are testing
SELECT COUNT(DATE) INTO @DESC
FROM holidays
WHERE FECHA BETWEEN start_date AND end_date;
SET holiday=@DESC;
   SET WorkingDays=NumberOfWeeks*5;
#Here we substract the number of holidays from the working week
   IF(RemainingDays>0) THEN RETURN WorkingDays+RemainingDays-holiday;
   ELSE RETURN WorkingDays-holiday; END IF;
 END
;;
delimiter ;

-- ----------------------------
-- Function structure for ToDigits
-- ----------------------------
DROP FUNCTION IF EXISTS `ToDigits`;
delimiter ;;
CREATE FUNCTION `ToDigits`(str CHAR(32))
 RETURNS char(32) CHARSET utf8
BEGIN
 DECLARE i, len SMALLINT DEFAULT 1;
  DECLARE ret CHAR(32) DEFAULT '';
  DECLARE c CHAR(1);
  IF str IS NULL
  THEN 
    RETURN "";
  END IF;
  SET len = CHAR_LENGTH( str );
  REPEAT
    BEGIN
      SET c = MID( str, i, 1 );
      IF c BETWEEN '0' AND '9' THEN 
        SET ret=CONCAT(ret,c);
      END IF;
      SET i = i + 1;
    END;
  UNTIL i > len END REPEAT;
  RETURN ret;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for uSmownerid
-- ----------------------------
DROP PROCEDURE IF EXISTS `uSmownerid`;
delimiter ;;
CREATE PROCEDURE `uSmownerid`()
BEGIN
	#Routine body goes here...
declare crmid int(19);
declare ownerid int(19);
declare l_last_row_fetched int;
declare c_crmentity cursor for
   SELECT vtiger_crmentity.crmid,vtiger_crmentity.smownerid FROM vtiger_crmentity
   INNER JOIN vtiger_troubletickets ON vtiger_troubletickets.ticketid = vtiger_crmentity.crmid
   where vtiger_troubletickets.`status`='Open';


DECLARE CONTINUE HANDLER FOR NOT FOUND SET l_last_row_fetched=1;
SET l_last_row_fetched=0;

open c_crmentity;
cursor01: LOOP
   fetch c_crmentity into crmid,ownerid;
   IF l_last_row_fetched=1 THEN
      LEAVE cursor01;
   END IF;
end LOOP cursor01;
close c_crmentity;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vtiger_troubletickets
-- ----------------------------
DROP TRIGGER IF EXISTS `updateTicketCfAferUpdateVTT`;
delimiter ;;
CREATE TRIGGER `updateTicketCfAferUpdateVTT` AFTER UPDATE ON `vtiger_troubletickets` FOR EACH ROW BEGIN
	IF (NEW.status <> OLD.status AND NEW.status = 'Closed by Divisi' and OLD.status <> 'Closed by Divisi')
	THEN
		UPDATE vtiger_ticketcf SET cf_736 = DATE_FORMAT(NOW(),'%Y-%m-%d')
		WHERE ticketid = OLD.ticketid;
	END IF;
    END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vtiger_troubletickets_2022
-- ----------------------------
DROP TRIGGER IF EXISTS `updateTicketCfAferUpdateVTT_copy1`;
delimiter ;;
CREATE TRIGGER `updateTicketCfAferUpdateVTT_copy1` AFTER UPDATE ON `vtiger_troubletickets_2022` FOR EACH ROW BEGIN
	IF (NEW.status <> OLD.status AND NEW.status = 'Closed by Divisi' and OLD.status <> 'Closed by Divisi')
	THEN
		UPDATE vtiger_ticketcf SET cf_736 = DATE_FORMAT(NOW(),'%Y-%m-%d')
		WHERE ticketid = OLD.ticketid;
	END IF;
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
