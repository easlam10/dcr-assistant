/*
 Navicat Premium Data Transfer

 Source Server         : KIPS ERP NEW RDC
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39-0ubuntu0.20.04.1)
 Source Host           : 192.168.2.55:3306
 Source Schema         : db_kips_erp

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39-0ubuntu0.20.04.1)
 File Encoding         : 65001

 Date: 23/07/2025 16:12:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_admission_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admission_type`;
CREATE TABLE `tbl_admission_type`  (
  `adm_id` int NOT NULL AUTO_INCREMENT,
  `adm_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `adm_description` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adm_p_id` int NULL DEFAULT NULL COMMENT 'tbl_programs:p_id',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL DEFAULT 1,
  `adm_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`adm_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_applicant_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_applicant_status`;
CREATE TABLE `tbl_applicant_status`  (
  `a_status_id` int NOT NULL AUTO_INCREMENT,
  `a_status_no` int NOT NULL COMMENT 'a_no',
  `a_status_reg` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `a_status_session` int NULL DEFAULT 0,
  `a_status_project` int NULL DEFAULT 0,
  `a_status_campus` int NULL DEFAULT 0,
  `a_status_program` int NULL DEFAULT 0,
  `a_status_discipline` int NULL DEFAULT 0,
  `a_status_discipline_sub` int NULL DEFAULT 0,
  `a_status_admission_type` int NULL DEFAULT 0,
  `a_status_section` int NULL DEFAULT 0,
  `a_status_description` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `a_status_date` datetime NULL DEFAULT NULL,
  `a_status_state` tinyint(1) NULL DEFAULT 0,
  `a_status_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `a_status_reason` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `a_status_amount` int NULL DEFAULT 0,
  `a_status_by` int NULL DEFAULT 0,
  `a_status_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `a_status` tinyint(1) NOT NULL DEFAULT 1,
  `a_un_freeze_date` datetime NULL DEFAULT NULL,
  `a_total_freeze_month` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55789 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_applicants
-- ----------------------------
DROP TABLE IF EXISTS `tbl_applicants`;
CREATE TABLE `tbl_applicants`  (
  `a_no` int NOT NULL AUTO_INCREMENT,
  `a_reg` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `a_campus_id` int NOT NULL COMMENT 'tbl_campuses:camp_no',
  `a_doa` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `a_session_id` int NOT NULL,
  `a_program_id` int NOT NULL DEFAULT 0 COMMENT 'tbl_programs:p_id',
  `a_discipline_id` int NOT NULL DEFAULT 0 COMMENT 'tbl_discipline:discipline_id',
  `a_discipline_sid` int NOT NULL DEFAULT 0 COMMENT 'tbl_discipline_sub:discipline_sid',
  `a_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `a_fname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `a_gender` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'MALE',
  `a_dob` date NULL DEFAULT NULL,
  `a_cnic` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Applicant CNIC/B-Form',
  `a_fcnic` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Father CNIC',
  `a_nationality` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_area` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_caddress` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_ccity` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_paddress` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_pcity` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_lcontact` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'ec applicant father no',
  `a_mcontact` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'ec applicant no',
  `a_econtact` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_fcontact` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Father Contact Number',
  `a_current_school` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_category` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_total_marks_old` smallint NULL DEFAULT 0,
  `a_obtained_marks_old` int NULL DEFAULT 0,
  `a_total_marks` int NULL DEFAULT 0,
  `a_obtained_marks` int NULL DEFAULT 0 COMMENT 'Obtained Marks (PAST)',
  `a_total_phy` smallint NULL DEFAULT 0,
  `a_obtained_phy` smallint NULL DEFAULT 0,
  `a_total_che` smallint NULL DEFAULT 0,
  `a_obtained_che` smallint NULL DEFAULT 0,
  `a_total_bio` smallint NULL DEFAULT 0,
  `a_obtained_bio` smallint NULL DEFAULT 0,
  `a_total_math` smallint NULL DEFAULT 0,
  `a_obtained_math` smallint NULL DEFAULT 0,
  `a_total_cs` smallint NULL DEFAULT 0,
  `a_obtained_cs` smallint NULL DEFAULT 0,
  `a_total_eng` smallint NULL DEFAULT 0,
  `a_obtained_eng` smallint NULL DEFAULT 0,
  `a_total_urdu` smallint NULL DEFAULT 0,
  `a_obtained_urdu` smallint NULL DEFAULT 0,
  `a_total_isl` smallint NULL DEFAULT 0,
  `a_obtained_isl` smallint NULL DEFAULT 0,
  `a_total_ps` smallint NULL DEFAULT 0,
  `a_obtained_ps` smallint NULL DEFAULT 0,
  `a_total_tq` smallint NULL DEFAULT 0,
  `a_obtained_tq` smallint NULL DEFAULT 0,
  `a_is_hold` tinyint NOT NULL DEFAULT 0,
  `a_unhold_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `a_status` tinyint NOT NULL DEFAULT 1,
  `a_dec_g` tinyint(1) NOT NULL DEFAULT 0,
  `a_dec_s` tinyint(1) NOT NULL DEFAULT 0,
  `a_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_last_school` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NA',
  `a_no_online` int NOT NULL DEFAULT 0,
  `p_group_id` int NOT NULL DEFAULT 0 COMMENT 'tbl_admission_type:adm_id',
  `pt_id` int NOT NULL DEFAULT 0 COMMENT 'tbl_projects:project_id',
  `parent_sec_id` int UNSIGNED NULL DEFAULT 0,
  `sec_id` int NULL DEFAULT NULL,
  `a_pic` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'no_image.gif',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_tran` tinyint(1) NULL DEFAULT 0 COMMENT 'Is Transferred?',
  `is_posted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int NULL DEFAULT 1 COMMENT 'tbl_users:u_no',
  `a_status_mode` int NULL DEFAULT 1 COMMENT '1:active, 2:left, 3:struck-off, 4:other',
  `a_status_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_status_reason` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_status_by` int NULL DEFAULT 0,
  `a_status_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_inquiry` tinyint(1) NULL DEFAULT 0,
  `a_inquiry_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_inquirer_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_inquirer_relationship` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_pfy` tinyint(1) NULL DEFAULT 0,
  `is_confirm` tinyint(1) NULL DEFAULT 0,
  `inquiry_a_no` int NULL DEFAULT 0,
  `is_admission` tinyint(1) NULL DEFAULT 0,
  `is_repeater` tinyint(1) NULL DEFAULT 0,
  `repeater_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `repeater_remarks` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_demoted` tinyint(1) NULL DEFAULT 0,
  `is_promoted` tinyint(1) NULL DEFAULT 0,
  `is_transfer` tinyint(1) NULL DEFAULT 0,
  `transfer_type` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'NONE' COMMENT 'NONE, IN, OUT',
  `transfer_campus_no` int NULL DEFAULT 0,
  `transfer_date` date NULL DEFAULT NULL,
  `sra` int NULL DEFAULT 0,
  `a_board` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_board_sub` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_subjects` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_subjects_count` tinyint NULL DEFAULT 0,
  `a_roll_number` int NULL DEFAULT NULL,
  `a_admission_source` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_form_submission_date` date NULL DEFAULT NULL,
  `a_from_section` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `a_pin` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_cp` tinyint(1) NULL DEFAULT 0,
  `lms_user_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lms_password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lms_status` tinyint(1) NULL DEFAULT 0,
  `parent_portal_password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `parent_portal_status` tinyint(1) NULL DEFAULT 1,
  `student_portal_password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `student_portal_status` tinyint(1) NULL DEFAULT 1,
  `parent_portal_first_login` tinyint(1) NULL DEFAULT 1,
  `student_portal_first_login` tinyint(1) NULL DEFAULT 1,
  `old_class_id` int NULL DEFAULT 0,
  `old_class_group_id` int NULL DEFAULT 0,
  `old_campus_code` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `old_sec_no` int NULL DEFAULT 0,
  `old_a_reg` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `old_campus_no` int NULL DEFAULT 0,
  `old_doa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `old_dob` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_discipline_trans` tinyint(1) NULL DEFAULT 0,
  `policy_discount` tinyint(1) NULL DEFAULT NULL,
  `other_discount_id` int NULL DEFAULT NULL,
  `police_ref_letter` tinyint(1) NULL DEFAULT NULL,
  `police_sh_pen_book` tinyint(1) NULL DEFAULT NULL,
  `police_od_pay_slip` tinyint(1) NULL DEFAULT NULL,
  `police_od_ser_book` tinyint(1) NULL DEFAULT NULL,
  `sc_franchise_remarks` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `package_flag` tinyint NULL DEFAULT 0,
  `a_wwb` tinyint NULL DEFAULT 0 COMMENT '0:Nill, 1:wwb, 2:eobi, 3: other ngo',
  PRIMARY KEY (`a_no`) USING BTREE,
  INDEX `tbl_applicants_campus_id`(`a_campus_id` ASC) USING BTREE,
  INDEX `tbl_applicants_program_id`(`a_program_id` ASC) USING BTREE,
  INDEX `tbl_applicants_session_id`(`a_session_id` ASC) USING BTREE,
  INDEX `a_discipline_id`(`a_discipline_id` ASC) USING BTREE,
  INDEX `a_cnic`(`a_cnic` ASC) USING BTREE,
  INDEX `p_group_id`(`p_group_id` ASC) USING BTREE,
  INDEX `pt_id`(`pt_id` ASC) USING BTREE,
  INDEX `sec_id`(`sec_id` ASC) USING BTREE,
  INDEX `a_reg`(`a_reg` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1344891 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_attendance_staff
-- ----------------------------
DROP TABLE IF EXISTS `tbl_attendance_staff`;
CREATE TABLE `tbl_attendance_staff`  (
  `att_sta_no` bigint NOT NULL AUTO_INCREMENT,
  `att_sta_u_no` int NULL DEFAULT 0,
  `att_sta_s_no` int NULL DEFAULT 0 COMMENT 's_id',
  `att_sta_id` int NOT NULL DEFAULT 0 COMMENT 's_no',
  `att_sta_type_in` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Automated',
  `att_sta_camp_id_in` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_ter_ip_in` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_dt_in` datetime NULL DEFAULT NULL,
  `att_sta_sensor_in` int NULL DEFAULT 0,
  `att_sta_type_out` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Automated',
  `att_sta_camp_id_out` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_ter_ip_out` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_dt_out` datetime NULL DEFAULT NULL,
  `att_sta_sensor_out` int NULL DEFAULT 0,
  `att_sta_subject_id` int NULL DEFAULT 0,
  `att_sta_status` tinyint NOT NULL DEFAULT 1,
  `att_sta_rm_in` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `att_sta_rm_out` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_ip` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_posted` tinyint(1) NOT NULL DEFAULT 0,
  `att_sta_cm_posted` tinyint(1) NULL DEFAULT 0,
  `att_sta_cm_id` int NULL DEFAULT NULL,
  `att_sta_cm_deduct` tinyint(1) NULL DEFAULT 0,
  `att_sta_cm_datetime` datetime NULL DEFAULT NULL,
  `att_sta_cm_remarks` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_dd_posted` tinyint(1) NULL DEFAULT 0,
  `att_sta_dd_id` int NULL DEFAULT NULL,
  `att_sta_dd_deduct` tinyint(1) NULL DEFAULT 0,
  `att_sta_dd_datetime` datetime NULL DEFAULT NULL,
  `att_sta_dd_remarks` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_supervision_state` smallint NULL DEFAULT 0,
  `att_sta_hr_posted` tinyint(1) NULL DEFAULT 0,
  `att_sta_hr_id` int NULL DEFAULT NULL,
  `att_sta_hr_deduct` tinyint(1) NULL DEFAULT 0,
  `att_sta_hr_datetime` datetime NULL DEFAULT NULL,
  `att_sta_hr_remarks` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_sta_log_id` bigint NULL DEFAULT 0,
  `att_sta_guid` char(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`att_sta_no`) USING BTREE,
  INDEX `att_sta_u_no`(`att_sta_u_no` ASC) USING BTREE,
  INDEX `att_sta_s_no`(`att_sta_s_no` ASC) USING BTREE,
  INDEX `att_sta_type_in`(`att_sta_type_in` ASC) USING BTREE,
  INDEX `att_sta_camp_id_in`(`att_sta_camp_id_in` ASC) USING BTREE,
  INDEX `att_sta_dt_in`(`att_sta_dt_in` ASC) USING BTREE,
  INDEX `att_sta_type_out`(`att_sta_type_out` ASC) USING BTREE,
  INDEX `att_sta_camp_id_out`(`att_sta_camp_id_out` ASC) USING BTREE,
  INDEX `att_sta_dt_out`(`att_sta_dt_out` ASC) USING BTREE,
  INDEX `att_sta_subject_id`(`att_sta_subject_id` ASC) USING BTREE,
  INDEX `att_sta_id`(`att_sta_id` ASC) USING BTREE,
  INDEX `att_sta_guid`(`att_sta_guid` ASC) USING BTREE,
  INDEX `att_sta_log_id`(`att_sta_log_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225330907 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_attendance_students
-- ----------------------------
DROP TABLE IF EXISTS `tbl_attendance_students`;
CREATE TABLE `tbl_attendance_students`  (
  `att_stu_no` bigint NOT NULL AUTO_INCREMENT,
  `att_a_no` int NOT NULL,
  `att_lec_number` smallint NULL DEFAULT 0,
  `att_lec_room_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `att_campus_id` int NULL DEFAULT NULL COMMENT 'tbl_campuses:camp_no',
  `att_session_id` int NULL DEFAULT NULL,
  `att_program_id` int NULL DEFAULT NULL COMMENT 'tbl_programs:p_id',
  `att_discipline_id` int NULL DEFAULT NULL COMMENT 'tbl_discipline:discipline_id',
  `att_section_id` int NULL DEFAULT NULL COMMENT 'tbl_sections:sec_no',
  `att_roster_id` bigint NOT NULL COMMENT 'tbl_roster:roster_id',
  `att_subject_id` int NULL DEFAULT NULL COMMENT 'tbl_subjects:sub_id',
  `att_teacher_id` int NULL DEFAULT NULL,
  `att_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `att_status` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'P,L,A',
  `att_stu_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'tbl_applicants:a_reg',
  `att_stu_type_in` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Automated',
  `att_stu_camp_id_in` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_stu_ter_ip_in` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_stu_dt_in` datetime NULL DEFAULT NULL,
  `att_stu_type_out` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Automated',
  `att_stu_camp_id_out` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_stu_ter_ip_out` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `att_stu_dt_out` datetime NULL DEFAULT NULL,
  `att_stu_status` tinyint NOT NULL DEFAULT 1,
  `att_stu_rm_in` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `att_stu_rm_out` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_ip` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_posted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`att_stu_no`) USING BTREE,
  INDEX `att_a_no`(`att_a_no` ASC) USING BTREE,
  INDEX `att_lec_number`(`att_lec_number` ASC) USING BTREE,
  INDEX `att_lec_room_number`(`att_lec_room_number` ASC) USING BTREE,
  INDEX `att_campus_id`(`att_campus_id` ASC) USING BTREE,
  INDEX `att_session_id`(`att_session_id` ASC) USING BTREE,
  INDEX `att_program_id`(`att_program_id` ASC) USING BTREE,
  INDEX `att_discipline_id`(`att_discipline_id` ASC) USING BTREE,
  INDEX `att_section_id`(`att_section_id` ASC) USING BTREE,
  INDEX `att_roster_id`(`att_roster_id` ASC) USING BTREE,
  INDEX `att_subject_id`(`att_subject_id` ASC) USING BTREE,
  INDEX `att_teacher_id`(`att_teacher_id` ASC) USING BTREE,
  INDEX `att_datetime`(`att_datetime` ASC) USING BTREE,
  INDEX `att_stu_id`(`att_stu_id` ASC) USING BTREE,
  INDEX `att_stu_type_in`(`att_stu_type_in` ASC) USING BTREE,
  INDEX `att_stu_camp_id_in`(`att_stu_camp_id_in` ASC) USING BTREE,
  INDEX `att_stu_dt_in`(`att_stu_dt_in` ASC) USING BTREE,
  INDEX `att_status`(`att_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26674173 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_boards
-- ----------------------------
DROP TABLE IF EXISTS `tbl_boards`;
CREATE TABLE `tbl_boards`  (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `board_group_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `board_group_short` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `board_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `board_short` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `board_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `board_create_by` int NULL DEFAULT 0,
  `board_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `board_status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`board_id`) USING BTREE,
  INDEX `board_title`(`board_title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_campuses
-- ----------------------------
DROP TABLE IF EXISTS `tbl_campuses`;
CREATE TABLE `tbl_campuses`  (
  `camp_no` int NOT NULL AUTO_INCREMENT,
  `camp_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `camp_title` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `camp_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_city` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'LAHORE',
  `camp_country` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'PAKISTAN',
  `camp_manager_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `camp_amanager_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `camp_status` tinyint NOT NULL DEFAULT 1,
  `camp_contact1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_contact2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_contact3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `camp_type` tinyint NULL DEFAULT 0 COMMENT '1=ET, 2=EC, 3=School, 4=College, 21=EC+ET',
  `camp_zone_id` int NULL DEFAULT 1 COMMENT 'tbl_zones:zone_id',
  `camp_company_id` int NULL DEFAULT 1 COMMENT '1:TETBL, 3:QBL',
  `camp_satellite` tinyint(1) NULL DEFAULT 0,
  `camp_reality` tinyint(1) NULL DEFAULT 1 COMMENT 'Is campus real?',
  `camp_hr_limit_management` int NULL DEFAULT 0,
  `camp_hr_limit_faculty` int NULL DEFAULT 0,
  `camp_remarks` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_gender` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'BOYS',
  `camp_region_id` tinyint NULL DEFAULT 0,
  `is_sms_campaign_allowed` tinyint(1) NULL DEFAULT 0,
  `camp_sms_quota` int NULL DEFAULT 0,
  `camp_sms_quota_remaining` int NULL DEFAULT 0,
  `camp_sms_quota_start` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_sms_quota_end` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `camp_abbr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`camp_no`) USING BTREE,
  UNIQUE INDEX `camp_no`(`camp_no` ASC) USING BTREE,
  INDEX `camp_id`(`camp_id` ASC) USING BTREE,
  INDEX `camp_type`(`camp_type` ASC) USING BTREE,
  INDEX `camp_zone_id`(`camp_zone_id` ASC) USING BTREE,
  INDEX `camp_company_id`(`camp_company_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_cash_collection
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cash_collection`;
CREATE TABLE `tbl_cash_collection`  (
  `cc_no` int NOT NULL AUTO_INCREMENT,
  `fee_no` int NOT NULL,
  `fee_a_no` int NOT NULL,
  `fee_a_reg` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fee_date` date NULL DEFAULT NULL,
  `fee_month` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `fee_session_id` int NULL DEFAULT 0,
  `fee_project_id` int NULL DEFAULT 0,
  `fee_campus_id` int NULL DEFAULT 0,
  `fee_program_id` int NULL DEFAULT 0,
  `fee_discipline_id` int NULL DEFAULT 0,
  `fee_discipline_sid` int NULL DEFAULT 0,
  `fee_adm_id` int NULL DEFAULT 0,
  `fee_sec_no` int NULL DEFAULT 0,
  `fee_roll_no` int NULL DEFAULT 0,
  `fee_discount_id` int NULL DEFAULT 0,
  `fee_discount_percentage` int NULL DEFAULT 0,
  `fee_discount_amount` int NULL DEFAULT 0,
  `fee_admission_amount` int NULL DEFAULT 0,
  `fee_security_amount` int NULL DEFAULT 0,
  `fee_annual_amount` int NULL DEFAULT 0,
  `fee_ac_amount` int NULL DEFAULT 0,
  `fee_lim_amount` int NULL DEFAULT 0,
  `fee_thub_amount` int NULL DEFAULT 0,
  `fee_misc_amount` int NULL DEFAULT 0,
  `fee_lab_amount` int NULL DEFAULT 0,
  `fee_tuition_a_amount` int NULL DEFAULT 0,
  `fee_tuition_amount` int NULL DEFAULT 0,
  `fee_admission_discount` int NULL DEFAULT 0,
  `fee_security_discount` int NULL DEFAULT 0,
  `fee_annual_discount` int NULL DEFAULT 0,
  `fee_ac_discount` int NULL DEFAULT 0,
  `fee_tuition_a_discount` int NULL DEFAULT 0,
  `fee_tuition_discount` int NULL DEFAULT 0,
  `fee_disc_discount_amount` int NULL DEFAULT 0,
  `fee_disc_discount_reason` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `fee_other_discount_id` int NULL DEFAULT 0,
  `fee_other_discount_percentage` int NULL DEFAULT 0,
  `fee_other_discount_amount` int NULL DEFAULT 0,
  `fee_full_amount` int NULL DEFAULT 0,
  `fee_discount_total_amount` int NULL DEFAULT 0,
  `fee_final_amount` int NULL DEFAULT 0,
  `fee_installments` int NULL DEFAULT 1,
  `fee_installment_amount` int NULL DEFAULT 0,
  `fee_adjustment_01` int NULL DEFAULT 0,
  `fee_adjustment_02` int NULL DEFAULT 0,
  `fee_pfy_amount` int NULL DEFAULT 0,
  `fee_received_amount` int NULL DEFAULT 0,
  `fee_received_total_amount` int NULL DEFAULT 0,
  `fee_balance` int NULL DEFAULT 0,
  `fee_other_type` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_other_amount_due` int NULL DEFAULT 0,
  `fee_other_amount_received` int NULL DEFAULT 0,
  `fee_other_remarks` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_prospectus` tinyint(1) NULL DEFAULT 0,
  `fee_prospectus_received` int NULL DEFAULT 0,
  `fee_posted` tinyint(1) NOT NULL DEFAULT 0,
  `fee_posted_by` int NULL DEFAULT 0,
  `fee_posted_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `fee_created_by` int NOT NULL DEFAULT 1,
  `fee_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fee_status` tinyint(1) NOT NULL DEFAULT 1,
  `is_pfy` tinyint(1) NULL DEFAULT 0,
  `is_confirm` tinyint(1) NULL DEFAULT 0,
  `is_admission` tinyint(1) NULL DEFAULT 0,
  `is_repeater` tinyint(1) NULL DEFAULT 0,
  `repeater_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `repeater_remarks` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_promoted` tinyint(1) NULL DEFAULT 0,
  `cc_created_by` int NULL DEFAULT 0,
  `cc_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `cc_status` tinyint(1) NULL DEFAULT 1,
  `fee_lms_amount` int NULL DEFAULT NULL,
  `fee_library_amount` int NULL DEFAULT NULL,
  `fee_exam_amount` int NULL DEFAULT NULL,
  `fee_id_card_amount` int NULL DEFAULT NULL,
  `fee_service_amount` int NULL DEFAULT NULL,
  `fee_board_reg_amount` int NULL DEFAULT NULL,
  `fee_board_adm_amount` int NULL DEFAULT NULL,
  `fee_rnt_amount` int NULL DEFAULT NULL,
  `fee_lms_discount` int NULL DEFAULT NULL,
  `fee_library_discount` int NULL DEFAULT NULL,
  `fee_exam_discount` int NULL DEFAULT NULL,
  `fee_id_card_discount` int NULL DEFAULT NULL,
  `fee_service_discount` int NULL DEFAULT NULL,
  `fee_board_reg_discount` int NULL DEFAULT NULL,
  `fee_board_adm_discount` int NULL DEFAULT NULL,
  `fee_rnt_discount` int NULL DEFAULT NULL,
  `fee_lim_discount` int NULL DEFAULT NULL,
  `fee_fine_discount` int NULL DEFAULT NULL,
  `fee_fine_amount` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`cc_no`) USING BTREE,
  INDEX `fee_a_no`(`fee_a_no` ASC) USING BTREE,
  INDEX `fee_a_reg`(`fee_a_reg` ASC) USING BTREE,
  INDEX `fee_date`(`fee_date` ASC) USING BTREE,
  INDEX `fee_session_id`(`fee_session_id` ASC) USING BTREE,
  INDEX `fee_project_id`(`fee_project_id` ASC) USING BTREE,
  INDEX `fee_campus_id`(`fee_campus_id` ASC) USING BTREE,
  INDEX `fee_program_id`(`fee_program_id` ASC) USING BTREE,
  INDEX `fee_discipline_id`(`fee_discipline_id` ASC) USING BTREE,
  INDEX `fee_adm_id`(`fee_adm_id` ASC) USING BTREE,
  INDEX `fee_discipline_sid`(`fee_discipline_sid` ASC) USING BTREE,
  INDEX `fee_sec_no`(`fee_sec_no` ASC) USING BTREE,
  INDEX `fee_posted`(`fee_posted` ASC) USING BTREE,
  INDEX `fee_posted_by`(`fee_posted_by` ASC) USING BTREE,
  INDEX `fee_no`(`fee_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061110 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_cities
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cities`;
CREATE TABLE `tbl_cities`  (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_title` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city_post_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `province_id` int NULL DEFAULT 0,
  `province_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `country_id` int NULL DEFAULT NULL,
  `city_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`city_id`) USING BTREE,
  INDEX `country_id`(`country_id` ASC) USING BTREE,
  INDEX `province_id`(`province_id` ASC) USING BTREE,
  INDEX `city_post_code`(`city_post_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1295 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_companies
-- ----------------------------
DROP TABLE IF EXISTS `tbl_companies`;
CREATE TABLE `tbl_companies`  (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `company_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `company_year` int NULL DEFAULT 0,
  `company_person` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `company_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`company_id`) USING BTREE,
  INDEX `company_title`(`company_title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_departments
-- ----------------------------
DROP TABLE IF EXISTS `tbl_departments`;
CREATE TABLE `tbl_departments`  (
  `dept_no` int NOT NULL AUTO_INCREMENT,
  `dept_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dept_short_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dept_long_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dept_description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dept_status` tinyint NOT NULL DEFAULT 1,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dept_no`) USING BTREE,
  UNIQUE INDEX `dept_no`(`dept_no` ASC) USING BTREE,
  INDEX `dept_id`(`dept_id` ASC) USING BTREE,
  INDEX `dept_short_name`(`dept_short_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_designations
-- ----------------------------
DROP TABLE IF EXISTS `tbl_designations`;
CREATE TABLE `tbl_designations`  (
  `desig_no` int NOT NULL AUTO_INCREMENT,
  `desig_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `desig_short_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `desig_long_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `desig_description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `desig_status` tinyint NOT NULL DEFAULT 1,
  `desig_camp_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `desig_franchise` tinyint(1) NULL DEFAULT 0,
  `desig_short_name_backup` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`desig_no`) USING BTREE,
  UNIQUE INDEX `desig_no`(`desig_no` ASC) USING BTREE,
  INDEX `desig_id`(`desig_id` ASC) USING BTREE,
  INDEX `desig_short_name`(`desig_short_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 598 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_directorate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_directorate`;
CREATE TABLE `tbl_directorate`  (
  `dr_id` int NOT NULL AUTO_INCREMENT,
  `dr_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dr_location` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dr_sort_order` int NOT NULL DEFAULT 0,
  `dr_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dr_created_by` int NOT NULL DEFAULT 0,
  `dr_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`dr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_discipline
-- ----------------------------
DROP TABLE IF EXISTS `tbl_discipline`;
CREATE TABLE `tbl_discipline`  (
  `discipline_id` int NOT NULL AUTO_INCREMENT,
  `discipline_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `discipline_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'program_id',
  `discipline_class_level` int NULL DEFAULT 0,
  `discipline_class_subjects` int NULL DEFAULT 0,
  `discipline_total_marks` int NOT NULL DEFAULT 0 COMMENT 'Previous Degree Total Marks',
  `discipline_p_id` int NULL DEFAULT NULL,
  `discipline_display_order` int NULL DEFAULT 0,
  `discipline_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discipline_id`) USING BTREE,
  INDEX `discipline_p_id`(`discipline_p_id` ASC) USING BTREE,
  INDEX `discipline_display_order`(`discipline_display_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_discipline_sub
-- ----------------------------
DROP TABLE IF EXISTS `tbl_discipline_sub`;
CREATE TABLE `tbl_discipline_sub`  (
  `discipline_sid` int NOT NULL AUTO_INCREMENT,
  `discipline_stitle` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `discipline_sdescription` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discipline_id` int NULL DEFAULT NULL,
  `discipline_sstatus` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discipline_sid`) USING BTREE,
  INDEX `discipline_id`(`discipline_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 387 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_ec_ac_dates
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ec_ac_dates`;
CREATE TABLE `tbl_ec_ac_dates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `campus_id` int NULL DEFAULT NULL,
  `ac_start_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ac_end_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT 0,
  `updated_on` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_ec_applicant_monthly_fee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ec_applicant_monthly_fee`;
CREATE TABLE `tbl_ec_applicant_monthly_fee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pkg_id` int NULL DEFAULT 0,
  `amf_year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amf_month` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amf_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amf_expiary` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amf_a_reg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amf_days_fee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amf_slabs` smallint NULL DEFAULT 4,
  `amf_adm_fee` int NULL DEFAULT 0,
  `amf_base_fee` int NULL DEFAULT 0,
  `amf_tuition_fee` int NULL DEFAULT 0,
  `amf_ac_fee` int NULL DEFAULT 0,
  `amf_sum_of_fee` int NULL DEFAULT 0,
  `amf_is_paid` tinyint NULL DEFAULT 0,
  `request_form` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `re_admission_flag` tinyint NULL DEFAULT 0,
  `days_in_month` int NULL DEFAULT 30,
  `admission_form_flag` tinyint NULL DEFAULT 0,
  `amf_updated_from_attendance` tinyint NULL DEFAULT 0,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_on` datetime NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_on` datetime NULL DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 790475 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_ec_applicant_package
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ec_applicant_package`;
CREATE TABLE `tbl_ec_applicant_package`  (
  `pkg_id` int NOT NULL AUTO_INCREMENT,
  `pkg_a_no` int NULL DEFAULT NULL,
  `pkg_reg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pkg_sec_s_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pkg_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pkg_campus` int NULL DEFAULT 0,
  `pkg_camp_region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `pkg_camp_zone_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `pkg_project_id` int NULL DEFAULT 0,
  `pkg_program` int NULL DEFAULT 0,
  `pkg_class` int NULL DEFAULT 0,
  `pkg_discipline` int NULL DEFAULT 0,
  `pkg_section_no` int NULL DEFAULT 0,
  `pkg_roll_no` int NULL DEFAULT 0,
  `pkg_adm_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pkg_section_start_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pkg_sec_ac_start_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pkg_sec_ac_end_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pkg_adm_month` int NULL DEFAULT 0,
  `pkg_adm_fee` int NULL DEFAULT 0,
  `pkg_base_fee` int NULL DEFAULT 0,
  `pkg_tuition_fee` int NULL DEFAULT NULL,
  `pkg_ac_fee` int NULL DEFAULT 0,
  `pkg_full_fee` int NULL DEFAULT 0,
  `pkg_full_fee_without_adm_fee` int NULL DEFAULT 0,
  `pkg_disc_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pkg_discount_percentage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `pkg_disc_id` int NULL DEFAULT NULL,
  `pkg_disc_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pkg_adm_fee_discount` int NULL DEFAULT 0,
  `pkg_base_fee_discount` int NULL DEFAULT 0,
  `pkg_ac_fee_discount` int NULL DEFAULT 0,
  `pkg_tuition_fee_discount` int NULL DEFAULT 0,
  `pkg_full_discount` int NULL DEFAULT 0,
  `pkg_full_discount_without_adm_discount` int NULL DEFAULT 0,
  `pkg_final_fee` int NULL DEFAULT 0,
  `pkg_applicant_final_fee_package` int NULL DEFAULT 0,
  `pkg_current_balance` int NULL DEFAULT 0,
  `pkg_status` tinyint NULL DEFAULT 1,
  `applicant_status` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 1,
  `tbl_applicant_status_left_id` int NULL DEFAULT 0,
  `applicant_status_left_date` datetime NULL DEFAULT NULL,
  `tbl_applicant_status_rejoin_id` int NULL DEFAULT 0,
  `applicant_status_rejoin_date` datetime NULL DEFAULT NULL,
  `request_form` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pkg_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `pkg_created_by` int NULL DEFAULT 0,
  `pkg_updated_by` int NULL DEFAULT 0,
  `pkg_updated_on` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `balance_flag` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`pkg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94608 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_fee_collection
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fee_collection`;
CREATE TABLE `tbl_fee_collection`  (
  `fee_no` int NOT NULL AUTO_INCREMENT,
  `fee_a_no` int NOT NULL COMMENT 'tbl_applicants:a_no',
  `fee_a_reg` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'tbl_applicants:a_reg',
  `fee_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fee_month` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `fee_session_id` int NULL DEFAULT 0 COMMENT 'tbl_sessions:s_id',
  `fee_campus_id` int NULL DEFAULT NULL COMMENT 'tbl_campuses:camp_no',
  `fee_project_id` int NULL DEFAULT NULL COMMENT 'tbl_projects:project_id',
  `fee_program_id` int NULL DEFAULT NULL COMMENT 'tbl_programs:p_id',
  `fee_discipline_id` int NULL DEFAULT NULL COMMENT 'tbl_discipline:descipline_id',
  `fee_discipline_sid` int NULL DEFAULT 0 COMMENT 'tbl_discipline_sub:discipline_sid',
  `fee_adm_id` int NULL DEFAULT 0 COMMENT 'tbl_admission_type:adm_id',
  `fee_discount_id` int NULL DEFAULT 0 COMMENT 'tbl_fee_discounts:discount_id',
  `fee_discount_percentage` int NULL DEFAULT 0 COMMENT 'tbl_fee_discounts:discount_percentage',
  `fee_discount_amount` int NULL DEFAULT 0 COMMENT 'Marks based Discount',
  `fee_admission_amount` int NULL DEFAULT 0,
  `fee_security_amount` int NULL DEFAULT 0,
  `fee_annual_amount` int NULL DEFAULT 0,
  `fee_ac_amount` int NULL DEFAULT 0,
  `fee_lim_amount` int NULL DEFAULT 0,
  `fee_thub_amount` int NULL DEFAULT 0,
  `fee_misc_amount` int NULL DEFAULT 0,
  `fee_lab_discount` int NULL DEFAULT 0,
  `fee_lab_amount` int NULL DEFAULT 0,
  `fee_tuition_a_amount` int NULL DEFAULT NULL,
  `fee_tuition_amount` int NULL DEFAULT 0,
  `fee_admission_discount` int NULL DEFAULT 0,
  `fee_security_discount` int NULL DEFAULT 0,
  `fee_annual_discount` int NULL DEFAULT 0,
  `fee_ac_discount` int NULL DEFAULT 0,
  `fee_tuition_a_discount` int NULL DEFAULT 0,
  `fee_tuition_discount` int NULL DEFAULT 0,
  `fee_disc_discount_amount` int NULL DEFAULT 0 COMMENT 'Discretionary Discount Amount',
  `fee_disc_discount_reason` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT 'Discretionary Discount Reason',
  `fee_other_discount_id` int NULL DEFAULT 0,
  `fee_other_discount_percentage` int NULL DEFAULT 0,
  `fee_other_discount_amount` int NULL DEFAULT 0 COMMENT 'Other General Category Discount',
  `fee_full_amount` int NULL DEFAULT 0 COMMENT 'Sum of fee_admission_amount, fee_misc_amount, fee_lab_amount, fee_tuition_amount',
  `fee_discount_total_amount` int NULL DEFAULT 0 COMMENT 'Sum of fee_discount_amount, fee_disc_discount_amount,fee_other_discount_amount',
  `fee_fine_amount` int NULL DEFAULT 0,
  `fee_fine_reason` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_franchise_outstanding` int NULL DEFAULT 0 COMMENT 'outstandings of school franchise old students',
  `fee_final_amount` int NULL DEFAULT 0,
  `fee_installments` int NULL DEFAULT 1 COMMENT 'Number of Installments: Default is 1',
  `fee_installment_amount` int NULL DEFAULT 0 COMMENT 'Amount of Each Installment',
  `fee_adjustment_01` int NULL DEFAULT 0,
  `fee_adjustment_02` int NULL DEFAULT 0,
  `fee_pfy_amount` int NULL DEFAULT 0 COMMENT 'Pre First Year Amount',
  `fee_receiveable_amount` int NULL DEFAULT 0,
  `fee_received_amount` int NULL DEFAULT 0,
  `fee_received_total_amount` int NULL DEFAULT 0 COMMENT 'Sum of fee_pfy_amount and fee_received_amount',
  `fee_balance` int NULL DEFAULT 0,
  `fee_balance_new_preps` int UNSIGNED NULL DEFAULT 0,
  `created_by` int NULL DEFAULT 1 COMMENT 'Created By/Received By',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fee_status` tinyint(1) NULL DEFAULT 1,
  `prospectus` tinyint(1) NULL DEFAULT 0,
  `posted` tinyint(1) NULL DEFAULT 0 COMMENT 'Is Posted to Ledger?',
  `demoted` tinyint(1) NULL DEFAULT 0,
  `fee_other_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N/A',
  `promoted` tinyint(1) NULL DEFAULT 0 COMMENT 'Is promoted?',
  `fee_sec_no` int NULL DEFAULT 0,
  `fee_roll_no` int NULL DEFAULT 0,
  `fee_reason` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_inquiry` tinyint(1) NULL DEFAULT 0,
  `is_pfy` tinyint(1) NULL DEFAULT 0,
  `is_confirm` tinyint(1) NULL DEFAULT 0,
  `is_admission` tinyint(1) NULL DEFAULT 0,
  `is_repeater` tinyint(1) NULL DEFAULT 0,
  `repeater_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `repeater_remarks` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `srfee` int NULL DEFAULT 0,
  `is_ac_fee` tinyint(1) NULL DEFAULT 1,
  `is_admission_fee` tinyint(1) NULL DEFAULT 1,
  `fee_balance_due_date` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_remarks` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_reversal` tinyint NULL DEFAULT 0,
  `fee_transaction_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_branch_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_operator` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_challan_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_challan_payment_date` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_challan_installment_no` smallint NULL DEFAULT 0,
  `old_id` int NULL DEFAULT 0,
  `old_slip_no` int NULL DEFAULT 0,
  `old_fee_date` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fee_lms_amount` int NULL DEFAULT 0,
  `fee_library_amount` int NULL DEFAULT 0,
  `fee_exam_amount` int NULL DEFAULT 0,
  `fee_id_card_amount` int NULL DEFAULT 0,
  `fee_service_amount` int NULL DEFAULT 0,
  `fee_board_reg_amount` int NULL DEFAULT 0,
  `fee_board_adm_amount` int NULL DEFAULT 0,
  `fee_rnt_amount` int NULL DEFAULT 0,
  `fee_lms_discount` int NULL DEFAULT 0,
  `fee_library_discount` int NULL DEFAULT 0,
  `fee_exam_discount` int NULL DEFAULT 0,
  `fee_id_card_discount` int NULL DEFAULT 0,
  `fee_service_discount` int NULL DEFAULT 0,
  `fee_board_reg_discount` int NULL DEFAULT 0,
  `fee_board_adm_discount` int NULL DEFAULT 0,
  `fee_rnt_discount` int NULL DEFAULT 0,
  `fee_lim_discount` int NULL DEFAULT 0,
  `fee_fine_discount` int NULL DEFAULT 0,
  `fee_erp_remarks` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_discipline_trans` tinyint(1) NULL DEFAULT 0,
  `policy_discount` tinyint(1) NULL DEFAULT NULL,
  `police_ref_letter` tinyint(1) NULL DEFAULT NULL,
  `police_sh_pen_book` tinyint(1) NULL DEFAULT NULL,
  `police_od_pay_slip` tinyint(1) NULL DEFAULT NULL,
  `police_od_ser_book` tinyint(1) NULL DEFAULT NULL,
  `fee_discount_in_amount` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `is_balance` tinyint(1) NULL DEFAULT 0,
  `fee_package_update_on` datetime NULL DEFAULT NULL,
  `fee_prev_package` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fee_no`) USING BTREE,
  INDEX `fee_a_no`(`fee_a_no` ASC) USING BTREE,
  INDEX `fee_a_reg`(`fee_a_reg` ASC) USING BTREE,
  INDEX `fee_date`(`fee_date` ASC) USING BTREE,
  INDEX `fee_session_id`(`fee_session_id` ASC) USING BTREE,
  INDEX `fee_campus_id`(`fee_campus_id` ASC) USING BTREE,
  INDEX `fee_project_id`(`fee_project_id` ASC) USING BTREE,
  INDEX `fee_program_id`(`fee_program_id` ASC) USING BTREE,
  INDEX `fee_discipline_id`(`fee_discipline_id` ASC) USING BTREE,
  INDEX `fee_discipline_sid`(`fee_discipline_sid` ASC) USING BTREE,
  INDEX `fee_adm_id`(`fee_adm_id` ASC) USING BTREE,
  INDEX `fee_discount_id`(`fee_discount_id` ASC) USING BTREE,
  INDEX `fee_other_discount_id`(`fee_other_discount_id` ASC) USING BTREE,
  INDEX `fee_sec_no`(`fee_sec_no` ASC) USING BTREE,
  INDEX `fee_challan_no`(`fee_challan_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1360261 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_fee_dates
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fee_dates`;
CREATE TABLE `tbl_fee_dates`  (
  `fee_no` int NOT NULL,
  `fee_a_no` int NULL DEFAULT 0,
  `fee_a_reg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fee_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fee_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_fee_discounts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fee_discounts`;
CREATE TABLE `tbl_fee_discounts`  (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `discount_description` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount_percentage` int NULL DEFAULT 0,
  `discount_type` int NULL DEFAULT 0 COMMENT '0 for Other Discount Category; 1 for Marks Discount Category',
  `discount_marks_start` int NULL DEFAULT 0,
  `discount_marks_end` int NULL DEFAULT 0,
  `discount_percentage_start` decimal(5, 2) NULL DEFAULT 0.00,
  `discount_percentage_end` decimal(5, 2) NULL DEFAULT 0.00,
  `discount_payable_amount` int NULL DEFAULT 0 COMMENT '0: As per policy',
  `discount_seats` int NULL DEFAULT 0 COMMENT '0: unlimited',
  `discount_seats_additional` int NULL DEFAULT 0 COMMENT '0: As per policy',
  `discount_discipline_id` int NULL DEFAULT 0,
  `discount_campus_id` int NULL DEFAULT 0 COMMENT 'tbl_campuses:camp_no',
  `discount_project_id` int NULL DEFAULT 0,
  `discount_session_id` int NULL DEFAULT 0,
  `discount_admission_percentage` int NULL DEFAULT 0,
  `discount_security_percentage` int NULL DEFAULT 0,
  `discount_tuition_percentage` int NULL DEFAULT 0,
  `discount_tuition_amount` int NULL DEFAULT 0,
  `discount_tuition_base_amount` int NULL DEFAULT 0,
  `discount_authorize_user` int NULL DEFAULT NULL,
  `discount_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount_status` tinyint(1) NOT NULL DEFAULT 0,
  `discount_board_unit_id` int NULL DEFAULT 0,
  `discount_board_unit_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount_board_unit_title_short` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount_board_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount_group_id` int NULL DEFAULT 0,
  `discount_discipline_stitle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount_board_total_marks` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`discount_id`) USING BTREE,
  INDEX `discount_discipline_id`(`discount_discipline_id` ASC) USING BTREE,
  INDEX `discount_campus_id`(`discount_campus_id` ASC) USING BTREE,
  INDEX `discount_project_id`(`discount_project_id` ASC) USING BTREE,
  INDEX `discount_session_id`(`discount_session_id` ASC) USING BTREE,
  INDEX `discount_board_unit_title_short`(`discount_board_unit_title_short` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71531 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_fee_heads
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fee_heads`;
CREATE TABLE `tbl_fee_heads`  (
  `fh_id` int NOT NULL AUTO_INCREMENT,
  `fh_title` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fh_amount` int NOT NULL DEFAULT 0,
  `fh_order` int NOT NULL DEFAULT 1 COMMENT 'Integer value to display order of Fee heads (in groups), accepts duplicates',
  `fh_status` tinyint(1) NOT NULL DEFAULT 1,
  `p_id` int NOT NULL DEFAULT 0,
  `pt_id` int NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fh_id`) USING BTREE,
  INDEX `fh_order`(`fh_order` ASC) USING BTREE,
  INDEX `p_id`(`p_id` ASC) USING BTREE,
  INDEX `pt_id`(`pt_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_fee_structure
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fee_structure`;
CREATE TABLE `tbl_fee_structure`  (
  `fs_id` int NOT NULL AUTO_INCREMENT,
  `fs_description` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fs_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fs_by` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `fs_project_id` int NULL DEFAULT NULL COMMENT 'tbl_program_type:pt_id',
  `fs_region_id` int NULL DEFAULT NULL,
  `fs_campus_id` int NULL DEFAULT NULL,
  `fs_discipline_id` int NULL DEFAULT NULL COMMENT 'tbl_programs:p_id',
  `fs_session_id` int NULL DEFAULT 0,
  `fs_fee_head_id` int NULL DEFAULT NULL COMMENT 'tbl_fee_heads:fh_id',
  `fs_board` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `fs_classes` tinyint NULL DEFAULT 0,
  `fs_subjects` tinyint NULL DEFAULT 0,
  `fs_frequency` tinyint NULL DEFAULT 0,
  `fs_discountable` tinyint(1) NULL DEFAULT 0,
  `fs_refundable` tinyint(1) NULL DEFAULT 0,
  `fs_amount_minimum` int NULL DEFAULT 0,
  `fs_amount` int NOT NULL DEFAULT 0,
  `fs_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fs_id`) USING BTREE,
  INDEX `fs_date`(`fs_date` ASC) USING BTREE,
  INDEX `fs_project_id`(`fs_project_id` ASC) USING BTREE,
  INDEX `fs_region_id`(`fs_region_id` ASC) USING BTREE,
  INDEX `fs_campus_id`(`fs_campus_id` ASC) USING BTREE,
  INDEX `fs_discipline_id`(`fs_discipline_id` ASC) USING BTREE,
  INDEX `fs_fee_head_id`(`fs_fee_head_id` ASC) USING BTREE,
  INDEX `fs_session_id`(`fs_session_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61188 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_grades
-- ----------------------------
DROP TABLE IF EXISTS `tbl_grades`;
CREATE TABLE `tbl_grades`  (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `grade_project_id` int NOT NULL DEFAULT 0,
  `grade_min` float NOT NULL DEFAULT 0,
  `grade_max` float NOT NULL DEFAULT 0,
  `grade_title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grade_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_program_subjects
-- ----------------------------
DROP TABLE IF EXISTS `tbl_program_subjects`;
CREATE TABLE `tbl_program_subjects`  (
  `ps_id` int NOT NULL AUTO_INCREMENT COMMENT 'Program_Subjects',
  `ps_p_id` int NULL DEFAULT 0 COMMENT 'tbl_programs:p_id',
  `ps_discipline_id` int NULL DEFAULT 0,
  `ps_discipline_sid` int NULL DEFAULT 0 COMMENT 'tbl_discipline_sub:discipline_sid',
  `ps_adm_id` int NULL DEFAULT 0 COMMENT 'tbl_admission_type:adm_id',
  `ps_s_no` int NULL DEFAULT 0 COMMENT 'tbl_sessions:s_no',
  `ps_sub_id` int NULL DEFAULT 0 COMMENT 'tbl_subjects:sub_id',
  `ps_created_by` int NOT NULL DEFAULT 0,
  `ps_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ps_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ps_id`) USING BTREE,
  INDEX `ps_p_id`(`ps_p_id`) USING BTREE,
  INDEX `ps_discipline_id`(`ps_discipline_id`) USING BTREE,
  INDEX `ps_discipline_sid`(`ps_discipline_sid`) USING BTREE,
  INDEX `ps_adm_id`(`ps_adm_id`) USING BTREE,
  INDEX `ps_s_no`(`ps_s_no`) USING BTREE,
  INDEX `ps_sub_id`(`ps_sub_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1195 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_program_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_program_type`;
CREATE TABLE `tbl_program_type`  (
  `pt_id` int NOT NULL AUTO_INCREMENT,
  `pt_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pt_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_programs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_programs`;
CREATE TABLE `tbl_programs`  (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_title` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `project_id` int NOT NULL COMMENT 'tbl_projects:project_id',
  `pt_id` int NULL DEFAULT NULL,
  `p_status` tinyint NOT NULL DEFAULT 1,
  `p_duration` int NULL DEFAULT 12,
  `p_group_id` int NULL DEFAULT NULL,
  `camp_no` int NULL DEFAULT NULL,
  `p_fee` int NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adm_fee` int NOT NULL DEFAULT 0,
  `tui_fee` int NOT NULL DEFAULT 0,
  `reg_fee` int NOT NULL DEFAULT 0,
  `sec_fee` int NOT NULL DEFAULT 0,
  `idc_fee` int NOT NULL DEFAULT 0,
  `act_fee` int NOT NULL DEFAULT 0,
  `com_fee` int NOT NULL DEFAULT 0,
  `sta_fee` int NOT NULL DEFAULT 0,
  `lib_fee` int NOT NULL DEFAULT 0,
  `cur_fee` int NOT NULL DEFAULT 0,
  `spo_fee` int NOT NULL DEFAULT 0,
  `uti_fee` int NOT NULL DEFAULT 0,
  `art_fee` int NOT NULL DEFAULT 0,
  `exa_fee` int NOT NULL DEFAULT 0,
  `sci_fee` int NOT NULL DEFAULT 0,
  `boa_fee` int NOT NULL DEFAULT 0,
  `ac_fee` int NOT NULL DEFAULT 0,
  `oth_fee` int NOT NULL DEFAULT 0,
  `pap_fee` int NOT NULL DEFAULT 0,
  `pra_fee` int NOT NULL DEFAULT 0,
  `tui_fee_1` int NOT NULL DEFAULT 0,
  `tui_fee_2` int NOT NULL DEFAULT 0,
  `tui_fee_3` int NOT NULL DEFAULT 0,
  `tui_fee_4` int NOT NULL DEFAULT 0,
  `tui_fee_5` int NOT NULL DEFAULT 0,
  `tui_fee_6` int NOT NULL DEFAULT 0,
  `tui_fee_7` int NOT NULL DEFAULT 0,
  `tui_fee_8` int NOT NULL DEFAULT 0,
  `is_pre_test` tinyint NOT NULL DEFAULT 0,
  `p_sort_order` int NULL DEFAULT 0,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_projects
-- ----------------------------
DROP TABLE IF EXISTS `tbl_projects`;
CREATE TABLE `tbl_projects`  (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `project_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `project_company_id` int NOT NULL DEFAULT 0,
  `project_display_order` smallint NULL DEFAULT 0,
  `project_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `project_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`project_id`) USING BTREE,
  INDEX `project_company_id`(`project_company_id` ASC) USING BTREE,
  INDEX `project_display_order`(`project_display_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_regions
-- ----------------------------
DROP TABLE IF EXISTS `tbl_regions`;
CREATE TABLE `tbl_regions`  (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `region_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `region_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `region_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`region_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_roster
-- ----------------------------
DROP TABLE IF EXISTS `tbl_roster`;
CREATE TABLE `tbl_roster`  (
  `roster_id` bigint NOT NULL AUTO_INCREMENT,
  `roster_a_no` int NOT NULL,
  `roster_roll_no` int NOT NULL,
  `roster_roll_text` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `roster_sec_no` int NULL DEFAULT NULL COMMENT 'tbl_sections:sec_no',
  `roster_session_id` int NULL DEFAULT NULL,
  `roster_discipline_id` int NULL DEFAULT NULL,
  `roster_program_id` int NULL DEFAULT NULL,
  `roster_campus_id` int NULL DEFAULT NULL,
  `roster_staff_id` int NULL DEFAULT NULL,
  `roster_sub_id` int NULL DEFAULT NULL,
  `roster_created_by` int NOT NULL DEFAULT 1,
  `roster_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `roster_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`roster_id`) USING BTREE,
  INDEX `roster_a_no`(`roster_a_no`) USING BTREE,
  INDEX `roster_roll_no`(`roster_roll_no`) USING BTREE,
  INDEX `roster_sec_no`(`roster_sec_no`) USING BTREE,
  INDEX `roster_session_id`(`roster_session_id`) USING BTREE,
  INDEX `roster_discipline_id`(`roster_discipline_id`) USING BTREE,
  INDEX `roster_program_id`(`roster_program_id`) USING BTREE,
  INDEX `roster_campus_id`(`roster_campus_id`) USING BTREE,
  INDEX `roster_staff_id`(`roster_staff_id`) USING BTREE,
  INDEX `roster_sub_id`(`roster_sub_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 511526 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_sections
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sections`;
CREATE TABLE `tbl_sections`  (
  `sec_no` int NOT NULL AUTO_INCREMENT,
  `sec_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sec_description` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_method` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:Auto; 1:Manual',
  `sec_project_id` int NULL DEFAULT 0,
  `sec_discipline_id` int NOT NULL COMMENT 'tbl_discipline:discipline_id',
  `sec_program_id` int NULL DEFAULT NULL COMMENT 'tbl_programs:p_id',
  `sec_campus_id` int NULL DEFAULT NULL COMMENT 'tbl_campuses:camp_no',
  `sec_camp_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_s_id` int NULL DEFAULT NULL,
  `sec_cr_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_sos` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_start` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_end` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_str` int NOT NULL DEFAULT 0 COMMENT '0:No Limit',
  `sec_filled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Section Filled or not? Boolean',
  `sec_group` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `is_lms` tinyint(1) NULL DEFAULT 0,
  `is_online` tinyint(1) NULL DEFAULT 0,
  `online_date_ends` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ac_charges` int NULL DEFAULT 0,
  `admission_Fee` int NULL DEFAULT 0,
  `base_fee_amount` int NULL DEFAULT 0,
  `tuition_fee_amount` int NULL DEFAULT 0,
  `board_title` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL DEFAULT 0,
  `old_campus_id` int NULL DEFAULT 0,
  `old_campus_calling_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `old_class_id` int NULL DEFAULT 0,
  `old_sec_no` int NULL DEFAULT 0,
  `sec_remarks` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_ac_start_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sec_ac_off_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `erp_lms_sos` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sec_no`) USING BTREE,
  INDEX `sec_id`(`sec_id` ASC) USING BTREE,
  INDEX `sec_discipline_id`(`sec_discipline_id` ASC) USING BTREE,
  INDEX `sec_program_id`(`sec_program_id` ASC) USING BTREE,
  INDEX `sec_campus_id`(`sec_campus_id` ASC) USING BTREE,
  INDEX `sec_camp_id`(`sec_camp_id` ASC) USING BTREE,
  INDEX `sec_s_id`(`sec_s_id` ASC) USING BTREE,
  INDEX `sec_cr_id`(`sec_cr_id` ASC) USING BTREE,
  INDEX `sec_group`(`sec_group` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98641 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_session_fee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_session_fee`;
CREATE TABLE `tbl_session_fee`  (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `sec_no` int NOT NULL,
  `ac_charges` int NULL DEFAULT 0,
  `admission_fee` int NULL DEFAULT 0,
  `base_fee_amount` int NULL DEFAULT 0,
  `tuition_fee_amount` int NULL DEFAULT 0,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1171 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_sessions
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sessions`;
CREATE TABLE `tbl_sessions`  (
  `s_no` int NOT NULL AUTO_INCREMENT,
  `s_id` int NULL DEFAULT NULL,
  `s_date` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `s_time` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `s_sec` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'A',
  `s_title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `s_project_id` int NULL DEFAULT 0,
  `camp_no` int NULL DEFAULT 0,
  `p_id` int NULL DEFAULT 0,
  `d_id` int NULL DEFAULT 0,
  `p_group_id` int NULL DEFAULT 0,
  `s_status` tinyint NOT NULL DEFAULT 0,
  `s_ecet_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s_lec_week` int NULL DEFAULT 0,
  `s_weeks` int NULL DEFAULT 0,
  `s_adm_fee` int NULL DEFAULT 0,
  `s_fee` int NULL DEFAULT 0,
  `s_ac_fee` int NULL DEFAULT 0,
  `s_paper_fee` int NULL DEFAULT 0,
  `s_other_fee` int NULL DEFAULT 0,
  `adm_fee` int NULL DEFAULT 0,
  `tui_fee` int NULL DEFAULT 0,
  `reg_fee` int NULL DEFAULT 0,
  `sec_fee` int NULL DEFAULT 0,
  `idc_fee` int NULL DEFAULT 0,
  `act_fee` int NULL DEFAULT 0,
  `com_fee` int NULL DEFAULT 0,
  `sta_fee` int NULL DEFAULT 0,
  `lib_fee` int NULL DEFAULT 0,
  `cur_fee` int NULL DEFAULT 0,
  `spo_fee` int NULL DEFAULT 0,
  `uti_fee` int NULL DEFAULT 0,
  `art_fee` int NULL DEFAULT 0,
  `exa_fee` int NULL DEFAULT 0,
  `sci_fee` int NULL DEFAULT 0,
  `boa_fee` int NULL DEFAULT 0,
  `ac_fee` int NULL DEFAULT 0,
  `oth_fee` int NULL DEFAULT 0,
  `pap_fee` int NULL DEFAULT 0,
  `pra_fee` int NULL DEFAULT 0,
  `tui_fee_1` int NULL DEFAULT 0,
  `tui_fee_2` int NULL DEFAULT 0,
  `tui_fee_3` int NULL DEFAULT 0,
  `tui_fee_4` int NULL DEFAULT 0,
  `tui_fee_5` int NULL DEFAULT 0,
  `tui_fee_6` int NULL DEFAULT 0,
  `tui_fee_7` int NULL DEFAULT 0,
  `tui_fee_8` int NULL DEFAULT 0,
  `tui_fee_9` int NULL DEFAULT 0,
  `tui_fee_10` int NULL DEFAULT 0,
  `s_limit` int NULL DEFAULT 0,
  PRIMARY KEY (`s_no`) USING BTREE,
  INDEX `s_id`(`s_id` ASC) USING BTREE,
  INDEX `s_sec`(`s_sec` ASC) USING BTREE,
  INDEX `camp_no`(`camp_no` ASC) USING BTREE,
  INDEX `p_id`(`p_id` ASC) USING BTREE,
  INDEX `p_group_id`(`p_group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_staff_basic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_basic`;
CREATE TABLE `tbl_staff_basic`  (
  `s_no` int NOT NULL AUTO_INCREMENT,
  `s_id` int NOT NULL,
  `u_no` int NULL DEFAULT 0,
  `s_f_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_m_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_l_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_father` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_cnic` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_cnic_expiry` date NULL DEFAULT NULL,
  `s_dob` date NULL DEFAULT NULL,
  `s_gender` tinyint(1) NULL DEFAULT 1,
  `s_married` tinyint(1) NULL DEFAULT 0,
  `s_blood_group` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_religion` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_subject1` smallint NULL DEFAULT 0,
  `s_subject2` smallint NULL DEFAULT 0,
  `s_subject3` smallint NULL DEFAULT 0,
  `s_subject4` smallint NULL DEFAULT 0,
  `s_courses_allocated` smallint NULL DEFAULT 0,
  `s_courses_additional` smallint NULL DEFAULT 0,
  `s_courses_additional_rate` smallint NULL DEFAULT 0,
  `s_image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_remarks` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s_created_by` int NOT NULL DEFAULT 0,
  `s_status` tinyint(1) NOT NULL DEFAULT 1,
  `s_status_remarks` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_internal_supervisor` int NULL DEFAULT 0,
  `is_fr_employee` tinyint(1) NULL DEFAULT 0,
  `s_ipa` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_modified_on` datetime NULL DEFAULT NULL,
  `s_modified_by` int NULL DEFAULT NULL,
  `s_system_remarks` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_no`) USING BTREE,
  UNIQUE INDEX `s_no`(`s_no`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  INDEX `u_no`(`u_no`) USING BTREE,
  INDEX `s_f_name`(`s_f_name`) USING BTREE,
  INDEX `s_m_name`(`s_m_name`) USING BTREE,
  INDEX `s_l_name`(`s_l_name`) USING BTREE,
  INDEX `s_cnic`(`s_cnic`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30299 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_staff_employment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_staff_employment`;
CREATE TABLE `tbl_staff_employment`  (
  `e_no` int NOT NULL AUTO_INCREMENT,
  `e_s_no` int NOT NULL,
  `e_s_id` int NOT NULL,
  `e_type` smallint NULL DEFAULT 0,
  `e_salary_id` int NULL DEFAULT 0,
  `e_date` date NULL DEFAULT NULL,
  `e_s_category_id` int NULL DEFAULT 0,
  `e_s_directorate_id` int NULL DEFAULT 0,
  `e_s_dept_id` int NULL DEFAULT 0,
  `e_s_desig_id` int NULL DEFAULT 0,
  `e_s_cader_id` int NULL DEFAULT 0,
  `e_s_grade_id` int NULL DEFAULT 0,
  `e_s_campus_id` int NULL DEFAULT 0,
  `e_s_zone_id` int NULL DEFAULT 0,
  `e_s_region_id` int NULL DEFAULT 0,
  `e_s_project_id` int NULL DEFAULT 0,
  `e_s_company_id` int NULL DEFAULT 0,
  `e_s_shift` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'MORNING',
  `e_s_job_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'FULL TIME',
  `e_s_employment_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'PERMANENT',
  `e_s_time_category` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'MORNING',
  `e_s_operational_lock_days` smallint NULL DEFAULT 89,
  `e_s_supervisor` int NULL DEFAULT 0,
  `e_s_academic_level` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'MATRIC',
  `e_s_courses_regular` smallint NULL DEFAULT 0,
  `e_s_start_time_1` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00:00',
  `e_s_end_time_1` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00:00',
  `e_s_start_time_2` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00:00',
  `e_s_end_time_2` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00:00',
  `e_s_organization_other` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `e_s_designation_other` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `e_s_status_other` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `e_s_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `e_s_created_by` int NOT NULL DEFAULT 0,
  `e_s_status` tinyint(1) NOT NULL DEFAULT 1,
  `e_s_ipa` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `e_s_modified_on` datetime NULL DEFAULT NULL,
  `e_s_modified_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`e_no`) USING BTREE,
  UNIQUE INDEX `e_no`(`e_no`) USING BTREE,
  INDEX `e_s_no`(`e_s_no`) USING BTREE,
  INDEX `e_s_id`(`e_s_id`) USING BTREE,
  INDEX `e_type`(`e_type`) USING BTREE,
  INDEX `e_salary_id`(`e_salary_id`) USING BTREE,
  INDEX `e_s_category_id`(`e_s_category_id`) USING BTREE,
  INDEX `e_s_directorate_id`(`e_s_directorate_id`) USING BTREE,
  INDEX `e_s_dept_id`(`e_s_dept_id`) USING BTREE,
  INDEX `e_s_desig_id`(`e_s_desig_id`) USING BTREE,
  INDEX `e_s_cader_id`(`e_s_cader_id`) USING BTREE,
  INDEX `e_s_grade_id`(`e_s_grade_id`) USING BTREE,
  INDEX `e_s_campus_id`(`e_s_campus_id`) USING BTREE,
  INDEX `e_s_zone_id`(`e_s_zone_id`) USING BTREE,
  INDEX `e_s_region_id`(`e_s_region_id`) USING BTREE,
  INDEX `e_s_project_id`(`e_s_project_id`) USING BTREE,
  INDEX `e_s_company_id`(`e_s_company_id`) USING BTREE,
  INDEX `e_s_shift`(`e_s_shift`) USING BTREE,
  INDEX `e_s_job_status`(`e_s_job_status`) USING BTREE,
  INDEX `e_s_employment_status`(`e_s_employment_status`) USING BTREE,
  INDEX `e_s_time_category`(`e_s_time_category`) USING BTREE,
  INDEX `e_s_supervisor`(`e_s_supervisor`) USING BTREE,
  INDEX `e_s_academic_level`(`e_s_academic_level`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23087 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_subjects
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subjects`;
CREATE TABLE `tbl_subjects`  (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_project_id` int NULL DEFAULT 0,
  `sub_title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub_test_marks` int NULL DEFAULT 25,
  `sub_flp_marks` int NULL DEFAULT 50,
  `sub_mock_marks` int NULL DEFAULT 50,
  `sub_sendup_mark` int NULL DEFAULT 50,
  `sub_order` smallint NULL DEFAULT 10000,
  `sub_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`sub_id`) USING BTREE,
  INDEX `sub_order`(`sub_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 234 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_test_return
-- ----------------------------
DROP TABLE IF EXISTS `tbl_test_return`;
CREATE TABLE `tbl_test_return`  (
  `tr_no` int NOT NULL AUTO_INCREMENT,
  `tr_project` int NULL DEFAULT 0,
  `tr_session` int NULL DEFAULT 0,
  `tr_campus` int NULL DEFAULT 0,
  `tr_program` int NULL DEFAULT 0,
  `tr_discipline` int NULL DEFAULT 0,
  `tr_section` int NULL DEFAULT 0,
  `tr_subject` int NULL DEFAULT 0,
  `tr_teacher` int NULL DEFAULT 0,
  `tr_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tr_number` int NULL DEFAULT 0,
  `tr_test_date` date NULL DEFAULT NULL,
  `tr_return_date` date NULL DEFAULT NULL,
  `tr_days` smallint NULL DEFAULT 0,
  `tr_section_str` smallint NULL DEFAULT 0,
  `tr_return_str` smallint NULL DEFAULT 0,
  `tr_status` tinyint(1) NULL DEFAULT 1,
  `tr_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `tr_created_by` int NULL DEFAULT 0,
  PRIMARY KEY (`tr_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35726 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_test_students
-- ----------------------------
DROP TABLE IF EXISTS `tbl_test_students`;
CREATE TABLE `tbl_test_students`  (
  `test_no` int NOT NULL AUTO_INCREMENT,
  `test_a_no` int NULL DEFAULT 0,
  `test_a_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `test_roll_number` int NULL DEFAULT 0,
  `test_campus_id` int NULL DEFAULT 0,
  `test_session_id` int NULL DEFAULT 0,
  `test_program_id` int NULL DEFAULT 0,
  `test_discipline_id` int NULL DEFAULT 0,
  `test_section_id` int NULL DEFAULT 0,
  `test_roster_id` int NULL DEFAULT 0,
  `test_subject_id` int NULL DEFAULT 0,
  `test_teacher_id` int NULL DEFAULT 0,
  `test_datetime` datetime NULL DEFAULT NULL,
  `test_number` int NULL DEFAULT 1,
  `test_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'TEST',
  `test_total_marks` int NULL DEFAULT 10,
  `test_passing_marks` float NULL DEFAULT 0,
  `test_obtained_marks` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0',
  `test_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `test_created_by` int NULL DEFAULT 0,
  `is_uploaded` tinyint(1) NULL DEFAULT 0,
  `test_client_ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `is_posted_to_cm` tinyint(1) NOT NULL DEFAULT 0,
  `is_checked_by_cm` tinyint(1) NOT NULL DEFAULT 0,
  `checked_by_cm_date` datetime NULL DEFAULT NULL,
  `test_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`test_no`) USING BTREE,
  INDEX `test_a_no`(`test_a_no` ASC) USING BTREE,
  INDEX `test_a_id`(`test_a_id` ASC) USING BTREE,
  INDEX `test_campus_id`(`test_campus_id` ASC) USING BTREE,
  INDEX `test_session_id`(`test_session_id` ASC) USING BTREE,
  INDEX `test_program_id`(`test_program_id` ASC) USING BTREE,
  INDEX `test_discipline_id`(`test_discipline_id` ASC) USING BTREE,
  INDEX `test_section_id`(`test_section_id` ASC) USING BTREE,
  INDEX `test_roster_id`(`test_roster_id` ASC) USING BTREE,
  INDEX `test_subject_id`(`test_subject_id` ASC) USING BTREE,
  INDEX `test_teacher_id`(`test_teacher_id` ASC) USING BTREE,
  INDEX `test_number`(`test_number` ASC) USING BTREE,
  INDEX `test_type`(`test_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16650509 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

-- ----------------------------
-- Table structure for tbl_test_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_test_types`;
CREATE TABLE `tbl_test_types`  (
  `test_type_id` int NOT NULL AUTO_INCREMENT,
  `test_type_project_id` int NULL DEFAULT 0,
  `test_type_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `test_type_total_marks` int NULL DEFAULT 0,
  `test_display_order` smallint NULL DEFAULT 0,
  `test_type_status` tinyint(1) NULL DEFAULT 1,
  `test_type_created_by` int NULL DEFAULT 0,
  `test_type_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_tests
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tests`;
CREATE TABLE `tbl_tests`  (
  `test_id` int NOT NULL,
  `test_project_id` int NULL DEFAULT 0,
  `test_type_id` int NULL DEFAULT 0,
  `test_number` int NULL DEFAULT 0,
  `test_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `test_status` tinyint(1) NULL DEFAULT 1,
  `test_created_by` int NULL DEFAULT 0,
  `test_created_on` datetime NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users`  (
  `u_no` int NOT NULL AUTO_INCREMENT,
  `u_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `u_pass` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `u_f_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `u_l_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `u_type_id` int NOT NULL,
  `u_designation_id` int NULL DEFAULT NULL,
  `u_department_id` int NULL DEFAULT NULL,
  `u_campus_id` int NULL DEFAULT NULL,
  `u_doc` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `u_multicampus` tinyint NOT NULL DEFAULT 0,
  `u_status` tinyint NOT NULL DEFAULT 0,
  `u_image` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_ip` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `u_remarks` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `u_access_area` tinyint NOT NULL DEFAULT 0 COMMENT '0=ETP/Academy, 1=Colleges, 2=Schools, 3=All',
  `u_access_region` tinyint NOT NULL DEFAULT 0,
  `u_access_project` tinyint NOT NULL DEFAULT 0,
  `u_s_no` int NULL DEFAULT 0 COMMENT 'tbl_staff:s_no',
  `u_e_no` int NULL DEFAULT 0,
  `u_is_hod` tinyint NULL DEFAULT 0 COMMENT 'is HOD or Supervisor?',
  `u_access_zone` smallint NULL DEFAULT 0,
  `u_is_rm` tinyint(1) NULL DEFAULT 0,
  `u_is_zm` tinyint(1) NULL DEFAULT 0,
  `u_is_accountant` tinyint(1) NULL DEFAULT 0,
  `u_is_director_reports` tinyint(1) NULL DEFAULT 0,
  `u_modified_on` datetime NULL DEFAULT NULL,
  `u_modified_by` int NULL DEFAULT 0,
  `u_created_by` int NULL DEFAULT 0,
  PRIMARY KEY (`u_no`) USING BTREE,
  UNIQUE INDEX `u_id`(`u_id` ASC) USING BTREE,
  INDEX `u_pass`(`u_pass` ASC) USING BTREE,
  INDEX `u_type_id`(`u_type_id` ASC) USING BTREE,
  INDEX `u_designation_id`(`u_designation_id` ASC) USING BTREE,
  INDEX `u_department_id`(`u_department_id` ASC) USING BTREE,
  INDEX `u_campus_id`(`u_campus_id` ASC) USING BTREE,
  INDEX `u_access_area`(`u_access_area` ASC) USING BTREE,
  INDEX `u_multicampus`(`u_multicampus` ASC) USING BTREE,
  INDEX `u_access_region`(`u_access_region` ASC) USING BTREE,
  INDEX `u_access_project`(`u_access_project` ASC) USING BTREE,
  INDEX `u_s_no`(`u_s_no` ASC) USING BTREE,
  INDEX `u_access_zone`(`u_access_zone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9913 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci;

-- ----------------------------
-- Table structure for tbl_zones
-- ----------------------------
DROP TABLE IF EXISTS `tbl_zones`;
CREATE TABLE `tbl_zones`  (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `zone_title` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `zone_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `zone_region_id` int NOT NULL DEFAULT 1,
  `zone_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `zone_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`zone_id`) USING BTREE,
  INDEX `zone_region_id`(`zone_region_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
