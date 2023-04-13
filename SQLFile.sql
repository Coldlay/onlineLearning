/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : onlinelearn

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 13/04/2023 10:17:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority`  (
  `id` bigint NOT NULL COMMENT '权限id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名',
  `perms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逻辑删除',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更信人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority
-- ----------------------------

-- ----------------------------
-- Table structure for t_business
-- ----------------------------
DROP TABLE IF EXISTS `t_business`;
CREATE TABLE `t_business`  (
  `id` bigint NOT NULL COMMENT '业务类型id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_business
-- ----------------------------

-- ----------------------------
-- Table structure for t_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam`  (
  `id` bigint NOT NULL COMMENT '考试id',
  `paper_id` bigint NULL DEFAULT NULL COMMENT '试卷id(用的是哪一张试卷)',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考试名',
  `exam_date` date NULL DEFAULT NULL COMMENT '考试时间',
  `continue_time` int NULL DEFAULT NULL COMMENT '考试时长',
  `total_score` int NULL DEFAULT NULL COMMENT '总分',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逻辑删除',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_exam
-- ----------------------------

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper`  (
  `id` bigint NULL DEFAULT NULL COMMENT '试卷id',
  `question_id` bigint NULL DEFAULT NULL COMMENT '问题id',
  `business_id` bigint NULL DEFAULT NULL COMMENT '业务类型id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_paper
-- ----------------------------

-- ----------------------------
-- Table structure for t_policy
-- ----------------------------
DROP TABLE IF EXISTS `t_policy`;
CREATE TABLE `t_policy`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '政策内容',
  `summary` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '政策摘要',
  `business_id` bigint NULL DEFAULT NULL COMMENT '所属业务分类id',
  `thumbnail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否置顶（0否，1是）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0已发布，1草稿）',
  `view_count` bigint NULL DEFAULT 0 COMMENT '访问量',
  `is_comment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否允许评论 1是，0否',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_policy
-- ----------------------------

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `id` bigint NOT NULL COMMENT '问题id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题类型（0代表判断题，1代表选择题，2代表简答题）',
  `subject` bigint NULL DEFAULT NULL COMMENT '业务类型',
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '具体题目',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案',
  `analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解析',
  `score` int NULL DEFAULT NULL COMMENT '所占分值',
  `level` int NULL DEFAULT NULL COMMENT '难度等级',
  `choiceA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `choiceB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `choiceC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '选项C',
  `choiceD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逻辑删除（1代表正常，0代表已删除）',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_question
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色状态(1代表正常，0代表停用)',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逻辑删除(1代表正常，0代表删除)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_authorities
-- ----------------------------
DROP TABLE IF EXISTS `t_role_authorities`;
CREATE TABLE `t_role_authorities`  (
  `role_id` bigint NOT NULL,
  `authoity_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_authorities
-- ----------------------------

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score`  (
  `id` bigint NOT NULL,
  `exam_id` bigint NULL DEFAULT NULL COMMENT '考试id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `socre` int NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_score
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL COMMENT '用户id',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `job_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `phone_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `avator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐号状态',
  `points` bigint NULL DEFAULT NULL COMMENT '积分',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
