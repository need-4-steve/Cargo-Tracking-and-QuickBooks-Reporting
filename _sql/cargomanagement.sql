-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 02:22 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cargomanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `archived_shipments`
--

CREATE TABLE `archived_shipments` (
  `id` int(11) NOT NULL,
  `status` text,
  `po` varchar(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `container_number` varchar(32) NOT NULL,
  `bill_of_lading` varchar(16) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `discharge_port` varchar(64) NOT NULL,
  `final_destination` varchar(64) NOT NULL,
  `eta` date DEFAULT NULL,
  `lfd` date DEFAULT NULL,
  `pickup_number` int(11) DEFAULT NULL,
  `truck_date` datetime DEFAULT NULL,
  `trucker_id` int(11) DEFAULT NULL,
  `bl_status` varchar(32) DEFAULT NULL,
  `freight` tinyint(1) DEFAULT '0',
  `isf_required` tinyint(1) DEFAULT '0',
  `customs` tinyint(1) DEFAULT '0',
  `is_complete` tinyint(1) DEFAULT '0',
  `po_boolean` tinyint(1) DEFAULT '0',
  `qb_rt` tinyint(1) DEFAULT '0',
  `qb_ws` tinyint(1) DEFAULT '0',
  `latest_event` text,
  `latest_event_time_and_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `requires_payment` tinyint(1) DEFAULT '0',
  `container_notes` text,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `container_size` smallint(11) DEFAULT NULL,
  `do` tinyint(1) DEFAULT '0',
  `vendor_identifier` varchar(32) DEFAULT NULL,
  `has_documents` tinyint(1) DEFAULT '0',
  `directory_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archived_shipments`
--

INSERT INTO `archived_shipments` (`id`, `status`, `po`, `product_id`, `container_number`, `bill_of_lading`, `vendor_id`, `discharge_port`, `final_destination`, `eta`, `lfd`, `pickup_number`, `truck_date`, `trucker_id`, `bl_status`, `freight`, `isf_required`, `customs`, `is_complete`, `po_boolean`, `qb_rt`, `qb_ws`, `latest_event`, `latest_event_time_and_date`, `is_active`, `requires_payment`, `container_notes`, `last_update`, `container_size`, `do`, `vendor_identifier`, `has_documents`, `directory_name`) VALUES
(11543, NULL, NULL, NULL, '', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, '2018-06-26 07:03:18', NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `ID` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `md5_container_number_and_date` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `calendar_events`
--

INSERT INTO `calendar_events` (`ID`, `title`, `event_type`, `start`, `end`, `description`, `shipment_id`, `md5_container_number_and_date`) VALUES
(1062, 'TCNU862477', 'ETA', '2018-06-11 23:59:00', '2018-06-11 23:59:00', 'Estimated Time of Arrival for Container #: TCNU862477. Times/Dates Subject to Change...', 11606, 'eb0e79059bf4e3e7fa9d21c187537fe2'),
(1063, 'TCNU259060', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: TCNU259060. Times/Dates Subject to Change...', 11607, 'd660d2e89fee3cee5a348d73c218c14c'),
(1064, 'CCLU689366', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: CCLU689366. Times/Dates Subject to Change...', 11608, 'ba2f2f4ccf2c265c3b0d985169eadcf7'),
(1065, 'CAIU344452', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: CAIU344452. Times/Dates Subject to Change...', 11609, '1b1cbe9a0bbe971b58a1376da2fd71a1'),
(1066, 'TCNU803965', 'ETA', '2018-06-17 23:59:00', '2018-06-17 23:59:00', 'Estimated Time of Arrival for Container #: TCNU803965. Times/Dates Subject to Change...', 11610, '2a3924c6874f1e429254dc445c470f98'),
(1067, 'CBHU832619', 'ETA', '2018-06-23 23:59:00', '2018-06-23 23:59:00', 'Estimated Time of Arrival for Container #: CBHU832619. Times/Dates Subject to Change...', 11611, '80acd9cc7e4e344db4dab7553e7b0299'),
(1068, 'FCIU987424', 'ETA', '2018-06-23 23:59:00', '2018-06-23 23:59:00', 'Estimated Time of Arrival for Container #: FCIU987424. Times/Dates Subject to Change...', 11612, 'd77ba8f5839ceac3790a50647ba76490'),
(1069, 'CBHU552322', 'ETA', '2018-06-25 23:59:00', '2018-06-25 23:59:00', 'Estimated Time of Arrival for Container #: CBHU552322. Times/Dates Subject to Change...', 11613, 'c6ea3727c7c0caf01da97eac3e7c5070'),
(1070, 'CSLU114281', 'ETA', '2018-06-25 23:59:00', '2018-06-25 23:59:00', 'Estimated Time of Arrival for Container #: CSLU114281. Times/Dates Subject to Change...', 11614, 'c996db92a03fee11a1f0a81697bbd63f'),
(1071, 'CSLU235424', 'ETA', '2018-06-25 23:59:00', '2018-06-25 23:59:00', 'Estimated Time of Arrival for Container #: CSLU235424. Times/Dates Subject to Change...', 11615, '48ee38038b7b990ef790518a6e267e70'),
(1072, 'TGHU685374', 'ETA', '2018-06-27 23:59:00', '2018-06-27 23:59:00', 'Estimated Time of Arrival for Container #: TGHU685374. Times/Dates Subject to Change...', 11616, 'a8b310f4ad01b3c62db18414db339fd9'),
(1073, 'TEMU628934', 'ETA', '2018-06-27 23:59:00', '2018-06-27 23:59:00', 'Estimated Time of Arrival for Container #: TEMU628934. Times/Dates Subject to Change...', 11617, 'a9a85df948adcf455d17e3bfec1949db'),
(1074, 'BMOU439963', 'ETA', '2018-06-27 23:59:00', '2018-06-27 23:59:00', 'Estimated Time of Arrival for Container #: BMOU439963. Times/Dates Subject to Change...', 11618, 'fc9a386f9af7e72298b7175fd69e6332'),
(1075, 'GLDU931983', 'ETA', '2018-06-29 23:59:00', '2018-06-29 23:59:00', 'Estimated Time of Arrival for Container #: GLDU931983. Times/Dates Subject to Change...', 11619, '062f3449f9bb4cc845f776d49bda7766'),
(1076, 'TCNU909669', 'ETA', '2018-07-01 23:59:00', '2018-07-01 23:59:00', 'Estimated Time of Arrival for Container #: TCNU909669. Times/Dates Subject to Change...', 11620, '9541a736a17384d7e6d1046022161bfd'),
(1077, 'TCNU507859', 'ETA', '2018-07-01 23:59:00', '2018-07-01 23:59:00', 'Estimated Time of Arrival for Container #: TCNU507859. Times/Dates Subject to Change...', 11621, '9767809aed1434a824a1966e5fd7915b'),
(1078, 'CSLU617701', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: CSLU617701. Times/Dates Subject to Change...', 11622, 'bae987fb535620920b569cd1f8be8899'),
(1079, 'CBHU701935', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: CBHU701935. Times/Dates Subject to Change...', 11623, '4f3077e7c55a5f8e988a506ae4e155a2'),
(1080, 'TCKU255801', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: TCKU255801. Times/Dates Subject to Change...', 11624, '7b0518721025836a3a6cda38fa0f77b5'),
(1081, 'TEMU759017', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: TEMU759017. Times/Dates Subject to Change...', 11625, '7ee68a2b418aa0df78d82bbb0ea26cee'),
(1082, 'TCNU634231', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: TCNU634231. Times/Dates Subject to Change...', 11626, 'f4916ccf5b5637c01cead097a68d54da'),
(1083, 'BMOU585674', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: BMOU585674. Times/Dates Subject to Change...', 11627, '35a7582c58c3388520182f877bb21d65'),
(1084, 'CSNU646679', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: CSNU646679. Times/Dates Subject to Change...', 11628, 'a8761843ff39420f4602a9ef36cd0b5d'),
(1085, 'CBHU411055', 'ETA', '2018-07-06 23:59:00', '2018-07-06 23:59:00', 'Estimated Time of Arrival for Container #: CBHU411055. Times/Dates Subject to Change...', 11629, '4d9e650be4ef5528d47f2aad321cc7d0'),
(1086, 'TRHU167517', 'ETA', '2018-07-11 23:59:00', '2018-07-11 23:59:00', 'Estimated Time of Arrival for Container #: TRHU167517. Times/Dates Subject to Change...', 11630, 'cd57202e445fa05d62d5546ed86a53a2'),
(1087, 'TCKU152269', 'ETA', '2018-07-11 23:59:00', '2018-07-11 23:59:00', 'Estimated Time of Arrival for Container #: TCKU152269. Times/Dates Subject to Change...', 11631, '6d46c13d23a91bfd0193cef843196731'),
(1088, 'TCNU626781', 'ETA', '2018-07-12 23:59:00', '2018-07-12 23:59:00', 'Estimated Time of Arrival for Container #: TCNU626781. Times/Dates Subject to Change...', 11632, '9fd9ca440a6cc09a501e29e93efe3bfa'),
(1089, 'TCNU739627', 'ETA', '2018-07-12 23:59:00', '2018-07-12 23:59:00', 'Estimated Time of Arrival for Container #: TCNU739627. Times/Dates Subject to Change...', 11633, 'c26eb7391f0850ae42b4fd560331f947'),
(1090, 'TCNU626886', 'ETA', '2018-07-12 23:59:00', '2018-07-12 23:59:00', 'Estimated Time of Arrival for Container #: TCNU626886. Times/Dates Subject to Change...', 11634, 'f64d7e8c16f0fab314f6e61558ea6495'),
(1091, 'CBHU823499', 'ETA', '2018-07-12 23:59:00', '2018-07-12 23:59:00', 'Estimated Time of Arrival for Container #: CBHU823499. Times/Dates Subject to Change...', 11635, '780759e099d15d7f09c55f39a6dfff04'),
(1092, 'TCKU303205', 'ETA', '2018-07-12 23:59:00', '2018-07-12 23:59:00', 'Estimated Time of Arrival for Container #: TCKU303205. Times/Dates Subject to Change...', 11636, 'd2d31f9d1334c38097c269d02ffbd665'),
(1093, 'DFSU158089', 'ETA', '2018-07-12 23:59:00', '2018-07-12 23:59:00', 'Estimated Time of Arrival for Container #: DFSU158089. Times/Dates Subject to Change...', 11637, 'a68c3a1da298a8cb34c8b556520f6405'),
(1094, 'Unassigned [6185637150]', 'ETA', '2018-07-14 23:59:00', '2018-07-14 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185637150]. Times/Dates Subject to Change...', 11638, '906f8f27df48376bdcc984dbeea02761'),
(1095, 'FSCU895722', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FSCU895722. Times/Dates Subject to Change...', 11639, '73c876205e4bb102fa3e5da7a02be919'),
(1096, 'FCIU960299', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FCIU960299. Times/Dates Subject to Change...', 11640, '89296e98ce9f99a1f1d6c0a14a41f1fe'),
(1097, 'CCLU673627', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: CCLU673627. Times/Dates Subject to Change...', 11641, '71a14319a05a64571b22b71c331a50aa'),
(1098, 'GLDU753837', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: GLDU753837. Times/Dates Subject to Change...', 11642, '0962b0694b06ffdadecd3733cec156e3'),
(1099, 'TCNU651692', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: TCNU651692. Times/Dates Subject to Change...', 11643, 'e05c94851a1951b72ce3390c096d0298'),
(1100, 'FCIU996977', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FCIU996977. Times/Dates Subject to Change...', 11644, 'ebd7c4cceca6034b9f2737b615d45885'),
(1101, 'FCIU525434', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FCIU525434. Times/Dates Subject to Change...', 11645, '476777cc8a28a688c0dbc007b2052ae2'),
(1102, 'TCNU607485', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: TCNU607485. Times/Dates Subject to Change...', 11646, '45efc65495d8802ce9604f9c02d50223'),
(1103, 'TCNU528878', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: TCNU528878. Times/Dates Subject to Change...', 11647, 'c05aea318340223617e471c2875460b1'),
(1104, 'TCNU618122', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: TCNU618122. Times/Dates Subject to Change...', 11648, '7d5fca6ccb0d87b4ddbe882ccb124519'),
(1105, 'Unassigned [6185691600]', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185691600]. Times/Dates Subject to Change...', 11649, '149c1a26d1260efce452cf2cf8f2ac6f'),
(1106, 'CBHU554243', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: CBHU554243. Times/Dates Subject to Change...', 11650, '71392c5a4b5b91f94b468e86930abb56'),
(1107, 'Unassigned [6183511340]', 'ETA', '2018-07-25 23:59:00', '2018-07-25 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183511340]. Times/Dates Subject to Change...', 11651, 'dbffa574eac6f114a229bc11e9ceb9dd'),
(1108, 'TCNU643762', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: TCNU643762. Times/Dates Subject to Change...', 11652, '6c3ab6cf558f10a094fefd6eb824bb5e'),
(1109, 'Unassigned [6183114220]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114220]. Times/Dates Subject to Change...', 11653, '5bec7423f6799b01592da869a948a1f6'),
(1110, 'Unassigned [6183114230]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114230]. Times/Dates Subject to Change...', 11654, '3b77112b8a05f885919eecd415bbce21'),
(1111, 'Unassigned [6185677760]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185677760]. Times/Dates Subject to Change...', 11655, '846f7c0e6046bca0c0d9970847d807f4'),
(1112, 'Unassigned [6185693500]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185693500]. Times/Dates Subject to Change...', 11656, '55cd774ab94da136d4249be979f06c1d'),
(1113, 'Unassigned [6183114200]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114200]. Times/Dates Subject to Change...', 11657, 'e7a3bc7e5efee5029c7ee54eb68f9d77'),
(1114, 'Unassigned [6183114380]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114380]. Times/Dates Subject to Change...', 11658, '2d612d7efb097c7356db2c553af404db'),
(1115, 'Unassigned [6183114390]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114390]. Times/Dates Subject to Change...', 11659, '3e998cf3b1d2ee5a46911eed1413479d'),
(1116, 'CBHU552322', 'LFD', '2018-06-29 00:00:00', '2018-06-29 23:59:00', 'Last Free Day for Container #: CBHU552322. Times/Dates Subject to Change...', 11613, '02d9179a671cd84a103030dc66a481cd'),
(1117, 'CSLU114281', 'LFD', '2018-06-29 00:00:00', '2018-06-29 23:59:00', 'Last Free Day for Container #: CSLU114281. Times/Dates Subject to Change...', 11614, '28ce54c52deab2b76767405900bd50fa'),
(1118, 'CSLU235424', 'LFD', '2001-01-01 00:00:00', '2001-01-01 23:59:00', 'Last Free Day for Container #: CSLU235424. Times/Dates Subject to Change...', 11615, '5d8db3ba83ff8e984190297d8041ab36'),
(1119, 'TCNU259060', 'LFD', '2018-06-16 00:00:00', '2018-06-16 23:59:00', 'Last Free Day for Container #: TCNU259060. Times/Dates Subject to Change...', 11607, '7f8e8670f5f20ef82bd8ae5cc0668b0b'),
(1120, 'CCLU689366', 'LFD', '2018-06-16 00:00:00', '2018-06-16 23:59:00', 'Last Free Day for Container #: CCLU689366. Times/Dates Subject to Change...', 11608, '6044c9db8028007986fd148c4fc58bf5'),
(1121, 'CBHU832619', 'LFD', '2018-06-26 00:00:00', '2018-06-26 23:59:00', 'Last Free Day for Container #: CBHU832619. Times/Dates Subject to Change...', 11611, '14496dc2a572401719a02b715abbdd32'),
(1122, 'FCIU987424', 'LFD', '2018-06-25 00:00:00', '2018-06-25 23:59:00', 'Last Free Day for Container #: FCIU987424. Times/Dates Subject to Change...', 11612, '1aa8b3c1bc92b92056b6ba6e49da51d0'),
(1123, 'CAIU344452', 'LFD', '2018-06-17 00:00:00', '2018-06-17 23:59:00', 'Last Free Day for Container #: CAIU344452. Times/Dates Subject to Change...', 11609, '67e4f7622c48ef553f7fff1ed2a666e7'),
(1124, 'TCNU862477', 'LFD', '2018-06-14 00:00:00', '2018-06-14 23:59:00', 'Last Free Day for Container #: TCNU862477. Times/Dates Subject to Change...', 11606, 'd1f6217161b12af5d54a8fa20af0b7bc'),
(1125, 'TCNU803965', 'LFD', '2018-06-19 00:00:00', '2018-06-19 23:59:00', 'Last Free Day for Container #: TCNU803965. Times/Dates Subject to Change...', 11610, '37985447e49539b2992b47093d82c908');

-- --------------------------------------------------------

--
-- Table structure for table `datatables_states`
--

CREATE TABLE `datatables_states` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `state` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`) VALUES
(1, ''),
(2, 'ATV tire'),
(3, 'Hub & drum'),
(4, 'Jack & Acc'),
(5, 'Spring'),
(6, 'Brake'),
(7, 'Chain'),
(8, 'Trailer Tire'),
(9, 'Spindle');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `po` varchar(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `container_number` varchar(32) NOT NULL,
  `bill_of_lading` varchar(16) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `discharge_port` varchar(64) NOT NULL,
  `final_destination` varchar(64) NOT NULL,
  `eta` date DEFAULT NULL,
  `lfd` date DEFAULT NULL,
  `pickup_number` int(11) DEFAULT NULL,
  `truck_date` datetime DEFAULT NULL,
  `trucker_id` int(11) DEFAULT NULL,
  `bl_status` varchar(32) DEFAULT NULL,
  `freight` tinyint(1) DEFAULT '0',
  `isf_required` tinyint(1) DEFAULT '0',
  `customs` tinyint(1) DEFAULT '0',
  `is_complete` tinyint(1) DEFAULT '0',
  `po_boolean` tinyint(1) DEFAULT '0',
  `qb_rt` tinyint(1) DEFAULT '0',
  `qb_ws` tinyint(1) DEFAULT '0',
  `latest_event` text,
  `latest_event_time_and_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `requires_payment` tinyint(1) DEFAULT '0',
  `container_notes` text,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `container_size` smallint(6) DEFAULT NULL,
  `do` tinyint(1) DEFAULT '0',
  `vendor_identifier` varchar(32) DEFAULT NULL,
  `has_documents` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `status`, `po`, `product_id`, `container_number`, `bill_of_lading`, `vendor_id`, `discharge_port`, `final_destination`, `eta`, `lfd`, `pickup_number`, `truck_date`, `trucker_id`, `bl_status`, `freight`, `isf_required`, `customs`, `is_complete`, `po_boolean`, `qb_rt`, `qb_ws`, `latest_event`, `latest_event_time_and_date`, `is_active`, `requires_payment`, `container_notes`, `last_update`, `container_size`, `do`, `vendor_identifier`, `has_documents`) VALUES
(11606, 0, NULL, 8, 'TCNU862477', '6185516940', 8, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-16', '2018-06-14', 986468, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Picked up at Final Destination for Delivery', NULL, 1, 0, NULL, '2018-06-26 10:01:14', 40, 1, NULL, 0),
(11607, 0, NULL, 2, 'TCNU259060', '6160597320', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', NULL, NULL, NULL, 'Release', 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-06-26 08:41:51', 40, 1, NULL, 0),
(11608, 0, NULL, 2, 'CCLU689366', '6160597340', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-14', '2018-06-16', 15509, NULL, NULL, 'Release', 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-06-26 10:04:48', 40, 1, NULL, 0),
(11609, 0, NULL, 3, 'CAIU344452', '6185488790', 2, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-16', '2018-06-17', 864059, NULL, NULL, 'Release', 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-06-26 10:01:14', 20, 1, NULL, 0),
(11610, 0, NULL, 9, 'TCNU803965', '6185527170', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-15', '2018-06-19', 525242, NULL, 1, 'Release', 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-06-26 10:01:13', 40, 1, NULL, 0),
(11611, 0, NULL, 2, 'CBHU832619', '6160597370', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-23', '2018-06-26', 492547, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Last Deramp Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:51', 40, 1, NULL, 0),
(11612, 0, NULL, 4, 'FCIU987424', '6182111620', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-23', '2018-06-25', 837092, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Last Deramp Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:51', 40, 1, NULL, 0),
(11613, 0, NULL, 5, 'CBHU552322', '6008522710', 4, 'Charleston', 'Loris, South Carolina', '2018-06-25', '2018-06-29', NULL, NULL, NULL, 'Release', 0, 0, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 1, 0, NULL, '2018-06-26 08:41:51', 20, 0, NULL, 0),
(11614, 0, NULL, 5, 'CSLU114281', '6008522710', 4, 'Charleston', 'Loris, South Carolina', '2018-06-25', '2018-06-29', NULL, NULL, NULL, 'Release', 0, 0, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 20, 0, NULL, 0),
(11615, 0, NULL, 5, 'CSLU235424', '6008526090', 4, 'Norfolk', 'Henderson, North Carolina', '2018-06-25', '2001-01-01', NULL, NULL, NULL, 'Release', 0, 0, 0, 0, 0, 0, 0, 'Carrier Released', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 20, 0, NULL, 0),
(11616, 0, NULL, 2, 'TGHU685374', '6160596710', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-14', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 10:04:47', 40, 1, NULL, 0),
(11617, 0, NULL, 2, 'TEMU628934', '6160597350', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-27', NULL, 185011, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11618, 0, NULL, 2, 'BMOU439963', '6160597360', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-27', NULL, 493056, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11619, 0, NULL, 5, 'GLDU931983', '6008522700', 4, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-20', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 10:04:45', 20, 1, NULL, 0),
(11620, 1, NULL, 2, 'TCNU909669', '6183104310', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-01', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11621, 1, NULL, 2, 'TCNU507859', '6183107850', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 10:01:13', 40, 1, NULL, 0),
(11622, 1, NULL, 4, 'CSLU617701', '6182112950', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-02', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11623, 1, NULL, 4, 'CBHU701935', '6182112950', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-02', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11624, 1, 'JT18LB570', 6, 'TCKU255801', '6182630420', 5, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-02', NULL, NULL, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-06-26 10:04:50', 20, 1, 'JT18LB570', 1),
(11625, 2, 'RR18063', 4, 'TEMU759017', '6182113910', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Arrival at Last POD', NULL, 1, 0, NULL, '2018-06-26 11:46:13', 40, 1, 'JT18LB570', 1),
(11626, 2, NULL, 2, 'TCNU634231', '6183104300', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11627, 2, NULL, 2, 'BMOU585674', '6183107830', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11628, 2, NULL, 2, 'CSNU646679', '6183107840', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-02', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 1, 0, NULL, '2018-06-26 10:04:44', 40, 1, NULL, 0),
(11629, 2, NULL, 5, 'CBHU411055', '6008525240', 4, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-06-26 10:01:09', 20, 1, NULL, 0),
(11630, 2, NULL, 9, 'TRHU167517', '6183507450', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-11', NULL, NULL, NULL, 1, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:45:15', 20, 1, NULL, 0),
(11631, 2, NULL, 9, 'TCKU152269', '6183507450', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-11', NULL, NULL, NULL, 1, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:45:20', 20, 1, NULL, 0),
(11632, 2, NULL, 2, 'TCNU626781', '6183107800', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-11', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 10:01:10', 40, 1, NULL, 0),
(11633, 2, NULL, 2, 'TCNU739627', '6183107810', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-11', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 10:01:09', 40, 1, NULL, 0),
(11634, 2, NULL, 2, 'TCNU626886', '6183108290', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-09', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 10:04:43', 40, 1, NULL, 0),
(11635, 2, NULL, 8, 'CBHU823499', '6185603970', 8, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-11', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 10:01:10', 40, 1, NULL, 0),
(11636, 2, NULL, 3, 'TCKU303205', '6185628380', 2, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-11', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 10:01:10', 20, 1, NULL, 0),
(11637, 2, NULL, 6, 'DFSU158089', '6190904790', 5, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-12', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 20, 1, NULL, 0),
(11638, 2, NULL, 9, 'Unassigned [6185637150]', '6185637150', 12, 'Vancouver (Intended)', 'Memphis, Tennessee', '2018-07-14', NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:45:40', 40, 1, NULL, 0),
(11639, 2, NULL, 4, 'FSCU895722', '6182115600', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11640, 2, NULL, 4, 'FCIU960299', '6182115600', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-06-26 08:41:52', 40, 1, NULL, 0),
(11641, 2, NULL, 2, 'CCLU673627', '6183104650', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11642, 2, NULL, 2, 'GLDU753837', '6183104660', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11643, 2, NULL, 2, 'TCNU651692', '6183108390', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11644, 2, NULL, 9, 'FCIU996977', '6185635620', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, 1, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:45:46', 40, 1, NULL, 0),
(11645, 2, NULL, 6, 'FCIU525434', '6190935400', 5, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 20, 1, NULL, 0),
(11646, 2, NULL, 2, 'TCNU607485', '6183114240', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11647, 2, NULL, 2, 'TCNU528878', '6183114250', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11648, 2, NULL, 2, 'TCNU618122', '6183114260', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11649, 2, NULL, 3, 'Unassigned [6185691600]', '6185691600', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 10:01:07', 20, 1, NULL, 0),
(11650, 2, NULL, 6, 'CBHU554243', '6190942840', 5, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 20, 1, NULL, 0),
(11651, 2, NULL, 9, 'Unassigned [6183511340]', '6183511340', 12, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-25', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:45:57', 20, 1, NULL, 0),
(11652, 2, NULL, 2, 'TCNU643762', '6183114210', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11653, 2, NULL, 2, 'Unassigned [6183114220]', '6183114220', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11654, 2, NULL, 2, 'Unassigned [6183114230]', '6183114230', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11655, 2, NULL, 2, 'Unassigned [6185677760]', '6185677760', 9, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:46:02', 40, 1, NULL, 0),
(11656, 2, NULL, 9, 'Unassigned [6185693500]', '6185693500', 12, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:45:59', 40, 1, NULL, 0),
(11657, 2, NULL, 2, 'Unassigned [6183114200]', '6183114200', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11658, 2, NULL, 2, 'Unassigned [6183114380]', '6183114380', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0),
(11659, 2, NULL, 2, 'Unassigned [6183114390]', '6183114390', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-06-26 08:41:53', 40, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `truckers`
--

CREATE TABLE `truckers` (
  `id` int(11) NOT NULL,
  `trucker_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `truckers`
--

INSERT INTO `truckers` (`id`, `trucker_name`) VALUES
(1, ''),
(2, 'Main Stream'),
(3, 'IMCG'),
(4, 'MACO');

-- --------------------------------------------------------

--
-- Table structure for table `update_events`
--

CREATE TABLE `update_events` (
  `id` int(11) NOT NULL,
  `time_and_date` datetime NOT NULL,
  `content` text NOT NULL,
  `container_number` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `register_date`) VALUES
(1, 'Stephen', 'smvorwerk@gmail.com', 'svorwerk', '7374d6f128028c3a2bf629ad92e1e2c8', '2018-05-02 19:19:35'),
(2, 'Hillary Haynes', 'hah690@gmail.com', 'test', '098f6bcd4621d373cade4e832627b4f6', '2018-05-02 19:22:39'),
(3, 'Libra Resources', 'cargodata.libra@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-06-02 13:39:12'),
(5, 'Tasty', 'tasty.garbanzo.beans@gmail.com', 'tasty', '7374d6f128028c3a2bf629ad92e1e2c8', '2018-06-13 15:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `abbreviation` varchar(32) NOT NULL,
  `document_initials` varchar(8) DEFAULT NULL,
  `email_addresses` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `abbreviation`, `document_initials`, `email_addresses`) VALUES
(1, '', '', NULL, NULL),
(2, 'Changyi Youxing Casting Company Limited', 'Youxing', 'YX', NULL),
(3, 'Guangdong Foreign Trade Import & Export Company Limited', 'Rodrock', 'RR', NULL),
(4, 'Hangzhou Skye Vehicle Parts. Co., Ltd.', 'Skye', 'NY', NULL),
(5, 'Hebei Xingyue Braking Element Company Limited', 'Xingyue', 'XY', NULL),
(6, 'Intradin Huzhou Hardware Co., Ltd', 'ITI', 'LB-TK', NULL),
(7, 'Iti Company Limited', 'ITI', 'LB', NULL),
(8, 'Qingdao Crowntyre Industrial Company Limited', 'Crown', 'CR', NULL),
(9, 'Qingdao Qihang Tyre Company Limited', 'Qihang', 'QQ', NULL),
(10, 'Shandong Guofeng Rubber Plastics Company Limited', 'Guofeng', 'GF', NULL),
(11, 'Tianjin Wanda Tyre Group Company Limited', 'Wanda', 'WD', 'tjwanda.com|gmail.com'),
(12, 'Ruian Jianxin Machinery Manufacturing Company Limited.', 'Jianxin', 'JX', '163.com|');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_documents`
--

CREATE TABLE `vendor_documents` (
  `id` int(11) NOT NULL,
  `document_type` varchar(32) DEFAULT NULL,
  `po_number` varchar(16) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `file_extension` varchar(8) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `md5_hash` varchar(32) NOT NULL,
  `identifying_label` varchar(32) DEFAULT NULL,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_documents`
--

INSERT INTO `vendor_documents` (`id`, `document_type`, `po_number`, `vendor_id`, `filename`, `filepath`, `file_extension`, `shipment_id`, `md5_hash`, `identifying_label`, `creation_timestamp`) VALUES
(556, 'Parts_List', 'NY17093', 4, 'doc-568-pl-spring-17093 18021.pdf', '/vendor_documents/UNASSOCIATED_FILES/062618/SKYE/NY17093/PDF/', 'PDF', NULL, '48924bf3cddc92b0b23d88fa413d02b7', 'JT18LB568', '2018-06-26 18:19:59'),
(557, 'Invoice', 'NY17093', 4, 'doc-568-iv-spring-17093 18021.pdf', '/vendor_documents/UNASSOCIATED_FILES/062618/SKYE/NY17093/PDF/', 'PDF', NULL, 'f92578d1f253dcfb8d9d2f792d418e54', 'JT18LB568', '2018-06-26 18:19:59'),
(558, 'Parts_List', 'RR18063', 3, 'doc-570-PL-jack-17163.pdf', '/vendor_documents/RR18-RR18063 TEMU759017/', 'PDF', 11625, 'cc6d55189e48fca04ea0aacfbfe16e3c', 'JT18LB570', '2018-06-26 18:20:00'),
(559, 'Invoice', 'RR18063', 3, 'doc-570-in-jack-17163.pdf', '/vendor_documents/RR18-RR18063 TEMU759017/', 'PDF', 11625, '75c328a5a25563b9d9b83e684728755c', 'JT18LB570', '2018-06-26 18:20:00'),
(560, 'Parts_List', 'NY17133', 4, 'doc-569-pl-spring-17133.pdf', '/vendor_documents/UNASSOCIATED_FILES/062618/SKYE/NY17133/PDF/', 'PDF', NULL, '3df1fcd1893f0979a619880cc21b7604', 'JT18LB569', '2018-06-26 18:20:00'),
(561, 'Invoice', 'NY17133', 4, 'doc-569-iv-spring-17133.pdf', '/vendor_documents/UNASSOCIATED_FILES/062618/SKYE/NY17133/PDF/', 'PDF', NULL, '7eae0e0136233abd32d1cc5f229dee14', 'JT18LB569', '2018-06-26 18:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_products`
--

CREATE TABLE `vendor_products` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_products`
--

INSERT INTO `vendor_products` (`id`, `vendor_id`, `product_id`) VALUES
(1, 2, 3),
(2, 3, 4),
(3, 4, 5),
(4, 5, 6),
(5, 6, 7),
(6, 7, 7),
(7, 8, 8),
(8, 9, 2),
(9, 10, 8),
(10, 11, 2),
(11, 12, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archived_shipments`
--
ALTER TABLE `archived_shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `container_number_2` (`container_number`),
  ADD KEY `bill_of_lading` (`bill_of_lading`),
  ADD KEY `requires_payment` (`requires_payment`) USING BTREE,
  ADD KEY `active_shipments` (`is_active`) USING BTREE,
  ADD KEY `container_number` (`container_number`) USING BTREE,
  ADD KEY `vendor_identifier` (`vendor_identifier`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `md5_container_number_and_date` (`md5_container_number_and_date`),
  ADD KEY `event_type` (`event_type`);

--
-- Indexes for table `datatables_states`
--
ALTER TABLE `datatables_states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `container_number` (`container_number`) USING BTREE,
  ADD KEY `bill_of_lading` (`bill_of_lading`),
  ADD KEY `requires_payment` (`requires_payment`) USING BTREE,
  ADD KEY `active_shipments` (`is_active`) USING BTREE,
  ADD KEY `vendor_identifier` (`vendor_identifier`);

--
-- Indexes for table `truckers`
--
ALTER TABLE `truckers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_events`
--
ALTER TABLE `update_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `container_number` (`container_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_initials` (`document_initials`);

--
-- Indexes for table `vendor_documents`
--
ALTER TABLE `vendor_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `md5_hash` (`md5_hash`),
  ADD KEY `shipment` (`shipment_id`),
  ADD KEY `document_type` (`document_type`),
  ADD KEY `identifying_label` (`identifying_label`),
  ADD KEY `file_extension` (`file_extension`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors` (`vendor_id`),
  ADD KEY `PRODUCT_CONSTRAINT` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archived_shipments`
--
ALTER TABLE `archived_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11592;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1126;

--
-- AUTO_INCREMENT for table `datatables_states`
--
ALTER TABLE `datatables_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11660;

--
-- AUTO_INCREMENT for table `truckers`
--
ALTER TABLE `truckers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `update_events`
--
ALTER TABLE `update_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor_documents`
--
ALTER TABLE `vendor_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562;

--
-- AUTO_INCREMENT for table `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD CONSTRAINT `PRODUCT_CONSTRAINT` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `VENDOR_CONSTRAINT` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
