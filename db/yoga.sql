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

 Date: 27/01/2023 18:46:58
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
  `mentor_id` int NULL DEFAULT NULL,
  `createdAt` datetime(6) NULL DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startedAt` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Cobra Position-2023', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, 'Dr.Kumar', '01_preview_large.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-01-21 08:38:12.000000', 'Online', '2023-01-21 08:38:12.000000');
INSERT INTO `course` VALUES (2, '2022 Online Course-Lion Position', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, 'Dr.Kumar', 'image-45-copyright-min.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-01-23 05:38:12.000000', 'Bombei Online Stadium', '2023-01-23 05:38:12.000000');
INSERT INTO `course` VALUES (3, 'Rasperi Oilo-2023', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, 'Dr.Kumar', 'group-photo-sun-2-1-768x512-310x207.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-01-23 20:38:17.000000', 'Online', '2023-01-23 20:38:17.000000');
INSERT INTO `course` VALUES (4, 'Honey Location', 'Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharam For Yoga Teachers and Students to become a ...', 0, 'Dr.Kumar', 'ayurveda-services-consultation.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-01-23 20:38:17.000000', 'Online', '2023-01-23 20:38:17.000000');

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
INSERT INTO `coursemembers` VALUES (3, 9);
INSERT INTO `coursemembers` VALUES (4, 9);

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
INSERT INTO `courseprogress` VALUES (1, 9, 100);
INSERT INTO `courseprogress` VALUES (2, 9, 30);
INSERT INTO `courseprogress` VALUES (3, 9, 100);
INSERT INTO `courseprogress` VALUES (1, 10, 100);
INSERT INTO `courseprogress` VALUES (2, 10, 50);
INSERT INTO `courseprogress` VALUES (3, 10, 100);
INSERT INTO `courseprogress` VALUES (4, 9, 100);
INSERT INTO `courseprogress` VALUES (4, 10, 100);
INSERT INTO `courseprogress` VALUES (3, 8, 0);
INSERT INTO `courseprogress` VALUES (2, 8, 0);

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
INSERT INTO `coursequiz` VALUES (1, 9);
INSERT INTO `coursequiz` VALUES (2, 9);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES (2, 9, 'Father', 'Suren Darbinyan', '+14062012319');
INSERT INTO `family` VALUES (3, 10, 'Father', 'Jeremy Khan', '19063738322');

-- ----------------------------
-- Table structure for mentor
-- ----------------------------
DROP TABLE IF EXISTS `mentor`;
CREATE TABLE `mentor`  (
  `id` int NOT NULL,
  `legalName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chiefMentor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `chief_id` int NULL DEFAULT NULL,
  `active` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mentor
-- ----------------------------
INSERT INTO `mentor` VALUES (1, 'Dr. Kumar', 'Ceo. James', '0221', 'India', 'Mumbai', 1, 1, '2023-01-21 08:38:12.000000', 47, 48, 1);
INSERT INTO `mentor` VALUES (2, 'Dr. Luis', 'Ceo. James', '1189', 'Japan', 'Tokyo', 1, 1, '2023-01-23 05:38:12.000000', 47, 48, 1);
INSERT INTO `mentor` VALUES (3, 'Dr. Joke', 'Ceo. James', '9986', 'Germany', 'Berlin', 2, 1, '2023-01-23 20:38:17.000000', 47, 48, 1);
INSERT INTO `mentor` VALUES (4, 'Dr. Hone', 'Ceo. James', '5569', 'India', 'New Delhi', 1, 1, '2023-01-23 20:38:17.000000', 47, 48, 1);
INSERT INTO `mentor` VALUES (5, 'Br. Kuin', 'Ceo. Choi', '7788', 'Russia', 'Moscow', 1, 0, '2023-01-23 20:38:17.000000', 47, 48, 0);

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
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `readState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------
INSERT INTO `notification` VALUES (1, 'To chief mentors', 'Hello. Every one.', '0', '0', '2023-01-26 00:00:00.000000');
INSERT INTO `notification` VALUES (2, 'Major changes to every one', '\"Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharma For Yoga Teachers and Students to become Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharma For Yoga Teachers and Students to become a....\"\"Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharma For Yoga Teachers and Students to become Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharma For Yoga Teachers and Students to become a....\"\"Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharma For Yoga Teachers and Students to become Free Online Traditional Meditation Teacher Training Based on Darashanas Or Sanathana Dharma For Yoga Teachers and Students to become a....\"', '1', '0', '2023-01-26 00:00:00.000000');
INSERT INTO `notification` VALUES (3, 'Start a Yoga course on 2023-1-25', 'Yoga - 20231023', '1', '0', '2023-01-26 00:00:00.000000');
INSERT INTO `notification` VALUES (4, 'Here you start.', 'Hero - 220112', '0', '0', '2023-01-26 00:00:00.000000');

-- ----------------------------
-- Table structure for professions
-- ----------------------------
DROP TABLE IF EXISTS `professions`;
CREATE TABLE `professions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of professions
-- ----------------------------
INSERT INTO `professions` VALUES (1, 'Yoga Teacher');
INSERT INTO `professions` VALUES (2, 'Spiritual Leader');
INSERT INTO `professions` VALUES (3, 'Gym Instructor');
INSERT INTO `professions` VALUES (4, 'Meditation Teacher');
INSERT INTO `professions` VALUES (5, 'Personal Teacher');
INSERT INTO `professions` VALUES (6, 'Accountant');
INSERT INTO `professions` VALUES (7, 'Actor Actress');
INSERT INTO `professions` VALUES (8, 'Air traffic controller');
INSERT INTO `professions` VALUES (9, 'Architect');
INSERT INTO `professions` VALUES (10, 'Artist');
INSERT INTO `professions` VALUES (11, 'Attorney\r\n');
INSERT INTO `professions` VALUES (12, 'Banker');
INSERT INTO `professions` VALUES (13, 'Bartender');
INSERT INTO `professions` VALUES (14, 'Barber');
INSERT INTO `professions` VALUES (15, 'Bookkeeper');
INSERT INTO `professions` VALUES (16, 'Builder');
INSERT INTO `professions` VALUES (17, 'Businessman');
INSERT INTO `professions` VALUES (18, 'Businesswoman');
INSERT INTO `professions` VALUES (19, 'Businessperson');
INSERT INTO `professions` VALUES (20, 'Butcher');
INSERT INTO `professions` VALUES (21, 'Carpenter');
INSERT INTO `professions` VALUES (22, 'Cashier');
INSERT INTO `professions` VALUES (23, 'Chef');
INSERT INTO `professions` VALUES (24, 'Coach');
INSERT INTO `professions` VALUES (25, 'Dental hygienist Dentist');
INSERT INTO `professions` VALUES (26, 'Designer');
INSERT INTO `professions` VALUES (27, 'Developer');
INSERT INTO `professions` VALUES (28, 'Dietcian');
INSERT INTO `professions` VALUES (29, 'Doctor');
INSERT INTO `professions` VALUES (30, 'Economist');
INSERT INTO `professions` VALUES (31, 'Editor');
INSERT INTO `professions` VALUES (32, 'Electrician');
INSERT INTO `professions` VALUES (33, 'Engineer');
INSERT INTO `professions` VALUES (34, 'Farmer');
INSERT INTO `professions` VALUES (35, 'Filmmaker');
INSERT INTO `professions` VALUES (36, 'Fisherman');
INSERT INTO `professions` VALUES (37, 'Flight attendant');
INSERT INTO `professions` VALUES (38, 'Home Maker');
INSERT INTO `professions` VALUES (39, 'Jeweler');
INSERT INTO `professions` VALUES (40, 'Judge');
INSERT INTO `professions` VALUES (41, 'Lawyer');
INSERT INTO `professions` VALUES (42, 'Lecturer');
INSERT INTO `professions` VALUES (43, 'Mechanic');
INSERT INTO `professions` VALUES (44, 'Musician');
INSERT INTO `professions` VALUES (45, 'Nutritionist');
INSERT INTO `professions` VALUES (46, 'Nurse');
INSERT INTO `professions` VALUES (47, 'Optician');
INSERT INTO `professions` VALUES (48, 'Painter');
INSERT INTO `professions` VALUES (49, 'Pharmacist');
INSERT INTO `professions` VALUES (50, 'Photographer');
INSERT INTO `professions` VALUES (51, 'Physician');
INSERT INTO `professions` VALUES (52, 'Physician\'s assistant');
INSERT INTO `professions` VALUES (53, 'Pilot');
INSERT INTO `professions` VALUES (54, 'Plumber');
INSERT INTO `professions` VALUES (55, 'Police officer');
INSERT INTO `professions` VALUES (56, 'Politician');
INSERT INTO `professions` VALUES (57, 'Professor');
INSERT INTO `professions` VALUES (58, 'Programmer');
INSERT INTO `professions` VALUES (59, 'Psychologist');
INSERT INTO `professions` VALUES (60, 'Receptionist');
INSERT INTO `professions` VALUES (61, 'Salesman');
INSERT INTO `professions` VALUES (62, 'Salesperson');
INSERT INTO `professions` VALUES (63, 'Saleswoman');
INSERT INTO `professions` VALUES (64, 'Secretary');
INSERT INTO `professions` VALUES (65, 'Singer');
INSERT INTO `professions` VALUES (66, 'Student');
INSERT INTO `professions` VALUES (67, 'Surgeon');
INSERT INTO `professions` VALUES (68, 'Teacher');
INSERT INTO `professions` VALUES (69, 'Therapist');
INSERT INTO `professions` VALUES (70, 'Translator');
INSERT INTO `professions` VALUES (71, 'Undertaker');
INSERT INTO `professions` VALUES (72, 'Veternarian');
INSERT INTO `professions` VALUES (73, 'Videographer');
INSERT INTO `professions` VALUES (74, 'Waiter');
INSERT INTO `professions` VALUES (75, 'Waitress');
INSERT INTO `professions` VALUES (76, 'Writer');
INSERT INTO `professions` VALUES (77, 'Other');

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
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `rating` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
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
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES (1, 'Module1', 1, 3, 'This is Module1');
INSERT INTO `section` VALUES (2, 'Module2', 2, 4, 'This is Module2');

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
  `course_discipline` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vedic_nutraceutical` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `discipline_acknowledgement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contact_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int NULL DEFAULT NULL,
  `can_attend_course` tinyint(1) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mentor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (8, 50, 'google', 'I have 10 years experience in yoga practice.', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', '@devdemon1028', 2, NULL, '2023-01-21 08:38:12', 'Helo12', '898989', '2');
INSERT INTO `student` VALUES (9, 50, 'google', 'I have 10 years experience in yoga practice.', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', '@devdemon1028', 0, NULL, '2023-01-23 05:38:12', 'Loparen', '898989', '1');
INSERT INTO `student` VALUES (10, 51, 'google', 'I have 5 years experience in yoga practice', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'live:.cid.95f87dcdd5adc6a7', 0, NULL, '2023-01-23 20:38:17', 'Nouuse', '221553', '1');
INSERT INTO `student` VALUES (11, 51, 'google', 'I have 5 years experience in yoga practice', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'live:.cid.95f87dcdd5adc6a7', 0, NULL, '2023-01-23 20:38:17', 'Sophie', '221553', '3');
INSERT INTO `student` VALUES (12, 51, 'google', 'I have 5 years experience in yoga practice', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'live:.cid.95f87dcdd5adc6a7', 0, NULL, '2023-01-23 20:38:17', 'Joke', '221553', '2');
INSERT INTO `student` VALUES (13, 51, 'google', 'I have 5 years experience in yoga practice', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'Sample Text', 'live:.cid.95f87dcdd5adc6a7', 0, NULL, '2023-01-23 20:38:17', 'Hopoen', '221553', '2');

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
  `created_at` datetime NULL DEFAULT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (1, 1, 'Unit1', 'This is first unit', 1, NULL, NULL, NULL, NULL, '2023-01-23 21:00:00', 'PY020721_MikeNader_Class4_20min.webp', 'United State');
INSERT INTO `unit` VALUES (2, 1, 'Unit2', 'This is second unit', 1, NULL, NULL, NULL, NULL, '2023-01-24 21:00:18', 'vcvv-min.jpg', 'India');
INSERT INTO `unit` VALUES (3, 2, 'Unit1', 'This is third unit', 1, NULL, NULL, NULL, NULL, '2023-01-25 21:00:44', 'Ramoji2-copy-1024x680.jpg', 'Nepal');
INSERT INTO `unit` VALUES (4, 2, 'Unit2', 'This is fourth unit', 0, NULL, NULL, NULL, NULL, '2023-01-25 22:01:05', 'about2-copyright.png', 'Myanmar');

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
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (46, 'admin@yoga.com', 'asdf', 'Yoga', 'Admin', NULL, NULL, NULL, '19573632574', 1, 'en, hd', 'master\'s degree', 'N/A', 'United States', '710 Tina Manker Rd', ' ', 'Ridgeland', 'South Carolina', '29936', 0, '2023-01-26 02:43:53', '$2a$10$8q1o61oPMbl79YAS/5T8x.tD/FMQGAyghL6xo8c4ziL2ZRHPkac1O', 1, NULL, NULL, '1674805801887.jpg');
INSERT INTO `user` VALUES (47, 'mentor@yoga.com', 'asdfg', 'Yoga', 'Mentor', NULL, NULL, NULL, '	022 2756 3377', 1, 'en,hd', 'doctor', 'N/A', 'India', 'Palm Beach Rd, Sector 15, CBD Belapur', ' ', 'Navi Mumbai', '	Maharashtra', '	400614', 2, '2023-01-27 06:13:30', '$2a$10$ElMU.uVXI4FUtCLlExdEZeB3VzwXQVEMIG67wfjanSCPPqx0xONZG', 1, NULL, NULL, '1674805801887.jpg');
INSERT INTO `user` VALUES (48, 'chief@yoga.com', 'asdfg', 'Chief', 'Mentor', NULL, NULL, NULL, '	099 47 770555', 1, 'en,hd', 'doctor', 'N/A', 'India', '	Salem - Kochi - Kanyakumari Hwy, Sreekariyam', ' ', '	Thiruvananthapuram', '	Kerala', '	695017', 1, '2023-01-27 05:03:24', '$2a$10$qbepXy69WihmEkWlrkwH9uVpBTCwuMN59wCi.l/LaZGR1uOFEIElW', 1, NULL, NULL, '1674806583864.jpg');
INSERT INTO `user` VALUES (50, 'darbinyan.dev@gmail.com', 'asdf', 'Suren', 'Darbinyan', 'Suren', 0, '2023-01-23', '15405724932', 1, 'en', 'bachelor\'s degree in computer science', 'N/A', 'Armenia', 'Rubinyants 17/2 apt 26', '', 'Yerevan', 'Yerevan', '0069', 3, '2023-01-27 06:13:00', '$2a$10$8q1o61oPMbl79YAS/5T8x.tD/FMQGAyghL6xo8c4ziL2ZRHPkac1O', 1, NULL, NULL, '1674805801887.jpg');
INSERT INTO `user` VALUES (51, 'jeremykh1028@gmail.com', NULL, 'Jeremy', 'Khan', 'Jeremy', 0, '2023-01-23', '18654659371', 1, 'en,fr', 'bachelor\'s degree in computer science', 'N/A', 'Canada', '155 Calverley trail', '', 'Toronto', 'Ontario', 'M1C 3Y4', 4, NULL, NULL, 0, NULL, NULL, 'jeremy_avatar.jpg');

SET FOREIGN_KEY_CHECKS = 1;
