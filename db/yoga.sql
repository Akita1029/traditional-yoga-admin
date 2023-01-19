/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : yoga

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 19/01/2023 20:59:54
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coursemembers
-- ----------------------------

-- ----------------------------
-- Table structure for courseprogress
-- ----------------------------
DROP TABLE IF EXISTS `courseprogress`;
CREATE TABLE `courseprogress`  (
  `unit_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `done` tinyint(1) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for testuser
-- ----------------------------
DROP TABLE IF EXISTS `testuser`;
CREATE TABLE `testuser`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testuser
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
  `last_logged_in` time NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin1@gmail.com', '$2a$10$LxpBbl7OKFy.h/48l5OlxO2frQyYgigJWXdTX/hXVLpW3KXvf9Bp.', 'Senju', 'Hasirama', 'a', 0, '1992-12-29', '1932354', 4, 'english', 'c', 'd', 'germany', 'berlin', 'stress', 'y', 'x', 'z', 0, NULL);
INSERT INTO `user` VALUES (2, 'chiefmentor@gmail.com', '$2a$10$pvNIV2NoyP1JyHWuKZ9EQOZYahOpWh5kipkURHc1heFe9CfY6ZCXa', 'Senju', 'Tobirama', 'a', 0, '1992-12-29', '1932354', 4, 'english', 'c', 'd', 'germany', 'berlin', 'stress', 'y', 'x', 'z', 1, NULL);
INSERT INTO `user` VALUES (3, 'mentor@gmail.com', '$2a$10$1HOqdPPaZ08bcSPA5f0wzu3mSFyXx176f8fBwhw3JdMUdJJnDlulu', 'Sarutobi', 'Hiruzen', 'a', 0, '1992-12-29', '1932354', 4, 'english', 'c', 'd', 'germany', 'berlin', 'stress', 'y', 'x', 'z', 2, NULL);
INSERT INTO `user` VALUES (4, 'student@gmail.com', '$2a$10$otEbic2tvKQRzR.yD9fz1Ofgcp1OXz44Wpd/qnNUkG.0Q42D/LbbS', 'Namikage', 'Minato', 'a', 0, '1992-12-29', '1932354', 4, 'english', 'c', 'd', 'germany', 'berlin', 'stress', 'y', 'x', 'z', 3, NULL);

SET FOREIGN_KEY_CHECKS = 1;
