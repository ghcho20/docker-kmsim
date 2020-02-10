/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.3.13-MariaDB : Database - kms_admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kms_admin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kms_admin`;

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `CONF_CD` varchar(50) NOT NULL,
  `CONF_VAL` varchar(1000) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CONF_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_config` */

insert  into `tb_config`(`CONF_CD`,`CONF_VAL`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('ALERT_LOG_STORAGE_DATE','7',NULL,NULL,'U0001','2019-09-17 22:05:08'),('AUDIT_LOG_PULL_MIN','5',NULL,NULL,'U0001','2019-09-17 22:05:08'),('AUDIT_LOG_STORAGE_DATE','10',NULL,NULL,'U0001','2019-09-17 22:05:08'),('BACKGROUND_IMG','/resources/fileUpload/images/sktBgrd.png',NULL,NULL,NULL,NULL),('EVENT_LOG_STORAGE_DATE','7',NULL,NULL,'U0001','2019-09-17 22:05:08'),('HMAC_KEY','576489bc9b3c9be696d2a7b547f596d8576489bc9b3c9be696d2a7b547f596d8f99e18d238d6f6956d7f1e6add5d42a1',NULL,NULL,'U0001','2019-09-17 22:05:08'),('KMS_ACCESS_ADMIN_DEFAULT_CERT','cert.p12',NULL,NULL,NULL,NULL),('KMS_CONNECT_TRY_INTERVAL_SECOND','10','system','2019-08-01 10:50:20','U0001','2019-09-17 22:05:08'),('KMS_INFT_HMAC_USE_FLAG','N',NULL,NULL,'U0001','2019-09-17 22:05:08'),('KMS_STATUS_REPORT_FALLING_INTERVAL','10',NULL,NULL,NULL,NULL),('LOGIN_TXT','본 시스템은 허가된 사용자만 이용하실수 있습니다.<br>부당한 방법으로 전산망에 접속하거나 <br>정보를 삭제/변경/유출하는 사용자는 <br>관련법령에 따라 처벌 받으실수 있으니 주의 하시기 바랍니다.<br>WARNING:  Unauthorized access to this system is forbidden and will be<br>prosecuted by law. By accessing this system, you agree that your actions<br>may be monitored if unauthorized usage is suspected.<br>',NULL,NULL,'U0001','2019-09-17 22:05:08'),('LOGO_IMG','/resources/fileUpload/images/IDQuantiqueLogo.png',NULL,NULL,NULL,NULL),('SERVER_VERSION','R2.0.2',NULL,NULL,'U0001','2019-09-17 22:05:08'),('STAST_LOG_PULL_MIN','5',NULL,NULL,'U0001','2019-09-17 22:05:08'),('STAST_LOG_STORAGE_DATE','14',NULL,NULL,'U0001','2019-09-17 22:05:08'),('UNUSED_PROCESS_TRY_COUNT','3','system','2019-08-01 10:50:20','U0001','2019-09-17 22:05:08');

/*Table structure for table `tb_consumer_key_store` */

DROP TABLE IF EXISTS `tb_consumer_key_store`;

CREATE TABLE `tb_consumer_key_store` (
  `LINK_ID` int(11) NOT NULL,
  `DEFAULT_KEY_SIZE` int(11) DEFAULT NULL,
  `MAX_KEY_CNT` int(11) DEFAULT NULL,
  `MAX_KEY_CNT_PER_REQ` int(11) DEFAULT NULL,
  `MAX_KEY_SIZE` int(11) DEFAULT NULL,
  `MIN_KEY_SIZE` int(11) DEFAULT NULL,
  `KEY_REQ_INTERVAL` int(11) DEFAULT NULL,
  `MIN_STORE_RATE` int(11) DEFAULT NULL,
  `MAJ_STORE_RATE` int(11) DEFAULT NULL,
  `CRT_STORE_RATE` int(11) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`LINK_ID`),
  CONSTRAINT `tb_consumer_key_store_ibfk_1` FOREIGN KEY (`LINK_ID`) REFERENCES `tb_link_consumer` (`LINK_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_element` */

DROP TABLE IF EXISTS `tb_element`;

CREATE TABLE `tb_element` (
  `ELMT_ID` int(11) NOT NULL,
  `GRP_ID` int(11) DEFAULT NULL,
  `ELMT_NM` varchar(200) DEFAULT NULL,
  `VENDOR` varchar(5) DEFAULT NULL COMMENT 'SKT, NOKIA, IDQ, CIENA',
  `I_PORT` int(11) DEFAULT NULL,
  `E_PORT` int(11) DEFAULT NULL,
  `A_PORT` int(11) DEFAULT NULL,
  `P_PORT` int(11) DEFAULT NULL COMMENT 'KMS에서는 admin port\nConsumer/Provider에서는 protocol port',
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  `ELMT_TYPE` varchar(5) DEFAULT NULL COMMENT 'Consumer : 0, Provider : 1, KMS : 2',
  `LOC_X` int(11) DEFAULT 0 COMMENT 'network 좌표 X',
  `LOC_Y` int(11) DEFAULT 0 COMMENT 'network 좌표 Y',
  `LOC_YN` char(1) DEFAULT 'N' COMMENT '좌표 저장여부',
  `KMS_ID` int(11) DEFAULT NULL,
  `KMS_USE_YN` char(1) DEFAULT 'Y' COMMENT '사용여부',
  `KMS_STATUS` varchar(5) DEFAULT '00' COMMENT '접속상태',
  PRIMARY KEY (`ELMT_ID`),
  UNIQUE KEY `ELMT_NM` (`ELMT_NM`),
  KEY `GRP_ID` (`GRP_ID`),
  CONSTRAINT `tb_element_ibfk_1` FOREIGN KEY (`GRP_ID`) REFERENCES `tb_group` (`GRP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_element_consumer` */

DROP TABLE IF EXISTS `tb_element_consumer`;

CREATE TABLE `tb_element_consumer` (
  `ELMT_ID` int(11) NOT NULL,
  `C_AUTH_PROTOCOL_CD` varchar(20) DEFAULT NULL COMMENT 'MD5, SHA',
  `C_PRIV_PROTOCOL_CD` varchar(20) DEFAULT NULL COMMENT 'AES128, AES256',
  `C_IP` varchar(50) DEFAULT NULL,
  `C_PORT` int(11) DEFAULT NULL,
  `C_SECURITY_NAME` varchar(50) DEFAULT NULL,
  `C_PRIV_PASSWORD` varchar(100) DEFAULT NULL,
  `C_AUTH_PASSWORD` varchar(100) DEFAULT NULL,
  `A_AUTH_PROTOCOL_CD` varchar(20) DEFAULT NULL,
  `A_PRIV_PROTOCOL_CD` varchar(20) DEFAULT NULL,
  `A_IP` varchar(50) DEFAULT NULL,
  `A_PORT` int(11) DEFAULT NULL,
  `A_SECURITY_NAME` varchar(50) DEFAULT NULL,
  `A_PRIV_PASSWORD` varchar(100) DEFAULT NULL,
  `A_AUTH_PASSWORD` varchar(100) DEFAULT NULL,
  `PROCESS_CD` varchar(20) DEFAULT NULL COMMENT 'process_code',
  KEY `ELMT_ID` (`ELMT_ID`),
  CONSTRAINT `tb_element_consumer_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_element_kms` */

DROP TABLE IF EXISTS `tb_element_kms`;

CREATE TABLE `tb_element_kms` (
  `ELMT_ID` int(11) NOT NULL,
  `UNIQUE_ID` varchar(50) DEFAULT NULL,
  `CERT_FILE` varchar(200) DEFAULT NULL COMMENT 'KMS 접속 인증서',
  `LAST_AUDIT_LOG_TIME` varchar(40) DEFAULT NULL COMMENT '감사로그 최종 요청시간',
  `LAST_STATISTICS_LOG_TIME` varchar(40) DEFAULT NULL COMMENT '통계로그 최종 요청시간',
  KEY `ELMT_ID` (`ELMT_ID`),
  CONSTRAINT `tb_element_kms_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_element_kms_port` */

DROP TABLE IF EXISTS `tb_element_kms_port`;

CREATE TABLE `tb_element_kms_port` (
  `ELMT_ID` int(11) NOT NULL,
  `PROCESS_CD` varchar(20) NOT NULL,
  `PORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ELMT_ID`,`PROCESS_CD`),
  CONSTRAINT `tb_element_kms_port_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_group` */

DROP TABLE IF EXISTS `tb_group`;

CREATE TABLE `tb_group` (
  `GRP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GRP_NM` varchar(200) DEFAULT NULL,
  `GRP_DESC` text DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  `LOCATION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`GRP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;


/*Table structure for table `tb_interface` */

DROP TABLE IF EXISTS `tb_interface`;

CREATE TABLE `tb_interface` (
  `ELMT_ID` int(11) NOT NULL,
  `INTF_IP` varchar(50) NOT NULL,
  `IP_TYPE_CD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ELMT_ID`,`INTF_IP`),
  CONSTRAINT `tb_interface_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_interface_consumer` */

DROP TABLE IF EXISTS `tb_interface_consumer`;

CREATE TABLE `tb_interface_consumer` (
  `ELMT_ID` int(11) NOT NULL,
  `VID` varchar(50) NOT NULL,
  `PROTOCOL_ID` varchar(50) DEFAULT NULL,
  `SUBJECT_DN` varchar(300) DEFAULT NULL COMMENT 'vendor가 RESTFUL인 경우 사용',
  `PROCESS_CD` varchar(20) DEFAULT NULL,
  `KEY_TYPE_CD` varchar(20) DEFAULT NULL COMMENT 'QKey, ECDH',
  `STATUS_CD` varchar(20) DEFAULT NULL,
  `STATUS_UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`VID`),
  KEY `ELMT_ID` (`ELMT_ID`),
  CONSTRAINT `tb_interface_consumer_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_interface_provider` */

DROP TABLE IF EXISTS `tb_interface_provider`;

CREATE TABLE `tb_interface_provider` (
  `ELMT_ID` int(11) NOT NULL,
  `KMS_VID` varchar(50) NOT NULL,
  `KMS_PROTOCOL_ID` varchar(50) DEFAULT NULL,
  `PROV_PROTOCOL_ID` varchar(50) DEFAULT NULL,
  `PROCESS_CD` varchar(20) DEFAULT NULL,
  `STATUS_CD` varchar(20) DEFAULT NULL,
  `STATUS_UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`KMS_VID`),
  KEY `ELMT_ID` (`ELMT_ID`),
  CONSTRAINT `tb_interface_provider_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_link` */

DROP TABLE IF EXISTS `tb_link`;

CREATE TABLE `tb_link` (
  `LINK_ID` int(11) NOT NULL,
  `LINK_NM` varchar(200) DEFAULT NULL,
  `LINK_TYPE_CD` varchar(20) DEFAULT NULL COMMENT 'External:K to K\nInternal:K to C, K to P\nProtocl:K to C, K to P',
  `ALGORITHM_CD` int(11) DEFAULT NULL COMMENT '0:none, 1:otp, 2:ARIA256',
  `WEIGHT` int(11) DEFAULT NULL COMMENT 'K to K만 해당. 경로계산시 사용',
  `SRC_ELMT_ID` int(11) DEFAULT NULL,
  `SRC_INTF_IP` varchar(50) DEFAULT NULL,
  `DST_ELMT_ID` int(11) DEFAULT NULL,
  `DST_INTF_IP` varchar(50) DEFAULT NULL,
  `STATUS_CD` varchar(20) DEFAULT NULL COMMENT 'status',
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  `STATUS_UPDATE_TIME` datetime DEFAULT NULL COMMENT 'status updatetiem',
  `ID_INSERT` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`LINK_ID`),
  KEY `SRC_ELMT_ID` (`SRC_ELMT_ID`,`SRC_INTF_IP`),
  KEY `DST_ELMT_ID` (`DST_ELMT_ID`,`DST_INTF_IP`),
  CONSTRAINT `tb_link_ibfk_1` FOREIGN KEY (`SRC_ELMT_ID`, `SRC_INTF_IP`) REFERENCES `tb_interface` (`ELMT_ID`, `INTF_IP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_link_ibfk_2` FOREIGN KEY (`DST_ELMT_ID`, `DST_INTF_IP`) REFERENCES `tb_interface` (`ELMT_ID`, `INTF_IP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_link_consumer` */

DROP TABLE IF EXISTS `tb_link_consumer`;

CREATE TABLE `tb_link_consumer` (
  `LINK_ID` int(11) NOT NULL,
  `LINK_NM` varchar(200) DEFAULT NULL,
  `OPER_MODE_CD` varchar(20) DEFAULT NULL COMMENT '0:master, 1:slave',
  `PRESHARED_KEY` varchar(150) DEFAULT NULL,
  `SRC_VID` varchar(50) DEFAULT NULL,
  `DST_VID` varchar(50) DEFAULT NULL,
  `STATUS_CD` varchar(20) DEFAULT NULL,
  `STATUS_UPDATE_TIME` datetime DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`LINK_ID`),
  KEY `SRC_VID` (`SRC_VID`),
  KEY `DST_VID` (`DST_VID`),
  CONSTRAINT `tb_link_consumer_ibfk_1` FOREIGN KEY (`SRC_VID`) REFERENCES `tb_interface_consumer` (`VID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_link_consumer_ibfk_2` FOREIGN KEY (`DST_VID`) REFERENCES `tb_interface_consumer` (`VID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_link_path` */

DROP TABLE IF EXISTS `tb_link_path`;

CREATE TABLE `tb_link_path` (
  `LINK_ID` int(11) NOT NULL,
  `PATH_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_ID`,`PATH_ID`),
  KEY `PATH_ID` (`PATH_ID`),
  CONSTRAINT `tb_link_path_ibfk_1` FOREIGN KEY (`LINK_ID`) REFERENCES `tb_link_consumer` (`LINK_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_link_path_ibfk_2` FOREIGN KEY (`PATH_ID`) REFERENCES `tb_path` (`PATH_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_link_provider` */

DROP TABLE IF EXISTS `tb_link_provider`;

CREATE TABLE `tb_link_provider` (
  `LINK_ID` int(11) NOT NULL,
  `LINK_NM` varchar(200) DEFAULT NULL,
  `OPER_MODE_CD` varchar(20) DEFAULT NULL COMMENT '0:master, 1:slave',
  `SRC_KMS_VID` varchar(50) DEFAULT NULL,
  `DST_KMS_VID` varchar(50) DEFAULT NULL,
  `STATUS_CD` varchar(20) DEFAULT NULL,
  `STATUS_UPDATE_TIME` datetime DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`LINK_ID`),
  KEY `SRC_KMS_VID` (`SRC_KMS_VID`),
  KEY `DST_KMS_VID` (`DST_KMS_VID`),
  CONSTRAINT `tb_link_provider_ibfk_1` FOREIGN KEY (`SRC_KMS_VID`) REFERENCES `tb_interface_provider` (`KMS_VID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tb_link_provider_ibfk_2` FOREIGN KEY (`DST_KMS_VID`) REFERENCES `tb_interface_provider` (`KMS_VID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_audit` */

DROP TABLE IF EXISTS `tb_log_audit`;

CREATE TABLE `tb_log_audit` (
  `WORK_ID` varchar(10) DEFAULT NULL,
  `WORK_DT` datetime DEFAULT NULL,
  `WORK_KIND` varchar(5) DEFAULT NULL COMMENT 'KMS관리/Consumer관리 등',
  `WORK_TYPE` varchar(5) DEFAULT NULL COMMENT '등록/수정/삭제 등',
  `WORK_RESULT` varchar(5) DEFAULT NULL COMMENT 'Success/Fail',
  `WORK_CONTENT` text DEFAULT NULL,
  `WORK_IP` varchar(50) DEFAULT NULL,
  `WORK_REASON` text DEFAULT NULL COMMENT '작업 실패시 실패 사유',
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_audit` */

/*Table structure for table `tb_log_event` */

DROP TABLE IF EXISTS `tb_log_event`;

CREATE TABLE `tb_log_event` (
  `KMS_ID` int(11) DEFAULT NULL,
  `ELMT_ID` int(11) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `OCCUR_TIME` varchar(40) DEFAULT NULL,
  `CONFIRM_YN` varchar(1) DEFAULT 'N',
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `EVENT_ID` varchar(10) NOT NULL,
  `SRC_SYS_NAME` varchar(20) DEFAULT NULL,
  `SRC_INTERFACE` varchar(40) DEFAULT NULL,
  `DST_SYS_NAME` varchar(20) DEFAULT NULL,
  `DST_INTERFACE` varchar(40) DEFAULT NULL,
  KEY `EVENT_ID` (`EVENT_ID`),
  KEY `ELMT_ID` (`ELMT_ID`,`APP_NAME`,`EVENT_ID`,`CONFIRM_YN`),
  CONSTRAINT `tb_log_event_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `tb_log_event_config` (`EVENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_event_config` */

DROP TABLE IF EXISTS `tb_log_event_config`;

CREATE TABLE `tb_log_event_config` (
  `EVENT_ID` varchar(10) NOT NULL,
  `RATE_CD` varchar(20) DEFAULT NULL,
  `EVENT_KIND` varchar(10) DEFAULT NULL,
  `EVENT_TYPE` varchar(20) NOT NULL,
  `EVENT_MSG` varchar(100) DEFAULT NULL,
  `EVENT_DESC` varchar(200) DEFAULT NULL,
  `AUTO_CONFIRM_YN` varchar(1) DEFAULT 'N',
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_event_config` */

insert  into `tb_log_event_config`(`EVENT_ID`,`RATE_CD`,`EVENT_KIND`,`EVENT_TYPE`,`EVENT_MSG`,`EVENT_DESC`,`AUTO_CONFIRM_YN`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('E3120001','MIN','312','-2000','eInternalError','','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120002','MIN','312','-1999','eSyntaxError','','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120003','MIN','312','-1998','eNotFound','','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120004','MIN','312','-1997','eInvalidRequestId','','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120005','MAJ','312','-1996','eSendFail','Broker에서 전송 실패','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120006','MIN','312','-1995','eTimeout','타임아웃','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120007','MIN','312','-1994','eOverLoadControl','과부하 제어','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120008','MIN','312','-1993','eInvalidOpcode','내가 처리할 메시지가 아니다','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120009','MIN','312','-1992','eUnknownOpcode','모르는 메시지다','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120010','MAJ','312','-1991','eNotManagementEnc','Provisioning 되지 않은 VID','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120011','MAJ','312','-1990','eNotManagement','Provisioning 되지 않은 VID','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120012','MAJ','312','-1989','eManagementMode','관리모드 설정 중이다','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120013','MAJ','312','-1988','eNullKeyValue','key 부족','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120014','MIN','312','-1987','eNotReady','key request를 할 준비가 안됨','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120015','MIN','312','-1986','eInvalidKeyId','key response 의 keyid 가 0 이다','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120016','MIN','312','-1985','eExceedMaxSizeOfVendorSpecificData','VendorSpecificData의 크기가 초과됨','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120017','MIN','312','-1984','eKeyGenFail','key generate fail','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120018','MIN','312','-1983','eExceedMaxKeySize','','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120019','CRI','312','-1982','eIntegrityFailed','무결성 오류','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120020','MIN','312','-1981','eKeySetFail','key set fail','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120021','MIN','312','-1980','eAbnormalProvisionInfo','provisioning data abnormal','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120022','MIN','312','-1979','eDownload','admin 에 있는 file download fail','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120023','MIN','312','-1978','eFileWrite','admin 에서 받은 file kms 에 write fail','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120024','MIN','312','-1900','eEtcError','','N','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120025','MIN','312','-1977','eNotFoundPath','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120026','MIN','312','-1976','eExceedRetry','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120027','MIN','312','-1975','eAlreadyProcessing','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120028','MIN','312','-1974','eRestInvalidMethod','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120029','MIN','312','-1973','eRestInvalidKeySize','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120030','MIN','312','-1972','eRestInvalidMaxKeyPerRequest','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120031','MIN','312','-1971','eRestUnSupportedParameter','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120032','MIN','312','-1970','eRestUnSupportedValues','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120033','MIN','312','-1969','eRestUnSupportedOptionParameter','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14'),('E3120034','MIN','312','-1968','eRestNotFoundPage','','N','system','2019-08-30 17:07:14','system','2019-08-30 17:07:14');

/*Table structure for table `tb_log_event_config_lang` */

DROP TABLE IF EXISTS `tb_log_event_config_lang`;

CREATE TABLE `tb_log_event_config_lang` (
  `EVENT_ID` varchar(10) NOT NULL,
  `FG_LANG` varchar(5) NOT NULL,
  `EVENT_MSG` varchar(100) DEFAULT NULL,
  `EVENT_DESC` varchar(200) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`,`FG_LANG`),
  CONSTRAINT `tb_log_event_config_lang_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `tb_log_event_config` (`EVENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_event_config_lang` */

insert  into `tb_log_event_config_lang`(`EVENT_ID`,`FG_LANG`,`EVENT_MSG`,`EVENT_DESC`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('E3120001','en','eInternalError','',NULL,NULL,NULL,NULL),('E3120001','ko','eInternalError','','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120002','en','eSyntaxError','',NULL,NULL,NULL,NULL),('E3120002','ko','eSyntaxError','','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120003','en','eNotFound','',NULL,NULL,NULL,NULL),('E3120003','ko','eNotFound','','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120004','en','eInvalidRequestId','',NULL,NULL,NULL,NULL),('E3120004','ko','eInvalidRequestId','','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120005','en','eSendFail','',NULL,NULL,NULL,NULL),('E3120005','ko','eSendFail','Broker에서 전송 실패','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120006','en','eTimeout','',NULL,NULL,NULL,NULL),('E3120006','ko','eTimeout','타임아웃','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120007','en','eOverLoadControl','',NULL,NULL,NULL,NULL),('E3120007','ko','eOverLoadControl','과부하 제어','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120008','en','eInvalidOpcode','',NULL,NULL,NULL,NULL),('E3120008','ko','eInvalidOpcode','내가 처리할 메시지가 아니다','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120009','en','eUnknownOpcode','',NULL,NULL,NULL,NULL),('E3120009','ko','eUnknownOpcode','모르는 메시지다','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120010','en','eNotManagementEnc','',NULL,NULL,NULL,NULL),('E3120010','ko','eNotManagementEnc','Provisioning 되지 않은 VID','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120011','ko','eNotManagement','Provisioning 되지 않은 VID','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120012','ko','eManagementMode','관리모드 설정 중이다','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120013','ko','eNullKeyValue','key 부족','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120014','ko','eNotReady','key request를 할 준비가 안됨','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120015','ko','eInvalidKeyId','key response 의 keyid 가 0 이다','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120016','ko','eExceedMaxSizeOfVendorSpecificData','VendorSpecificData의 크기가 초과됨','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120017','ko','eKeyGenFail','key generate fail','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120018','ko','eExceedMaxKeySize','','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120019','ko','eIntegrityFailed','무결성 오류','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120020','ko','eKeySetFail','key set fail','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120021','ko','eAbnormalProvisionInfo','provisioning data abnormal','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120022','ko','eDownload','admin 에 있는 file download fail','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120023','ko','eFileWrite','admin 에서 받은 file kms 에 write fail','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120024','ko','eEtcError','','system','2019-04-05 21:00:37','system','2019-04-05 21:00:37'),('E3120025','ko','eNotFoundPath','라우팅 경로가 없다','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120026','ko','eExceedRetry','재시도 회수가 넘었다','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120027','ko','eAlreadyProcessing','동일한 메시지 요청이 왔다','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120028','ko','eRestInvalidMethod','restful invalid http method','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120029','ko','eRestInvalidKeySize','restful invalid request key size','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120030','ko','eRestInvalidMaxKeyPerRequest','restful invalid max key per request','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120031','ko','eRestUnSupportedParameter','unsupported extension_mandatory parameters','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120032','ko','eRestUnSupportedValues','unsupported extension_mandatory parameter values','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120033','ko','eRestUnSupportedOptionParameter','unsupported extension_optional','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15'),('E3120034','ko','eRestNotFoundPage','not found operation','system','2019-08-30 17:07:15','system','2019-08-30 17:07:15');

/*Table structure for table `tb_log_report_audit` */

DROP TABLE IF EXISTS `tb_log_report_audit`;

CREATE TABLE `tb_log_report_audit` (
  `DT_INSERT` datetime DEFAULT NULL,
  `CREATE_TIME` varchar(40) DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `OP_TYPE` varchar(5) DEFAULT NULL,
  `RESULT_CODE` int(11) DEFAULT NULL,
  `PATH` text DEFAULT NULL,
  `HMAC` varchar(100) DEFAULT NULL,
  KEY `SYS_NAME` (`SYS_NAME`),
  KEY `CREATE_TIME` (`CREATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_brk` */

DROP TABLE IF EXISTS `tb_log_report_brk`;

CREATE TABLE `tb_log_report_brk` (
  `DT_INSERT` datetime DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `CONN_STS` int(11) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SZ_SRC_NAME` varchar(20) DEFAULT NULL,
  `SZ_SRC_IP` varchar(40) DEFAULT NULL,
  `SZ_DST_NAME` varchar(20) DEFAULT NULL,
  `SZ_DST_IP` varchar(20) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_con_svc` */

DROP TABLE IF EXISTS `tb_log_report_con_svc`;

CREATE TABLE `tb_log_report_con_svc` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `IS_FAULT` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_enccall` */

DROP TABLE IF EXISTS `tb_log_report_enccall`;

CREATE TABLE `tb_log_report_enccall` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `C_VID` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL,
  `REGISTER_LASTTIME` varchar(40) DEFAULT NULL,
  `KEEPALIVE_LASTTIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_report_enccall` */

/*Table structure for table `tb_log_report_encryptor` */

DROP TABLE IF EXISTS `tb_log_report_encryptor`;

CREATE TABLE `tb_log_report_encryptor` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `C_VID` varchar(40) DEFAULT NULL,
  `DST_C_VID` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_key_fail` */

DROP TABLE IF EXISTS `tb_log_report_key_fail`;

CREATE TABLE `tb_log_report_key_fail` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `REASON` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_keyset` */

DROP TABLE IF EXISTS `tb_log_report_keyset`;

CREATE TABLE `tb_log_report_keyset` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_report_keyset` */

/*Table structure for table `tb_log_report_kkey_buffer` */

DROP TABLE IF EXISTS `tb_log_report_kkey_buffer`;

CREATE TABLE `tb_log_report_kkey_buffer` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `RATE` int(11) DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_overload` */

DROP TABLE IF EXISTS `tb_log_report_overload`;

CREATE TABLE `tb_log_report_overload` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL,
  `MESSAGE` varchar(260) DEFAULT NULL,
  `OVERLOAD_STS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_path` */

DROP TABLE IF EXISTS `tb_log_report_path`;

CREATE TABLE `tb_log_report_path` (
  `DT_INSERT` datetime DEFAULT NULL,
  `N_PRIORITY` int(11) DEFAULT NULL,
  `SZ_SRC_SYS_NAME` varchar(20) DEFAULT NULL,
  `SZ_DST_SYS_NAME` varchar(20) DEFAULT NULL,
  `SZ_PATH` varchar(600) DEFAULT NULL,
  `IS_USE` int(11) DEFAULT NULL,
  `IS_FAULT` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_process` */

DROP TABLE IF EXISTS `tb_log_report_process`;

CREATE TABLE `tb_log_report_process` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_report_process` */

/*Table structure for table `tb_log_report_process_queue` */

DROP TABLE IF EXISTS `tb_log_report_process_queue`;

CREATE TABLE `tb_log_report_process_queue` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `Q_KEY` int(11) DEFAULT NULL,
  `Q_COUNT` int(11) DEFAULT NULL,
  `Q_USAGE` int(11) DEFAULT NULL,
  `Q_SIZE` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL,
  `VERSION` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_report_process_queue` */

/*Table structure for table `tb_log_report_prov_svc` */

DROP TABLE IF EXISTS `tb_log_report_prov_svc`;

CREATE TABLE `tb_log_report_prov_svc` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `IS_FAULT` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_qkd` */

DROP TABLE IF EXISTS `tb_log_report_qkd`;

CREATE TABLE `tb_log_report_qkd` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `QKD_VID` varchar(40) DEFAULT NULL,
  `ENC_VID` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_report_qkey_buffer` */

DROP TABLE IF EXISTS `tb_log_report_qkey_buffer`;

CREATE TABLE `tb_log_report_qkey_buffer` (
  `DT_INSERT` datetime DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `KMS_VID` varchar(40) DEFAULT NULL,
  `TARGET_KMS_VID` varchar(40) DEFAULT NULL,
  `RATE` int(11) DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_warning` */

DROP TABLE IF EXISTS `tb_log_warning`;

CREATE TABLE `tb_log_warning` (
  `SEQ` varchar(100) NOT NULL,
  `KMS_ID` int(11) DEFAULT NULL,
  `ELMT_ID` int(11) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `OCCUR_TIME` varchar(40) DEFAULT NULL,
  `WARN_DTL` varchar(1000) DEFAULT NULL,
  `WARN_RELEASE` varchar(10) DEFAULT NULL,
  `RELEASE_TIME` varchar(40) DEFAULT NULL,
  `CONFIRM_YN` varchar(1) DEFAULT 'N',
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `WARN_ID` varchar(10) NOT NULL,
  `SRC_SYS_NAME` varchar(20) DEFAULT NULL,
  `SRC_INTERFACE` varchar(40) DEFAULT NULL,
  `DST_SYS_NAME` varchar(20) DEFAULT NULL,
  `DST_INTERFACE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SEQ`),
  KEY `WARN_ID` (`WARN_ID`),
  KEY `CONFIRM_YN` (`CONFIRM_YN`),
  KEY `ELMT_ID` (`ELMT_ID`),
  KEY `APP_NAME` (`APP_NAME`),
  KEY `SRC_SYS_NAME` (`SRC_SYS_NAME`),
  KEY `SRC_INTERFACE` (`SRC_INTERFACE`),
  KEY `DST_SYS_NAME` (`DST_SYS_NAME`),
  KEY `DST_INTERFACE` (`DST_INTERFACE`),
  CONSTRAINT `tb_log_warning_ibfk_1` FOREIGN KEY (`WARN_ID`) REFERENCES `tb_log_warning_config` (`WARN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_log_warning_config` */

DROP TABLE IF EXISTS `tb_log_warning_config`;

CREATE TABLE `tb_log_warning_config` (
  `WARN_ID` varchar(10) NOT NULL,
  `RATE_CD` varchar(20) DEFAULT NULL,
  `WARN_KIND` varchar(10) DEFAULT NULL,
  `WARN_OCCUR` varchar(10) DEFAULT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `WARN_DESC` varchar(200) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`WARN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_warning_config` */

insert  into `tb_log_warning_config`(`WARN_ID`,`RATE_CD`,`WARN_KIND`,`WARN_OCCUR`,`WARN_MSG`,`WARN_DESC`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('W0010101','CRI','K000','DISCONNECT','KEMS-KMS Disconnect','KMS의 접속정보(접속 IP,인증서 등)를 확인해주세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W1120101','CRI','112','DISCONNECT','Consumer Session Disconnect','C-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:40','system','2019-04-04 20:17:40'),('W1120201','MAJ','112','CONNECT','Consumer Session Connect','C-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:40','system','2019-04-04 20:17:40'),('W1120301','MIN','112','DOWN','Consumer Session Down','C-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W1130101','CRI','113','DISCONNECT','Provider Session Disconnect','P-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W1130201','MAJ','113','CONNECT','Provider Session Connect','P-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W1130301','MIN','113','DOWN','Provider Session Down','P-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3000101','CRI','300','STOP','Process Stop','프로세스를 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:40','system','2019-04-04 20:17:40'),('W3010101','CRI','301','1','Link Disconnect','Broker 프로세스를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:40','system','2019-04-04 20:17:40'),('W3030101','MIN','303','1','Overload Control','프로세스 관리 매뉴에서 rate 를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3040101','MAJ','304','1','KeySet Fail','Nokia C-Agent를 재기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3050101','MAJ','305','10','Path 장애','네트워크 인터페이스가 정상인지 상태를 점검하세요. 네트워크 인터페이스가 정상상태이면 CLI 명령으로 경로를 enable 시켜주세요(매뉴얼 참조)','system','2019-04-18 15:29:04','system','2019-04-18 15:29:04'),('W3050102','MIN','305','00','Path 미사용','네트워크 인터페이스가 정상인지 상태를 점검하세요. 네트워크 인터페이스가 정상상태이면 CLI 명령으로 경로를 enable 시켜주세요(매뉴얼 참조)','system','2019-04-18 15:29:04','system','2019-04-18 15:29:04'),('W3100101','MIN','310','2','Q-Key Buffer Minor','연결관리 -> provider 연결관리 매뉴에서 Q Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3100201','MAJ','310','3','Q-Key Buffer Major','연결관리 -> provider 연결관리 매뉴에서 Q Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3100301','CRI','310','4','Q-Key Buffer Critical','연결관리 -> provider 연결관리 매뉴에서 Q Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3110101','MIN','311','2','K-Key Buffer Minor','연결관리 -> consumer 연결관리 매뉴에서 Consumer Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:41','system','2019-04-04 20:17:41'),('W3110201','MAJ','311','3','K-Key Buffer Major','연결관리 -> consumer 연결관리 매뉴에서 Consumer Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3110301','CRI','311','4','K-Key Buffer Critical','연결관리 -> consumer 연결관리 매뉴에서 Consumer Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42');

/*Table structure for table `tb_log_warning_config_lang` */

DROP TABLE IF EXISTS `tb_log_warning_config_lang`;

CREATE TABLE `tb_log_warning_config_lang` (
  `WARN_ID` varchar(10) NOT NULL,
  `FG_LANG` varchar(5) NOT NULL,
  `WARN_MSG` varchar(100) DEFAULT NULL,
  `WARN_DESC` varchar(200) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`WARN_ID`,`FG_LANG`),
  CONSTRAINT `tb_log_warning_config_lang_ibfk_1` FOREIGN KEY (`WARN_ID`) REFERENCES `tb_log_warning_config` (`WARN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_warning_config_lang` */

insert  into `tb_log_warning_config_lang`(`WARN_ID`,`FG_LANG`,`WARN_MSG`,`WARN_DESC`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('W0010101','en','KEMS-KMS DisConnect','','system','2019-04-04 20:17:43','system','2019-04-04 20:17:43'),('W0010101','ko','KEMS-KMS DisConnect','KMS의 접속정보(접속 IP,인증서 등)를 확인해주세요.','system','2019-04-04 20:17:43','system','2019-04-04 20:17:43'),('W1120101','en','Consumer Session Disconnect','',NULL,NULL,NULL,NULL),('W1120101','ko','Consumer Session Disconnect','C-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W1120201','en','Consumer Session Connect','',NULL,NULL,NULL,NULL),('W1120201','ko','Consumer Session Connect','C-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W1120301','en','Consumer Session Down','',NULL,NULL,NULL,NULL),('W1120301','ko','Consumer Session Down','C-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W1130101','en','Provider Session Disconnect','',NULL,NULL,NULL,NULL),('W1130101','ko','Provider Session Disconnect','P-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W1130201','en','Provider Session Connect','',NULL,NULL,NULL,NULL),('W1130201','ko','Provider Session Connect','P-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W1130301','en','Provider Session Down','',NULL,NULL,NULL,NULL),('W1130301','ko','Provider Session Down','P-Agent를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3000101','en','Process Stop','',NULL,NULL,NULL,NULL),('W3000101','ko','Process Stop','프로세스를 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:18:35','system','2019-04-04 20:18:35'),('W3010101','en','Link Disconnect','',NULL,NULL,NULL,NULL),('W3010101','ko','Link Disconnect','Broker 프로세스를 재 기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3030101','en','Overload Control','',NULL,NULL,NULL,NULL),('W3030101','ko','Overload Control','프로세스 관리 매뉴에서 rate 를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3040101','en','KeySet Fail','',NULL,NULL,NULL,NULL),('W3040101','ko','KeySet Fail','Nokia C-Agent를 재기동하십시오. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3050101','en','Path disconnected','',NULL,NULL,NULL,NULL),('W3050101','ko','Path 장애','네트워크 인터페이스가 정상인지 상태를 점검하세요. 네트워크 인터페이스가 정상상태이면 CLI 명령으로 경로를 enable 시켜주세요(매뉴얼 참조)','system','2019-04-18 15:29:04','system','2019-04-18 15:29:04'),('W3050102','en','Path disabled','',NULL,NULL,NULL,NULL),('W3050102','ko','Path 미사용','네트워크 인터페이스가 정상인지 상태를 점검하세요. 네트워크 인터페이스가 정상상태이면 CLI 명령으로 경로를 enable 시켜주세요(매뉴얼 참조)','system','2019-04-18 15:29:04','system','2019-04-18 15:29:04'),('W3100101','en','Q-Key Buffer Minor','',NULL,NULL,NULL,NULL),('W3100101','ko','Q-Key Buffer Minor','연결관리 -> provider 연결관리 매뉴에서 Q Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3100201','en','Q-Key Buffer Major','',NULL,NULL,NULL,NULL),('W3100201','ko','Q-Key Buffer Major','연결관리 -> provider 연결관리 매뉴에서 Q Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:42','system','2019-04-04 20:17:42'),('W3100301','en','Q-Key Buffer Critical','',NULL,NULL,NULL,NULL),('W3100301','ko','Q-Key Buffer Critical','연결관리 -> provider 연결관리 매뉴에서 Q Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:43','system','2019-04-04 20:17:43'),('W3110101','en','K-Key Buffer Minor','',NULL,NULL,NULL,NULL),('W3110101','ko','K-Key Buffer Minor','연결관리 -> consumer 연결관리 매뉴에서 Consumer Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:43','system','2019-04-04 20:17:43'),('W3110201','en','K-Key Buffer Major','',NULL,NULL,NULL,NULL),('W3110201','ko','K-Key Buffer Major','연결관리 -> consumer 연결관리 매뉴에서 Consumer Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:43','system','2019-04-04 20:17:43'),('W3110301','en','K-Key Buffer Critical','',NULL,NULL,NULL,NULL),('W3110301','ko','K-Key Buffer Critical','연결관리 -> consumer 연결관리 매뉴에서 Consumer Key Store 정보를 조정하세요. 장애가 반복되면 관리자에서 통보하세요.','system','2019-04-04 20:17:43','system','2019-04-04 20:17:43');

/*Table structure for table `tb_log_warning_config_release` */

DROP TABLE IF EXISTS `tb_log_warning_config_release`;

CREATE TABLE `tb_log_warning_config_release` (
  `WARN_ID` varchar(10) NOT NULL,
  `WARN_RELEASE` varchar(10) NOT NULL,
  `AUTO_CONFIRM_YN` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`WARN_ID`,`WARN_RELEASE`),
  CONSTRAINT `tb_log_warning_config_release_ibfk_1` FOREIGN KEY (`WARN_ID`) REFERENCES `tb_log_warning_config` (`WARN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_log_warning_config_release` */

insert  into `tb_log_warning_config_release`(`WARN_ID`,`WARN_RELEASE`,`AUTO_CONFIRM_YN`) values ('W0010101','CONNECT','N'),('W1120101','CONNECT','Y'),('W1120101','DOWN','Y'),('W1120101','UP','N'),('W1120201','DISCONNECT','Y'),('W1120201','DOWN','Y'),('W1120201','UP','N'),('W1120301','CONNECT','Y'),('W1120301','DISCONNECT','Y'),('W1120301','UP','N'),('W1130101','CONNECT','Y'),('W1130101','DOWN','Y'),('W1130101','UP','N'),('W1130201','DISCONNECT','Y'),('W1130201','DOWN','Y'),('W1130201','UP','N'),('W1130301','CONNECT','Y'),('W1130301','DISCONNECT','Y'),('W1130301','UP','N'),('W3000101','RUN','N'),('W3010101','0','N'),('W3010101','2','N'),('W3030101','0','N'),('W3040101','0','N'),('W3050101','00','N'),('W3050101','01','N'),('W3050102','01','N'),('W3050102','10','N'),('W3100101','1','N'),('W3100101','3','Y'),('W3100101','4','Y'),('W3100201','1','N'),('W3100201','2','Y'),('W3100201','4','Y'),('W3100301','1','N'),('W3100301','2','Y'),('W3100301','3','Y'),('W3110101','1','N'),('W3110101','3','Y'),('W3110101','4','Y'),('W3110201','1','N'),('W3110201','2','Y'),('W3110201','4','Y'),('W3110301','1','N'),('W3110301','2','Y'),('W3110301','3','Y');

/*Table structure for table `tb_path` */

DROP TABLE IF EXISTS `tb_path`;

CREATE TABLE `tb_path` (
  `PATH_ID` int(11) NOT NULL,
  `SRC_KMS_ID` int(11) DEFAULT NULL,
  `DST_KMS_ID` int(11) DEFAULT NULL,
  `PATH_DESC_0` text DEFAULT NULL COMMENT '소스부터 목적지까지 ,로 구분된 path',
  `PATH_DESC_1` text DEFAULT NULL COMMENT '소스부터 목적지까지 ,로 구분된 path',
  `MEMO` text DEFAULT NULL,
  `DEPLOY_DT` datetime DEFAULT NULL,
  `DEPLOY_KEY` varchar(50) DEFAULT NULL COMMENT '배포키',
  `DEPLOY_DT_DST` datetime DEFAULT NULL,
  `DEPLOY_KEY_DST` varchar(50) DEFAULT NULL,
  `PATH_USE_0` varchar(20) DEFAULT NULL,
  `PATH_USE_1` varchar(20) DEFAULT NULL,
  `PATH_STATUS_0` varchar(20) DEFAULT NULL,
  `PATH_STATUS_1` varchar(20) DEFAULT NULL,
  `STATUS_UPDATE_TIME_0` datetime DEFAULT NULL,
  `STATUS_UPDATE_TIME_1` datetime DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`PATH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_path_dtl` */

DROP TABLE IF EXISTS `tb_path_dtl`;

CREATE TABLE `tb_path_dtl` (
  `PATH_ID` int(11) NOT NULL,
  `PRIORIY` varchar(5) NOT NULL,
  `SEQ` int(11) NOT NULL,
  `KMS_LINK_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PATH_ID`,`PRIORIY`,`SEQ`),
  KEY `KMS_LINK_ID` (`KMS_LINK_ID`),
  CONSTRAINT `tb_path_dtl_ibfk_2` FOREIGN KEY (`PATH_ID`) REFERENCES `tb_path` (`PATH_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_path_hist` */

DROP TABLE IF EXISTS `tb_path_hist`;

CREATE TABLE `tb_path_hist` (
  `SRC_KMS_ID` int(11) DEFAULT NULL,
  `SRC_C_VID` varchar(50) DEFAULT NULL,
  `DST_KMS_ID` int(11) DEFAULT NULL,
  `DST_C_VID` varchar(50) DEFAULT NULL,
  `PRIORIY` varchar(5) DEFAULT NULL,
  `PATH_DESC` text DEFAULT NULL COMMENT '소스부터 목적지까지 ,로 구분된 path',
  `MEMO` text DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_process` */

DROP TABLE IF EXISTS `tb_process`;

CREATE TABLE `tb_process` (
  `ELMT_ID` int(11) NOT NULL,
  `PROC_NAME` varchar(20) NOT NULL,
  `VERSION` varchar(20) DEFAULT NULL,
  `STATUS_CD` varchar(20) DEFAULT NULL COMMENT 'RUN, STOP',
  `RATE` int(11) DEFAULT NULL,
  `REPLY_TIMEOUT` int(11) DEFAULT NULL,
  `KEEPALIVE` int(11) DEFAULT NULL,
  `STATUS_UPDATE_TIME` datetime DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ELMT_ID`,`PROC_NAME`),
  CONSTRAINT `tb_process_ibfk_1` FOREIGN KEY (`ELMT_ID`) REFERENCES `tb_element` (`ELMT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_process_list` */

DROP TABLE IF EXISTS `tb_process_list`;

CREATE TABLE `tb_process_list` (
  `PROC_TYPE` varchar(20) NOT NULL,
  `PROCESS_CD` varchar(20) NOT NULL,
  `PROC_NM` varchar(50) NOT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`PROC_TYPE`,`PROCESS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_process_list` */

insert  into `tb_process_list`(`PROC_TYPE`,`PROCESS_CD`,`PROC_NM`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('Admin','ADMRD','ADMRD','system',NULL,'U0001','2019-04-30 11:42:52'),('Admin','CLID','CLID','system',NULL,NULL,NULL),('Admin','CRTD','CRTD','U0001','2019-09-23 14:53:05','U0001','2019-09-23 14:53:05'),('Admin','DBMD','DBMD','system',NULL,NULL,NULL),('Admin','LOGD','LOGD','system',NULL,NULL,NULL),('Admin','SWD','SWD','system',NULL,'U0001','2019-04-30 11:42:57'),('common','ABRK','ABRK','system',NULL,NULL,NULL),('common','EBRK','EBRK','system',NULL,NULL,NULL),('common','IBRK','IBRK','system',NULL,'U0001','2019-09-24 09:44:55'),('common','SYMD','SYMD','system',NULL,NULL,NULL),('consumer','CAGTI','CAGTI','system',NULL,'U0001','2019-04-30 14:38:14'),('consumer','CAGTN','CAGTN','U0001','2019-05-10 08:55:38','U0001','2019-05-10 08:55:38'),('consumer','CAGTR','CAGTR','U0001','2019-04-30 14:38:51','U0001','2019-04-30 14:38:51'),('consumer','CAGTS','CAGTS','system',NULL,NULL,NULL),('core_common','KGND','KGND','system',NULL,NULL,NULL),('core_common','KMSD','KMSD','system',NULL,NULL,NULL),('core_k_key','ECDHD','ECDHD','system',NULL,NULL,NULL),('core_q_key','SMMD','SMMD','system',NULL,NULL,NULL),('provider','PAGTI','PAGTI','U0001','2019-09-02 12:27:58','U0001','2019-09-02 12:27:58'),('provider','PAGTK','PAGTK','U0001','2019-09-24 09:51:30','U0001','2019-09-24 09:51:30'),('provider','PAGTS','PAGTS','system',NULL,NULL,NULL),('provider','PAGTS10','PAGTS10','U0001','2019-04-30 11:43:49','U0001','2019-04-30 11:43:49'),('provider','PAGTS2','PAGTS2','U0001','2019-05-31 12:43:24','U0001','2019-05-31 12:43:24'),('provider','PAGTS3','PAGTS3',NULL,NULL,NULL,NULL),('provider','PAGTS4','PAGTS4',NULL,NULL,NULL,NULL),('provider','PAGTS5','PAGTS5',NULL,NULL,NULL,NULL),('provider','PAGTS6','PAGTS6',NULL,NULL,NULL,NULL),('provider','PAGTS7','PAGTS7',NULL,NULL,NULL,NULL),('provider','PAGTS8','PAGTS8',NULL,NULL,NULL,NULL),('provider','PAGTS9','PAGTS9',NULL,NULL,NULL,NULL);

/*Table structure for table `tb_q_key_store` */

DROP TABLE IF EXISTS `tb_q_key_store`;

CREATE TABLE `tb_q_key_store` (
  `SRC_KMS_ID` int(11) NOT NULL,
  `DST_KMS_ID` int(11) NOT NULL,
  `DEFAULT_KEY_SIZE` int(11) DEFAULT NULL,
  `MAX_KEY_CNT` int(11) DEFAULT NULL,
  `MAX_KEY_CNT_PER_REQ` int(11) DEFAULT NULL,
  `MAX_KEY_SIZE` int(11) DEFAULT NULL,
  `MIN_KEY_SIZE` int(11) DEFAULT NULL,
  `KEY_REQ_INTERVAL` int(11) DEFAULT NULL,
  `MIN_STORE_RATE` int(11) DEFAULT NULL,
  `MAJ_STORE_RATE` int(11) DEFAULT NULL,
  `CRT_STORE_RATE` int(11) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SRC_KMS_ID`,`DST_KMS_ID`),
  KEY `DST_KMS_ID` (`DST_KMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_statistics_log` */

DROP TABLE IF EXISTS `tb_statistics_log`;

CREATE TABLE `tb_statistics_log` (
  `DT_INSERT` datetime DEFAULT NULL,
  `UPDATE_TIME` varchar(40) DEFAULT NULL,
  `SYS_NAME` varchar(20) DEFAULT NULL,
  `APP_NAME` varchar(10) DEFAULT NULL,
  `SRC_VID` varchar(40) DEFAULT NULL,
  `TARGET_VID` varchar(40) DEFAULT NULL,
  `KEY_REQ_TRY_CNT` int(11) DEFAULT NULL,
  `KEY_REQ_SUCC_CNT` int(11) DEFAULT NULL,
  `KEY_SYNC_TRY_CNT` int(11) DEFAULT NULL,
  `KEY_SYNC_SUCC_CNT` int(11) DEFAULT NULL,
  `OVERLOAD_REJECT` int(11) DEFAULT NULL,
  `KEY_REQ_TIMEOUT` int(11) DEFAULT NULL,
  `KEY_SYNC_TIMEOUT` int(11) DEFAULT NULL,
  `AUTH_FAIL` int(11) DEFAULT NULL,
  `ETC_FAIL` int(11) DEFAULT NULL,
  KEY `SYS_NAME` (`SYS_NAME`),
  KEY `UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_swdeploy` */

DROP TABLE IF EXISTS `tb_swdeploy`;

CREATE TABLE `tb_swdeploy` (
  `DEPLOY_ID` int(11) NOT NULL,
  `DEPLOY_TITLE` varchar(100) DEFAULT NULL,
  `DEPLOY_DESC` text DEFAULT NULL,
  `DEPLOY_START_DT` datetime DEFAULT NULL,
  `DEPLOY_UNIT` varchar(10) DEFAULT NULL,
  `DEPLOY_INTERVAL` varchar(10) DEFAULT NULL,
  `DEPLOY_STATUS_CD` varchar(20) DEFAULT NULL,
  `FILE_VERSION` varchar(32) DEFAULT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `FILE_PATH` varchar(200) DEFAULT NULL,
  `PROC_TYPE` varchar(20) DEFAULT NULL,
  `PROCESS_CD` varchar(20) DEFAULT NULL,
  `DOWNLOAD_URL` varchar(200) DEFAULT NULL,
  `DT_INSERT` datetime DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DEPLOY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_swdeploy_dtl` */

DROP TABLE IF EXISTS `tb_swdeploy_dtl`;

CREATE TABLE `tb_swdeploy_dtl` (
  `DEPLOY_ID` int(11) NOT NULL,
  `ELMT_ID` int(11) NOT NULL,
  `PROC_NM` varchar(50) NOT NULL,
  `DEPLOY_STATUS_CD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DEPLOY_ID`,`ELMT_ID`,`PROC_NM`),
  CONSTRAINT `tb_swdeploy_dtl_ibfk_1` FOREIGN KEY (`DEPLOY_ID`) REFERENCES `tb_swdeploy` (`DEPLOY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tm_cd` */

DROP TABLE IF EXISTS `tm_cd`;

CREATE TABLE `tm_cd` (
  `CD_GRP` varchar(20) NOT NULL COMMENT 'CD_GRP',
  `NO_CD` varchar(20) NOT NULL COMMENT 'NO_CD',
  `FG_LANG` varchar(2) NOT NULL COMMENT 'FG_LANG',
  `NM_CD` varchar(80) NOT NULL COMMENT 'NM_CD',
  `DESC_CD` varchar(100) DEFAULT NULL COMMENT 'DESC_CD',
  `NO_ORDER` int(11) DEFAULT NULL COMMENT 'NO_ORDER',
  `YN_USE` char(1) NOT NULL DEFAULT 'Y' COMMENT 'YN_USE',
  `ID_INSERT` varchar(10) DEFAULT NULL COMMENT 'ID_INSERT',
  `DT_INSERT` date DEFAULT NULL COMMENT 'DT_INSERT',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT 'ID_UPDATE',
  `DT_UPDATE` date DEFAULT NULL COMMENT 'DT_UPDATE',
  PRIMARY KEY (`CD_GRP`,`NO_CD`,`FG_LANG`),
  KEY `tm_cd_ibfk_1` (`CD_GRP`,`FG_LANG`),
  CONSTRAINT `tm_cd_ibfk_1` FOREIGN KEY (`CD_GRP`, `FG_LANG`) REFERENCES `tm_cdgrp` (`CD_GRP`, `FG_LANG`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드';

/*Data for the table `tm_cd` */

insert  into `tm_cd`(`CD_GRP`,`NO_CD`,`FG_LANG`,`NM_CD`,`DESC_CD`,`NO_ORDER`,`YN_USE`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('ALGORITHM','0','en','NONE','NONE',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ALGORITHM','0','ko','NONE','NONE',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ALGORITHM','1','en','OTP','OTP',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ALGORITHM','1','ko','OTP','OTP',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ALGORITHM','2','en','ARIA256','ARIA256',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ALGORITHM','2','ko','ARIA256','ARIA256',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('APP_STATE','01','en','사용중','사용중',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('APP_STATE','01','ko','사용중','사용중',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('APP_STATE','02','en','종료','종료',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('APP_STATE','02','ko','종료','종료',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('AUTH_PROTOCOL','MD5','en','MD5','MD5',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('AUTH_PROTOCOL','MD5','ko','MD5','MD5',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('AUTH_PROTOCOL','SHA','en','SHA','SHA',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('AUTH_PROTOCOL','SHA','ko','SHA','SHA',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('A_TEST','1','ko','1','1',1,'Y','U0001','2019-09-20','U0001','2019-09-20'),('COPYRIGHT','11','en','채널A','채널A',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('COPYRIGHT','11','ko','채널A','채널A',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('COUNTRY','JP','en','Japan','Japan',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('COUNTRY','JP','ko','일본','일본',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('COUNTRY','KR','en','Korea','Korea',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('COUNTRY','KR','ko','한국','한국',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('COUNTRY','US','en','United State','United State',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('COUNTRY','US','ko','미국','미국',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('DEFAULT_YN','N','en','N','N',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('DEFAULT_YN','N','ko','N','N',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('DEFAULT_YN','Y','en','Y','Y',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('DEFAULT_YN','Y','ko','Y','Y',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('DEPLOY_STATUS','COMPLETE','en','Completed','Completed',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('DEPLOY_STATUS','COMPLETE','ko','완료','완료',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('DEPLOY_STATUS','DEPLOYING','en','Under distribution','Under distribution',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('DEPLOY_STATUS','DEPLOYING','ko','배포중','배포중',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('DEPLOY_STATUS','WAITING','en','Waiting','Waiting',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('DEPLOY_STATUS','WAITING','ko','대기','대기',0,'Y','U0001','2019-04-23','U0001','2019-08-19'),('D_ALARM_TYPE','A','en','Warning','Warning',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('D_ALARM_TYPE','A','ko','경고','경고',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('D_ALARM_TYPE','E','en','Event','Event',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('D_ALARM_TYPE','E','ko','이벤트','이벤트',0,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ELEMENT_TYPE','0','en','Consumer','Consumer',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ELEMENT_TYPE','0','ko','Consumer','Consumer',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ELEMENT_TYPE','1','en','Provider','Provider',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ELEMENT_TYPE','1','ko','Provider','Provider',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ELEMENT_TYPE','2','en','KMS','KMS',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ELEMENT_TYPE','2','ko','KMS','KMS',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IP_TYPE','0','en','Key(internal)','Key(internal)',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IP_TYPE','0','ko','Key(internal)','Key(internal)',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IP_TYPE','1','en','KMS(external, admin)','KMS(external, admin)',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IP_TYPE','1','ko','KMS(external, admin)','KMS(external, admin)',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IP_TYPE','2','en','MGMT(center admin)','MGMT(center admin)',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IP_TYPE','2','ko','MGMT(center admin)','MGMT(center admin)',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IP_TYPE','3','en','Any(all)','Any(all)',4,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IP_TYPE','3','ko','Any(all)','Any(all)',4,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IS_FAULT','0','en','Normal','Normal',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IS_FAULT','0','ko','정상','정상',0,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IS_FAULT','1','en','Disorder','Disorder',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IS_FAULT','1','ko','장애','장애',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IS_USE','0','en','Not used','Not used',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IS_USE','0','ko','미사용','미사용',0,'Y','U0001','2019-04-23','U0001','2019-08-19'),('IS_USE','1','en','Used','Used',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('IS_USE','1','ko','사용','사용',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ITEM_MENU_TYPE','03','en','일반메뉴','일반메뉴',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ITEM_MENU_TYPE','03','ko','일반메뉴','일반메뉴',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('ITEM_MENU_TYPE','04','en','카테고리','카테고리',4,'Y','U0001','2019-05-27','U0001','2019-08-19'),('ITEM_MENU_TYPE','04','ko','카테고리','카테고리',4,'Y','U0001','2019-04-23','U0001','2019-08-19'),('KEY_TYPE','0','en','Q-Key','Q-Key',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('KEY_TYPE','0','ko','Q-Key','Q-Key',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('KEY_TYPE','1','en','ECDH-Key','ECDH-Key',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('KEY_TYPE','1','ko','ECDH-Key','ECDH-Key',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('KMS_STATUS','00','en','unconnected','unconnected',1,'Y','U0001','2019-08-22','U0001','2019-08-22'),('KMS_STATUS','00','ko','미접속','미접속',1,'Y','U0001','2019-08-22','U0001','2019-08-22'),('KMS_STATUS','01','en','Connection attempt','Connection attempt',2,'Y','U0001','2019-08-22','U0001','2019-08-22'),('KMS_STATUS','01','ko','접속시도','접속시도',2,'Y','U0001','2019-08-22','U0001','2019-08-22'),('KMS_STATUS','02','en','Connected','Connected',3,'Y','U0001','2019-08-22','U0001','2019-08-22'),('KMS_STATUS','02','ko','접속','접속',3,'Y','U0001','2019-08-22','U0001','2019-08-22'),('KMS_USE_YN','N','en','disabled','disabled',2,'Y','U0001','2019-08-19','U0001','2019-08-19'),('KMS_USE_YN','N','ko','미사용','미사용',2,'Y','U0001','2019-08-19','U0001','2019-08-19'),('KMS_USE_YN','Y','en','enabled','enabled',1,'Y','U0001','2019-08-19','U0001','2019-08-19'),('KMS_USE_YN','Y','ko','사용','사용',1,'Y','U0001','2019-08-19','U0001','2019-08-19'),('LANGUAGE','en','en','English','English',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LANGUAGE','en','ko','영어','영어',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LANGUAGE','ko','en','Korean','Korean',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LANGUAGE','ko','ko','한국어','한국어',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_STATUS','0','en','CONNECTED','CONNECTED',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_STATUS','0','ko','CONNECTED','CONNECTED',0,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_STATUS','1','en','DISCONNECTED','DISCONNECTED',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_STATUS','1','ko','DISCONNECTED','DISCONNECTED',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_STATUS','2','en','NOT_EQUIP','NOT_EQUIP',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_STATUS','2','ko','NOT_EQUIP','NOT_EQUIP',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_TYPE','0','en','Inside Consumer','Inside Consumer',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE','0','ko','Consumer 내부','Consumer 내부',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_TYPE','1','en','EXTERNAL','EXTERNAL',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE','1','ko','EXTERNAL','EXTERNAL',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_TYPE','2','en','ADMIN','ADMIN',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE','2','ko','ADMIN','ADMIN',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_TYPE','3','en','Inside KMS','Inside KMS',4,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE','3','ko','KMS 내부','KMS 내부',4,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LINK_TYPE_P','0','en','Inside Provider','Inside Provider',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE_P','0','ko','Provider 내부','Provider 내부',0,'Y','U0001','2019-05-14','U0001','2019-08-19'),('LINK_TYPE_P','1','en','EXTERNAL','EXTERNAL',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE_P','1','ko','EXTERNAL','EXTERNAL',1,'Y','U0001','2019-05-14','U0001','2019-08-19'),('LINK_TYPE_P','2','en','ADMIN','ADMIN',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE_P','2','ko','ADMIN','ADMIN',2,'Y','U0001','2019-05-14','U0001','2019-08-19'),('LINK_TYPE_P','3','en','Inside KMS','Inside KMS',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LINK_TYPE_P','3','ko','KMS 내부','KMS 내부',3,'Y','U0001','2019-05-14','U0001','2019-08-19'),('LOC_TYPE','01','en','TEMP 스토리지','TEMP 스토리지',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LOC_TYPE','01','ko','TEMP 스토리지','TEMP 스토리지',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LOC_TYPE','02','en','CDN','CDN',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LOC_TYPE','02','ko','CDN','CDN',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LOC_TYPE','03','en','백업 스토리지','백업 스토리지',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LOC_TYPE','03','ko','백업 스토리지','백업 스토리지',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LOG_ACTION_TYPE','1','en','Search','Search',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LOG_ACTION_TYPE','1','ko','조회','조회',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('LOG_ACTION_TYPE','2','en','New/Modify','New/Modify',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('LOG_ACTION_TYPE','2','ko','신규/수정','신규/수정',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('MESSAGE_TYPE','BTN','en','Button','Button',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('MESSAGE_TYPE','BTN','ko','버튼','버튼',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('MESSAGE_TYPE','COL','en','Column','Column',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('MESSAGE_TYPE','COL','ko','컬럼','컬럼',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('MESSAGE_TYPE','MSG','en','Message','Message',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('MESSAGE_TYPE','MSG','ko','메세지','메세지',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('NEW_YN','N','en','N','N',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('NEW_YN','N','ko','N','N',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('NEW_YN','Y','en','Y','Y',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('NEW_YN','Y','ko','Y','Y',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('OPER_MODE','0','en','Master','Master',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('OPER_MODE','0','ko','Master','Master',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('OPER_MODE','1','en','Slave','Slave',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('OPER_MODE','1','ko','Slave','Slave',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('OP_TYPE','1','en','KEY_REQUEST','KEY_REQUEST',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('OP_TYPE','1','ko','KEY_REQUEST','KEY_REQUEST',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('OP_TYPE','2','en','KEY_SYNC','KEY_SYNC',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('OP_TYPE','2','ko','KEY_SYNC','KEY_SYNC',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('OP_TYPE','3','en','PROC_START','PROC_START',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('OP_TYPE','3','ko','PROC_START','PROC_START',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('OP_TYPE','4','en','PROC_STOP','PROC_STOP',4,'Y','U0001','2019-05-27','U0001','2019-08-19'),('OP_TYPE','4','ko','PROC_STOP','PROC_STOP',4,'Y','U0001','2019-04-23','U0001','2019-08-19'),('PRIVATE_PROTOCOL','AES128','en','AES128','AES128',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('PRIVATE_PROTOCOL','AES128','ko','AES128','AES128',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('PRIVATE_PROTOCOL','AES256','en','AES256','AES256',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('PRIVATE_PROTOCOL','AES256','ko','AES256','AES256',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('PROVIDER_VENDOR','0','en','Clavis300','Clavis300',0,'Y','U0001','2019-07-03','U0001','2019-08-19'),('PROVIDER_VENDOR','1','en','Cerberis3','Cerberis3',1,'Y','U0001','2019-07-03','U0001','2019-08-19'),('PROVIDER_VENDOR','1','ko','Clavis300','Clavis300',1,'Y','U0001','2019-07-03','U0001','2019-08-19'),('PROVIDER_VENDOR','2','ko','Cerberis3','Cerberis3',2,'Y','U0001','2019-07-03','U0001','2019-08-19'),('USER_MEMBER_TYPE','01','en','일반','일반',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('USER_MEMBER_TYPE','01','ko','일반','일반',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('USER_TYPE','01','en','Administrator','Administrator',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('USER_TYPE','01','ko','운영자','운영자',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('USER_TYPE','02','en','Customer','Customer',2,'N','U0001','2019-05-27','U0001','2019-08-19'),('USER_TYPE','02','ko','고객','고객',2,'N','U0001','2019-04-23','U0001','2019-08-19'),('VENDOR','1','en','SKT','SKT',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('VENDOR','1','ko','IDQ','IDQ',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('VENDOR','2','en','NOKIA','NOKIA',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('VENDOR','2','ko','NOKIA','NOKIA',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('VENDOR','3','en','RESTFUL','RESTFUL',3,'Y','U0001','2019-05-27','U0001','2019-08-19'),('VENDOR','3','ko','RESTFUL','RESTFUL',3,'Y','U0001','2019-04-23','U0001','2019-08-19'),('VENDOR','4','en','CIENA','CIENA',4,'N','U0001','2019-05-27','U0001','2019-08-19'),('VENDOR','4','ko','CIENA','CIENA',4,'N','U0001','2019-04-23','U0001','2019-08-19'),('VENDOR_C','1','en','KEYSP','KEYSP',1,'Y','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','1','ko','KEYSP','KEYSP',1,'Y','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','2','en','SNMP','SNMP',2,'Y','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','2','ko','SNMP','SNMP',2,'Y','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','3','en','RESTFUL','RESTFUL',3,'Y','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','3','ko','RESTFUL','RESTFUL',3,'Y','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','4','en','CIENA_C','CIENA_C',4,'N','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_C','4','ko','CIENA_C','CIENA_C',4,'N','U0001','2019-07-26','U0001','2019-08-19'),('VENDOR_P','1','en','Clavis300','Clavis300',1,'Y','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','1','ko','Clavis300','Clavis300',1,'Y','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','2','en','Cerberis3','Cerberis3',2,'Y','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','2','ko','Cerberis3','Cerberis3',2,'Y','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','3','en','RESTFUL_P','RESTFUL_P',3,'N','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','3','ko','RESTFUL_P','RESTFUL_P',3,'N','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','4','en','CIENA_P','CIENA_P',4,'N','system','2019-07-26','U0001','2019-08-19'),('VENDOR_P','4','ko','CIENA_P','CIENA_P',4,'N','system','2019-07-26','U0001','2019-08-19'),('WARN_RATE','CRI','en','Critical','Critical',0,'Y','U0001','2019-05-27','U0001','2019-08-19'),('WARN_RATE','CRI','ko','Critical','Critical',0,'Y','U0001','2019-04-23','U0001','2019-08-19'),('WARN_RATE','MAJ','en','Major','Major',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('WARN_RATE','MAJ','ko','Major','Major',1,'Y','U0001','2019-04-23','U0001','2019-08-19'),('WARN_RATE','MIN','en','Minor','Minor',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('WARN_RATE','MIN','ko','Minor','Minor',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('YN_USE','N','en','N','N',2,'Y','U0001','2019-05-27','U0001','2019-08-19'),('YN_USE','N','ko','N','N',2,'Y','U0001','2019-04-23','U0001','2019-08-19'),('YN_USE','Y','en','Y','Y',1,'Y','U0001','2019-05-27','U0001','2019-08-19'),('YN_USE','Y','ko','Y','Y',1,'Y','U0001','2019-04-23','U0001','2019-08-19');

/*Table structure for table `tm_cdgrp` */

DROP TABLE IF EXISTS `tm_cdgrp`;

CREATE TABLE `tm_cdgrp` (
  `CD_GRP` varchar(20) NOT NULL COMMENT 'CD_GRP',
  `FG_LANG` varchar(2) NOT NULL COMMENT 'FG_LANG',
  `NM_GRP` varchar(80) NOT NULL COMMENT 'NM_GRP',
  `DESC_GRP` varchar(100) DEFAULT NULL COMMENT 'DESC_GRP',
  `YN_USE` char(1) NOT NULL DEFAULT 'Y' COMMENT 'YN_USE',
  `ID_INSERT` varchar(10) NOT NULL COMMENT 'ID_INSERT',
  `DT_INSERT` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'DT_INSERT',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT 'ID_UPDATE',
  `DT_UPDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'DT_UPDATE',
  PRIMARY KEY (`CD_GRP`,`FG_LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='코드그룹';

/*Data for the table `tm_cdgrp` */

insert  into `tm_cdgrp`(`CD_GRP`,`FG_LANG`,`NM_GRP`,`DESC_GRP`,`YN_USE`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('ALGORITHM','en','Algorithm','Algorithm','Y','U0001','2019-05-27 18:26:46','U0001','2019-08-19 16:43:47'),('ALGORITHM','ko','Algorithm','Algorithm','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:47'),('APP_STATE','en','Application Status','Application Status','Y','U0001','2019-05-27 18:26:46','U0001','2019-08-19 16:43:47'),('APP_STATE','ko','앱상태','앱상태','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:47'),('AUTH_PROTOCOL','en','Auth Protocol','Auth Protocol','Y','U0001','2019-05-27 18:26:46','U0001','2019-08-19 16:43:47'),('AUTH_PROTOCOL','ko','Auth Protocol','Auth Protocol','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:47'),('A_TEST','en','test','test','Y','U0001','2019-05-28 11:37:14','U0001','2019-08-19 16:43:47'),('A_TEST','ko','test 2222','test 2222','Y','U0001','2019-05-28 11:23:43','U0001','2019-08-19 16:43:48'),('COPYRIGHT','en','Copyright','Copyright','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:48'),('COPYRIGHT','ko','출처','출처','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:48'),('COUNTRY','en','Country','Country','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:48'),('COUNTRY','ko','국가','국가','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:49'),('DEFAULT_YN','en','Default or not','Default or not','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:49'),('DEFAULT_YN','ko','기본선택여부','기본선택여부','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:49'),('DEPLOY_STATUS','en','Deployment status','Deployment status','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:49'),('DEPLOY_STATUS','ko','배포상태','배포상태','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:49'),('D_ALARM_TYPE','en','Alarm type','Alarm type','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:49'),('D_ALARM_TYPE','ko','알람타임','알람타임','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:49'),('ELEMENT_TYPE','en','Element type','Element type','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:49'),('ELEMENT_TYPE','ko','element type','element type','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:49'),('IP_TYPE','en','Interface type','Interface type','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:49'),('IP_TYPE','ko','Ip type','Ip type','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:50'),('IS_FAULT','en','Fault status','Fault status','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:50'),('IS_FAULT','ko','장애여부','장애여부','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:50'),('IS_USE','en','Usage status','Usage status','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:50'),('IS_USE','ko','사용 여부','사용 여부','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:50'),('ITEM_MENU_TYPE','en','Menu type','Menu type','Y','U0001','2019-05-27 18:26:47','U0001','2019-08-19 16:43:50'),('ITEM_MENU_TYPE','ko','메뉴타입','메뉴타입','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:50'),('KEY_TYPE','en','Key Type','Key Type','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:50'),('KEY_TYPE','ko','Key Type','Key Type','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:51'),('KMS_STATUS','en','KMS STATUS','KMS STATUS','Y','U0001','2019-08-22 13:37:30','U0001','2019-08-22 13:37:30'),('KMS_STATUS','ko','KMS STATUS','KMS STATUS','Y','U0001','2019-08-22 13:30:01','U0001','2019-08-22 13:30:01'),('KMS_USE_YN','en','KMS USE FLAG','KMS USE FLAG','Y','U0001','2019-08-19 11:34:53','U0001','2019-08-19 16:43:51'),('KMS_USE_YN','ko','KMS 사용여부','KMS 사용여부','Y','U0001','2019-08-19 11:34:53','U0001','2019-08-19 16:43:51'),('LANGUAGE','en','Language','Language','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:51'),('LANGUAGE','ko','언어','언어','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:51'),('LINK_STATUS','en','Link status','Link status','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:51'),('LINK_STATUS','ko','링크상태','링크상태','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:51'),('LINK_TYPE','en','Consumer Agent Location','Consumer Agent Location','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:51'),('LINK_TYPE','ko','Consumer Agent 위치','Consumer Agent 위치','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:51'),('LINK_TYPE_P','en','Provider Agent Location','Provider Agent Location','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:52'),('LINK_TYPE_P','ko','Provider Agent 위치','Provider Agent 위치','Y','U0001','2019-05-14 15:33:36','U0001','2019-08-19 16:43:52'),('LOC_TYPE','en','방송영상파일위치','방송영상파일위치','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:52'),('LOC_TYPE','ko','방송영상파일위치','방송영상파일위치','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:52'),('LOG_ACTION_TYPE','en','로그액션타입','로그액션타입','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:52'),('LOG_ACTION_TYPE','ko','로그액션타입','로그액션타입','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:52'),('MESSAGE_TYPE','en','메세지 타입','메세지 타입','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:52'),('MESSAGE_TYPE','ko','메세지 타입','메세지 타입','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:52'),('NEW_YN','en','신상품 여부','신상품 여부','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:52'),('NEW_YN','ko','신상품 여부','신상품 여부','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:52'),('OPER_MODE','en','Oper Mode','Oper Mode','Y','U0001','2019-05-27 18:26:48','U0001','2019-08-19 16:43:52'),('OPER_MODE','ko','Oper Mode','Oper Mode','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:53'),('OP_TYPE','en','Audit log type','Audit log type','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:53'),('OP_TYPE','ko','감사로그 유형','감사로그 유형','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:53'),('PRIVATE_PROTOCOL','en','Private protocol','Private protocol','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:53'),('PRIVATE_PROTOCOL','ko','Private protocol','Private protocol','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:53'),('PROVIDER_VENDOR','en','Provider Vendor Code','Provider Vendor Code','N','U0001','2019-07-03 13:17:33','U0001','2019-08-19 16:43:53'),('PROVIDER_VENDOR','ko','Provider 벤더 코드','Provider 벤더 코드','N','U0001','2019-07-03 13:17:02','U0001','2019-08-19 16:43:53'),('USER_MEMBER_TYPE','en','회원구분','회원구분','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:53'),('USER_MEMBER_TYPE','ko','회원구분','회원구분','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:54'),('USER_TYPE','en','User level','User level','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:54'),('USER_TYPE','ko','사용자 구분','사용자 구분','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:54'),('VENDOR','en','Consumer Vendor','Consumer Vendor','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:54'),('VENDOR','ko','Consumer Vendor','Consumer Vendor','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:54'),('VENDOR_C','en','Vendor_consumer','Vendor_consumer','Y','U0001','2019-07-26 16:32:18','U0001','2019-08-19 16:43:54'),('VENDOR_C','ko','Vendor_consumer','Vendor_consumer','Y','U0001','2019-07-26 16:32:18','U0001','2019-08-19 16:43:54'),('VENDOR_P','en','Vendor_Provider','Vendor_Provider','Y','U0001','2019-07-26 16:32:54','U0001','2019-08-19 16:43:54'),('VENDOR_P','ko','Vendor_Provider','Vendor_Provider','Y','U0001','2019-07-26 16:32:54','U0001','2019-08-19 16:43:54'),('WARN_RATE','en','Alert level','Alert level','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:54'),('WARN_RATE','ko','장애/이벤트 등급','장애/이벤트 등급','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:54'),('YN_USE','en','Usage status','Usage status','Y','U0001','2019-05-27 18:26:49','U0001','2019-08-19 16:43:54'),('YN_USE','ko','사용유무','사용유무','Y','U0001','2019-04-23 15:05:50','U0001','2019-08-19 16:43:54');

/*Table structure for table `tm_conf` */

DROP TABLE IF EXISTS `tm_conf`;

CREATE TABLE `tm_conf` (
  `ID_CONF` int(11) NOT NULL AUTO_INCREMENT COMMENT '설정ID',
  `LOG_INOUT_YN` varchar(1) DEFAULT NULL COMMENT '접속로그여부',
  `LOG_RES_YN` varchar(1) DEFAULT NULL COMMENT '응답시간로그여부',
  `LOG_ACTION_YN` varchar(1) DEFAULT NULL COMMENT '수행업무로그여부',
  `LOG_ERROR_YN` varchar(1) DEFAULT NULL COMMENT '에러로그여부',
  `DF_LANG` varchar(4) DEFAULT 'KR' COMMENT '기본 언어',
  `PERIOD` varchar(4) DEFAULT NULL COMMENT '로그 보관기한',
  `ID_INSERT` varchar(10) DEFAULT NULL COMMENT '등록자',
  `DT_INSERT` datetime DEFAULT NULL COMMENT '등록일시',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT '수정자',
  `DT_UPDATE` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`ID_CONF`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='기본설정';

/*Data for the table `tm_conf` */

insert  into `tm_conf`(`ID_CONF`,`LOG_INOUT_YN`,`LOG_RES_YN`,`LOG_ACTION_YN`,`LOG_ERROR_YN`,`DF_LANG`,`PERIOD`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values (1,'Y','Y','Y','Y','ko','30','U000001','2017-02-17 10:53:57','U000001','2017-02-17 10:53:57'),(2,'Y','Y','Y','Y','ko','30','U0001','2017-04-20 19:49:30',NULL,NULL),(3,'Y',NULL,'N','Y','ko','30','U0001','2017-04-26 19:39:31',NULL,NULL),(4,'Y',NULL,'Y','Y','ko','30','U0001','2017-04-26 19:39:57',NULL,NULL);

/*Table structure for table `tm_log_action` */

DROP TABLE IF EXISTS `tm_log_action`;

CREATE TABLE `tm_log_action` (
  `ID_USER` varchar(10) NOT NULL COMMENT '사용자ID',
  `ID_MENU` varchar(10) NOT NULL COMMENT '메뉴ID',
  `REQ_DT` datetime NOT NULL COMMENT '요청일시',
  `ACTION_URL` varchar(256) NOT NULL COMMENT '요청URL',
  `ACTION` char(1) DEFAULT NULL COMMENT '작업 타입(1 조회,2 신규/수정)',
  `IS_SUCCESS` char(1) DEFAULT NULL COMMENT '작업결과',
  `ERR_TYPE` varchar(2) DEFAULT NULL COMMENT '에러종류',
  `DU_TIME` varchar(10) DEFAULT NULL COMMENT '작업시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='수행업무로그';


/*Table structure for table `tm_log_conn` */

DROP TABLE IF EXISTS `tm_log_conn`;

CREATE TABLE `tm_log_conn` (
  `ID_USER` varchar(10) NOT NULL COMMENT '사용자ID',
  `ID_SESSION` varchar(255) NOT NULL COMMENT '세션ID',
  `LOGIN_DT` datetime NOT NULL COMMENT '로그인일시',
  `LOGOUT_DT` datetime DEFAULT NULL COMMENT '로그아웃일시',
  `DU_TIME` int(11) DEFAULT NULL COMMENT '유지시간_초',
  `REMOTE_IP` varchar(40) DEFAULT NULL COMMENT '접속IP',
  `USER_AGENT` varchar(256) DEFAULT NULL COMMENT '접속단말',
  PRIMARY KEY (`ID_USER`,`ID_SESSION`,`LOGIN_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='접속로그';


/*Table structure for table `tm_log_error` */

DROP TABLE IF EXISTS `tm_log_error`;

CREATE TABLE `tm_log_error` (
  `ID_USER` varchar(10) NOT NULL COMMENT '사용자ID',
  `ID_MENU` varchar(10) NOT NULL COMMENT '메뉴ID',
  `ERROR_DT` datetime NOT NULL COMMENT '에러발생일시',
  `ACTION_URL` varchar(256) DEFAULT NULL COMMENT '요청URL',
  `CD_ERROR` varchar(5) DEFAULT NULL COMMENT '에러코드',
  `CD_ORG_ERROR` varchar(100) DEFAULT NULL COMMENT 'CD_ORG_ERROR',
  `DESC_ERROR` varchar(3500) DEFAULT NULL COMMENT '에러내용',
  PRIMARY KEY (`ID_USER`,`ID_MENU`,`ERROR_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='에러로그';


/*Table structure for table `tm_menu` */

DROP TABLE IF EXISTS `tm_menu`;

CREATE TABLE `tm_menu` (
  `ID_MENU` varchar(4) NOT NULL COMMENT 'ID_MENU',
  `ACTION_URL` varchar(255) DEFAULT NULL COMMENT 'ACTION_URL',
  `PA_MENU` varchar(4) NOT NULL DEFAULT '0' COMMENT 'PA_MENU',
  `DEPTH` char(1) NOT NULL COMMENT 'DEPTH',
  `IMG_MENU` varchar(100) DEFAULT NULL COMMENT 'IMG_MENU',
  `DESC_MENU` varchar(30) DEFAULT NULL COMMENT 'DESC_MENU',
  `NO_ORDER` varchar(2) DEFAULT NULL COMMENT 'NO_ORDER',
  `YN_USE` char(1) NOT NULL DEFAULT 'Y' COMMENT 'YN_USE',
  `VIEW_TYPE` varchar(4) DEFAULT NULL COMMENT '뷰타입',
  `ID_INSERT` varchar(10) NOT NULL COMMENT 'ID_INSERT',
  `DT_INSERT` date NOT NULL COMMENT 'DT_INSERT',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT 'ID_UPDATE',
  `DT_UPDATE` date DEFAULT NULL COMMENT 'DT_UPDATE',
  PRIMARY KEY (`ID_MENU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴정보';

/*Data for the table `tm_menu` */

insert  into `tm_menu`(`ID_MENU`,`ACTION_URL`,`PA_MENU`,`DEPTH`,`IMG_MENU`,`DESC_MENU`,`NO_ORDER`,`YN_USE`,`VIEW_TYPE`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('1','','0','1','fa fa-cogs','시스템관리','7','Y',NULL,'U0001','2017-02-17',NULL,'2019-06-21'),('14','','0','1','fa fa-circle','노드관리','0','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('15','','0','1','fa fa-share-alt','연결관리','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('16','','0','1','fa fa-arrow-right','경로관리','2','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('17','','0','1','fa fa-desktop','모니터링','3','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('18','','0','1','fa fa-history','로그관리','4','Y',NULL,'U0001','2019-02-07',NULL,'2019-04-19'),('19','','0','1','fa fa-share','배포관리','5','Y',NULL,'U0001','2019-02-07',NULL,'2019-03-06'),('2','/system/menu','1','2','fa fa-bars','','7','Y',NULL,'U0001','2017-02-17',NULL,'2019-06-24'),('20','/nodeMgmt/grpMgmt','14','2','fa fa-object-group','그룹관리','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('21','/nodeMgmt/kmsMgmt','14','2','fa fa-server','KMS 관리','2','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('22','/nodeMgmt/cnsmMgmt','14','2','fa fa-circle-o','Consumer 관리','4','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('23','/nodeMgmt/prvdrMgmt','14','2','fa fa-square','Provider 관리','3','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('24','/cnctnMgmt/kmsCnctnMgmt','15','2','fa fa-arrows-h','KMS 연결관리','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('25','/cnctnMgmt/cnsmCnctnMgmt','15','2','fa fa-arrows-v','Consumer  연결관리','3','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('26','/cnctnMgmt/prvdrCnctnMgmt','15','2','fa fa-code-fork','Provider 연결관리','2','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('27','/pathMgmt/pathMgmt','16','2','fa fa-arrow-right','경로관리','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-26'),('28','/monitoring/monitoring','17','2','fa fa-desktop','모니터링','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('29','/logMgmt/alert','18','2','fa fa-exclamation-circle','경보조회','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('3','/system/operator','1','2','fa fa-user','','9','Y',NULL,'U0001','2017-02-17',NULL,'2019-06-24'),('30','/logMgmt/event','18','2','fa fa-calendar','이벤트 조회','2','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('31','/logMgmt/log','18','2','fa fa-list','로그조회','3','Y',NULL,'U0001','2019-02-07',NULL,'2019-06-21'),('32','/dstrbMgmt/vrsn','19','2','fa fa-share-square-o','배포관리','1','Y',NULL,'U0001','2019-02-07',NULL,'2019-03-06'),('33','','0','1','fa fa-line-chart ','통계관리','6','Y',NULL,'U0001','2019-02-12',NULL,'2019-03-06'),('34','/stastMgmt/chart','33','2','fa fa-line-chart','','1','Y',NULL,'U0001','2019-02-12',NULL,'2019-03-15'),('35','/nodeMgmt/prcsMgmt','14','2','fa fa-th','Process 관리','5','Y',NULL,'U0001','2019-02-28',NULL,'2019-06-26'),('36','/dstrbMgmt/sftwDply','19','2','fa fa-check-square','SW배포 관리','2','Y',NULL,'U0001','2019-03-05',NULL,'2019-03-06'),('37','/stastMgmt/grid','33','2','fa fa-table','','2','Y',NULL,'U0001','2019-03-05',NULL,'2019-03-15'),('38','/system/logConf/warn','1','2','','경보 메시지 관리','4','Y',NULL,'U0001','2019-03-26',NULL,'2019-06-24'),('39','/system/logConf/event','1','2','','이벤트 메세지 관리','5','Y',NULL,'U0001','2019-03-26',NULL,'2019-06-24'),('4','/system/role','1','2','fa fa-id-badge','','10','Y',NULL,'U0001','2017-02-17',NULL,'2019-06-24'),('40','/system/process','1','2','','프로세스 목록 관리','3','Y',NULL,'U0001','2019-04-29',NULL,'2019-06-24'),('5','/system/code','1','2','','코드관리','8','Y',NULL,'U0001','2017-02-20',NULL,'2019-06-24'),('6','/system/notice','1','2','','공지사항','1','N',NULL,'U0001','2017-02-20',NULL,'2019-06-21'),('7','/system/kmsConf','1','2','fa fa-tasks','','2','Y',NULL,'U0001','2017-02-20',NULL,'2019-06-24'),('8','/system/message','1','2','fa fa-list-alt','','6','Y',NULL,'U0001','2017-02-21',NULL,'2019-06-24');

/*Table structure for table `tm_menu_dtl` */

DROP TABLE IF EXISTS `tm_menu_dtl`;

CREATE TABLE `tm_menu_dtl` (
  `id_menu` varchar(4) NOT NULL COMMENT 'ID_MENU',
  `fg_lang` varchar(5) NOT NULL COMMENT 'FG_LANG',
  `nm_menu` varchar(50) DEFAULT NULL COMMENT 'NM_MENU',
  PRIMARY KEY (`id_menu`,`fg_lang`),
  CONSTRAINT `tm_menu_dtl_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `tm_menu` (`ID_MENU`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴상세';

/*Data for the table `tm_menu_dtl` */

insert  into `tm_menu_dtl`(`id_menu`,`fg_lang`,`nm_menu`) values ('1','en','System Configuration'),('1','ko','시스템관리'),('14','en','Node Management'),('14','ko','노드관리'),('15','en','Link Management'),('15','ko','연결관리'),('16','en','Routing Path Management'),('16','ko','경로관리'),('17','en','Monitoring'),('17','ko','모니터링'),('18','en','Log Management'),('18','ko','로그관리'),('19','en','Deployment Management'),('19','ko','배포관리'),('2','en','Menu management'),('2','ko','메뉴관리'),('20','en','Group'),('20','ko','그룹'),('21','en','KMS'),('21','ko','KMS'),('22','en','Consumer'),('22','ko','Consumer'),('23','en','Provider'),('23','ko','Provider'),('24','en','KMS Link'),('24','ko','KMS 연결'),('25','en','Consumer Link'),('25','ko','Consumer  연결'),('26','en','Provider Link'),('26','ko','Provider 연결'),('27','en','Routing Path'),('27','ko','경로'),('28','en','Monitoring'),('28','ko','모니터링'),('29','en','Alert Log'),('29','ko','경보조회'),('3','en','User Management'),('3','ko','사용자관리'),('30','en','Event Log'),('30','ko','이벤트 조회'),('31','en','Audit Log'),('31','ko','감사로그조회'),('32','en','Version Manage'),('32','ko','버전관리'),('33','en','Statistics'),('33','ko','통계관리'),('34','en','Statistics Chart'),('34','ko','통계 조회'),('35','en','Process'),('35','ko','Process'),('36','en','Software Deployment Management'),('36','ko','SW배포 관리'),('37','en','Statistics Grid'),('37','ko','통계 로그 조회'),('38','en','Alert message management'),('38','ko','경보 메시지 관리'),('39','en','Event message management'),('39','ko','이벤트 메세지 관리'),('4','en','Access control management'),('4','ko','권한관리'),('40','en','Process configuration'),('40','ko','Process 목록 관리'),('5','en','Internal code management'),('5','ko','코드관리'),('6','en','Notice'),('6','ko','공지사항'),('7','en','KEMS Configuration'),('7','ko','기본설정'),('8','en','Message management'),('8','ko','메시지관리');

/*Table structure for table `tm_msg` */

DROP TABLE IF EXISTS `tm_msg`;

CREATE TABLE `tm_msg` (
  `CD_SYS` varchar(4) NOT NULL,
  `CD_MSG` varchar(4) NOT NULL,
  `NO_MSG` varchar(6) NOT NULL,
  `FG_LANG` varchar(2) NOT NULL,
  `NM_MSG` varchar(255) NOT NULL,
  `DESC_MSG` varchar(255) DEFAULT NULL,
  `ID_INSERT` varchar(10) DEFAULT NULL,
  `DT_INSERT` date DEFAULT NULL,
  `ID_UPDATE` varchar(10) DEFAULT NULL,
  `DT_UPDATE` date DEFAULT NULL,
  PRIMARY KEY (`CD_SYS`,`CD_MSG`,`NO_MSG`,`FG_LANG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `tm_msg` */

insert  into `tm_msg`(`CD_SYS`,`CD_MSG`,`NO_MSG`,`FG_LANG`,`NM_MSG`,`DESC_MSG`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('CMS','COL','B0673','ko','상품명','상품명','U0001','2016-12-31','U0001','2016-12-31'),('CMS','MSG','A0043','ko','추가할 파일을 선택하여 주세요','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0045','ko','ID중복체크를 해주세요.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0120','ko','폰트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0121','ko','글자크기','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0122','ko','글자색','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0123','ko','배경색','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0124','ko','메뉴생성일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0125','ko','메뉴상태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0126','ko','배포상태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0127','ko','버전정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0227','ko','삭제를 실패했습니다.','삭제를 실패했습니다.','U0001','2019-03-21','U0001','2019-03-21'),('CMS','COL','C0139','ko','우선순위','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0140','ko','이동전메뉴','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0141','ko','이동후메뉴','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0143','ko','메뉴위치','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0145','ko','승인일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0146','ko','승인자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0154','ko','실패내역','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0155','ko','장비ID','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0156','ko','등록시간','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0158','ko','부가정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0159','ko','작업명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0160','ko','사용언어','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0161','ko','접속정보로그','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0162','ko','수행업무로그','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0163','ko','패스워드변경주기','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0164','ko','응답시간로그','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0165','ko','수행에러로그','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0166','ko','상위메뉴','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0167','ko','메뉴설명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0168','ko','바로가기','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0170','ko','상세설명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0171','ko','정렬순서','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0172','ko','메시지구분','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0173','ko','메시지','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0175','ko','사업자등록번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0176','ko','법인등록번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0177','ko','대표FAX','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0178','ko','대표업체','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0179','ko','대표업종','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0180','ko','대표자명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0181','ko','담당자E-mail','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0182','ko','회사','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0183','ko','전화번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0184','ko','로그구분','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0185','ko','로그인일시','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0186','ko','로그아웃일시','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0187','ko','접속시간','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0188','ko','접속자IP','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0189','ko','브라우저','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0190','ko','업무(메뉴)명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0191','ko','수행일시','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0192','ko','수행Url','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0193','ko','응답시작일시','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0194','ko','응답종료일시','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0195','ko','수행시간','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0196','ko','에러일시','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0197','ko','에러내용','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0198','ko','조회기간','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0199','ko','부서','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0200','ko','회사명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0201','ko','그룹','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0202','ko','로그인ID','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0203','ko','직원여부','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0204','ko','내선번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0205','ko','사원번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0206','ko','FAX번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0207','ko','입사일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0208','ko','퇴사일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0209','ko','조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0210','ko','등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0211','ko','수정','수정','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0212','ko','삭제','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0213','ko','엑셀','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0008','ko','메뉴명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0009','ko','링크URL','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0010','ko','그룹코드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0011','ko','그룹코드명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0012','ko','코드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0013','ko','코드명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0006','ko','FTP정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0005','ko','저장기간','저장기간','U0001','2016-12-30','U0001','2018-01-04'),('CMS','MSG','A0054','ko','을(를) 메뉴 이동 하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0055','ko','을(를) 메뉴명 변경 하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0056','ko','이동 메뉴가 동일합니다. 다른 메뉴를 선택해주시기 바랍니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0057','ko','로 변경하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0059','ko','하위에 메뉴를 추가하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0075','ko','초기화 하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0076','ko','실패 정보를 입력하여 주십시오.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0079','ko','사용할 수 있는 ID입니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0080','ko','사용 중인 ID 입니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0083','ko','오류가 발생했습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0084','ko','다시 시도하여 주시기 바랍니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0085','ko','비밀번호와 비밀번호확인이 일치하지 않습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0087','ko','작업을 요청하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0091','ko','적용종료일이 적용시작일보다 작을수는 없습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0094','ko','해당 메뉴는 이미 등록이 되어있습니다','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0001','ko','접속정보로그','접속정보로그','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0002','ko','수행 업무 로그','수행 업무 로그','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0003','ko','수행 에러 로그','수행 에러 로그','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0004','ko','읍/면/동/리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0034','ko','메뉴관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0035','ko','메뉴명관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0036','ko','메뉴명조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0037','ko','메뉴명리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0039','ko','메뉴생성내역조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0040','ko','메뉴생성리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0042','ko','메뉴정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0043','ko','메뉴리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0045','ko','메뉴이동정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0046','ko','메뉴명변경','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0047','ko','메뉴구성정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0048','ko','메뉴추가','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0052','ko','메뉴승인정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0062','ko','작업관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0063','ko','작업정보관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0064','ko','작업정보조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0068','ko','시스템관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0069','ko','기준관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0070','ko','기본설정','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0071','ko','언어 및 로그설정','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0072','ko','메뉴설정','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0073','ko','메뉴리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0023','ko','메시지코드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0024','ko','메시지명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0025','ko','상호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0026','ko','대표전화','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0027','ko','주소','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0028','ko','부서명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0564','ko','권한 레벨','권한 레벨','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0030','ko','제목','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0031','ko','내용','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0050','ko','전체','전체','U0001','2016-12-30','U0001','2018-01-03'),('CMS','COL','C0051','ko','메시지 ID','메시지 ID','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0052','ko','메시지 구분','메시지 구분','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0053','ko','언어구분','언어구분','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0054','ko','메시지명','메시지명','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0056','ko','시스템 구분','시스템 구분','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0057','ko','메시지 구분','메시지 구분','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0058','ko','비밀번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0059','ko','사용자명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0060','ko','연락처','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0061','ko','메시지코드','메시지코드','U0001','2016-12-30','U0001','2018-01-04'),('CMS','COL','C0062','ko','그룹명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0064','ko','상품유형','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0066','ko','적용시작일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0067','ko','적용종료일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0068','ko','사용여부','사용여부','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0069','ko','메뉴코드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0070','ko','언어구분','언어구분(dup)','U0001','2016-12-30','U0001','2019-06-26'),('CMS','COL','C0077','ko','메뉴명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0078','ko','번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0079','ko','공지사항','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0080','ko','등록일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0081','ko','등록자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0083','ko','공지제목','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0084','ko','공지내용','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0087','ko','대상자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0088','ko','수정자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0089','ko','수정일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0092','ko','부제목','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0082','ko','CMSCMSCMSCMS','CMSCMSCMSCMS','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','1','ko','신규','신규','U0001','2016-12-30','U0001','2019-06-19'),('CMS','BTN','10','ko','닫기','닫기','U0001','2016-12-30','U0001','2017-02-02'),('CMS','BTN','12','ko','자동생성','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','13','ko','입고내역등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','14','ko','추가','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','15','ko','대출내역등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','16','ko','다국어정보입력','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','17','ko','엑셀','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','18','ko','등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','2','ko','저장','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','20','ko','재인코딩','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','202','ko','일괄등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','204','ko','재전송','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','21','ko','재수급','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','22','ko','상품매핑관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','23','ko','신버전생성','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','24','ko','수정','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','25','ko','메뉴이동','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','26','ko','메뉴명변경','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','3','ko','삭제','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','30','ko','배포요청','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','31','ko','삭제요청','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','32','ko','승인','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','34','ko','성공','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','35','ko','실패','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','36','ko','재수급요청','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','37','ko','재인코딩요청','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','38','ko','코드초기화','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','41','ko','수급확정','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','42','ko','엑셀','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','44','ko','만료','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','6','ko','조회','조회(dup)','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','7','ko','중복','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','76','ko','전체권한삭제','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','77','ko','전체권한저장','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','78','ko','개별권한저장','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','8','ko','업로드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','9','ko','다운로드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','BTN','97','ko','초기화','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0001','ko','숫자만 입력이 가능합니다','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0002','ko','형식이 올바르지 않습니다','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0003','ko','(을)를 입력하세요','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0004','ko','(을)를 선택하여주세요','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0005','ko','저장하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0006','ko','8자리수로 입력해 주세요.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0007','ko','저장되었습니다.','저장되었습니다.','U0001','2016-12-30','U0001','2018-01-04'),('CMS','MSG','A0008','ko','입력 달이 맞지 않습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0009','ko','입력 일자가 맞지 않습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0010','ko','중복된 데이터가 있습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0011','ko','조회 범위를 넘었습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0012','ko','조회 범위가 잘못되었습니다.','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0037','ko','처리가 정상적으로 끝났습니다','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0038','ko','처리중 오류가 발생하였습니다','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0599','ko','상세','상세','U0001','2019-03-04','U0001','2019-03-04'),('CMS','COL','C0598','ko','기본정보','기본정보','U0001','2019-02-28','U0001','2019-02-28'),('CMS','MSG','A0218','ko','정보','정보','U0001','2019-02-28','U0001','2019-02-28'),('CMS','BTN','212','ko','확인','확인','U0001','2019-02-28','U0001','2019-02-28'),('CMS','COL','C0597','ko','인터페이스','인터페이스','U0001','2019-02-28','U0001','2019-02-28'),('CMS','MSG','A0217','ko','목록','목록','U0001','2019-02-28','U0001','2019-02-28'),('CMS','MSG','A0216','ko','에러가 발생했습니다. 다시 시도해주세요.','에러가 발생했습니다. 다시 시도해주세요.','U0001','2019-02-28','U0001','2019-02-28'),('CMS','COL','C0596','ko','삭제되었습니다.','삭제되었습니다.','U0001','2019-02-28','U0001','2019-02-28'),('CMS','COL','C0595','ko','선택한 {0}을 삭제하시겠습니까?','선택한 {0}을 삭제하시겠습니까?','U0001','2019-02-28','U0001','2019-03-21'),('CMS','COL','C0594','ko','선택한 그룹을 삭제하시겠습니까','선택한 그룹을 삭제하시겠습니까','U0001','2019-02-28','U0001','2019-02-28'),('CMS','MSG','A0226','ko','연결중인 {0}을 삭제할 수 없습니다.','연결중인 {0}을 삭제할 수 없습니다.','U0001','2019-03-21','U0001','2019-03-21'),('CMS','COL','C0593','ko','삭제할 {0}을 선택하세요','삭제할 {0}을 선택하세요','U0001','2019-02-28','U0001','2019-03-21'),('CMS','COL','C0592','ko','Admin 브로커 Port','Admin 브로커 Port','U0001','2019-02-27','U0001','2019-03-22'),('CMS','COL','C0591','ko','외부 브로커 Port','외부 브로커 Port','U0001','2019-02-27','U0001','2019-03-22'),('CMS','COL','C0590','ko','내부 브로커 Port','내부 브로커 Port','U0001','2019-02-27','U0001','2019-03-22'),('CMS','COL','C0589','ko','그룹 ID','그룹 ID','U0001','2019-02-26','U0001','2019-02-26'),('CMS','COL','C0588','ko','설명','설명','U0001','2019-02-26','U0001','2019-02-26'),('CMS','BTN','211','ko','검색','검색','U0001','2019-02-26','U0001','2019-02-26'),('CMS','COL','C0340','ko','상품명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0341','ko','상품종료일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0342','ko','상품시작일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0343','ko','상품유형','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0345','ko','사용기간(일)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0346','ko','가격','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0348','ko','상품설명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0358','ko','기준단가','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0365','ko','승인일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0366','ko','승인자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0367','ko','만료일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0368','ko','만료자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0370','ko','메뉴별','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0372','ko','장비명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0373','ko','장비구분','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0374','ko','장비사용여부','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0375','ko','유형사용여부','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0376','ko','인터페이스 종류','인터페이스 종류','U0001','2016-12-30','U0001','2019-06-26'),('CMS','COL','C0377','ko','PORT','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0378','ko','User ID','User ID','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0379','ko','PW','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0380','ko','장비코드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0381','ko','장비유형','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0382','ko','장비상태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0383','ko','관리자','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0384','ko','장비스펙설명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0385','ko','최근메뉴승인버젼','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0386','ko','전체','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0387','ko','우편번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0388','ko','선택','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0390','ko','월','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0391','ko','화','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0392','ko','수','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0393','ko','목','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0394','ko','금','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0395','ko','토','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0396','ko','일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0400','ko','검색타입','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0401','ko','다국어종류','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0402','ko','검색일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0403','ko','원본경로','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0404','ko','원본파일명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0406','ko','메뉴그룹','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0408','ko','변경할 메뉴명 위치','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0409','ko','상품가격','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0410','ko','기타','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0412','ko','반복횟수','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0413','ko','시작시간','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0414','ko','CUG명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0419','ko','대표자주민번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0420','ko','그룹별권한','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0421','ko','시작번지','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0422','ko','종료번지','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0423','ko','옛우편번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0424','ko','길이름','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0425','ko','번지유형','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0427','ko','영어','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0428','ko','일본어','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0429','ko','베트남어','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0430','ko','중국어간체','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0431','ko','중국어번체','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0432','ko','등록여부','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0433','ko','코드리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0434','ko','비밀번호확인','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0484','ko','공지대상','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0485','ko','공지순서','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0486','ko','공지상태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0487','ko','공지시작일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0488','ko','공지종료일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0509','ko','요일별 시간(월)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0510','ko','요일별 시간(화)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0511','ko','요일별 시간(수)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0512','ko','요일별 시간(목)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0513','ko','요일별 시간(금)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0514','ko','요일별 시간(토)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0515','ko','요일별 시간(일)','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0516','ko','일별 시작/종료일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0517','ko','일별 시간','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0518','ko','월요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0519','ko','화요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0520','ko','수요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0521','ko','목요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0522','ko','금요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0523','ko','토요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0524','ko','일요일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0047','ko','추가하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0048','ko','삭제하시겠습니까?','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0074','ko','메뉴정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0075','ko','공통코드','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0076','ko','코드조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0077','ko','코드그룹','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0078','ko','코드그룹정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0079','ko','코드리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0080','ko','공통메시지','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0081','ko','메시지조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0082','ko','메시지리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0083','ko','회사정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0084','ko','회사리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0085','ko','부서정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0086','ko','로그현황','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0087','ko','로그조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0088','ko','로그그룹','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0089','ko','로그정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0090','ko','권한관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0091','ko','공지사항','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0092','ko','공지사항조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0093','ko','공지사항목록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0094','ko','사용자조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0095','ko','사용자리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0096','ko','사용자정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0097','ko','그룹리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0098','ko','그룹정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0095','ko','소재상태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0101','ko','업로드상태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0103','ko','업로드일','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0214','ko','설정정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0215','ko','전체선택','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0216','ko','담당자명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0217','ko','업태','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0218','ko','업종','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0220','ko','사업자번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0221','ko','국가','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0222','ko','상세주소','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0223','ko','은행명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0224','ko','계좌번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0225','ko','예금주','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0226','ko','주민번호','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0227','ko','비고','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0228','ko','등록증명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0229','ko','등록증이미지','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0234','ko','폴더경로','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0236','ko','정산기준','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0237','ko','정산유형','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0239','ko','개월','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0225','ko','{0} 정보를 선택해주세요','{0} 정보를 선택해주세요','U0001','2019-03-19','U0001','2019-03-19'),('CMS','COL','C0613','ko','{0}을(를) 입력해주세요','{0}을(를) 입력해주세요','U0001','2019-03-19','U0001','2019-03-19'),('CMS','MSG','A0224','ko','동일한 네트워크 인터페이스 IP 주소가 존재합니다.','동일한 네트워크 인터페이스 IP 주소가 존재합니다.','U0001','2019-03-19','U0001','2019-03-19'),('CMS','BTN','217','ko','완료처리','완료처리','U0001','2019-03-15','U0001','2019-03-15'),('CMS','COL','C0612','ko','해제일시(dup)','해제일시dup)','U0001','2019-03-15','U0001','2019-04-17'),('CMS','COL','C0611','ko','발생일시','발생일시','U0001','2019-03-15','U0001','2019-03-15'),('CMS','COL','C0610','ko','등급','등급','U0001','2019-03-15','U0001','2019-03-15'),('CMS','MSG','A0223','ko','삭제할 항목을 선택해주세요.','삭제할 항목을 선택해주세요.','U0001','2019-03-08','U0001','2019-03-08'),('CMS','MSG','A0222','ko','인터페이스를 선택해주세요.','인터페이스를 선택해주세요.','U0001','2019-03-08','U0001','2019-03-08'),('CMS','COL','C0609','ko','인증','인증','U0001','2019-03-08','U0001','2019-03-08'),('CMS','COL','C0608','ko','인증서','인증서','U0001','2019-03-08','U0001','2019-03-08'),('CMS','COL','C0607','ko','가중치','가중치','U0001','2019-03-07','U0001','2019-03-07'),('CMS','COL','C0606','ko','연결 이름','연결 이름','U0001','2019-03-07','U0001','2019-03-07'),('CMS','COL','C0605','ko','연결ID','연결ID','U0001','2019-03-07','U0001','2019-03-07'),('CMS','MSG','A0221','ko','조회 종료일을 선택하세요.','조회 종료일을 선택하세요.','U0001','2019-03-05','U0001','2019-03-05'),('CMS','MSG','A0220','ko','조회 시작일을 선택하세요.','조회 시작일을 선택하세요.','U0001','2019-03-05','U0001','2019-03-05'),('CMS','MSG','A0219','ko','조회 시작일은 조회 종료일보다 작거나 같아야 됩니다.','조회 시작일은 조회 종료일보다 작거나 같아야 됩니다.','U0001','2019-03-05','U0001','2019-03-05'),('CMS','BTN','216','ko','전체배포','전체배포','U0001','2019-03-04','U0001','2019-03-04'),('CMS','BTN','215','ko','배포','배포','U0001','2019-03-04','U0001','2019-03-04'),('CMS','COL','C0604','ko','경로생성시 활성화된 엘리먼트만 사용','경로생성시 활성화된 엘리먼트만 사용','U0001','2019-03-04','U0001','2019-03-04'),('CMS','BTN','214','ko','전체생성','전체생성','U0001','2019-03-04','U0001','2019-03-04'),('CMS','BTN','213','ko','생성','create','U0001','2019-03-04','U0001','2019-03-04'),('CMS','COL','C0603','ko','생성','create','U0001','2019-03-04','U0001','2019-03-04'),('CMS','COL','C0602','ko','경로 ID','경로 ID','U0001','2019-03-04','U0001','2019-03-04'),('CMS','COL','C0601','ko','발생일시','발생일시(dup)','U0001','2019-03-04','U0001','2019-06-26'),('CMS','COL','C0600','ko','연결 이름','연결 이름(dup)','U0001','2019-03-04','U0001','2019-07-01'),('CMS','COL','T0194','ko','해외','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0195','ko','읍/면/동/리/건물','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0196','ko','번지리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0197','ko','시/도명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0198','ko','구/군명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0199','ko','동/면명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','MSG','A0205','ko','캐쉬를 다시 불러왔습니다.','캐쉬를 다시 불러왔습니다.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','N0045','ko','메시지설명','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0575','ko','부모 경로','부모 경로','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0574','ko','메뉴 설명','메뉴 설명','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0573','ko','모든 아이콘 보기','모든 아이콘 보기','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0572','ko','메뉴 아이콘','메뉴 아이콘','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0571','ko','경로','경로','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0570','ko','URL','URL','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0569','ko','메뉴 ID','메뉴 ID','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0568','ko','메뉴 상세','메뉴 상세','U0001','2018-01-04','U0001','2018-01-04'),('CMS','BTN','210','ko','신규','신규(dup)','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0213','ko','검색어를 입력하세요','검색어를 입력하세요','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0567','ko','메뉴 트리','메뉴 트리','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0212','ko','데이터를 가져오는데 실패했습니다.','데이터를 가져오는데 실패했습니다.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','BTN','209','ko','신규비밀번호 전송','신규비밀번호 전송','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0562','ko','이메일','이메일','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0563','ko','휴대폰 번호','휴대폰 번호','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0565','ko','메모','메모','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0566','ko','신규 등록','신규 등록','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0211','ko','신규입력할 메뉴를 선택해주세요.','신규입력할 메뉴를 선택해주세요.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0560','ko','신규등록','신규등록','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0210','ko','비밀번호가 저장되었습니다.','비밀번호가 저장되었습니다.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0559','ko','운영자 수정','운영자 수정','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','T0099','ko','권한조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0100','ko','권한리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0101','ko','거래처조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0102','ko','거래처리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0103','ko','거래처관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0104','ko','거래처FTP리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0105','ko','거래처FTP조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0109','ko','거래처FTP관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0115','ko','미디어정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0116','ko','소재정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0124','ko','ASSET SERVER IMAGE LIST','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0131','ko','상품관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0132','ko','상품조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0133','ko','상품리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0134','ko','상품매핑리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0135','ko','상품등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0136','ko','상품상세등록','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0146','ko','메뉴별매핑리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0587','ko','언어별 메세지 다운로드','언어별 메세지 다운로드','U0001','2019-02-21','U0001','2019-02-21'),('CMS','COL','C0586','ko','언어별 코드 다운로드','언어별 코드 다운로드','U0001','2019-02-21','U0001','2019-02-21'),('CMS','COL','C0585','ko','메세지 관리','메세지 관리','U0001','2019-02-21','U0001','2019-02-21'),('CMS','COL','T0162','ko','장비조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0163','ko','장비관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0164','ko','장비리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0165','ko','자동생성리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0167','ko','다국어정보 조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0168','ko','다국어정보','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0169','ko','상품정보조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0172','ko','운영관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0175','ko','대상상품리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0584','ko','컬럼 추가','컬럼 추가','U0001','2019-02-12','U0001','2019-02-12'),('CMS','MSG','A0214','ko','tset','test','U0001','2019-02-12','U0001','2019-02-12'),('CMS','MSG','A0215','ko','권한을 지정할 메뉴를 선택하십시오.','권한을 지정할 메뉴를 선택하십시오.','U0001','2019-02-12','U0001','2019-02-12'),('CMS','COL','T0184','ko','선택메뉴','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0185','ko','출력방법선택','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0186','ko','코드그룹리스트','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0187','ko','운영정보관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0188','ko','사용자관리','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0192','ko','주소조회','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','T0193','ko','국내','','U0001','2016-12-30','U0001','2016-12-30'),('CMS','COL','C0582','ko','상태','상태','U0001','2019-02-08','U0001','2019-02-08'),('CMS','COL','C0581','ko','해제일시','해제일시','U0001','2019-02-08','U0001','2019-02-08'),('CMS','COL','C0580','ko','Element명','Element명','U0001','2019-02-08','U0001','2019-02-08'),('CMS','COL','C0579','ko','타입','타입','U0001','2019-02-08','U0001','2019-02-08'),('CMS','COL','C0578','ko','컬럼','컬럼','U0001','2019-01-29','U0001','2019-01-29'),('CMS','COL','C0577','ko','메세지','메세지','U0001','2019-01-29','U0001','2019-01-29'),('CMS','MSG','A0209','ko','현재 비밀번호가 초기화되고 임시비밀번호가 발급됩니다. 계속 하시겠습니까?','현재 비밀번호가 초기화되고 임시비밀번호가 발급됩니다. 계속 하시겠습니까?','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0208','ko','{0}은(는) 이미 사용중입니다.','{0}은(는) 이미 사용중입니다.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0207','ko','수정할 내용을 선택해주세요.','수정할 내용을 선택해주세요.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0555','ko','구분','구분','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0556','ko','이름','이름','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0557','ko','권한','권한','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0558','ko','중지여부','중지여부','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0576','ko','버튼','버튼','U0001','2019-01-29','U0001','2019-01-29'),('CMS','COL','C0554','ko','작성일','작성일','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0553','ko','작성자','작성자','U0001','2018-01-04','U0001','2018-01-04'),('CMS','BTN','208','ko','취소','취소','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0552','ko','코드관리','코드관리','U0001','2018-01-04','U0001','2018-01-04'),('CMS','BTN','207','ko','검색','검색','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0551','ko','코드그룹 관리','코드그룹 관리','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0550','ko','코드수정','코드수정','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0549','ko','코드등록','코드등록','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0548','ko','코드그룹수정','코드그룹수정','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0547','ko','코드그룹등록','코드그룹등록','U0001','2018-01-04','U0001','2018-01-04'),('CMS','MSG','A0206','ko','이미 등록된 코드그룹입니다.','이미 등록된 코드그룹입니다.','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0545','ko','코드그룹명','코드그룹명','U0001','2018-01-04','U0001','2018-01-04'),('CMS','COL','C0546','ko','등록일시','등록일시','U0001','2019-02-11','U0001','2019-02-11'),('CMS','MSG','A0228','ko','Sys 인터페이스를 추가해주세요','Sys 인터페이스를 추가해주세요','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0614','ko','KMS 이름','KMS 이름','U0001','2019-03-22','U0001','2019-03-22'),('CMS','BTN','218','ko','그룹 선텍','그룹 선텍','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0615','ko','KMS ID','KMS ID','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0616','ko','네트워크 인터페이스 목록','네트워크 인터페이스 목록','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0617','ko','Consumer 연결 Port 정보','Consumer 연결 Port 정보','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0618','ko','Agent 통신 port','Agent 통신 port','U0001','2019-03-22','U0001','2019-03-22'),('CMS','MSG','A0229','ko','인증정보','인증정보','U0001','2019-03-22','U0001','2019-03-22'),('CMS','MSG','A0230','ko','KMS Unique ID','KMS Unique ID','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0619','ko','Protocol Port','Protocol Port','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0620','ko','IP Address','IP Address','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0515','en','D.O.W time(Sat)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0514','en','D.O.W time(Fri)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0513','en','D.O.W time(Thu)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0512','en','D.O.W time(Wed)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0511','en','D.O.W time(Tue)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0510','en','D.O.W time(Mon)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0509','en','notice end date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0488','en','notice start date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0487','en','notice state','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0486','en','notice order','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0485','en','notice target','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0484','en','confirm password','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0434','en','code list','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0433','en','Code list','Code list','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0432','en','Traditional Chinese','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0431','en','Simplified Chinese','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0430','en','Vietnamese','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0429','en','Japanese','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0428','en','English','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0427','en','zip type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0425','en','street name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0424','en','old zip','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0423','en','zip end','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0422','en','zip start','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0421','en','group permission','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0420','en','representative residence registrtion number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0419','en','CUG name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0414','en','start time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0413','en','repeat no.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0412','en','etc','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0410','en','product price','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0409','en','new menu position','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0408','en','menu group','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0406','en','original file name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0404','en','path to original','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0403','en','Original path','Original path','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0402','en','language type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0401','en','Multi-lang','Multi-lang','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0400','en','Sun','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0396','en','Sat','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0395','en','Fri','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0394','en','Thu','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0393','en','Wed','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0392','en','Tue','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0391','en','Mon','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0390','en','choice','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0388','en','Select','Select','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0387','en','total','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0386','en','All','All','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0385','en','device specification','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0384','en','administrator','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0383','en','Administrator','Administrator','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0382','en','device type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0381','en','device code','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0380','en','PWD','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0379','en','ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0378','en','User ID','User ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0377','en','PORT','PORT','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0376','en','Interface type','Interface type','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0375','en','device use?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0374','en','device type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0373','en','device name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0372','en','per menu','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0370','en','expirator','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0368','en','expiration','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0367','en','approver','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0366','en','approve data','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0365','en','unit price','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0358','en','service description','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0348','en','price','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0346','en','service life','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0345','en','service type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0343','en','service start','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0342','en','service end','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0341','en','service name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0340','en','months','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0239','en','adjustment type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0237','en','adjustment basis','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0236','en','path','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0234','en','reg cert image','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0229','en','registration certificate','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0228','en','note','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0227','en','residence registration number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0226','en','account holder','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0225','en','account number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0224','en','bank','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0223','en','address','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0222','en','country','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0221','en','coporate registration number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0220','en','business','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0218','en','en','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0217','en','contact info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0216','en','select all','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0215','en','config info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0214','en','excel','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0213','en','delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0212','en','Delete','Delete','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0211','en','Modify','Modify','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0210','en','lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0209','en','Search','Search','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0208','en','starting date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0207','en','FAX','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0206','en','employee no.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0205','en','ext. no.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0204','en','employee?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0203','en','login ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0202','en','group','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0201','en','Group','Group','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0200','en','department','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0199','en','lookup period','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0198','en','Period','Period','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0197','en','error time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0196','en','execution duration','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0195','en','response end time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0194','en','response start time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0193','en','execution url','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0192','en','execution time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0191','en','menu name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0190','en','browser','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0189','en','access IP','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0188','en','Client IP','Client IP','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0187','en','logout time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0186','en','login time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0185','en','log type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0184','en','TEL','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0183','en','Phone Number','Phone Number','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0182','en','e-mail','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0181','en','representitive','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0180','en','representitive biz','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0179','en','representitive biz entiry','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0178','en','FAX','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0177','en','corporate registration number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0176','en','company registration number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0175','en','message','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0173','en','message type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0172','en','sorting order','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0171','en','Order','Order','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0170','en','shortcut','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0168','en','menu description','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0167','en','parent menu','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0166','en','task error log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0165','en','response time log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0164','en','password update period','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0163','en','task log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0162','en','access log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0161','en','used language','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0160','en','Language','Language','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0159','en','aux info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0158','en','registration time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0156','en','device ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0155','en','failure history','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0154','en','approver','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0146','en','approval date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0145','en','menu position','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0143','en','menu after','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0141','en','menu before','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0140','en','priority','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0139','en','version info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0127','en','deploy state','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0126','en','Distribution Status','Distribution Status','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0125','en','menu create date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0124','en','background color','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0123','en','font color','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0122','en','font size','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0121','en','font','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0120','en','update date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0103','en','upload state','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0101','en','accountability','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0095','en','subtitle','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0092','en','update date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0089','en','Modified date','Modified date','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0088','en','Changer','Changer','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0087','en','notice content','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0084','en','Notice','Notice','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0083','en','registrator','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0081','en','Register','Register','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0080','en','Registered Date','Registered Date','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0079','en','number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0078','en','menu name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0077','en','language','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0070','en','Language','Language','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0069','en','in use ?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0068','en','Usage','Usage','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0067','en','adoption start','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0066','en','product type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0064','en','group name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0062','en','Group name','Group name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0061','en','Message code','Message code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0060','en','user name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0059','en','password','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0058','en','Password','Password','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0057','en','Message category','Message category','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0056','en','message name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0054','en','Message name','Message name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0053','en','Language','Language','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0052','en','Message category','Message category','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0051','en','Message ID','Message ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0050','en','All','All','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0031','en','User Message','Message to show users','U0001','2019-04-18','U0001','2019-07-18'),('CMS','COL','C0030','en','Title','Title','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0028','en','address','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0027','en','phone#','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0026','en','brand','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0025','en','message name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0024','en','message code','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0023','en','code name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0013','en','Code name','Code name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0012','en','Code','Code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0011','en','group code','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0010','en','link URL','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0009','en','menu name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0008','en','Menu name','Menu name','U0001','2019-04-18','U0001','2019-06-24'),('CMS','COL','C0006','en','duration','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0005','en','Storage period','Storage period','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0004','en','error log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0003','en','operation log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0002','en','access log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0001','en','connection log','connection log','U0001','2019-04-18','U0001','2019-06-24'),('CMS','COL','B0673','en','new2','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','97','en','reset','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','9','en','download','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','8','en','upload','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','78','en','save individual permission','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','77','en','save all permissions','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','76','en','remove all permissions','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','7','en','duplicates','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','6','en','Search','Search','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','44','en','expired','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','42','en','excel','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','41','en','settlement','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','38','en','reset codes','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','37','en','request reencoding','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','36','en','request refurbishing','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','35','en','failure','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','34','en','success','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','32','en','approve','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','31','en','request delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','30','en','request deployment','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','3','en','delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','26','en','change menu name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','25','en','move menu','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','24','en','Modify','Modify','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','23','en','create a new version','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','22','en','product mapping management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','218','en','Select a group','Select a group','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','217','en','done','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','216','en','deploy all','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','215','en','Deploy','en','U0001','2019-04-18','U0001','2019-08-26'),('CMS','BTN','214','en','create all','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','213','en','Create','en','U0001','2019-04-18','U0001','2019-08-26'),('CMS','BTN','212','en','confirm','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','211','en','Search(dup)','Search(dup)','U0001','2019-04-18','U0001','2019-06-24'),('CMS','BTN','210','en','New','New(dup)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','21','en','refurbishing','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','209','en','send new password','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','208','en','Cancel','Cancel','U0001','2019-04-18','U0001','2019-06-24'),('CMS','BTN','207','en','Search','Search','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','204','en','resend','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','202','en','batch registration','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','20','en','reencode','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','2','en','Save','Save','U0001','2019-04-18','U0001','2019-06-24'),('CMS','BTN','18','en','Register','Register','U0001','2019-04-18','U0001','2019-06-24'),('CMS','BTN','17','en','Excel','Excel','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','16','en','multi lang input','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','15','en','loan details input','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','14','en','Add','Add','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','13','en','warehousing details input','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','12','en','Auto create','Auto create','U0001','2019-04-18','U0001','2019-04-18'),('CMS','BTN','10','en','Close','Close','U0001','2019-04-18','U0001','2019-06-21'),('CMS','BTN','1','en','New','New','U0001','2019-04-18','U0001','2019-06-21'),('CMS','COL','C0801','ko','배포상태','배포상태(dup)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0800','ko','Version','Version','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0799','ko','Path','Path','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0798','ko','Result Code','Result Code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0797','ko','유형','유형','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0796','ko','Target VID','Target VID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0795','ko','SYS NAME','SYS NAME','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0621','ko','Provider ID','Provider ID','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0622','ko','Provider 이름','Provider 이름','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0623','ko','Vendor','Vendor','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0624','ko','KMS VID','KMS VID','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0625','ko','KMS Address','KMS Address','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0626','ko','Provider Address','Provider Address','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0627','ko','APP','APP','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0628','ko','Protocol 인터페이스를 추가해주세요.','Protocol 인터페이스를 추가해주세요.','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0629','ko','Provider Address 정보','Provider Address 정보','U0001','2019-03-22','U0001','2019-05-14'),('CMS','COL','C0630','ko','Address 목록','Address 목록','U0001','2019-03-22','U0001','2019-05-14'),('CMS','COL','C0631','ko','네트워크 인터페이스 등록','네트워크 인터페이스 등록','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0632','ko','네트워크 인터페이스 삭제','네트워크 인터페이스 삭제','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0633','ko','네트워크 인터페이스 삭제','네트워크 인터페이스 삭제','U0001','2019-03-22','U0001','2019-03-22'),('CMS','COL','C0634','ko','Address 등록','Address 등록','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0635','ko','Address 삭제','Address 삭제','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0636','ko','Address 수정','Address 수정','U0001','2019-03-22','U0001','2019-05-15'),('CMS','COL','C0637','ko','Algorithm','Algorithm','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0638','ko','Destination','Destination','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0639','ko','Source','Source','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0640','ko','Agent 설치 위치','Agent 설치 위치','U0001','2019-03-25','U0001','2019-05-14'),('CMS','COL','C0641','ko','삭제할 {0} 연결을 선택하세요.','삭제할 {0} 연결을 선택하세요.','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0642','ko','{0} 연결({1})을 삭제하시겠습니까?','{0} 연결({1})을 삭제하시겠습니까?','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0643','ko','Source VID','Source VID','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0644','ko','Destination VID','Destination VID','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0645','ko','동작 모드','Role','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0646','ko','Q key Store 정보','Q key Store 정보','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0647','ko','Max Key Count','Max Key Count','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0648','ko','Max Key Count Per Request','Max Key Count Per Request','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0649','ko','Max Key Size','Max Key Size','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0650','ko','bit','bit','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0651','ko','Min Store Rate','Min Store Rate','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0652','ko','Default Key Size','Default Key Size','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0653','ko','Key Request Interval','Key Request Interval','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0654','ko','mSec.','mSec.','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0655','ko','Min Key Size','Min Key Size','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0656','ko','Maj Store Rate','Maj Store Rate','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0657','ko','Crt Store Rate','Crt Store Rate','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0658','ko','Consumer 역할','Consumer 역할','U0001','2019-03-25','U0001','2019-06-26'),('CMS','COL','C0659','ko','VID','VID','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0660','ko','Address','Address','U0001','2019-03-25','U0001','2019-05-15'),('CMS','COL','C0661','ko','Key Type','Key Type','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0662','ko','보안 정보','보안 정보','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0663','ko','PSK','PSK','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0664','ko','Consumer Key Store 정보','Consumer Key Store 정보','U0001','2019-03-25','U0001','2019-03-25'),('CMS','COL','C0665','ko','1순위 경로','1순위 경로','U0001','2019-03-26','U0001','2019-04-17'),('CMS','COL','C0666','ko','2순위 경로','2순위 경로','U0001','2019-03-26','U0001','2019-04-17'),('CMS','COL','C0667','ko','배포일시','배포일시','U0001','2019-03-26','U0001','2019-03-26'),('CMS','MSG','A0231','ko','인증서 파일 업로드 중 에러가 발생했습니다.','인증서 파일 업로드 중 에러가 발생했습니다.','U0001','2019-03-26','U0001','2019-03-26'),('CMS','COL','C0668','ko','경로 생성','경로 생성','U0001','2019-03-26','U0001','2019-03-26'),('CMS','COL','C0669','ko','신규','신규','U0001','2019-03-27','U0001','2019-03-27'),('CMS','COL','C0670','ko','이력','이력','U0001','2019-03-27','U0001','2019-03-27'),('CMS','MSG','A0232','ko','목록에서 연결을 먼저 선택해주세요','목록에서 연결을 먼저 선택해주세요','U0001','2019-03-27','U0001','2019-03-27'),('CMS','MSG','A0233','ko','마스터 경로는 반드시 선택해야합니다.','마스터 경로는 반드시 선택해야합니다.','U0001','2019-03-27','U0001','2019-03-27'),('CMS','MSG','A0234','ko','이미 경로가 모두 선택되었습니다. 선택된 경로 체크 해제후 다시 선택해주세요','이미 경로가 모두 선택되었습니다. 선택된 경로 체크 해제후 다시 선택해주세요','U0001','2019-03-27','U0001','2019-03-27'),('CMS','MSG','A0235','ko','이미 같은 경로가 선택되었습니다.다른 경로를 선택하거나 선택된 경로를 체크 해제해주세요','이미 같은 경로가 선택되었습니다.다른 경로를 선택하거나 선택된 경로를 체크 해제해주세요','U0001','2019-03-27','U0001','2019-03-27'),('CMS','COL','C0671','ko','사용중인 {0} 연결을 삭제할 수 없습니다.','사용중인 {0} 연결을 삭제할 수 없습니다.','U0001','2019-03-27','U0001','2019-03-27'),('CMS','MSG','A0236','ko','전체 경로를 재생성 하시겠습니까?','전체 경로를 재생성 하시겠습니까?','U0001','2019-03-28','U0001','2019-03-28'),('CMS','COL','C0672','ko','동일한 이름의 {0}가 존재합니다.','동일한 이름의 {0}가 존재합니다.','U0001','2019-04-01','U0001','2019-04-01'),('CMS','MSG','A0237','ko','님 께서 로그인 하셨습니다.','님 께서 로그인 하셨습니다.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','COL','C0794','ko','App Name','App Name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0238','ko','이 필드값은 필수입니다.','이 필드값은 필수입니다.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0239','ko','이 항목을 수정하여주십시오.','이 항목을 수정하여주십시오.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0240','ko','유효한 이메일 주소를 입력하세요.','유효한 이메일 주소를 입력하세요.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0241','ko','유효한 URL을 입력 해주세요.','유효한 URL을 입력 해주세요.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0242','ko','유효한 날짜를 입력하십시오.','유효한 날짜를 입력하십시오.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0243','ko','올바른 숫자를 입력하십시오.','올바른 숫자를 입력하십시오.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0245','ko','IP주소를 입력해주세요.','IP주소를 입력해주세요.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0244','ko','IP 형식이 올바르지 않습니다.','IP 형식이 올바르지 않습니다.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','COL','C0673','ko','KMS','KMS','U0001','2019-04-09','U0001','2019-04-09'),('CMS','COL','C0674','ko','KMS 연결 인터페이스','KMS 연결 인터페이스','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0246','ko','수정할 항목은 하나만 선택해주세요.','수정할 항목은 하나만 선택해주세요.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0247','ko','수정할 항목을 선택해주세요.','수정할 항목을 선택해주세요.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','MSG','A0248','ko','{0} Protocol ID 를 입력해주세요.','{0} Protocol ID 를 입력해주세요.','U0001','2019-04-09','U0001','2019-04-09'),('CMS','COL','C0675','ko','KMS를 선택해주세요','KMS를 선택해주세요','U0001','2019-04-11','U0001','2019-04-11'),('CMS','COL','C0676','ko','현재 사용중인 {0} 인터페이스가 포함되어 있습니다.','현재 사용중인 {0} 인터페이스가 포함되어 있습니다.','U0001','2019-04-11','U0001','2019-04-11'),('CMS','COL','C0677','ko','Consumer 이름','Consumer 이름','U0001','2019-04-11','U0001','2019-04-11'),('CMS','COL','C0678','ko','Subject DN','Subject DN','U0001','2019-04-11','U0001','2019-04-11'),('CMS','COL','C0679','ko','사용중인 인터페이스를 삭제할 수 없습니다.','사용중인 인터페이스를 삭제할 수 없습니다.','U0001','2019-04-11','U0001','2019-04-11'),('CMS','COL','C0680','ko','Consumer Address 정보','Consumer Address 정보','U0001','2019-04-11','U0001','2019-05-14'),('CMS','COL','C0681','ko','KMS SNMP','KMS SNMP','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0682','ko','인증','인증','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0683','ko','Privacy','Privacy','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0684','ko','SNMP Port','SNMP Port','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0685','ko','NE IP','NE IP','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0686','ko','NE Security명','NE Security명','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0687','ko','인증 비밀번호','인증 비밀번호','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0688','ko','Privacy 비밀번호','Privacy 비밀번호','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0689','ko','Element 이름','Element 이름','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0690','ko','Process  이름','Process  이름','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0691','ko','Element Type','Element Type','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0692','ko','Status','Status','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0693','ko','Rate','Rate','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0694','ko','Reply Timeout','Reply Timeout','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0695','ko','Keep Alive','Keep Alive','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0696','ko','해당 Process {0} 하시겠습니까?','해당 Process {0} 하시겠습니까?','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0697','ko','작업을 수행할 Process를 선택해주세요','작업을 수행할 Process를 선택해주세요','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0698','ko','상태 update','상태 update','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0699','ko','NOKIA SMS SNMP Info','Consumer SNMP','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0700','ko','{0}가 {1} 보다 클 수 없습니다.','{0}가 {1} 보다 클 수 없습니다.','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0701','ko','연결','연결','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0702','ko','App 이름','App 이름','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0703','ko','확인 여부','확인 여부','U0001','2019-04-15','U0001','2019-04-15'),('CMS','COL','C0704','ko','Source와 Destination이 동일할 수 없습니다.','Source와 Destination이 동일할 수 없습니다.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0705','ko','경로정보','경로정보','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0706','ko','경로를 가져오는데 실패했습니다. 연결이름이 모두 존재하는지 확인해주세요.','경로를 가져오는데 실패했습니다. 연결이름이 모두 존재하는지 확인해주세요.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0707','ko','현재 노드 위치를 저장하시겠습니까?','현재 노드 위치를 저장하시겠습니까?','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0708','ko','Group','Group','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0709','ko','정상 KMS','정상 KMS','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0710','ko','끊어진 KMS','끊어진 KMS','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0711','ko','경고상태 KMS','경고상태 KMS','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0712','ko','Provider','Provider','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0713','ko','Consumer','Consumer','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0714','ko','서버 Version','서버 Version','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0715','ko','사용자접속 시간','사용자접속 시간','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0716','ko','시스템 시간','시스템 시간','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0717','ko','갱신주기','갱신주기','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0718','ko','초','초','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0719','ko','완료 여부','완료 여부','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0720','ko','Element ID','Element ID','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0721','ko','버전','버전','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0722','ko','버전 조회','버전 조회','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0723','ko','배포 ID','배포 ID','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0724','ko','배포시작일시','배포시작일시','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0725','ko','파일 버전','파일 버전','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0726','ko','다운로드 단위','다운로드 단위','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0727','ko','다운로드 간격(분)','다운로드 간격(분)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0728','ko','배포할 파일을 업로드 후에 배포해주세요.','배포할 파일을 업로드 후에 배포해주세요.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0729','ko','배포할 항목을 선택해주세요.','배포할 항목을 선택해주세요.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0730','ko','선택 항목을 배포하시겠습니까?','선택 항목을 배포하시겠습니까?','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0731','ko','배포시작 시간은 현재 시각 이후여야 합니다.','배포시작 시간은 현재 시각 이후여야 합니다.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0732','ko','대상목록을 선택해주세요.','대상목록을 선택해주세요.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0733','ko','배포 대상목록 중 Process가 일치하지 않는 항목이 있습니다.','배포 대상목록 중 Process가 일치하지 않는 항목이 있습니다.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0734','ko','Process','Process','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0735','ko','파일','파일','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0736','ko','다운로드단위(KMS)','다운로드단위(KMS)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0737','ko','다운로드간격(분)','다운로드간격(분)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0738','ko','다운로드간격(분)','다운로드간격(분)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0739','ko','대상목록','대상목록','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0740','ko','Process를 먼저 선택해주세요.','Process를 먼저 선택해주세요.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0741','ko','Process 리스트','Process 리스트','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0742','ko','동일한 프로세스가 존재합니다.','동일한 프로세스가 존재합니다.','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0743','ko','SYS NAME','SYS NAME(dup)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0744','ko','Key Request 시도 건수','Key Request 시도 건수','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0745','ko','Key Request 성공 건수','Key Request 성공 건수','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0746','ko','Key Sync 시도 건수','Key Sync 시도 건수','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0747','ko','Key Sync 성공 건수','Key Sync 성공 건수','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0748','ko','Overload 거부건수','Overload 거부건수','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0749','ko','Key Request Timeout','Key Request Timeout','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0750','ko','Key Sync Timeout','Key Sync Timeout','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0751','ko','Auth 실패','Auth 실패','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0752','ko','기타 실패','기타 실패','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0753','ko','KMS 연결 설정','KMS 연결 설정','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0754','ko','HMAC 사용여부','KMS 인터페이스 HMAC 사용여부','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0755','ko','HMAC Key','HMAC Key','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0756','ko','KEMS 기본 키쌍(.p12)','KMS 접속 Admin 기본 인증서','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0757','ko','KEMS 키쌍','KEMS 인증서','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0758','ko','경보 로그 보관일(일)','경보 로그 보관일(일)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0759','ko','이벤트 로그 보관일(일)','이벤트 로그 보관일(일)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0760','ko','감사 로그 보관일(일)','감사 로그 보관일(일)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0761','ko','감사 로그 폴링 간격(분)','감사 로그 폴링 간격(분)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0762','ko','통계 로그 보관일(일)','통계 로그 보관일(일)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0763','ko','통계 로그 폴링 간격(분)','통계 로그 폴링 간격(분)','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0764','ko','로그인','로그인','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0765','ko','로고 이미지','로고 이미지','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0766','ko','배경 이미지','배경 이미지','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0767','ko','문구','문구','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0768','ko','대시보드','대시보드','U0001','2019-04-16','U0001','2019-04-16'),('CMS','COL','C0769','ko','종류','종류','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0770','ko','발생코드','발생코드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0771','ko','해제코드','해제코드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0772','ko','경보를 선택해주세요','경보를 선택해주세요','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0773','ko','이벤트코드','이벤트코드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0774','ko','이벤트를 선택해주세요','이벤트를 선택해주세요','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0775','ko','메세지 엑셀 업로드','메세지 엑셀 업로드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0776','ko','확장명이 올바르지 않습니다.','확장명이 올바르지 않습니다.','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0777','ko','파일이 업로드 되지 않았습니다.','파일이 업로드 되지 않았습니다.','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0778','ko','최대사이즈를 초과하였습니다.','최대사이즈를 초과하였습니다.','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0779','ko','추가하려는 코드의 상위 코드 그룹이 존재하지 않습니다.','추가하려는 코드의 상위 코드 그룹이 존재하지 않습니다.','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0780','ko','코드 그룹 추가후에 다시 시도해주십시오.','코드 그룹 추가후에 다시 시도해주십시오.','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0781','ko','코드 그룹 엑셀 업로드','코드 그룹 엑셀 업로드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0782','ko','엑셀 업로드','엑셀 업로드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0783','ko','엑셀 다운로드','엑셀 다운로드','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0784','ko','- 파일(.xlsx)만 등록할 수 있습니다.','- 파일(.xlsx)만 등록할 수 있습니다.','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0785','ko','엑셀파일','엑셀파일','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0786','ko','ID_ROLE','ID_ROLE','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0787','ko','권한명','권한명','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0788','ko','메뉴명 (조회, 등록/수정)','메뉴명 (조회, 등록/수정)','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0789','ko','권한그룹 수정','권한그룹 수정','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0790','ko','권한그룹 등록','권한그룹 등록','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0791','ko','권한그룹','권한그룹','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0792','ko','메뉴권한','메뉴권한','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0793','ko','등록/수정','등록/수정','U0001','2019-04-17','U0001','2019-04-17'),('CMS','COL','C0516','en','D.O.W time(Sun)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0517','en','day start/end','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0518','en','day time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0519','en','Mon','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0520','en','Tue','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0521','en','Wed','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0522','en','Thu','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0523','en','Fri','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0524','en','Sat','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0545','en','Code Group Name','Code Group Name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0546','en','Registed Date','Registed Date','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0547','en','Register Code','en','U0001','2019-04-18','U0001','2019-07-18'),('CMS','COL','C0548','en','code group registration','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0549','en','code group modification','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0550','en','code registration','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0551','en','code modification','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0552','en','code group management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0553','en','Author','Author','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0554','en','Created Date','Created Date','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0555','en','Category','Category','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0556','en','Name','Name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0557','en','name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0558','en','permission','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0559','en','stopped?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0560','en','change by admin','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0562','en','E-Mail','E-Mail','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0563','en','Mobile Phone Number','Mobile Phone Number','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0564','en','Permission','Permission','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0565','en','Note','Note','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0566','en','memo','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0567','en','Menu Tree','Menu Tree','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0568','en','menu tree','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0569','en','Menu ID','Menu ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0570','en','URL','URL','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0571','en','Path','Path','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0572','en','Menu Icon','Menu Icon','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0573','en','Icons','Icons','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0574','en','Menu descriptions','Menu descriptions','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0575','en','menu description','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0576','en','Button','Button','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0577','en','Message','Message','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0578','en','Column','Column','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0579','en','column','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0580','en','Element name','Element name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0581','en','Released time','Released time','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0582','en','Status','Status','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0584','en','Add Column','Add Column','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0585','en','Message management','Message management','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0586','en','Code donwload for each language','Code donwload for each language','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0587','en','Message donwload for each language','Message donwload for each language','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0588','en','Description','Message description','U0001','2019-04-18','U0001','2019-07-18'),('CMS','COL','C0589','en','description','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0590','en','Internal Broker Port','Internal Broker Port','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0591','en','External Broker Port','External Broker Port','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0592','en','Admin Broker Port','Admin Broker Port','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0593','en','admin broker port','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0594','en','select {0} to delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0595','en','delete the selected group?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0596','en','delete the selected {0}?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0597','en','Interface','Interface','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0598','en','Basic information','Basic information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0599','en','Detail information','Detail information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0600','en','Session name','Session name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0601','en','Occurred time','Occurred time','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0602','en','Path ID','Path ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0603','en','path ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0604','en','Use only active nodes, creating the path.','경로생성시 활성화된 엘리먼트만 사용','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0605','en','Session ID','Session ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0606','en','Link name','Link name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0607','en','Weight','Weight','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0608','en','X.509 Certificate','X.509 Certificate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0609','en','certificate','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0610','en','Severity','Severity','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0611','en','Occurred time','Occurred time','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0612','en','Released time','Released time','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0613','en','Input the value','Input the value','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0614','en','KMS name','KMS name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0615','en','KMS ID','KMS ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0616','en','Network Interface List','Network Interface List','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0617','en','Consumer Connection Port Information','Consumer Connection Port Information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0618','en','Agent Comm Port','Consumer interfacing Port','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0619','en','Agent interfacing Port','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0620','en','IP Address','IP Address','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0621','en','Provider ID','Provider ID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0622','en','Provider Name','Provider 이름','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0623','en','Vendor','Vendor','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0624','en','KMS VID','KMS VID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0625','en','KMS Address','KMS Address','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0626','en','Provider Address','Provider Address','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0627','en','APP','APP','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0628','en','Please add protocol interface.','Protocol 인터페이스를 추가해주세요.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0629','en','Provider Address Information','Provider Address Information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0630','en','Provider Address Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0631','en','Register network interface','Register network interface','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0632','en','Delete network interface','Delete network interface','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0633','en','Delete Sys Interface','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0634','en','Register Address','Address 등록','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0635','en','Delete Address','Delete Address','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0636','en','Modify Address','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0637','en','Algorithm','Algorithm','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0638','en','Destination','Destination','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0639','en','Source','Source','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0640','en','Agent Location','Agent 설치 위치','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0641','en','Select {0} to delete.','삭제할 {0} 연결을 선택하세요.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0642','en','Select {0} to delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0643','en','Source VID','Source VID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0644','en','Destination VID','Destination VID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0645','en','Operational Mode','Operational Mode','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0646','en','Q key Store Info','Q key Store Info','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0647','en','Max Key Count','Max Key Count','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0648','en','Max Key Count Per Request','Max Key Count Per Request','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0649','en','Max Key Size','Max Key Size','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0650','en','bit','bit','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0651','en','Min Store Rate','Min Store Rate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0652','en','Default Key Size','Default Key Size','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0653','en','Key Request Interval','Key Request Interval','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0654','en','mSec.','mSec.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0655','en','Min Key Size','Min Key Size','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0656','en','Maj Store Rate','Maj Store Rate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0657','en','Crt Store Rate','Crt Store Rate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0658','en','Consumer Role','Consumer Role','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0659','en','VID','VID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0660','en','Address','Address','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0661','en','Key Type','Key Type','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0662','en','Security Information','Security Information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0663','en','PSK','Pre-shared Key','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0664','en','Consumer Key Store Information','Consumer Key Store Information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0665','en','Primary path','Primary path','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0666','en','Secondary path','Secondary path','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0667','en','Distributed Date','Distributed Date','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0668','en','Create the path','경로 생성','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0669','en','New','New(dup)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0670','en','History','이력 History','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0671','en','History','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0672','en','Can\'t delete {0} in use','en','U0001','2019-04-18','U0001','2019-07-02'),('CMS','COL','C0673','en','KMS','KMS','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0674','en','IP for KMS connection','IP for KMS connection','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0675','en','Select KMS','Select KMS','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0676','en','Select KMS','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0677','en','Consumer Name','Consumer Name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0678','en','Subject DN','Subject DN','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0679','en','Subject DN','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0680','en','Consumer Address Info','Consumer Address Info','U0001','2019-04-18','U0001','2019-07-02'),('CMS','COL','C0681','en','KMS SNMP','KMS SNMP','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0682','en','Authentication','Authentication','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0683','en','Privacy','Privacy','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0684','en','SNMP Port','SNMP Port','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0685','en','NE IP','NE IP','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0686','en','NE Sec. Name','NE Sec. Name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0687','en','Auth Password','Auth Password','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0688','en','Privacy Password','Privacy Password','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0689','en','Element name','Element name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0690','en','Process name','Process name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0691','en','Element Type','Element Type','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0692','en','Status','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0693','en','Rate','Rate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0694','en','Reply Timeout','Reply Timeout','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0695','en','Keep Alive','Keep Alive','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0696','en','Keep Alive','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0697','en','Delete the Process {0}?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0698','en','Status update','Status update','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0699','en','NOKIA SMS SNMP Info','Consumer SNMP','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0700','en','{0} can not be greater than  {1}','{0}가 {1} 보다 클 수 없습니다.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0701','en','Connection','Connection','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0702','en','App name','App name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0703','en','Acknowledgement','Acknowledgement','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0704','en','It can not be the same Source and Destination.','It can not be the same Source and Destination.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0705','en','Route Information','Route Information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0706','en','Path Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0707','en','Failed to retrieve path. Check the link name.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0708','en','Group','Group','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0709','en','Normal KMS','Normal KMS','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0710','en','Disconnected KMS','Disconnected KMS','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0711','en','Alarmed KMS','Alarmed KMS','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0712','en','Provider','Provider','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0713','en','Consumer','Consumer','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0714','en','Server version','Server version','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0715','en','Server Version','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0716','en','System time','System time','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0717','en','Refresh interval','Refresh interval','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0718','en','Sec','Second','U0001','2019-04-18','U0001','2019-06-24'),('CMS','COL','C0719','en','Complete status','Complete status','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0720','en','Completed','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0721','en','Element ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0722','en','Version','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0723','en','Version Check','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0724','en','Distribution Date','Distribution Date','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0725','en','File version','File version','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0726','en','Download Unit','Download Unit','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0727','en','Download Interval(min.)','Download Interval(min.)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0728','en','Download Interval(min)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0729','en','Upload and Deploy File','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0730','en','Select Items to deploy','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0731','en','Deploy the Item?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0732','en','Deploy time must be later than current time','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0733','en','Select targets','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0734','en','Process','Process','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0735','en','File','File','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0736','en','Download Unit(KMS)','Download Unit(KMS)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0737','en','Download Size(KMS)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0738','en','Download Interval(min)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0739','en','Distribution List','Distribution List','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0740','en','Targets','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0741','en','Select Process','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0742','en','Process List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0743','en','SYS NAME','SYS NAME','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0744','en','Key Request Attempt','Key Request Attempt','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0745','en','Key Request Success','Key Request Success','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0746','en','Key Sync Attempt','Key Sync Attempt','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0747','en','Key Sync Success','Key Sync Success','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0748','en','Overload Reject','Overload Reject','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0749','en','Key Request Timeout','Key Request Timeout','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0750','en','Key Sync Timeout','Key Sync Timeout','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0751','en','Auth Fail','Auth Fail','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0752','en','ETC Fail','ETC Fail','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0753','en','KMS Connection Setup','KMS Connection Setup','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0754','en','HMAC On/Off','HMAC Usage for KMS interface','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0755','en','HMAC Key','HMAC Key','U0001','2019-04-18','U0001','2019-06-24'),('CMS','COL','C0756','en','Default KEMS Key pair(.p12)','Default KEMS Certificate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0757','en','KEMS Key pair','KEMS Certificate','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0758','en','Alert Log Retention(days)','Alert Log Retention(days)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0759','en','Event Log Retention(days)','Event Log Retention(days)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0760','en','Audit Log Retention(days)','Audit Log Retention(days)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0761','en','Audit Log Polling Interval(Min.)','Audit Log Polling Interval(Min.)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0762','en','Statistics Log Retention(days)','Statistics Log Retention(days)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0763','en','Statistics Log Polling Interval(Min.)','Statistics Log Polling Interval(Min.)','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0764','en','Login','Login','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0765','en','Login','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0766','en','Background Image','Background Image','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0767','en','Login Banner','Login Banner','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0768','en','Dashboard','Dashboard','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0769','en','Type','Type','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0770','en','Occurred Code','Occurred Code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0771','en','Release Code','Release Code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0772','en','Select the alert','Select the alert','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0773','en','Select Alert','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0774','en','Event Code','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0775','en','Select Event','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0776','en','Upload Message File(xlsx)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0777','en','File Extension Incorrect','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0778','en','Upload Fail','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0779','en','Exceeded Max Size','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0780','en','No parent group for code to add','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0781','en','Retry after adding code group','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0782','en','Upload Code Group(xlsx)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0783','en','Download code group(xlsx)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0784','en','Download(xlsx)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0785','en','Excel(.xlsx) Only','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0786','en','Excel File','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0787','en','ID_ROME','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0788','en','Permission Name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0789','en','Menu Name(Lookup, Add/Change)','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0790','en','Permission Group Change','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0791','en','Permission Group Add','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0792','en','Permission Group','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0793','en','Menu Permission','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0794','en','App Name','App Name','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0795','en','SYS NAME','SYS NAME','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0796','en','Target VID','Target VID','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0797','en','Type','Type','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0798','en','Result Code','Result Code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0799','en','Path','Path','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0800','en','Version','Version','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0801','en','Distribution Status','Distribution Status','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','N0045','en','Message description','Message description','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0034','en','Deploy File Name','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0035','en','SW Deploy','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0036','en','Pending','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0037','en','Select KMS','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0039','en','Select group to delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0040','en','Group exists','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0042','en','Processed','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0043','en','Deploy all paths?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0045','en','Deploy requested','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0046','en','Deploy path?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0047','en','Menu contents','Menu contents','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0048','en','Code group name < maxlength','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0052','en','Code group < maxlength','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0062','en','Sorting order < maxlength','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0063','en','Code duplicated','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0064','en','Save Fail','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0068','en','Information Upload Fail','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0069','en','Logo background Upload Fail','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0070','en','Certificate Upload Fail','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0071','en','Change','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0072','en','Log','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0073','en','Select Alerts to Ack','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0074','en','Enter ID of','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0075','en','Enter in format 0.0.0','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0076','en','Enter valid date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0077','en','Code group','Code group','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0078','en','Type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0079','en','Address','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0080','en','Consumer Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0081','en','Provider Connection Port Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0082','en','Provider Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0083','en','KMS Connection Port Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0084','en','KEMS Comm Port','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0085','en','Peer KMS Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0086','en','KMS Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0087','en','Link Type','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0088','en','Message Add','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0089','en','Message Change','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0090','en','Message Description','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0091','en','Menu Manage','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0092','en','Menu Name Manage','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0093','en','Menu Name Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0094','en','Menu Name List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0095','en','Menu Creation History Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0096','en','Menu Creation List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0097','en','Menu Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0098','en','Menu List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0099','en','Menu Move Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0100','en','Menu Name Change','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0101','en','Menu Items Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0102','en','Menu Add','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0103','en','Menu Approve Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0104','en','Task Management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0105','en','Task Info Management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0109','en','Task Info Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0115','en','System Management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0116','en','Criteria Management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0124','en','Default Setting','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0131','en','Lang & Log Setting','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0132','en','Menu Setting','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0133','en','Menu List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0134','en','Menu Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0135','en','Common Codes','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0136','en','Code Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0146','en','Code Group','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0162','en','Code Group Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0163','en','Code List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0164','en','Common Messages','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0165','en','Message Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0167','en','Message List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0168','en','Company Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0169','en','Company List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0172','en','Dept. Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0175','en','Log Status','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0184','en','Log Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0185','en','Log Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0186','en','Log Group','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0187','en','Permission Control','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0188','en','User Management','User Management','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0192','en','Notice Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0193','en','Notice List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0194','en','User Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0195','en','User List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0196','en','User Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0197','en','Group List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0198','en','Group Info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','T0199','en','Permission Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0001','en','Only number can be inputed','Only number can be inputed','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0002','en','Invalid format','Invalid format','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0003','en','Input value','Input value','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0004','en','Select choice','Select choice','U0001','2019-04-18','U0001','2019-06-24'),('CMS','MSG','A0005','en','Will you save it?','Will you save it?','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0006','en','Input 8 digit number only','Input 8 digit number only','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0007','en','Saved','Saved','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0008','en','Month info is not correct.','Month info is not correct.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0009','en','Date info is not correct.','Date info is not correct.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0010','en','There is duplicated data.','There is duplicated data.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0011','en','Out of search range','Out of search range','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0012','en','Search range is incorrect.','Search range is incorrect.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0037','en','Process completed.','Process completed.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0038','en','Errors are occurred under processing.','Errors are occurred under processing.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0043','en','Select the files to add.','Select the files to add.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0045','en','Check the duplication of ID.','Check the duplication of ID.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0047','en','Confirm to add?','Confirm to add?','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0048','en','Confirm to delete?','Confirm to delete?','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0054','en','Device Management','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0055','en','Device List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0056','en','Auto Creation List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0057','en','confirm to change','confirm to change','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0059','en','Multi Lang Info Lookup','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0075','en','Do you initialize the data?','Do you initialize the data?','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0076','en','Input the error code.','Input the error code.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0079','en','It is available ID.','It is available ID.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0080','en','This ID is already used.','This ID is already used.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0082','en','Select Printing Option','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0083','en','The errors are occurred.','The errors are occurred.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0084','en','Retry again.','Retry again.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0085','en','Password and password verification is not the same','Password and password verification is not the same','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0087','en','Confirm the request.','Confirm the request.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0091','en','It can not be the end date is earlier than the sta','It can not be the end date is earlier than the sta','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0094','en','The menu already exist.','The menu already exist.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0205','en','Reloaded the cached code','Reloaded the cached code','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0206','en','Code group already exist.','Code group already exist.','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0207','en','City/Province','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0208','en','Gu/Gun','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0209','en','Dong/Myun','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0210','en','Password saved','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0211','en','Select menu to add','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0212','en','Failed to retrieve data','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0213','en','Enter search word','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0214','en','tset','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0215','en','Select menu to assign permission to.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0216','en','Error occurred. Retry','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0217','en','List','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0218','en','Information','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0219','en','Lookup start date must be less than or equl to end date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0220','en','Select lookup start date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0221','en','Select lookup end date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0222','en','Select interface','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0223','en','Select a item to delete','Select a item to delete','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0224','en','Duplicate Sys interface IP','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0225','en','Select {0} info','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0226','en','Can\'t delete {0} in active connection','en','U0001','2019-04-18','U0001','2019-07-02'),('CMS','MSG','A0227','en','Failed to delete','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0228','en','Add Sys Interface','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0229','en','Authentication Info','Authentication Information','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0230','en','KMS Unique ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0231','en','Error while uploading certificate','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0232','en','Select link first','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0233','en','Master path must be selected','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0234','en','All paths are selected. Uncheck and retry.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0235','en','Same path is selected. Choose another or uncheck.','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0236','en','Recreate all paths?','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0237','en','logged in','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0238','en','This field is mandatory','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0239','en','Correct the field','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0240','en','Enter valid email','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0241','en','Enter valid URL','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0242','en','Enter valid date','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0243','en','Enter valid number','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0244','en','Invalid IP address','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0245','en','Enter IP address','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0246','en','Select one item for change','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0247','en','Select a item to modify','Select a item to modify','U0001','2019-04-18','U0001','2019-04-18'),('CMS','MSG','A0248','en','Enter {0} Protocol ID','en','U0001','2019-04-18','U0001','2019-04-18'),('CMS','COL','C0802','ko','배포 파일명','배포 파일명','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0803','ko','SW 배포','SW 배포','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0804','ko','대기','대기','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0805','ko','KMS 선택','KMS 선택','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0806','ko','삭제할 그룹을 선택하세요','삭제할 그룹을 선택하세요','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0807','ko','이미 존재하는 그룹입니다.','이미 존재하는 그룹입니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0808','ko','처리되었습니다.','처리되었습니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0809','ko','전체 경로를 배포 하시겠습니까?','전체 경로를 배포 하시겠습니까?','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0810','ko','배포요청이 완료되었습니다.','배포요청이 완료되었습니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0811','ko','경로를 배포 하시겠습니까?','경로를 배포 하시겠습니까?','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0812','ko','제목은 maxlength 이하 이어야합니다.','제목은 maxlength 이하 이어야합니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0813','ko','코드그룹명은 maxlength 이하 이어야합니다.','코드그룹명은 maxlength 이하 이어야합니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0814','ko','코드그룹은 maxlength 이하 이어야합니다.','코드그룹은 maxlength 이하 이어야합니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0815','ko','정렬순서는 maxlength 이하 이어야합니다.','정렬순서는 maxlength 이하 이어야합니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0816','ko','동일한 코드가 존재합니다.','동일한 코드가 존재합니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0817','ko','저장에 실패해였습니다.','저장에 실패해였습니다.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0818','ko','기타정보 업로드 실패','기타정보 업로드 실패','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0819','ko','로고 배경 업로드 실패.','로고 배경 업로드 실패.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0820','ko','cert file 업로드 실패.','cert file 업로드 실패.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0821','ko','변경','변경','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0822','ko','로그','로그','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0823','ko','처리완료할 알림을 선택해 주세요.','처리완료할 알림을 선택해 주세요.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0824','ko','의 아이디를 넣어주세요','의 아이디를 넣어주세요','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','C0825','ko','0.0.0 형식으로 입력해주세요.','0.0.0 형식으로 입력해주세요.','U0001','2019-04-19','U0001','2019-04-19'),('CMS','COL','1','ko','신규2','신규2','U0001','2019-04-23','U0001','2019-04-23'),('CMS','MSG','1','ko','신규2','신규2','U0001','2019-04-23','U0001','2019-04-23'),('CMS','MSG','A0249','ko','서버 에러가 발생하였습니다. \\n 자세한 내용은 에러 로그를 확인하세요','서버 에러가 발생하였습니다. \\n 자세한 내용은 에러 로그를 확인하세요','U0001','2019-04-24','U0001','2019-04-24'),('CMS','MSG','A0250','ko','페이지를 찾을 수 없습니다.','페이지를 찾을 수 없습니다.','U0001','2019-04-24','U0001','2019-04-24'),('CMS','MSG','A0255','ko','올바른 이메일 주소를 입력하세요.','올바른 이메일 주소를 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0253','ko','필수 입력란입니다.','필수 입력란입니다.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0254','ko','이 필드를 수정하세요.','이 필드를 수정하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0251','ko','권한이 없습니다. \\n 관리자에게 문의해주세요.','권한이 없습니다. \\n 관리자에게 문의해주세요.','U0001','2019-04-24','U0001','2019-04-24'),('CMS','MSG','A0252','ko','권한이 없습니다. 로그인 페이지로 이동합니다.','권한이 없습니다. 로그인 페이지로 이동합니다.','U0001','2019-04-24','U0001','2019-04-24'),('CMS','MSG','A0256','ko','올바른 URL을 입력하세요.','올바른 URL을 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','COL','C0827','ko','유효한 날짜를 입력하세요.','유효한 날짜를 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0257','ko','유효한 날짜를 입력하세요.','유효한 날짜를 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0258','ko','유효한 날짜 (ISO)를 입력하세요.','유효한 날짜 (ISO)를 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0259','ko','유효한 번호를 입력하세요.','유효한 번호를 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0260','ko','숫자만 입력하세요.','숫자만 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0261','ko','유효한 신용 카드 번호를 입력하세요.','유효한 신용 카드 번호를 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0262','ko','동일한 값을 다시 입력하세요.','동일한 값을 다시 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0263','ko','{0} 자 이상을 입력하세요.','{0} 자 이상을 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0264','ko','적어도 {0} 자 이상 입력하세요.','적어도 {0} 자 이상 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0265','ko','{0} ~ {1} 자 사이의 값을 입력하세요.','{0} ~ {1} 자 사이의 값을 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0266','ko','{0} ~ {1} 사이의 값을 입력하세요.','{0} ~ {1} 사이의 값을 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0267','ko','{0}보다 작거나 같은 값을 입력하세요.','{0}보다 작거나 같은 값을 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','MSG','A0268','ko','{0}보다 크거나 같은 값을 입력하세요.','{0}보다 크거나 같은 값을 입력하세요.','U0001','2019-04-25','U0001','2019-04-25'),('CMS','COL','C0828','ko','Process','Process','U0001','2019-04-29','U0001','2019-04-29'),('CMS','COL','C0829','ko','Type','Type','U0001','2019-04-29','U0001','2019-04-29'),('CMS','COL','C0830','ko','Address','Address','U0001','2019-05-14','U0001','2019-05-14'),('CMS','COL','C0831','ko','Consumer 정보','Consumer 정보','U0001','2019-05-14','U0001','2019-05-14'),('CMS','COL','C0832','ko','Provider 연결 Port 정보','Provider 연결 Port 정보','U0001','2019-05-14','U0001','2019-05-14'),('CMS','COL','C0833','ko','Provider 정보','Provider 정보','U0001','2019-05-14','U0001','2019-05-14'),('CMS','COL','C0834','ko','KMS 연결 Port 정보','KMS 연결 Port 정보','U0001','2019-05-14','U0001','2019-05-14'),('CMS','COL','C0835','ko','KEMS 통신 포트','KEMS 통신 포트','U0001','2019-05-14','U0001','2019-05-14'),('CMS','COL','C0836','ko','연결 KMS 정보','연결 KMS 정보','U0001','2019-05-15','U0001','2019-05-15'),('CMS','COL','C0837','ko','KMS 정보','KMS 정보','U0001','2019-05-15','U0001','2019-05-15'),('CMS','COL','C0838','ko','Link Type','Link Type','U0001','2019-05-20','U0001','2019-05-20'),('CMS','MSG','A0268','en','Enter value greater than or equal to {0}.','en','U0001','2019-05-22','U0001','2019-05-22'),('CMS','COL','C0839','ko','메시지 등록','메시지 등록','U0001','2019-05-27','U0001','2019-05-27'),('CMS','COL','C0840','ko','메시지 수정','메시지 수정','U0001','2019-05-27','U0001','2019-05-27'),('CMS','MSG','A0249','en','Server error. Check log for details.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0250','en','Page not found','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0251','en','Permission not granted.\\nAsk administrator.','Permission not granted.\\nAsk administrator.','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0252','en','Permission not granted.\\nMove to login page.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0253','en','Mandatory field.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0254','en','Correct this field.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0255','en','Enter valid email.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0256','en','Enter valid URL.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0257','en','Enter valid date.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0258','en','Enter valid date(ISO).','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0259','en','Enter valid number.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0260','en','Number only.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0261','en','Enter valid credit card number.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0262','en','Enter same value again.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0263','en','Enter more than {0} characters.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0264','en','Enter more than {0} characters.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0265','en','Enter {0} ~ {1} characters.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0266','en','Enter value between {0} and {1}.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','MSG','A0267','en','Enter value less than or equal to {0}.','en','U0001','2019-06-21','U0001','2019-06-21'),('CMS','COL','C0837','en','KMS Information','KMS Information','U0001','2019-06-26','U0001','2019-06-26'),('CMS','COL','C0835','en','KEMS Comm Port','KEMS Comm Port','U0001','2019-06-26','U0001','2019-06-26'),('CMS','COL','C0844','ko','기본 인증서','기본 인증서','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0822','en','Log','Log','U0001','2019-06-26','U0001','2019-06-26'),('CMS','COL','C0840','en','Message Modify','Message Modify','U0001','2019-06-26','U0001','2019-06-26'),('CMS','MSG','1','en','New','New','U0001','2019-06-26','U0001','2019-06-26'),('CMS','COL','C0841','ko','K to K','K to K','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0841','en','K to K','K to K','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0842','ko','P to P','P to P','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0843','ko','C to C','C to C','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0842','en','P to P','P to P','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0843','en','C to C','C to C','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0844','en','Default KEMS Key pair','Default KEMS Key pair','U0001','2019-07-02','U0001','2019-07-02'),('CMS','BTN','219','ko','인증서 선택','인증서 선택','U0001','2019-07-02','U0001','2019-07-02'),('CMS','BTN','219','en','Select a certificate','Select a certificate','U0001','2019-07-02','U0001','2019-07-02'),('CMS','COL','C0845','en','KMS Port Info','KMS Port Info','U0001','2019-07-03','U0001','2019-07-03'),('CMS','COL','C0836','en','Associated KMS Info','Associated KMS Info','U0001','2019-07-03','U0001','2019-07-03'),('CMS','COL','C0832','en','Provider Port Information','Provider Port Information','U0001','2019-07-03','U0001','2019-07-03'),('CMS','COL','C0833','en','Provider Info','Provider Info','U0001','2019-07-03','U0001','2019-07-03'),('CMS','COL','C0831','en','Consumer Info','Consumer Info','U0001','2019-07-03','U0001','2019-07-03'),('CMS','COL','C0834','en','KMS Port Info','KMS Port Info','U0001','2019-07-03','U0001','2019-07-03'),('CMS','COL','C0804','en','Pending','Pending','U0001','2019-07-04','U0001','2019-07-04'),('CMS','COL','C0846','ko','Protocol','Protocol','U0001','2019-08-19','U0001','2019-08-19'),('CMS','MSG','A0269','ko','이(가) 다르면 연결할 수 없습니다.','이(가) 다르면 연결할 수 없습니다.','U0001','2019-08-19','U0001','2019-08-19'),('CMS','MSG','A0270','ko','{0}는 {1}이상 {2}이하 값입니다.','{0}는 {1}이상 {2}이하 값입니다.','U0001','2019-08-19','U0001','2019-08-19'),('CMS','COL','C0846','en','Protocol','Protocol','U0001','2019-08-19','U0001','2019-08-19'),('CMS','MSG','A0271','ko','{0}는 {1}이하 값입니다.','{0}는 {1}이하 값입니다.','U0001','2019-08-27','U0001','2019-08-27'),('CMS','MSG','A0271','en','{0} is a value less than or equal to {1}.','{0} is a value less than or equal to {1}.','U0001','2019-08-27','U0001','2019-08-27'),('CMS','BTN','220','ko','선택','선택','U0001','2019-08-28','U0001','2019-08-28'),('CMS','BTN','220','en','Select','Select','U0001','2019-08-28','U0001','2019-08-28'),('CMS','MSG','A0272','ko','Address 목록의 app이 일치하지 않습니다.','Address 목록의 app이 일치하지 않습니다.','U0001','2019-08-29','U0001','2019-08-29'),('CMS','MSG','A0273','ko','연결하려는 Consumer의 KMS가 서로 이웃한 KMS가 아닙니다.','연결하려는 Consumer의 KMS가 서로 이웃한 KMS가 아닙니다.','U0001','2019-08-29','U0001','2019-08-29'),('CMS','MSG','A0274','ko','동일한 Provider를 연결 할 수 없습니다.','동일한 Provider를 연결 할 수 없습니다.','U0001','2019-08-30','U0001','2019-08-30'),('CMS','MSG','A0275','ko','동일한 그룹명이 존재합니다.','동일한 그룹명이 존재합니다.','U0001','2019-09-05','U0001','2019-09-05'),('CMS','MSG','A0276','ko','미사용 처리 시도 횟수가 0회 이상인 경우, <br> KMS 접속 시도 간격 * 미사용 처리 시도 횟수가 30초 이상이여야합니다.','미사용 처리 시도 횟수가 0회 이상인 경우, <br> KMS 접속 시도 간격 * 미사용 처리 시도 횟수가 30초 이상이여야합니다.','U0001','2019-09-05','U0001','2019-09-05'),('CMS','MSG','A0277','ko','KMS 접속 시도 간격 10초 이상이여야합니다.','KMS 접속 시도 간격 10초 이상이여야합니다.','U0001','2019-09-05','U0001','2019-09-05'),('CMS','MSG','A0272','en','Address 목록의 app이 일치하지 않습니다.(en)','Address 목록의 app이 일치하지 않습니다.(en)','U0001','2019-08-29','U0001','2019-08-29'),('CMS','MSG','A0276','en','KMS 접속 시도 간격 * 미사용 처리 시도 횟수가 30초 이상이여야합니다.en','KMS 접속 시도 간격 * 미사용 처리 시도 횟수가 30초 이상이여야합니다.en','U0001','2019-09-05','U0001','2019-09-05'),('CMS','MSG','A0277','en','KMS 접속 시도 간격 10초 이상이여야합니다.en','KMS 접속 시도 간격 10초 이상이여야합니다.en','U0001','2019-09-05','U0001','2019-09-05'),('CMS','MSG','A0275','en','동일한 그룹명이 존재합니다.en','동일한 그룹명이 존재합니다.en','U0001','2019-09-05','U0001','2019-09-05'),('CMS','MSG','A0273','en','연결하려는 Consumer의 KMS가 서로 이웃한 KMS가 아닙니다.en','연결하려는 Consumer의 KMS가 서로 이웃한 KMS가 아닙니다.en','U0001','2019-08-29','U0001','2019-08-29'),('CMS','MSG','A0274','en','동일한 Provider를 연결 할 수 없습니다.en','동일한 Provider를 연결 할 수 없습니다.en','U0001','2019-08-30','U0001','2019-08-30');

/*Table structure for table `tm_role` */

DROP TABLE IF EXISTS `tm_role`;

CREATE TABLE `tm_role` (
  `ID_ROLE` varchar(4) NOT NULL COMMENT 'ID_ROLE',
  `NM_ROLE` varchar(30) NOT NULL COMMENT 'NM_ROLE',
  `DESC_ROLE` varchar(100) DEFAULT NULL COMMENT 'DESC_ROLE',
  `YN_USE` char(1) NOT NULL DEFAULT 'Y' COMMENT 'YN_USE',
  `ID_INSERT` varchar(10) NOT NULL COMMENT 'ID_INSERT',
  `DT_INSERT` date NOT NULL COMMENT 'DT_INSERT',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT 'ID_UPDATE',
  `DT_UPDATE` date DEFAULT NULL COMMENT 'DT_UPDATE',
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='권한그룹';

/*Data for the table `tm_role` */

insert  into `tm_role`(`ID_ROLE`,`NM_ROLE`,`DESC_ROLE`,`YN_USE`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('0002','Crypto',NULL,'Y','U0001','2019-07-22','U0001','2019-07-22'),('0003','Monitor',NULL,'Y','U0001','2019-07-22','U0001','2019-07-22'),('1','admin',NULL,'Y','U0001','2017-02-17',NULL,NULL);

/*Table structure for table `tm_role_menu` */

DROP TABLE IF EXISTS `tm_role_menu`;

CREATE TABLE `tm_role_menu` (
  `ID_ROLE` varchar(4) NOT NULL COMMENT 'ID_ROLE',
  `ID_MENU` varchar(4) NOT NULL COMMENT 'ID_MENU',
  `YN_SELECT` char(1) NOT NULL DEFAULT 'N' COMMENT 'YN_SELECT',
  `YN_INSERT` char(1) NOT NULL DEFAULT 'N' COMMENT 'YN_INSERT',
  `YN_UPDATE` char(1) NOT NULL DEFAULT 'N' COMMENT 'YN_UPDATE',
  `YN_DELETE` char(1) NOT NULL DEFAULT 'N' COMMENT 'YN_DELETE',
  `YN_EXCEL` char(1) NOT NULL DEFAULT 'N' COMMENT 'YN_EXCEL',
  `YN_REPORT` char(1) NOT NULL DEFAULT 'N' COMMENT 'YN_REPORT',
  `ID_INSERT` varchar(10) NOT NULL COMMENT 'ID_INSERT',
  `DT_INSERT` date NOT NULL COMMENT 'DT_INSERT',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT 'ID_UPDATE',
  `DT_UPDATE` date DEFAULT NULL COMMENT 'DT_UPDATE',
  PRIMARY KEY (`ID_ROLE`,`ID_MENU`),
  KEY `ID_MENU` (`ID_MENU`),
  CONSTRAINT `tm_role_menu_ibfk_1` FOREIGN KEY (`ID_MENU`) REFERENCES `tm_menu` (`ID_MENU`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tm_role_menu_ibfk_2` FOREIGN KEY (`ID_ROLE`) REFERENCES `tm_role` (`ID_ROLE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴권한';

/*Data for the table `tm_role_menu` */

insert  into `tm_role_menu`(`ID_ROLE`,`ID_MENU`,`YN_SELECT`,`YN_INSERT`,`YN_UPDATE`,`YN_DELETE`,`YN_EXCEL`,`YN_REPORT`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('0002','1','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','14','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','15','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','16','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','17','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','18','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','19','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','2','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','20','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','21','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','22','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','23','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','24','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','25','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','26','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','27','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','28','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','29','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','3','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','30','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','31','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','32','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','33','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','34','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','35','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','36','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','37','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','38','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','39','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','4','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','40','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','5','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','6','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','7','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0002','8','Y','Y','Y','Y','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','1','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','14','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','15','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','16','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','17','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','18','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','19','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','2','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','20','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','21','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','22','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','23','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','24','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','25','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','26','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','27','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','28','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','29','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','3','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','30','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','31','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','32','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','33','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','34','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','35','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','36','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','37','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','38','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','39','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','4','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','40','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','5','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','6','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','7','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('0003','8','Y','N','N','N','N','N','U0001','2019-07-22','U0001','2019-07-22'),('1','1','Y','Y','Y','Y','N','N','U0001','2017-02-17','U0001','2019-07-22'),('1','10','Y','Y','Y','Y','N','N','U0001','2017-02-21','U0001','2019-02-07'),('1','11','Y','Y','Y','Y','N','N','U0001','2017-02-21','U0001','2019-02-07'),('1','12','Y','Y','Y','Y','N','N','U0001','2017-02-21','U0001','2019-02-07'),('1','14','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','15','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','16','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','17','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','18','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','19','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','2','Y','Y','Y','Y','N','N','U0001','2017-02-17','U0001','2019-07-22'),('1','20','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','21','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','22','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','23','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','24','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','25','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','26','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','27','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','28','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','29','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','3','Y','Y','Y','Y','N','N','U0001','2017-02-17','U0001','2019-07-22'),('1','30','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','31','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','32','Y','Y','Y','Y','N','N','U0001','2019-02-07','U0001','2019-07-22'),('1','33','Y','Y','Y','Y','N','N','U0001','2019-02-12','U0001','2019-07-22'),('1','34','Y','Y','Y','Y','N','N','U0001','2019-02-12','U0001','2019-07-22'),('1','35','Y','Y','Y','Y','N','N','U0001','2019-02-28','U0001','2019-07-22'),('1','36','Y','Y','Y','Y','N','N','U0001','2019-03-05','U0001','2019-07-22'),('1','37','Y','Y','Y','Y','N','N','U0001','2019-03-05','U0001','2019-07-22'),('1','38','Y','Y','Y','Y','N','N','U0001','2019-04-01','U0001','2019-07-22'),('1','39','Y','Y','Y','Y','N','N','U0001','2019-04-01','U0001','2019-07-22'),('1','4','Y','Y','Y','Y','N','N','U0001','2017-02-17','U0001','2019-07-22'),('1','40','Y','Y','Y','Y','N','N','U0001','2019-04-29','U0001','2019-07-22'),('1','5','Y','Y','Y','Y','N','N','U0001','2017-02-20','U0001','2019-07-22'),('1','6','Y','Y','Y','Y','N','N','U0001','2017-02-20','U0001','2019-07-22'),('1','7','Y','Y','Y','Y','N','N','U0001','2017-02-20','U0001','2019-07-22'),('1','8','Y','Y','Y','Y','N','N','U0001','2017-02-21','U0001','2019-07-22'),('1','9','Y','Y','Y','Y','N','N','U0001','2017-02-21','U0001','2019-02-07');

/*Table structure for table `tm_user` */

DROP TABLE IF EXISTS `tm_user`;

CREATE TABLE `tm_user` (
  `ID_USER` varchar(5) NOT NULL COMMENT '사용자ID',
  `NM_USER` varchar(50) DEFAULT NULL COMMENT '이름',
  `USER_TYPE` varchar(4) DEFAULT NULL COMMENT '사용자구분 : 운영자(01), CS(02), 번역자(03), 연예인매니저(04), DJ(05), 큐레이터(06), 테스터(99)',
  `ID_LOGIN` varchar(10) DEFAULT NULL COMMENT '로그인ID',
  `PWD` varchar(200) DEFAULT NULL COMMENT '패스워드',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '이메일',
  `MOB_NO` varchar(12) DEFAULT NULL COMMENT '휴대폰번호',
  `TEL_NO` varchar(12) DEFAULT NULL COMMENT '전화번호',
  `NM_COM` varchar(50) DEFAULT NULL COMMENT '소속회사명',
  `NM_DEPT` varchar(50) DEFAULT NULL COMMENT '소속부서명',
  `LANG` varchar(4) DEFAULT NULL COMMENT '언어 : 한국어(KR)\n일본어(JP)\n영어(EN)',
  `MEMO` text DEFAULT NULL COMMENT '메모',
  `RANDOM_PW_YN` char(1) DEFAULT 'N' COMMENT '임시비번 여부',
  `DEL_YN` varchar(4) DEFAULT NULL COMMENT '삭제여부',
  `CUST_ID` varchar(10) DEFAULT NULL COMMENT '회사ID',
  `CUST_GROUP_ID` varchar(13) DEFAULT NULL COMMENT '그룹ID',
  `ID_INSERT` varchar(10) DEFAULT NULL COMMENT '등록자',
  `DT_INSERT` datetime DEFAULT NULL COMMENT '등록일시',
  `ID_UPDATE` varchar(10) DEFAULT NULL COMMENT '수정자',
  `DT_UPDATE` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사용자정보';

/*Data for the table `tm_user` */

insert  into `tm_user`(`ID_USER`,`NM_USER`,`USER_TYPE`,`ID_LOGIN`,`PWD`,`EMAIL`,`MOB_NO`,`TEL_NO`,`NM_COM`,`NM_DEPT`,`LANG`,`MEMO`,`RANDOM_PW_YN`,`DEL_YN`,`CUST_ID`,`CUST_GROUP_ID`,`ID_INSERT`,`DT_INSERT`,`ID_UPDATE`,`DT_UPDATE`) values ('1','monitor user',NULL,'monitor','$2a$10$Az9DjgqtUNSXrhGPUI7aBub20Uf0x1L/HPj2TzQlRfmSXwA1Up562','monitor@idquantique.com','','',NULL,NULL,NULL,NULL,'N','N',NULL,NULL,'U0001','2019-07-22 23:29:10','U0001','2019-07-22 23:29:10'),('U0001','관리자','01','admin','$2a$10$cM5Jit6PkJy6LjkccndbI.sulQSUf7jZx7qsX0eCJ/QhU/OGE4w0i','odusanu@gmail.com','','',NULL,NULL,NULL,NULL,'Y','N','C000000003','','U0001','2017-05-19 14:32:47','U0001','2017-11-28 15:58:25');

/*Table structure for table `tm_user_role` */

DROP TABLE IF EXISTS `tm_user_role`;

CREATE TABLE `tm_user_role` (
  `ID_ROLE` varchar(4) NOT NULL COMMENT 'ID_ROLE',
  `ID_USER` varchar(5) NOT NULL COMMENT '사용자ID',
  `ID_INSERT` varchar(10) NOT NULL COMMENT 'ID_INSERT',
  `DT_INSERT` date NOT NULL COMMENT 'DT_INSERT',
  PRIMARY KEY (`ID_ROLE`,`ID_USER`),
  KEY `ID_USER` (`ID_USER`),
  CONSTRAINT `tm_user_role_ibfk_1` FOREIGN KEY (`ID_ROLE`) REFERENCES `tm_role` (`ID_ROLE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tm_user_role_ibfk_2` FOREIGN KEY (`ID_USER`) REFERENCES `tm_user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사용자권한';

/*Data for the table `tm_user_role` */

insert  into `tm_user_role`(`ID_ROLE`,`ID_USER`,`ID_INSERT`,`DT_INSERT`) values ('0003','1','U0001','2019-07-22'),('1','U0001','U0001','2017-11-28');

/* Function  structure for function  `dept_connect_by_parent` */

/*!50003 DROP FUNCTION IF EXISTS `dept_connect_by_parent` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `dept_connect_by_parent`() RETURNS int(11)
    READS SQL DATA
BEGIN
DECLARE _id INT;
DECLARE _parent INT;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET @id = NULL;
SET _parent = @id;
SET _id = -1;
IF @id IS NULL THEN
RETURN NULL;
END IF;
LOOP
SELECT MIN(CAST(ID_MENU AS UNSIGNED))
INTO @id
FROM tm_menu
WHERE PA_MENU = _parent
AND CAST(id_menu AS unsigned) > _id;
IF @id IS NOT NULL OR _parent = @start_with THEN
SET @level = @level + 1;
RETURN @id;
END IF;
SET @level := @level - 1;
SELECT ID_MENU, PA_MENU
INTO _id, _parent
FROM tm_menu
WHERE ID_MENU = _parent;
END LOOP;
END */$$
DELIMITER ;

/* Function  structure for function  `FN_CD_NAME_LANG` */

/*!50003 DROP FUNCTION IF EXISTS `FN_CD_NAME_LANG` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `FN_CD_NAME_LANG`(  I_CDGRP VARCHAR(20),  I_NOCD VARCHAR(20), I_FG_LANG VARCHAR(2)   ) RETURNS varchar(80) CHARSET utf8
BEGIN
	DECLARE O_CDNAME VARCHAR(80);
	 SELECT  ifnull(NM_CD, '*')
	       INTO     O_CDNAME
	       FROM     tm_cd
	      WHERE     CD_GRP = I_CDGRP
		AND     NO_CD  = I_NOCD
		AND  FG_LANG = I_FG_LANG;
	     RETURN O_CDNAME;	
    END */$$
DELIMITER ;

/* Function  structure for function  `Fn_Menu_Name` */

/*!50003 DROP FUNCTION IF EXISTS `Fn_Menu_Name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `Fn_Menu_Name`(  I_ID_MENU VARCHAR(4), I_FG_LANG VARCHAR(5)  ) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE O_NM_MENU VARCHAR(50);
	 SELECT     IFNULL(tmd.NM_MENU, '') INTO O_NM_MENU FROM tm_menu tm, tm_menu_dtl tmd  
	 WHERE     tm.ID_MENU = I_ID_MENU and tm.ID_MENU = tmd.ID_MENU and tmd.FG_LANG = I_FG_LANG    LIMIT 1  ;
	 RETURN O_NM_MENU;
    END */$$
DELIMITER ;

/* Function  structure for function  `Fn_User_Name` */

/*!50003 DROP FUNCTION IF EXISTS `Fn_User_Name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `Fn_User_Name`(  I_ID_USER VARCHAR(20)  ) RETURNS varchar(90) CHARSET utf8
BEGIN
	DECLARE O_NM_USER VARCHAR(80);
		 SELECT     IFNULL(NM_USER, I_ID_USER) INTO O_NM_USER FROM tm_user  WHERE     ID_USER = I_ID_USER LIMIT 1  ;
	     RETURN IFNULL(O_NM_USER, I_ID_USER);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `loopInsert` */

/*!50003 DROP PROCEDURE IF EXISTS  `loopInsert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `loopInsert`()
BEGIN
	DECLARE i INT DEFAULT 0;
    WHILE i < 10 DO
       INSERT INTO tb_statistics_log (
DT_INSERT
,UPDATE_TIME
,SYS_NAME
,APP_NAME
,SRC_VID
,TARGET_VID
,KEY_REQ_TRY_CNT
,KEY_REQ_SUCC_CNT
,KEY_SYNC_TRY_CNT
,KEY_SYNC_SUCC_CNT
,OVERLOAD_REJECT
,KEY_REQ_TIMEOUT
,KEY_SYNC_TIMEOUT			
,AUTH_FAIL
,ETC_FAIL
) 
VALUES
  (
    ADDDATE(STR_TO_DATE(NOW(),'%Y-%m-%d %H:%i:%s'), INTERVAL FLOOR(RAND() * -10) day)
    ,DATE_FORMAT(NOW(), '%H:%i:%s')
    ,'sys name'		
    ,'app name'
    ,'src vid'
    ,'target vid'
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
    ,FLOOR(RAND() * 100)  
  );
        SET i = i + 1;
    END WHILE;
    
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
