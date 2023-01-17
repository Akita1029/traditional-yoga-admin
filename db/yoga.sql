/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.27-MariaDB : Database - yoga
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yoga` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `yoga`;

/*Table structure for table `assignment` */

DROP TABLE IF EXISTS `assignment`;

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `sub_title` text DEFAULT NULL,
  `max_mark` int(11) DEFAULT NULL,
  `max_time_limit` int(11) DEFAULT NULL,
  `include_in_course_evaluation` tinyint(1) DEFAULT NULL,
  `submissions` int(11) DEFAULT NULL,
  `attachment_type` text DEFAULT NULL,
  `accachment_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `assignment` */

/*Table structure for table `certificationtemplate` */

DROP TABLE IF EXISTS `certificationtemplate`;

CREATE TABLE `certificationtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `bg_image` text DEFAULT NULL,
  `enable_print` tinyint(1) DEFAULT NULL,
  `certificate_width` int(11) DEFAULT NULL,
  `certificate_height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `certificationtemplate` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `detail_content` text DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `instructor_name` text DEFAULT NULL,
  `instructor_photo` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_param` int(11) DEFAULT NULL,
  `student_number` int(11) DEFAULT NULL,
  `completion_lock` tinyint(1) DEFAULT NULL,
  `offline_course` tinyint(1) DEFAULT NULL,
  `show_unit_content_in_curriculumn` tinyint(1) DEFAULT NULL,
  `hide_course_button_after_subscription` tinyint(1) DEFAULT NULL,
  `display_course_progress_on_course_home` tinyint(1) DEFAULT NULL,
  `time_based_corse_progress` tinyint(1) DEFAULT NULL,
  `post_course_reviews_from_course_home` tinyint(1) DEFAULT NULL,
  `auto_evaluation` tinyint(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `max_student_number` int(11) DEFAULT NULL,
  `excellence_badge` text DEFAULT NULL,
  `badge_percent` int(11) DEFAULT NULL,
  `badge_title` text DEFAULT NULL,
  `completion_certificate` tinyint(1) DEFAULT NULL,
  `certificate_template` int(11) DEFAULT NULL,
  `passing_percentage` int(11) DEFAULT NULL,
  `drip_feed` tinyint(1) DEFAULT NULL,
  `course_starting_time_as_drip_feed_origin` tinyint(1) DEFAULT NULL,
  `section-drip_feed` tinyint(1) DEFAULT NULL,
  `drip_duration_as_unit_duration` tinyint(1) DEFAULT NULL,
  `drip_feed_duration` int(11) DEFAULT NULL,
  `drip_feed_duration_param` int(11) DEFAULT NULL,
  `prerequisite_course` text DEFAULT NULL,
  `course_retakes` int(11) DEFAULT NULL,
  `course_forum` int(11) DEFAULT NULL,
  `course_specific_instructions` text DEFAULT NULL,
  `course_completion_msg` text DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `course` */

/*Table structure for table `courseassignment` */

DROP TABLE IF EXISTS `courseassignment`;

CREATE TABLE `courseassignment` (
  `course_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `courseassignment` */

/*Table structure for table `coursecategory` */

DROP TABLE IF EXISTS `coursecategory`;

CREATE TABLE `coursecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `parent_category` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `coursecategory` */

/*Table structure for table `coursemembers` */

DROP TABLE IF EXISTS `coursemembers`;

CREATE TABLE `coursemembers` (
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `coursemembers` */

/*Table structure for table `courseprogress` */

DROP TABLE IF EXISTS `courseprogress`;

CREATE TABLE `courseprogress` (
  `unit_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `courseprogress` */

/*Table structure for table `coursequiz` */

DROP TABLE IF EXISTS `coursequiz`;

CREATE TABLE `coursequiz` (
  `course_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `coursequiz` */

/*Table structure for table `family` */

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `relation` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `phone_number` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `family` */

/*Table structure for table `mentor` */

DROP TABLE IF EXISTS `mentor`;

CREATE TABLE `mentor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `chief_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mentor` */

/*Table structure for table `mentormembers` */

DROP TABLE IF EXISTS `mentormembers`;

CREATE TABLE `mentormembers` (
  `student_id` int(11) DEFAULT NULL,
  `mentor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mentormembers` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `question_options` text DEFAULT NULL,
  `correct_answer` text DEFAULT NULL,
  `answer_hint` text DEFAULT NULL,
  `answer_explantion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `question` */

/*Table structure for table `quiz` */

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_param` int(11) DEFAULT NULL,
  `auto_evaluate_result` tinyint(1) DEFAULT NULL,
  `retake_number` int(11) DEFAULT NULL,
  `post_quiz_msg` text DEFAULT NULL,
  `show_result_after_submission` tinyint(1) DEFAULT NULL,
  `add_check_answer_switch` tinyint(1) DEFAULT NULL,
  `dynamic_quiz` tinyint(1) DEFAULT NULL,
  `random_questions` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `quiz` */

/*Table structure for table `quizquestions` */

DROP TABLE IF EXISTS `quizquestions`;

CREATE TABLE `quizquestions` (
  `quiz_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `quizquestions` */

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `section` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hear_about_us` text DEFAULT NULL,
  `past_yoga_experience` text DEFAULT NULL,
  `course_outline` text DEFAULT NULL,
  `course_ethos` text DEFAULT NULL,
  `course_disciplne` text DEFAULT NULL,
  `vedic_nutraceutical` text DEFAULT NULL,
  `discipline_acknowledgement` text DEFAULT NULL,
  `contact_detail` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `can_attend_course` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `student` */

/*Table structure for table `testuser` */

DROP TABLE IF EXISTS `testuser`;

CREATE TABLE `testuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `testuser` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `first_name` text DEFAULT NULL,
  `last_name` text DEFAULT NULL,
  `nick_name` text DEFAULT NULL,
  `ryit_cert` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `whatsapp_phonenumber` text DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `language` text DEFAULT NULL,
  `profession` text DEFAULT NULL,
  `education_detail` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `street_address` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `province` text DEFAULT NULL,
  `zip_code` text DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `last_logged_in` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`password`,`first_name`,`last_name`,`nick_name`,`ryit_cert`,`birthday`,`whatsapp_phonenumber`,`gender`,`language`,`profession`,`education_detail`,`country`,`street_address`,`address_line_2`,`city`,`province`,`zip_code`,`role`,`last_logged_in`) values 
(1,'admin1@gmail.com','$2a$10$LxpBbl7OKFy.h/48l5OlxO2frQyYgigJWXdTX/hXVLpW3KXvf9Bp.','Senju','Hasirama','a',0,'1992-12-29','1932354',4,'english','c','d','germany','berlin','stress','y','x','z',0,NULL),
(2,'chiefmentor@gmail.com','$2a$10$pvNIV2NoyP1JyHWuKZ9EQOZYahOpWh5kipkURHc1heFe9CfY6ZCXa','Senju','Tobirama','a',0,'1992-12-29','1932354',4,'english','c','d','germany','berlin','stress','y','x','z',1,NULL),
(3,'mentor@gmail.com','$2a$10$1HOqdPPaZ08bcSPA5f0wzu3mSFyXx176f8fBwhw3JdMUdJJnDlulu','Sarutobi','Hiruzen','a',0,'1992-12-29','1932354',4,'english','c','d','germany','berlin','stress','y','x','z',2,NULL),
(4,'student@gmail.com','$2a$10$otEbic2tvKQRzR.yD9fz1Ofgcp1OXz44Wpd/qnNUkG.0Q42D/LbbS','Namikage','Minato','a',0,'1992-12-29','1932354',4,'english','c','d','germany','berlin','stress','y','x','z',3,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
