/*
 Navicat Premium Data Transfer

 Source Server         : 10.10.15.161_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : 10.10.15.161:3306
 Source Schema         : yoga

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 22/01/2023 02:47:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assignment
-- ----------------------------
DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sub_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `max_mark` int NULL DEFAULT NULL,
  `max_time_limit` int NULL DEFAULT NULL,
  `include_in_course_evaluation` tinyint(1) NULL DEFAULT NULL,
  `submissions` int NULL DEFAULT NULL,
  `attachment_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `accachment_size` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of assignment
-- ----------------------------

-- ----------------------------
-- Table structure for certificationtemplate
-- ----------------------------
DROP TABLE IF EXISTS `certificationtemplate`;
CREATE TABLE `certificationtemplate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bg_image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enable_print` tinyint(1) NULL DEFAULT NULL,
  `certificate_width` int NULL DEFAULT NULL,
  `certificate_height` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificationtemplate
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `category` int NULL DEFAULT NULL,
  `instructor_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `instructor_photo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `duration` int NULL DEFAULT NULL,
  `duration_param` int NULL DEFAULT NULL,
  `student_number` int NULL DEFAULT NULL,
  `completion_lock` tinyint(1) NULL DEFAULT NULL,
  `offline_course` tinyint(1) NULL DEFAULT NULL,
  `show_unit_content_in_curriculumn` tinyint(1) NULL DEFAULT NULL,
  `hide_course_button_after_subscription` tinyint(1) NULL DEFAULT NULL,
  `display_course_progress_on_course_home` tinyint(1) NULL DEFAULT NULL,
  `time_based_corse_progress` tinyint(1) NULL DEFAULT NULL,
  `post_course_reviews_from_course_home` tinyint(1) NULL DEFAULT NULL,
  `auto_evaluation` tinyint(1) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `max_student_number` int NULL DEFAULT NULL,
  `excellence_badge` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `badge_percent` int NULL DEFAULT NULL,
  `badge_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `completion_certificate` tinyint(1) NULL DEFAULT NULL,
  `certificate_template` int NULL DEFAULT NULL,
  `passing_percentage` int NULL DEFAULT NULL,
  `drip_feed` tinyint(1) NULL DEFAULT NULL,
  `course_starting_time_as_drip_feed_origin` tinyint(1) NULL DEFAULT NULL,
  `section-drip_feed` tinyint(1) NULL DEFAULT NULL,
  `drip_duration_as_unit_duration` tinyint(1) NULL DEFAULT NULL,
  `drip_feed_duration` int NULL DEFAULT NULL,
  `drip_feed_duration_param` int NULL DEFAULT NULL,
  `prerequisite_course` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_retakes` int NULL DEFAULT NULL,
  `course_forum` int NULL DEFAULT NULL,
  `course_specific_instructions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_completion_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_free` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '(RYIT 200) Free Online Traditional', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, NULL, 'Rectangle 28.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES (2, '(RYIT 200asdfasdonal', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, NULL, '01_preview_large.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES (3, '(Raeatrwetyrraditional', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, NULL, 'group-photo-sun-2-1-768x512-310x207.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES (4, '(RYIewqrqwertqweonal', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, NULL, 'ayurveda-services-consultation.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for courseassignment
-- ----------------------------
DROP TABLE IF EXISTS `courseassignment`;
CREATE TABLE `courseassignment`  (
  `course_id` int NULL DEFAULT NULL,
  `assignment_id` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of courseassignment
-- ----------------------------

-- ----------------------------
-- Table structure for coursecategory
-- ----------------------------
DROP TABLE IF EXISTS `coursecategory`;
CREATE TABLE `coursecategory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `slug` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `parent_category` int NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `display_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coursecategory
-- ----------------------------

-- ----------------------------
-- Table structure for coursemembers
-- ----------------------------
DROP TABLE IF EXISTS `coursemembers`;
CREATE TABLE `coursemembers`  (
  `course_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coursemembers
-- ----------------------------
INSERT INTO `coursemembers` VALUES (1, 6);
INSERT INTO `coursemembers` VALUES (2, 6);

-- ----------------------------
-- Table structure for courseprogress
-- ----------------------------
DROP TABLE IF EXISTS `courseprogress`;
CREATE TABLE `courseprogress`  (
  `unit_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `done` tinyint(1) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of courseprogress
-- ----------------------------

-- ----------------------------
-- Table structure for coursequiz
-- ----------------------------
DROP TABLE IF EXISTS `coursequiz`;
CREATE TABLE `coursequiz`  (
  `course_id` int NULL DEFAULT NULL,
  `quiz_id` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coursequiz
-- ----------------------------

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NULL DEFAULT NULL,
  `relation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone_number` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of family
-- ----------------------------

-- ----------------------------
-- Table structure for mentor
-- ----------------------------
DROP TABLE IF EXISTS `mentor`;
CREATE TABLE `mentor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `chief_id` int NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mentor
-- ----------------------------

-- ----------------------------
-- Table structure for mentormembers
-- ----------------------------
DROP TABLE IF EXISTS `mentormembers`;
CREATE TABLE `mentormembers`  (
  `student_id` int NULL DEFAULT NULL,
  `mentor_id` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mentormembers
-- ----------------------------

-- ----------------------------
-- Table structure for query
-- ----------------------------
DROP TABLE IF EXISTS `query`;
CREATE TABLE `query`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of query
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int NULL DEFAULT NULL,
  `question_options` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer_hint` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `answer_explantion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `subtitle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `duration` int NULL DEFAULT NULL,
  `duration_param` int NULL DEFAULT NULL,
  `auto_evaluate_result` tinyint(1) NULL DEFAULT NULL,
  `retake_number` int NULL DEFAULT NULL,
  `post_quiz_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `show_result_after_submission` tinyint(1) NULL DEFAULT NULL,
  `add_check_answer_switch` tinyint(1) NULL DEFAULT NULL,
  `dynamic_quiz` tinyint(1) NULL DEFAULT NULL,
  `random_questions` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quiz
-- ----------------------------

-- ----------------------------
-- Table structure for quizquestions
-- ----------------------------
DROP TABLE IF EXISTS `quizquestions`;
CREATE TABLE `quizquestions`  (
  `quiz_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quizquestions
-- ----------------------------

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `order` int NULL DEFAULT NULL,
  `course_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of section
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `hear_about_us` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `past_yoga_experience` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_outline` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_ethos` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_disciplne` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vedic_nutraceutical` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `discipline_acknowledgement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int NULL DEFAULT NULL,
  `can_attend_course` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (6, 37, 'google', 'I have 10 years yoga experience', 'a', 'a', 'a', 'a', 'a', 'a', 2, 1);

-- ----------------------------
-- Table structure for testuser
-- ----------------------------
DROP TABLE IF EXISTS `testuser`;
CREATE TABLE `testuser`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of testuser
-- ----------------------------

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_id` int NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_free` tinyint NULL DEFAULT NULL,
  `duration` int NULL DEFAULT NULL,
  `duration_param` int NULL DEFAULT NULL,
  `forum` int NULL DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `first_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `nick_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ryit_cert` tinyint(1) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `whatsapp_phonenumber` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gender` int NULL DEFAULT NULL,
  `language` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `profession` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `education_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `country` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `street_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address_line_2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `city` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `province` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `zip_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `role` int NULL DEFAULT NULL,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `hash` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int NULL DEFAULT NULL,
  `resetPasswordToken` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `resetPasswordExpires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (34, 'laihunter911@gmail.com', 'asdf', 'ChauKoi', 'Lai', 'LaiHunter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '$2a$10$FlTBdpR1JKi.Jo9ucZp0guZ7ilVHNrcoebpnISpTLBeCCDnbr.XQO', 1, NULL, NULL);
INSERT INTO `user` VALUES (35, 'darbinyan.dev@gmail.com', 'asdf', 'Suren', 'Darbinyan', 'Suren', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-01-21 07:03:08', '$2a$10$UTKUAT5mcm0RPNxUYIgv8uz8svFiMwQzZsnSQNCjrzPtsXvJhBZNG', 1, NULL, NULL);
INSERT INTO `user` VALUES (36, 'bnicola1023@gmail.com', 'asdf', 'Bogdan', 'Nicola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-01-21 07:03:30', '$2a$10$ai5U4g1D7ROsyWOKG7fWHeKXdZTKoXfm3Ov0azgpkTJU7Fvwtxgsi', 1, NULL, NULL);
INSERT INTO `user` VALUES (37, 'jeremykh1028@gmail.com', 'asdf', 'Jeremy', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2023-01-21 07:06:29', '$2a$10$pbl0KbN8p5gMneJKcjm7MOHuTzpmgU0dMk3B7e4iuSfQqNb0XUs8a', 1, NULL, NULL);
INSERT INTO `user` VALUES (38, 'dmitroloparan@gmail.com', 'asdf', 'Dmitro', 'Loparan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '$2a$10$6lHi2wDz/ddz3VyYtMqgu.uBx88qGyeLsGs2qi4aq97RcFfJ3Ti/a', 1, NULL, NULL);
INSERT INTO `user` VALUES (39, 'islerheiri@gmail.com', 'asdf', 'Isler', 'Heiri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '$2a$10$yPRmPy20.JIEELZy2wuy0OfswzkI7WJw.MeTsDUD.IIJrFZrMiMx6', 0, NULL, NULL);
INSERT INTO `user` VALUES (40, 'danil.petrenko.dev@gmail.com', 'asdf', 'Danylo', 'Petrenko', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '$2a$10$dSgyvQPWbHWGWBt6R4BYjejFqizER9RQM7QJ6Vzv0RAZeCEEJ/R06', 0, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
