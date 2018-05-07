/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50538
Source Database       : quartz_sqoop_conf

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-05-07 16:36:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for job_task
-- ----------------------------
DROP TABLE IF EXISTS `job_task`;
CREATE TABLE `job_task` (
  `TASK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASK_CODE` varchar(255) DEFAULT NULL,
  `TASK_TYPE` varchar(255) DEFAULT NULL,
  `TASK_IMPL_CLASS` varchar(255) DEFAULT NULL,
  `TASK_EXPRESS` varchar(255) DEFAULT NULL,
  `STATE_DATE` datetime DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `PARMS` text COMMENT 'json格式参数',
  `REMARK` varchar(255) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TASK_JAR_PATH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_task
-- ----------------------------
INSERT INTO `job_task` VALUES ('1', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 17 10 * * ?', '2016-12-05 10:14:06', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 17 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 10:14:06', '');
INSERT INTO `job_task` VALUES ('2', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 17 10 * * ?', '2016-12-05 11:02:07', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 17 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 11:02:07', '');
INSERT INTO `job_task` VALUES ('3', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 04 11 * * ?', '2016-12-05 11:03:22', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 04 11 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 11:03:22', '');
INSERT INTO `job_task` VALUES ('4', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 40 15 * * ?', '2016-12-05 13:38:40', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 40 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 13:38:40', '');
INSERT INTO `job_task` VALUES ('5', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 42 13 * * ?', '2016-12-05 13:40:17', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 42 13 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 13:40:17', '');
INSERT INTO `job_task` VALUES ('6', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 10 14 * * ?', '2016-12-05 14:07:25', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 10 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 14:07:25', '');
INSERT INTO `job_task` VALUES ('7', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 26 14 * * ?', '2016-12-05 14:24:44', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 26 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 14:24:44', '');
INSERT INTO `job_task` VALUES ('8', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 26 14 * * ?', '2016-12-05 14:25:26', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 26 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 14:25:26', '');
INSERT INTO `job_task` VALUES ('9', 'sqoop_etl_task7', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 56 14 * * ?', '2016-12-05 14:53:56', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":7,\"task_express\":\"0 56 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 14:53:56', '');
INSERT INTO `job_task` VALUES ('10', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-05 15:18:56', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 15:18:56', '');
INSERT INTO `job_task` VALUES ('11', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-05 15:24:56', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 15:24:56', '');
INSERT INTO `job_task` VALUES ('12', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 28 15 * * ?', '2016-12-05 15:24:56', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 28 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-05 15:24:56', '');
INSERT INTO `job_task` VALUES ('13', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-06 10:54:13', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-06 10:54:13', '');
INSERT INTO `job_task` VALUES ('14', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 58 10 * * ?', '2016-12-06 10:54:13', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"2016-12-04 21:42:07.000\",\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 58 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-06 10:54:13', '');
INSERT INTO `job_task` VALUES ('15', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-07 10:16:30', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-07 10:16:30', '');
INSERT INTO `job_task` VALUES ('16', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 18 10 * * ?', '2016-12-07 10:16:30', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"2016-12-04 23:35:30.000\",\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 18 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-07 10:16:30', '');
INSERT INTO `job_task` VALUES ('17', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-08 14:50:50', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-08 14:50:50', '');
INSERT INTO `job_task` VALUES ('18', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 18 10 * * ?', '2016-12-08 14:50:50', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"2016-12-07 23:56:27.000\",\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 18 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-08 14:50:50', '');
INSERT INTO `job_task` VALUES ('19', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 53 14 * * ?', '2016-12-08 14:50:50', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 53 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-08 14:50:50', '');
INSERT INTO `job_task` VALUES ('20', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-09 10:32:47', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-09 10:32:47', '');
INSERT INTO `job_task` VALUES ('21', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 18 10 * * ?', '2016-12-09 10:32:47', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"2016-12-08 23:52:23.000\",\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 18 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-09 10:32:47', '');
INSERT INTO `job_task` VALUES ('22', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 53 14 * * ?', '2016-12-09 10:32:48', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 53 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-09 10:32:48', '');
INSERT INTO `job_task` VALUES ('23', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-09 10:34:48', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-09 10:34:48', '');
INSERT INTO `job_task` VALUES ('24', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 18 10 * * ?', '2016-12-09 10:34:48', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"2016-12-08 23:52:23.000\",\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 18 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-09 10:34:48', '');
INSERT INTO `job_task` VALUES ('25', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 36 10 * * ?', '2016-12-09 10:34:48', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 36 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-09 10:34:48', '');
INSERT INTO `job_task` VALUES ('26', 'sqoop_etl_task8', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 15 * * ?', '2016-12-15 16:59:32', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_corp\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"RTT_1\",\"partitionColumn\":\"CorpID\",\"sqoop_etl_id\":8,\"task_express\":\"0 20 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-15 16:59:32', '');
INSERT INTO `job_task` VALUES ('27', 'sqoop_etl_task9', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 18 10 * * ?', '2016-12-15 16:59:32', 'N', '{\"create_time\":0,\"datasource_database\":\"e6da\",\"datasource_pass\":\"E6Hive143\",\"datasource_port\":3306,\"datasource_table\":\"da_base_driver\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.43\",\"datasource_user\":\"root\",\"from_datasource_type\":1,\"last_end_time\":0,\"lastpartitionColumnValue\":\"2016-12-14 23:32:01.000\",\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":9,\"task_express\":\"0 18 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-15 16:59:32', '');
INSERT INTO `job_task` VALUES ('28', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 36 10 * * ?', '2016-12-15 16:59:32', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 36 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-15 16:59:32', '');
INSERT INTO `job_task` VALUES ('29', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 36 14 * * ?', '2016-12-16 14:34:49', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 36 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 14:34:49', '');
INSERT INTO `job_task` VALUES ('30', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 39 14 * * ?', '2016-12-16 14:37:49', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 39 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 14:37:49', '');
INSERT INTO `job_task` VALUES ('31', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 48 14 * * ?', '2016-12-16 14:44:49', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 48 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 14:44:49', '');
INSERT INTO `job_task` VALUES ('32', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 48 14 * * ?', '2016-12-16 14:45:57', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 48 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 14:45:57', '');
INSERT INTO `job_task` VALUES ('33', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 48 14 * * ?', '2016-12-16 15:02:58', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 48 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 15:02:58', '');
INSERT INTO `job_task` VALUES ('34', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 10 15 * * ?', '2016-12-16 15:02:58', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 10 15 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 15:02:58', '');
INSERT INTO `job_task` VALUES ('35', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 16 * * ?', '2016-12-16 16:52:18', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 55 16 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 16:52:18', '');
INSERT INTO `job_task` VALUES ('36', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 00 17 * * ?', '2016-12-16 16:52:18', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 00 17 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-16 16:52:18', '');
INSERT INTO `job_task` VALUES ('37', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 16 * * ?', '2016-12-20 10:42:39', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 55 16 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 10:42:39', '');
INSERT INTO `job_task` VALUES ('38', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 00 17 * * ?', '2016-12-20 10:42:39', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 00 17 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 10:42:39', '');
INSERT INTO `job_task` VALUES ('39', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 16 * * ?', '2016-12-20 10:43:39', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 55 16 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 10:43:39', '');
INSERT INTO `job_task` VALUES ('40', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 45 10 * * ?', '2016-12-20 10:43:39', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 45 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 10:43:39', '');
INSERT INTO `job_task` VALUES ('41', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 16 * * ?', '2016-12-20 10:46:24', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 55 16 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 10:46:24', '');
INSERT INTO `job_task` VALUES ('42', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 10 * * ?', '2016-12-20 10:46:24', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 55 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 10:46:24', '');
INSERT INTO `job_task` VALUES ('43', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 16 * * ?', '2016-12-20 11:13:25', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 55 16 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:13:25', '');
INSERT INTO `job_task` VALUES ('44', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 10 * * ?', '2016-12-20 11:13:25', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 55 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:13:25', '');
INSERT INTO `job_task` VALUES ('45', 'sqoop_etl_task12', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 20 11 * * ?', '2016-12-20 11:13:25', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AutoRunWayBill\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":12,\"task_express\":\"0 20 11 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:13:25', '');
INSERT INTO `job_task` VALUES ('46', 'sqoop_etl_task10', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 16 * * ?', '2016-12-20 11:32:25', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AreaExtend\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"lastpartitionColumnValue\":\"477546\",\"partitionColumn\":\"AreaID\",\"sqoop_etl_id\":10,\"task_express\":\"0 55 16 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:32:25', '');
INSERT INTO `job_task` VALUES ('47', 'sqoop_etl_task11', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 55 10 * * ?', '2016-12-20 11:32:25', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.APPWayBillProccess\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":11,\"task_express\":\"0 55 10 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:32:25', '');
INSERT INTO `job_task` VALUES ('48', 'sqoop_etl_task12', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 40 11 * * ?', '2016-12-20 11:32:25', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AutoRunWayBill\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":12,\"task_express\":\"0 40 11 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:32:25', '');
INSERT INTO `job_task` VALUES ('49', 'sqoop_etl_task12', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 56 11 * * ?', '2016-12-20 11:53:06', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AutoRunWayBill\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":12,\"task_express\":\"0 56 11 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 11:53:06', '');
INSERT INTO `job_task` VALUES ('50', 'sqoop_etl_task12', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 50 13 * * ?', '2016-12-20 13:47:46', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AutoRunWayBill\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":12,\"task_express\":\"0 50 13 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 13:47:46', '');
INSERT INTO `job_task` VALUES ('51', 'sqoop_etl_task12', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 58 13 * * ?', '2016-12-20 13:55:21', 'N', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AutoRunWayBill\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":12,\"task_express\":\"0 58 13 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 13:55:21', '');
INSERT INTO `job_task` VALUES ('52', 'sqoop_etl_task12', 'sqoop_etl_task', 'com.apache.sqoop.demo.task.JDBC2HiveETLTask', '0 32 14 * * ?', '2016-12-20 14:28:22', 'U', '{\"create_time\":0,\"datasource_database\":\"E6PlateFormWalmart_0010\",\"datasource_pass\":\"T8!qg~CRZujK9k\",\"datasource_port\":8089,\"datasource_table\":\"Wal.AutoRunWayBill\",\"datasource_table_columns\":\"\",\"datasource_table_where_condition\":\"\",\"datasource_url\":\"192.168.1.57\",\"datasource_user\":\"S_BigData_Sync\",\"from_datasource_type\":3,\"last_end_time\":0,\"partitionColumn\":\"CreatedTime\",\"sqoop_etl_id\":12,\"task_express\":\"0 32 14 * * ?\",\"to_datasource_type\":4,\"update_time\":0}', null, '2016-12-20 14:28:22', '');

-- ----------------------------
-- Table structure for sqoop_etl_task
-- ----------------------------
DROP TABLE IF EXISTS `sqoop_etl_task`;
CREATE TABLE `sqoop_etl_task` (
  `sqoop_etl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_datasource_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '1代表来源为msyql,2来源为Oracle,3来源为mssql,4HIVE',
  `to_datasource_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '1代表来源为msyql,2来源为Oracle,3来源为mssql,4HIVE',
  `datasource_url` varchar(255) DEFAULT NULL COMMENT '数据库链接地址',
  `datasource_port` int(11) NOT NULL DEFAULT '3306' COMMENT '数据库链接端口',
  `datasource_user` varchar(255) DEFAULT 'root' COMMENT '数据库用户名',
  `STATE` char(1) NOT NULL DEFAULT '1' COMMENT '1为可用，2为废弃',
  `datasource_table` varchar(255) NOT NULL COMMENT '迁移数据表名',
  `datasource_table_columns` varchar(255) DEFAULT '' COMMENT '迁移数据表字段已,分割',
  `datasource_table_where_condition` varchar(1024) DEFAULT '' COMMENT '迁移数据where条件',
  `create_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '创建时间13位时间戳',
  `update_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '更新时间13位时间戳',
  `last_end_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '最后任务结束时间13位时间戳',
  `task_express` varchar(256) NOT NULL DEFAULT '' COMMENT '任务执行时间',
  `datasource_pass` varchar(256) NOT NULL COMMENT '数据库密码',
  `datasource_database` varchar(256) NOT NULL COMMENT '数据库库名',
  `partitionColumn` varchar(256) DEFAULT NULL COMMENT '表分区字段一般为主键或者createtime等',
  `is_need_reload` smallint(6) DEFAULT '0' COMMENT '0表示不需要，1表示需要',
  PRIMARY KEY (`sqoop_etl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqoop_etl_task
-- ----------------------------
INSERT INTO `sqoop_etl_task` VALUES ('4', '1', '4', '192.168.8.50', '3306', 'car_warn', '2', 'da_base_corp', '', '', '0', '0', '0', '0 40 17 * * ?', '1q2w3e4r5t@', 'e6da', 'CreatedTime', '0');
INSERT INTO `sqoop_etl_task` VALUES ('5', '2', '4', '192.168.8.213', '1521', 'e3_user', '2', 'E3_CRM.T_BSS_CORP', '', '', '0', '0', '0', '0 50 17 * * ?', '!FE68jlj5rft55', 'orcl', 'CORP_ID', '0');
INSERT INTO `sqoop_etl_task` VALUES ('6', '4', '1', '192.168.8.50', '3306', 'car_warn', '2', 'hive2jdbc', '', 'select createduserid,createdtime,corpname,1 from schema_e6plateformmain_base_table_e6corp where createduserid>500', '0', '0', '0', '0 35 17 * * ?', '1q2w3e4r5t@', 'e6da', null, '0');
INSERT INTO `sqoop_etl_task` VALUES ('7', '1', '4', '192.168.1.43', '3306', 'root', '2', 'da_base_corp', '', '', '0', '0', '0', '0 56 14 * * ?', 'E6Hive143', 'e6da', 'CreatedTime', '0');
INSERT INTO `sqoop_etl_task` VALUES ('8', '1', '4', '192.168.1.43', '3306', 'root', '2', 'da_base_corp', '', '', '0', '0', '0', '0 20 15 * * ?', 'E6Hive143', 'e6da', 'CorpID', '0');
INSERT INTO `sqoop_etl_task` VALUES ('9', '1', '4', '192.168.1.43', '3306', 'root', '2', 'da_base_driver', '', '', '0', '0', '0', '0 18 10 * * ?', 'E6Hive143', 'e6da', 'CreatedTime', '0');
INSERT INTO `sqoop_etl_task` VALUES ('10', '3', '4', '192.168.1.57', '8089', 'S_BigData_Sync', '2', 'Wal.AreaExtend', '', '', '0', '0', '0', '0 55 16 * * ?', 'T8!qg~CRZujK9k', 'E6PlateFormWalmart_0010', 'AreaID', '0');
INSERT INTO `sqoop_etl_task` VALUES ('11', '3', '4', '192.168.1.57', '8089', 'S_BigData_Sync', '2', 'Wal.APPWayBillProccess', '', '', '0', '0', '0', '0 55 10 * * ?', 'T8!qg~CRZujK9k', 'E6PlateFormWalmart_0010', 'CreatedTime', '0');
INSERT INTO `sqoop_etl_task` VALUES ('12', '3', '4', '192.168.1.57', '8089', 'S_BigData_Sync', '1', 'Wal.AutoRunWayBill', '', '', '0', '0', '0', '0 32 14 * * ?', 'T8!qg~CRZujK9k', 'E6PlateFormWalmart_0010', 'CreatedTime', '0');

-- ----------------------------
-- Table structure for sqoop_etl_task_lastvalue
-- ----------------------------
DROP TABLE IF EXISTS `sqoop_etl_task_lastvalue`;
CREATE TABLE `sqoop_etl_task_lastvalue` (
  `sqoop_etl_id` bigint(20) NOT NULL,
  `partitionColumn_last_value` varchar(256) NOT NULL,
  `result_table` varchar(256) NOT NULL DEFAULT '' COMMENT '导出结果表',
  PRIMARY KEY (`sqoop_etl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqoop_etl_task_lastvalue
-- ----------------------------
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('1', '2016-12-02 17:43:29.000', 'schema_E6PlateFormMain_Base_table_E6Driver');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('2', '2016-11-29 17:51:46.000', 'schema_E6PlateFormMain_Base_table_E6Corp');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('3', '2016-11-18 20:26:39.000', 'schema_E6PlateFormMain_Base_table_E6Vehicle');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('4', '2016-07-26 20:54:53.000', 'schema_e6da_table_da_base_corp');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('5', '18663.0', 'schema_orcl_E3_CRM_table_T_BSS_CORP');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('7', '确保货物顺利通关。 \"', 'schema_e6da_table_da_base_corp');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('8', 'RTT_1', 'schema_e6da_table_da_base_corp');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('9', '2016-12-14 23:32:01.000', 'schema_e6da_table_da_base_driver');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('10', '477546', 'schema_E6PlateFormWalmart_0010_Wal_table_AreaExtend');
INSERT INTO `sqoop_etl_task_lastvalue` VALUES ('12', '81794', 'schema_E6PlateFormWalmart_0010_Wal_table_AutoRunWayBill');

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
DROP TABLE IF EXISTS `task_log`;
CREATE TABLE `task_log` (
  `TASK_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_ID` int(11) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `FINISH_DATE` datetime DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TASK_LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_log
-- ----------------------------
INSERT INTO `task_log` VALUES ('1', '4', 'R', '2016-11-02 11:06:59', null, 'running');
INSERT INTO `task_log` VALUES ('2', '9', 'O', '2016-11-16 16:04:40', '2016-11-16 16:04:40', 'complete');
INSERT INTO `task_log` VALUES ('3', '11', 'O', '2016-11-16 16:22:40', '2016-11-16 16:22:40', 'complete');
INSERT INTO `task_log` VALUES ('4', '12', 'O', '2016-11-16 16:33:40', '2016-11-16 16:34:10', 'complete');
INSERT INTO `task_log` VALUES ('5', '13', 'O', '2016-11-16 17:43:38', '2016-11-16 17:43:54', 'complete');
INSERT INTO `task_log` VALUES ('6', '14', 'O', '2016-11-16 17:50:38', '2016-11-16 17:51:09', 'complete');
INSERT INTO `task_log` VALUES ('7', '15', 'O', '2016-11-17 09:05:20', '2016-11-17 09:05:36', 'complete');
INSERT INTO `task_log` VALUES ('8', '16', 'O', '2016-11-17 09:13:20', '2016-11-17 09:13:36', 'complete');
INSERT INTO `task_log` VALUES ('9', '17', 'O', '2016-11-17 10:28:19', '2016-11-17 10:28:50', 'complete');
INSERT INTO `task_log` VALUES ('10', '18', 'O', '2016-11-17 10:45:18', '2016-11-17 10:45:38', 'complete');
INSERT INTO `task_log` VALUES ('11', '19', 'O', '2016-11-17 11:24:18', '2016-11-17 11:24:48', 'complete');
INSERT INTO `task_log` VALUES ('12', '20', 'O', '2016-11-17 11:34:18', '2016-11-17 11:36:34', 'complete');
INSERT INTO `task_log` VALUES ('13', '21', 'O', '2016-11-17 13:40:40', '2016-11-17 13:43:36', 'complete');
INSERT INTO `task_log` VALUES ('14', '22', 'O', '2016-11-17 14:06:05', '2016-11-17 14:08:37', 'complete');
INSERT INTO `task_log` VALUES ('15', '23', 'O', '2016-11-17 14:11:28', '2016-11-17 14:11:28', 'complete');
INSERT INTO `task_log` VALUES ('16', '24', 'O', '2016-11-17 14:16:28', '2016-11-17 14:16:28', 'complete');
INSERT INTO `task_log` VALUES ('17', '25', 'O', '2016-11-17 14:26:28', '2016-11-17 14:28:44', 'complete');
INSERT INTO `task_log` VALUES ('18', '26', 'O', '2016-11-17 14:31:52', '2016-11-17 14:34:10', 'complete');
INSERT INTO `task_log` VALUES ('19', '27', 'O', '2016-11-17 14:37:17', '2016-11-17 14:40:04', 'complete');
INSERT INTO `task_log` VALUES ('20', '25', 'O', '2016-11-18 14:27:49', '2016-11-18 14:30:12', 'complete');
INSERT INTO `task_log` VALUES ('21', '26', 'O', '2016-11-18 14:33:15', '2016-11-18 14:35:36', 'complete');
INSERT INTO `task_log` VALUES ('22', '27', 'O', '2016-11-18 14:38:37', '2016-11-18 14:41:47', 'complete');
INSERT INTO `task_log` VALUES ('23', '25', 'O', '2016-11-19 14:28:34', '2016-11-19 14:31:34', 'complete');
INSERT INTO `task_log` VALUES ('24', '26', 'O', '2016-11-19 14:33:59', '2016-11-19 14:36:58', 'complete');
INSERT INTO `task_log` VALUES ('25', '27', 'O', '2016-11-19 14:39:24', '2016-11-19 14:44:07', 'complete');
INSERT INTO `task_log` VALUES ('26', '25', 'O', '2016-11-20 14:29:23', '2016-11-20 14:31:43', 'complete');
INSERT INTO `task_log` VALUES ('27', '26', 'O', '2016-11-20 14:34:47', '2016-11-20 14:37:17', 'complete');
INSERT INTO `task_log` VALUES ('28', '27', 'O', '2016-11-20 14:40:11', '2016-11-20 14:43:33', 'complete');
INSERT INTO `task_log` VALUES ('29', '25', 'O', '2016-11-21 14:30:56', '2016-11-21 14:33:23', 'complete');
INSERT INTO `task_log` VALUES ('30', '26', 'O', '2016-11-21 14:36:18', '2016-11-21 14:39:25', 'complete');
INSERT INTO `task_log` VALUES ('31', '27', 'O', '2016-11-21 14:41:46', '2016-11-21 14:45:19', 'complete');
INSERT INTO `task_log` VALUES ('32', '31', 'O', '2016-11-21 21:35:04', '2016-11-21 21:37:42', 'complete');
INSERT INTO `task_log` VALUES ('33', '32', 'O', '2016-11-21 22:35:27', '2016-11-21 22:38:04', 'complete');
INSERT INTO `task_log` VALUES ('34', '33', 'O', '2016-11-21 23:35:47', '2016-11-21 23:39:08', 'complete');
INSERT INTO `task_log` VALUES ('35', '34', 'O', '2016-11-22 00:36:11', '2016-11-22 00:36:13', 'complete');
INSERT INTO `task_log` VALUES ('36', '38', 'O', '2016-11-22 15:20:02', '2016-11-22 15:20:06', 'complete');
INSERT INTO `task_log` VALUES ('37', '42', 'O', '2016-11-22 15:25:02', '2016-11-22 15:27:32', 'complete');
INSERT INTO `task_log` VALUES ('38', '50', 'O', '2016-11-22 15:41:50', '2016-11-22 15:45:06', 'complete');
INSERT INTO `task_log` VALUES ('39', '47', 'O', '2016-11-22 21:38:24', '2016-11-22 21:41:20', 'complete');
INSERT INTO `task_log` VALUES ('40', '48', 'O', '2016-11-22 22:38:49', '2016-11-22 22:41:51', 'complete');
INSERT INTO `task_log` VALUES ('41', '49', 'O', '2016-11-22 23:39:13', '2016-11-22 23:41:37', 'complete');
INSERT INTO `task_log` VALUES ('42', '55', 'O', '2016-11-23 10:01:48', '2016-11-23 10:01:49', 'complete');
INSERT INTO `task_log` VALUES ('43', '60', 'O', '2016-11-23 10:10:48', '2016-11-23 10:10:50', 'complete');
INSERT INTO `task_log` VALUES ('44', '70', 'O', '2016-11-23 11:12:48', '2016-11-23 11:12:49', 'complete');
INSERT INTO `task_log` VALUES ('45', '65', 'O', '2016-11-23 11:12:48', '2016-11-23 11:12:49', 'complete');
INSERT INTO `task_log` VALUES ('46', '75', 'O', '2016-11-23 11:23:47', '2016-11-23 11:26:09', 'complete');
INSERT INTO `task_log` VALUES ('47', '85', 'O', '2016-11-23 11:34:09', '2016-11-23 11:34:15', 'complete');
INSERT INTO `task_log` VALUES ('48', '90', 'O', '2016-11-23 11:38:09', '2016-11-23 11:40:28', 'complete');
INSERT INTO `task_log` VALUES ('49', '95', 'O', '2016-11-23 12:42:30', '2016-11-23 12:45:14', 'complete');
INSERT INTO `task_log` VALUES ('50', '94', 'O', '2016-11-23 13:42:55', '2016-11-23 13:42:56', 'complete');
INSERT INTO `task_log` VALUES ('51', '98', 'O', '2016-11-23 14:07:54', '2016-11-23 14:10:15', 'complete');
INSERT INTO `task_log` VALUES ('52', '97', 'O', '2016-11-23 14:28:19', '2016-11-23 14:30:45', 'complete');
INSERT INTO `task_log` VALUES ('53', '96', 'O', '2016-11-23 14:43:43', '2016-11-23 14:46:04', 'complete');
INSERT INTO `task_log` VALUES ('54', '194', 'O', '2016-11-23 18:52:03', '2016-11-23 18:52:07', 'complete');
INSERT INTO `task_log` VALUES ('55', '200', 'O', '2016-11-23 18:55:03', '2016-11-23 18:55:06', 'complete');
INSERT INTO `task_log` VALUES ('56', '199', 'O', '2016-11-23 18:58:03', '2016-11-23 18:58:06', 'complete');
INSERT INTO `task_log` VALUES ('57', '209', 'O', '2016-11-23 21:00:00', '2016-11-23 21:02:31', 'complete');
INSERT INTO `task_log` VALUES ('58', '208', 'O', '2016-11-23 22:00:24', '2016-11-23 22:02:43', 'complete');
INSERT INTO `task_log` VALUES ('59', '207', 'O', '2016-11-23 23:00:41', '2016-11-23 23:02:50', 'complete');
INSERT INTO `task_log` VALUES ('60', '206', 'O', '2016-11-24 00:01:06', '2016-11-24 00:03:33', 'complete');
INSERT INTO `task_log` VALUES ('61', '215', 'O', '2016-11-24 20:01:37', '2016-11-24 20:04:37', 'complete');
INSERT INTO `task_log` VALUES ('62', '214', 'O', '2016-11-24 21:02:02', '2016-11-24 21:04:47', 'complete');
INSERT INTO `task_log` VALUES ('63', '213', 'O', '2016-11-24 22:02:28', '2016-11-24 22:04:51', 'complete');
INSERT INTO `task_log` VALUES ('64', '212', 'O', '2016-11-24 23:02:50', '2016-11-24 23:06:02', 'complete');
INSERT INTO `task_log` VALUES ('65', '211', 'O', '2016-11-25 00:03:14', '2016-11-25 00:05:52', 'complete');
INSERT INTO `task_log` VALUES ('66', '215', 'O', '2016-11-25 20:03:14', '2016-11-25 20:03:14', 'complete');
INSERT INTO `task_log` VALUES ('67', '214', 'O', '2016-11-25 21:03:13', '2016-11-25 21:03:13', 'complete');
INSERT INTO `task_log` VALUES ('68', '213', 'O', '2016-11-25 22:03:12', '2016-11-25 22:03:12', 'complete');
INSERT INTO `task_log` VALUES ('69', '212', 'O', '2016-11-25 23:03:11', '2016-11-25 23:03:11', 'complete');
INSERT INTO `task_log` VALUES ('70', '211', 'O', '2016-11-26 00:03:09', '2016-11-26 00:03:09', 'complete');
INSERT INTO `task_log` VALUES ('71', '215', 'O', '2016-11-26 20:02:46', '2016-11-26 20:02:46', 'complete');
INSERT INTO `task_log` VALUES ('72', '214', 'O', '2016-11-26 21:02:44', '2016-11-26 21:02:44', 'complete');
INSERT INTO `task_log` VALUES ('73', '213', 'O', '2016-11-26 22:02:43', '2016-11-26 22:02:43', 'complete');
INSERT INTO `task_log` VALUES ('74', '212', 'O', '2016-11-26 23:02:42', '2016-11-26 23:02:42', 'complete');
INSERT INTO `task_log` VALUES ('75', '211', 'O', '2016-11-27 00:02:41', '2016-11-27 00:02:41', 'complete');
INSERT INTO `task_log` VALUES ('76', '215', 'O', '2016-11-27 20:02:17', '2016-11-27 20:02:17', 'complete');
INSERT INTO `task_log` VALUES ('77', '214', 'O', '2016-11-27 21:02:16', '2016-11-27 21:02:16', 'complete');
INSERT INTO `task_log` VALUES ('78', '213', 'O', '2016-11-27 22:02:15', '2016-11-27 22:02:15', 'complete');
INSERT INTO `task_log` VALUES ('79', '212', 'O', '2016-11-27 23:02:14', '2016-11-27 23:02:14', 'complete');
INSERT INTO `task_log` VALUES ('80', '211', 'O', '2016-11-28 00:02:13', '2016-11-28 00:02:13', 'complete');
INSERT INTO `task_log` VALUES ('81', '215', 'O', '2016-11-28 20:06:16', '2016-11-29 11:48:34', 'complete');
INSERT INTO `task_log` VALUES ('82', '214', 'O', '2016-11-28 21:06:37', '2016-11-29 11:48:55', 'complete');
INSERT INTO `task_log` VALUES ('83', '213', 'O', '2016-11-28 22:07:01', '2016-11-29 11:49:00', 'complete');
INSERT INTO `task_log` VALUES ('84', '212', 'O', '2016-11-28 23:07:25', '2016-11-29 11:48:43', 'complete');
INSERT INTO `task_log` VALUES ('85', '211', 'O', '2016-11-29 00:07:48', '2016-11-29 11:48:50', 'complete');
INSERT INTO `task_log` VALUES ('86', '221', 'O', '2016-11-29 16:01:59', '2016-11-29 16:06:11', 'complete');
INSERT INTO `task_log` VALUES ('87', '227', 'O', '2016-11-29 16:20:48', '2016-11-29 16:24:39', 'complete');
INSERT INTO `task_log` VALUES ('88', '233', 'O', '2016-11-29 16:55:34', '2016-11-29 17:00:11', 'complete');
INSERT INTO `task_log` VALUES ('89', '239', 'O', '2016-11-29 17:14:24', '2016-11-29 17:18:45', 'complete');
INSERT INTO `task_log` VALUES ('90', '245', 'O', '2016-11-29 17:34:08', '2016-11-29 17:39:16', 'complete');
INSERT INTO `task_log` VALUES ('91', '251', 'O', '2016-11-29 17:46:01', '2016-11-29 17:50:20', 'complete');
INSERT INTO `task_log` VALUES ('92', '257', 'O', '2016-11-29 18:01:51', '2016-11-29 18:06:21', 'complete');
INSERT INTO `task_log` VALUES ('93', '256', 'O', '2016-11-29 20:15:39', '2016-11-29 20:18:06', 'complete');
INSERT INTO `task_log` VALUES ('94', '255', 'O', '2016-11-29 21:16:00', '2016-11-29 21:18:25', 'complete');
INSERT INTO `task_log` VALUES ('95', '254', 'O', '2016-11-29 22:16:25', '2016-11-29 22:19:23', 'complete');
INSERT INTO `task_log` VALUES ('96', '253', 'O', '2016-11-29 23:16:48', '2016-11-29 23:18:56', 'complete');
INSERT INTO `task_log` VALUES ('97', '252', 'O', '2016-11-30 00:17:08', '2016-11-30 00:19:51', 'complete');
INSERT INTO `task_log` VALUES ('98', '263', 'O', '2016-11-30 08:45:20', '2016-11-30 08:49:16', 'complete');
INSERT INTO `task_log` VALUES ('99', '269', 'O', '2016-11-30 09:27:01', '2016-11-30 09:32:56', 'complete');
INSERT INTO `task_log` VALUES ('100', '275', 'O', '2016-11-30 09:52:53', '2016-11-30 09:57:55', 'complete');
INSERT INTO `task_log` VALUES ('101', '274', 'O', '2016-11-30 20:19:30', '2016-11-30 20:24:47', 'complete');
INSERT INTO `task_log` VALUES ('102', '273', 'O', '2016-11-30 21:19:53', '2016-11-30 21:23:58', 'complete');
INSERT INTO `task_log` VALUES ('103', '272', 'O', '2016-11-30 22:20:17', '2016-11-30 22:24:20', 'complete');
INSERT INTO `task_log` VALUES ('104', '271', 'O', '2016-11-30 23:20:42', '2016-11-30 23:26:05', 'complete');
INSERT INTO `task_log` VALUES ('105', '270', 'O', '2016-12-01 00:21:06', '2016-12-01 00:26:31', 'complete');
INSERT INTO `task_log` VALUES ('106', '276', 'O', '2016-12-01 09:31:06', '2016-12-01 09:33:21', 'complete');
INSERT INTO `task_log` VALUES ('107', '277', 'O', '2016-12-01 09:41:53', '2016-12-01 09:44:22', 'complete');
INSERT INTO `task_log` VALUES ('108', '278', 'O', '2016-12-01 09:52:16', '2016-12-01 09:55:16', 'complete');
INSERT INTO `task_log` VALUES ('109', '281', 'O', '2016-12-01 09:57:41', '2016-12-01 10:01:46', 'complete');
INSERT INTO `task_log` VALUES ('110', '279', 'O', '2016-12-01 10:03:28', '2016-12-01 10:05:55', 'complete');
INSERT INTO `task_log` VALUES ('111', '280', 'O', '2016-12-01 10:13:52', '2016-12-01 10:16:20', 'complete');
INSERT INTO `task_log` VALUES ('112', '276', 'O', '2016-12-02 09:34:31', '2016-12-02 09:37:16', 'complete');
INSERT INTO `task_log` VALUES ('113', '277', 'O', '2016-12-02 09:44:55', '2016-12-02 09:47:24', 'complete');
INSERT INTO `task_log` VALUES ('114', '278', 'O', '2016-12-02 09:55:18', '2016-12-02 09:58:06', 'complete');
INSERT INTO `task_log` VALUES ('115', '281', 'O', '2016-12-02 10:00:42', '2016-12-02 10:04:52', 'complete');
INSERT INTO `task_log` VALUES ('116', '279', 'O', '2016-12-02 10:06:30', '2016-12-02 10:09:05', 'complete');
INSERT INTO `task_log` VALUES ('117', '280', 'O', '2016-12-02 10:16:54', '2016-12-02 10:19:28', 'complete');
INSERT INTO `task_log` VALUES ('118', '276', 'O', '2016-12-03 09:37:16', '2016-12-03 09:39:51', 'complete');
INSERT INTO `task_log` VALUES ('119', '277', 'O', '2016-12-03 09:47:40', '2016-12-03 09:50:06', 'complete');
INSERT INTO `task_log` VALUES ('120', '278', 'O', '2016-12-03 09:58:05', '2016-12-03 10:01:06', 'complete');
INSERT INTO `task_log` VALUES ('121', '281', 'O', '2016-12-03 10:03:29', '2016-12-03 10:07:54', 'complete');
INSERT INTO `task_log` VALUES ('122', '279', 'O', '2016-12-03 10:09:16', '2016-12-03 10:11:51', 'complete');
INSERT INTO `task_log` VALUES ('123', '280', 'O', '2016-12-03 10:19:40', '2016-12-03 10:22:18', 'complete');
INSERT INTO `task_log` VALUES ('124', '276', 'O', '2016-12-04 09:39:39', '2016-12-04 09:42:42', 'complete');
INSERT INTO `task_log` VALUES ('125', '277', 'O', '2016-12-04 09:50:04', '2016-12-04 09:52:43', 'complete');
INSERT INTO `task_log` VALUES ('126', '278', 'O', '2016-12-04 10:00:28', '2016-12-04 10:03:58', 'complete');
INSERT INTO `task_log` VALUES ('127', '281', 'O', '2016-12-04 10:05:55', '2016-12-04 10:10:52', 'complete');
INSERT INTO `task_log` VALUES ('128', '279', 'O', '2016-12-04 10:11:45', '2016-12-04 10:15:35', 'complete');
INSERT INTO `task_log` VALUES ('129', '280', 'O', '2016-12-04 10:22:12', '2016-12-04 10:26:01', 'complete');
INSERT INTO `task_log` VALUES ('130', '1', 'R', '2016-12-05 10:17:00', null, 'running');
INSERT INTO `task_log` VALUES ('131', '3', 'R', '2016-12-05 11:04:00', null, 'running');
INSERT INTO `task_log` VALUES ('132', '5', 'R', '2016-12-05 13:42:00', null, 'running');
INSERT INTO `task_log` VALUES ('133', '6', 'R', '2016-12-05 14:10:00', null, 'running');
INSERT INTO `task_log` VALUES ('134', '8', 'O', '2016-12-05 14:26:00', '2016-12-05 14:49:41', 'complete');
INSERT INTO `task_log` VALUES ('135', '9', 'O', '2016-12-05 14:56:00', '2016-12-05 14:56:47', 'complete');
INSERT INTO `task_log` VALUES ('136', '10', 'O', '2016-12-05 15:20:00', '2016-12-05 15:20:38', 'complete');
INSERT INTO `task_log` VALUES ('137', '12', 'O', '2016-12-05 15:28:00', '2016-12-05 15:29:12', 'complete');
INSERT INTO `task_log` VALUES ('138', '14', 'O', '2016-12-06 10:58:00', '2016-12-06 10:58:58', 'complete');
INSERT INTO `task_log` VALUES ('139', '13', 'O', '2016-12-06 15:20:00', '2016-12-06 15:21:30', 'complete');
INSERT INTO `task_log` VALUES ('140', '16', 'O', '2016-12-07 10:18:00', '2016-12-07 10:18:42', 'complete');
INSERT INTO `task_log` VALUES ('141', '15', 'O', '2016-12-07 15:20:00', '2016-12-07 15:20:33', 'complete');
INSERT INTO `task_log` VALUES ('142', '16', 'O', '2016-12-08 10:17:59', '2016-12-08 10:18:46', 'complete');
INSERT INTO `task_log` VALUES ('143', '19', 'O', '2016-12-08 14:53:00', '2016-12-08 14:53:03', 'complete');
INSERT INTO `task_log` VALUES ('144', '17', 'O', '2016-12-08 15:20:00', '2016-12-08 15:20:32', 'complete');
INSERT INTO `task_log` VALUES ('145', '18', 'O', '2016-12-09 10:18:00', '2016-12-09 10:18:43', 'complete');
INSERT INTO `task_log` VALUES ('146', '25', 'O', '2016-12-09 10:36:00', '2016-12-09 10:36:35', 'complete');
INSERT INTO `task_log` VALUES ('147', '23', 'O', '2016-12-09 15:19:59', '2016-12-09 15:20:36', 'complete');
INSERT INTO `task_log` VALUES ('148', '24', 'O', '2016-12-10 10:18:00', '2016-12-10 10:18:44', 'complete');
INSERT INTO `task_log` VALUES ('149', '25', 'O', '2016-12-10 10:36:00', '2016-12-10 10:36:35', 'complete');
INSERT INTO `task_log` VALUES ('150', '23', 'O', '2016-12-10 15:20:00', '2016-12-10 15:20:33', 'complete');
INSERT INTO `task_log` VALUES ('151', '24', 'O', '2016-12-11 10:18:00', '2016-12-11 10:18:43', 'complete');
INSERT INTO `task_log` VALUES ('152', '25', 'O', '2016-12-11 10:36:00', '2016-12-11 10:36:38', 'complete');
INSERT INTO `task_log` VALUES ('153', '23', 'O', '2016-12-11 15:20:00', '2016-12-11 15:20:35', 'complete');
INSERT INTO `task_log` VALUES ('154', '24', 'O', '2016-12-12 10:18:00', '2016-12-12 10:18:41', 'complete');
INSERT INTO `task_log` VALUES ('155', '25', 'O', '2016-12-12 10:36:00', '2016-12-12 10:36:34', 'complete');
INSERT INTO `task_log` VALUES ('156', '23', 'O', '2016-12-12 15:20:00', '2016-12-12 15:20:37', 'complete');
INSERT INTO `task_log` VALUES ('157', '24', 'O', '2016-12-13 10:18:00', '2016-12-13 10:18:45', 'complete');
INSERT INTO `task_log` VALUES ('158', '25', 'O', '2016-12-13 10:36:00', '2016-12-13 10:36:34', 'complete');
INSERT INTO `task_log` VALUES ('159', '23', 'O', '2016-12-13 15:20:00', '2016-12-13 15:20:33', 'complete');
INSERT INTO `task_log` VALUES ('160', '24', 'O', '2016-12-14 10:18:00', '2016-12-14 10:18:43', 'complete');
INSERT INTO `task_log` VALUES ('161', '25', 'O', '2016-12-14 10:36:00', '2016-12-14 10:36:32', 'complete');
INSERT INTO `task_log` VALUES ('162', '23', 'O', '2016-12-14 15:20:00', '2016-12-14 15:20:36', 'complete');
INSERT INTO `task_log` VALUES ('163', '24', 'O', '2016-12-15 10:18:00', '2016-12-15 10:18:43', 'complete');
INSERT INTO `task_log` VALUES ('164', '25', 'O', '2016-12-15 10:36:00', '2016-12-15 10:36:35', 'complete');
INSERT INTO `task_log` VALUES ('165', '23', 'O', '2016-12-15 15:20:00', '2016-12-15 15:20:01', 'complete');
INSERT INTO `task_log` VALUES ('166', '27', 'R', '2016-12-16 10:18:00', null, 'running');
INSERT INTO `task_log` VALUES ('167', '28', 'R', '2016-12-16 10:36:00', null, 'running');
INSERT INTO `task_log` VALUES ('168', '32', 'R', '2016-12-16 14:48:00', null, 'running');
INSERT INTO `task_log` VALUES ('169', '35', 'O', '2016-12-16 16:55:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('170', '36', 'O', '2016-12-16 17:00:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('171', '35', 'O', '2016-12-17 16:55:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('172', '36', 'O', '2016-12-17 17:00:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('173', '35', 'O', '2016-12-18 16:55:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('174', '36', 'O', '2016-12-18 16:59:59', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('175', '35', 'O', '2016-12-19 16:55:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('176', '36', 'O', '2016-12-19 17:00:00', '2016-12-20 09:09:48', 'complete');
INSERT INTO `task_log` VALUES ('177', '40', 'O', '2016-12-20 10:45:00', '2016-12-20 10:45:00', 'complete');
INSERT INTO `task_log` VALUES ('178', '42', 'O', '2016-12-20 10:55:00', '2016-12-20 10:55:00', 'complete');
INSERT INTO `task_log` VALUES ('179', '45', 'O', '2016-12-20 11:19:59', '2016-12-20 11:20:00', 'complete');
INSERT INTO `task_log` VALUES ('180', '48', 'O', '2016-12-20 11:40:00', '2016-12-20 11:40:21', 'complete');
INSERT INTO `task_log` VALUES ('181', '49', 'O', '2016-12-20 11:56:00', '2016-12-20 11:56:22', 'complete');
INSERT INTO `task_log` VALUES ('182', '50', 'O', '2016-12-20 13:50:00', '2016-12-20 13:50:22', 'complete');
INSERT INTO `task_log` VALUES ('183', '51', 'O', '2016-12-20 13:58:00', '2016-12-20 13:58:22', 'complete');
INSERT INTO `task_log` VALUES ('184', '52', 'O', '2016-12-20 14:32:00', '2016-12-20 14:34:42', 'complete');
INSERT INTO `task_log` VALUES ('185', '52', 'O', '2016-12-21 14:32:00', '2016-12-21 14:34:10', 'complete');
INSERT INTO `task_log` VALUES ('186', '52', 'O', '2016-12-22 14:31:59', '2016-12-22 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('187', '52', 'O', '2016-12-23 14:32:00', '2016-12-23 14:34:08', 'complete');
INSERT INTO `task_log` VALUES ('188', '52', 'O', '2016-12-24 14:32:00', '2016-12-24 14:34:07', 'complete');
INSERT INTO `task_log` VALUES ('189', '52', 'O', '2016-12-25 14:32:00', '2016-12-25 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('190', '52', 'O', '2016-12-26 14:32:00', '2016-12-26 14:34:07', 'complete');
INSERT INTO `task_log` VALUES ('191', '52', 'O', '2016-12-27 14:32:00', '2016-12-27 14:34:07', 'complete');
INSERT INTO `task_log` VALUES ('192', '52', 'O', '2016-12-28 14:32:00', '2016-12-28 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('193', '52', 'O', '2016-12-29 14:32:00', '2016-12-29 14:34:10', 'complete');
INSERT INTO `task_log` VALUES ('194', '52', 'O', '2016-12-30 14:32:00', '2016-12-30 14:35:35', 'complete');
INSERT INTO `task_log` VALUES ('195', '52', 'O', '2016-12-31 14:32:00', '2016-12-31 14:34:06', 'complete');
INSERT INTO `task_log` VALUES ('196', '52', 'O', '2017-01-01 14:32:00', '2017-01-01 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('197', '52', 'O', '2017-01-02 14:32:00', '2017-01-02 14:34:08', 'complete');
INSERT INTO `task_log` VALUES ('198', '52', 'O', '2017-01-03 14:32:00', '2017-01-03 14:34:14', 'complete');
INSERT INTO `task_log` VALUES ('199', '52', 'O', '2017-01-04 14:32:00', '2017-01-04 14:34:56', 'complete');
INSERT INTO `task_log` VALUES ('200', '52', 'O', '2017-01-05 14:32:00', '2017-01-05 14:35:03', 'complete');
INSERT INTO `task_log` VALUES ('201', '52', 'O', '2017-01-06 14:32:00', '2017-01-06 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('202', '52', 'O', '2017-01-07 14:32:00', '2017-01-07 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('203', '52', 'O', '2017-01-08 14:31:59', '2017-01-08 14:34:10', 'complete');
INSERT INTO `task_log` VALUES ('204', '52', 'O', '2017-01-09 14:32:00', '2017-01-09 14:34:49', 'complete');
INSERT INTO `task_log` VALUES ('205', '52', 'O', '2017-01-10 14:31:59', '2017-01-10 14:34:09', 'complete');
INSERT INTO `task_log` VALUES ('206', '52', 'O', '2017-01-11 14:32:00', '2017-01-11 14:35:12', 'complete');
INSERT INTO `task_log` VALUES ('207', '52', 'O', '2017-01-12 14:31:59', '2017-01-12 14:34:11', 'complete');
INSERT INTO `task_log` VALUES ('208', '52', 'O', '2017-01-13 14:32:00', '2017-01-13 14:34:08', 'complete');
INSERT INTO `task_log` VALUES ('209', '52', 'O', '2017-01-14 14:31:59', '2017-01-14 14:34:11', 'complete');
INSERT INTO `task_log` VALUES ('210', '52', 'O', '2017-01-15 14:32:00', '2017-01-15 14:34:07', 'complete');
INSERT INTO `task_log` VALUES ('211', '52', 'O', '2017-01-16 14:31:59', '2017-01-16 14:38:16', 'complete');
INSERT INTO `task_log` VALUES ('212', '52', 'O', '2017-01-17 14:31:59', '2017-01-17 14:35:04', 'complete');
INSERT INTO `task_log` VALUES ('213', '52', 'O', '2017-01-18 14:32:00', '2017-01-18 14:34:10', 'complete');
INSERT INTO `task_log` VALUES ('214', '52', 'O', '2017-01-19 14:32:00', '2017-01-19 14:34:47', 'complete');
INSERT INTO `task_log` VALUES ('215', '52', 'O', '2017-01-20 14:32:00', '2017-01-20 14:34:53', 'complete');
INSERT INTO `task_log` VALUES ('216', '52', 'O', '2017-01-21 14:32:00', '2017-01-21 14:34:12', 'complete');
INSERT INTO `task_log` VALUES ('217', '52', 'O', '2017-01-22 14:31:59', '2017-01-22 14:33:26', 'complete');
INSERT INTO `task_log` VALUES ('218', '52', 'O', '2017-01-23 14:32:00', '2017-01-23 14:34:14', 'complete');
INSERT INTO `task_log` VALUES ('219', '52', 'O', '2017-01-24 14:31:59', '2017-01-24 14:33:24', 'complete');
INSERT INTO `task_log` VALUES ('220', '52', 'O', '2017-01-25 14:32:00', '2017-01-25 14:34:10', 'complete');
