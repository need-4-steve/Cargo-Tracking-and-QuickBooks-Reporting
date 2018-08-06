-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2018 at 10:00 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

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
  `file_directory` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `archived_shipments`
--

INSERT INTO `archived_shipments` (`id`, `status`, `po`, `product_id`, `container_number`, `bill_of_lading`, `vendor_id`, `discharge_port`, `final_destination`, `eta`, `lfd`, `pickup_number`, `truck_date`, `trucker_id`, `bl_status`, `freight`, `isf_required`, `customs`, `is_complete`, `po_boolean`, `qb_rt`, `qb_ws`, `latest_event`, `latest_event_time_and_date`, `is_active`, `requires_payment`, `container_notes`, `last_update`, `container_size`, `do`, `vendor_identifier`, `has_documents`, `file_directory`) VALUES
(111, '0', 'WD18034', 2, 'CXDU122177', '6160598210', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-09', 63827, '2018-06-11 14:31:00', 2, 'Release', 1, 1, 1, 1, 0, 0, 1, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(113, '0', NULL, 6, 'TRHU168632', '6182545470', 5, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-09', 881301, '2018-06-08 14:30:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 20, 1, NULL, 0, NULL),
(129, '0', NULL, 4, 'DFSU632170', '6182110120', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-11', '2018-06-13', 949540, '2018-06-12 10:00:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(130, '0', NULL, 4, 'FSCU872354', '6182110120', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-13', 949540, '2018-06-08 14:28:00', 2, 'Release', 1, 1, 1, 0, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(131, '0', 'WD18-033', 2, 'TCNU644757', '6160596700', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-09', 322425, '2018-06-07 14:29:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(132, '0', 'WD18-035', 2, 'TCNU259060', '6160597320', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', NULL, '2018-06-18 08:00:00', 2, 'Release', 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 1, NULL, '2018-06-26 11:00:04', 40, 1, NULL, 0, NULL),
(133, '0', 'WD18-036', 2, 'SEGU443110', '6160597330', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', 362401, '2018-06-14 08:17:00', 2, 'Release', 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(134, '0', 'WD18-037', 2, 'CCLU689366', '6160597340', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', 15509, '2018-06-15 08:17:00', 2, 'Release', 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 1, NULL, '2018-06-26 11:00:04', 40, 1, NULL, 0, NULL),
(135, '0', 'YX18044B', 3, 'CAIU344452', '6185488790', 2, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-17', 864059, '2018-06-15 10:00:00', 2, 'Release', 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 0, NULL, '2018-06-26 11:00:04', 20, 1, NULL, 0, NULL),
(136, '0', NULL, 8, 'TCNU862477', '6185516940', 8, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-11', '2018-06-14', 986468, '2018-06-13 08:00:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 'Intermodal Departure from Last Port of Discharge', NULL, 0, 0, NULL, '2018-07-03 11:00:05', 40, 1, NULL, 0, NULL),
(137, '3', 'Tire land', 8, 'TCNU803965', '6185527170', 1, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-17', '2018-06-19', 525242, NULL, 1, 'Release', 1, 1, 1, 1, 1, 1, 1, 'Vessel Arrival at Last POD', NULL, 0, 1, NULL, '2018-06-27 11:00:05', 40, 1, NULL, 0, NULL),
(138, '0', 'WD18-039', 2, 'TEMU628934', '6160597350', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-25', '2018-06-28', 185011, NULL, 1, 'Release', 1, 1, 0, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 40, 1, NULL, 0, NULL),
(139, '0', 'WD18-040', 2, 'BMOU439963', '6160597360', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-25', '2018-06-28', 493056, NULL, 1, 'Release', 1, 1, 0, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 1, NULL, '2018-07-07 11:00:05', 40, 1, NULL, 0, NULL),
(140, '0', 'WD18-038', 2, 'CBHU832619', '6160597370', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-23', '2018-06-26', 492547, NULL, 1, 'Release', 1, 1, 1, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 1, NULL, '2018-07-04 11:00:13', 40, 1, NULL, 0, NULL),
(141, '0', 'JT18062', 4, 'FCIU987424', '6182111620', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-23', '2018-06-25', 837092, NULL, 1, 'Release', 1, 1, 1, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-03 11:00:05', 40, 1, NULL, 0, NULL),
(142, '0', '17121', 5, 'GLDU931983', '6008522700', 4, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-27', '2018-07-01', 597831, NULL, 1, 'Release', 0, 1, 0, 1, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-07-06 11:00:05', 20, 1, NULL, 0, NULL),
(159, '2', NULL, 8, 'Unassigned [6185605500]', '6185605500', 8, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(160, '2', NULL, 3, 'Unassigned [6185607860]', '6185607860', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 20, 1, NULL, 0, NULL),
(175, '2', NULL, 2, 'Unassigned [6183114240]', '6183114240', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(176, '2', NULL, 2, 'Unassigned [6183114250]', '6183114250', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(177, '2', NULL, 2, 'Unassigned [6183114260]', '6183114260', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(178, '2', NULL, 2, 'Unassigned [6183114210]', '6183114210', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-25 11:00:18', 40, 1, NULL, 0, NULL),
(179, '2', NULL, 2, 'Unassigned [6183114220]', '6183114220', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-04 11:00:13', 40, 1, NULL, 0, NULL),
(180, '2', NULL, 2, 'Unassigned [6183114230]', '6183114230', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-04 11:00:13', 40, 1, NULL, 0, NULL),
(181, '2', NULL, 2, 'Unassigned [6183114200]', '6183114200', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 40, 1, NULL, 0, NULL),
(182, '2', NULL, 2, 'Unassigned [6183114380]', '6183114380', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 40, 1, NULL, 0, NULL),
(183, '2', NULL, 2, 'Unassigned [6183114390]', '6183114390', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 40, 1, NULL, 0, NULL),
(185, '2', NULL, NULL, 'Unassigned [6185637150]', '6185637150', NULL, 'Vancouver (Intended)', 'Memphis, Tennessee', '2018-07-14', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-26 11:00:04', 40, 1, NULL, 0, NULL),
(188, '2', NULL, 4, 'Unassigned [6182115600]', '6182115600', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(202, '2', NULL, 3, 'Unassigned [6185691600]', '6185691600', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 20, 1, NULL, 0, NULL),
(204, '2', NULL, NULL, 'Unassigned [6183511340]', '6183511340', NULL, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-25', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-29 11:00:10', 20, 1, NULL, 0, NULL),
(205, '2', NULL, 2, 'Unassigned [6185677760]', '6185677760', 9, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-29 11:00:10', 40, 1, NULL, 0, NULL),
(206, '2', NULL, NULL, 'Unassigned [6185693500]', '6185693500', NULL, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-02 11:00:15', 40, 1, NULL, 0, NULL),
(208, '2', NULL, 5, 'Unassigned [6008532450]', '6008532450', 4, 'Charleston (Intended)', 'Loris, South Carolina', '2018-09-04', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-02 11:00:15', 20, 0, NULL, 0, NULL),
(209, '2', NULL, 5, 'Unassigned [6008532880]', '6008532880', 4, 'Charleston (Intended)', 'Loris, South Carolina', '2018-09-25', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 20, 0, NULL, 0, NULL),
(212, '2', NULL, 4, 'Unassigned [6182118250]', '6182118250', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 40, 1, NULL, 0, NULL),
(215, '2', NULL, 6, 'Unassigned [6190982750]', '6190982750', 5, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 20, 1, NULL, 0, NULL),
(218, '2', NULL, 3, 'Unassigned [6191643350]', '6191643350', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 20, 1, NULL, 0, NULL),
(225, '2', NULL, NULL, 'Unassigned [6191658290]', '6191658290', NULL, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 40, 1, NULL, 0, NULL);

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
(69, 'CBHU705070', 'ETA', '2018-05-23 23:59:00', '2018-05-23 23:59:00', 'Estimated Time of Arrival for Container #: CBHU705070. Times/Dates Subject to Change...', 114, '3608cdaa0e1683c367b8ae62f17eae54'),
(70, 'CCLU797283', 'ETA', '2018-05-24 23:59:00', '2018-05-24 23:59:00', 'Estimated Time of Arrival for Container #: CCLU797283. Times/Dates Subject to Change...', 115, 'b4e3936e80e3c094940a7db7017dca8c'),
(71, 'TCNU228429', 'ETA', '2018-05-24 23:59:00', '2018-05-24 23:59:00', 'Estimated Time of Arrival for Container #: TCNU228429. Times/Dates Subject to Change...', 116, 'f41afaaa4e5905cb7b19c795f81bd771'),
(72, 'UETU516083', 'ETA', '2018-05-26 23:59:00', '2018-05-26 23:59:00', 'Estimated Time of Arrival for Container #: UETU516083. Times/Dates Subject to Change...', 117, 'b41ef10f16e44d32545cd789e07b7b5b'),
(73, 'BMOU455577', 'ETA', '2018-05-26 23:59:00', '2018-05-26 23:59:00', 'Estimated Time of Arrival for Container #: BMOU455577. Times/Dates Subject to Change...', 118, '1a060a3f2332fa5229bf1f65a0079a99'),
(74, 'CCLU769484', 'ETA', '2018-05-28 23:59:00', '2018-05-28 23:59:00', 'Estimated Time of Arrival for Container #: CCLU769484. Times/Dates Subject to Change...', 119, '52b35189aabf292fb7b2e7b2be3ff62f'),
(75, 'DFSU156558', 'ETA', '2018-05-28 23:59:00', '2018-05-28 23:59:00', 'Estimated Time of Arrival for Container #: DFSU156558. Times/Dates Subject to Change...', 120, 'ee324b2d4683d06b1831ea7d3dbfd46b'),
(76, 'FSCU879069', 'ETA', '2018-05-28 23:59:00', '2018-05-28 23:59:00', 'Estimated Time of Arrival for Container #: FSCU879069. Times/Dates Subject to Change...', 121, 'b5b7c663336b172feeb676ad3814edfd'),
(77, 'TCNU137006', 'ETA', '2018-05-28 23:59:00', '2018-05-28 23:59:00', 'Estimated Time of Arrival for Container #: TCNU137006. Times/Dates Subject to Change...', 122, '29cbcbcb0ae581595c3dbb9339bdd87b'),
(78, 'TLLU487706', 'ETA', '2018-05-28 23:59:00', '2018-05-28 23:59:00', 'Estimated Time of Arrival for Container #: TLLU487706. Times/Dates Subject to Change...', 123, 'ecfa28f4a7209d1fa8e7e81e7c238ec4'),
(79, 'CBHU568861', 'ETA', '2018-05-28 23:59:00', '2018-05-28 23:59:00', 'Estimated Time of Arrival for Container #: CBHU568861. Times/Dates Subject to Change...', 124, 'cecb5c3b1f295c272c506817dd55a196'),
(80, 'TLLU447704', 'ETA', '2018-05-30 23:59:00', '2018-05-30 23:59:00', 'Estimated Time of Arrival for Container #: TLLU447704. Times/Dates Subject to Change...', 125, '1d0c4578d435a0b677f301240b454385'),
(81, 'TCNU557797', 'ETA', '2018-05-30 23:59:00', '2018-05-30 23:59:00', 'Estimated Time of Arrival for Container #: TCNU557797. Times/Dates Subject to Change...', 126, 'c6ab6ec9afcc6ceb1d2d560b09f7ac72'),
(82, 'CCLU725168', 'ETA', '2018-06-01 23:59:00', '2018-06-01 23:59:00', 'Estimated Time of Arrival for Container #: CCLU725168. Times/Dates Subject to Change...', 127, '5c47f43a512a42d343775312aafea2d8'),
(83, 'CSLU200428', 'ETA', '2018-06-03 23:59:00', '2018-06-03 23:59:00', 'Estimated Time of Arrival for Container #: CSLU200428. Times/Dates Subject to Change...', 128, '93f79a06d62d2f4f1b6cd6b9c7509710'),
(84, 'DFSU632170', 'ETA', '2018-06-06 23:59:00', '2018-06-06 23:59:00', 'Estimated Time of Arrival for Container #: DFSU632170. Times/Dates Subject to Change...', 129, 'bce46e36e14f46d3f8d8f089716e0675'),
(85, 'FSCU872354', 'ETA', '2018-06-06 23:59:00', '2018-06-06 23:59:00', 'Estimated Time of Arrival for Container #: FSCU872354. Times/Dates Subject to Change...', 130, '3a114da9f67e156a62e8b524ed3fd873'),
(86, 'TCNU644757', 'ETA', '2018-06-09 23:59:00', '2018-06-09 23:59:00', 'Estimated Time of Arrival for Container #: TCNU644757. Times/Dates Subject to Change...', 131, '880d6c7fe99e563bed26d68abc498bcc'),
(87, 'TCNU259060', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: TCNU259060. Times/Dates Subject to Change...', 132, '398268cd501c26670918b001fb2dfab7'),
(88, 'SEGU443110', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: SEGU443110. Times/Dates Subject to Change...', 133, 'c31b7004e2cb75fa16c73dde1fe736ee'),
(89, 'CCLU689366', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: CCLU689366. Times/Dates Subject to Change...', 134, '5a8c04af1e046618d34c894cc3cfa724'),
(90, 'CAIU344452', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: CAIU344452. Times/Dates Subject to Change...', 135, 'b2943f6a56a7dc8428eb9c11da46e7c2'),
(91, 'TCNU862477', 'ETA', '2018-06-13 23:59:00', '2018-06-13 23:59:00', 'Estimated Time of Arrival for Container #: TCNU862477. Times/Dates Subject to Change...', 136, 'b8ed37effe9b20e5cec5223394d19ba7'),
(92, 'TCNU803965', 'ETA', '2018-06-14 23:59:00', '2018-06-14 23:59:00', 'Estimated Time of Arrival for Container #: TCNU803965. Times/Dates Subject to Change...', 137, '7b5b7cadce09aa58237573ad2efe7eb0'),
(93, 'TEMU628934', 'ETA', '2018-06-18 23:59:00', '2018-06-18 23:59:00', 'Estimated Time of Arrival for Container #: TEMU628934. Times/Dates Subject to Change...', 138, 'b60a0366e890e06f025e3b5e58e1a2be'),
(94, 'BMOU439963', 'ETA', '2018-06-18 23:59:00', '2018-06-18 23:59:00', 'Estimated Time of Arrival for Container #: BMOU439963. Times/Dates Subject to Change...', 139, '483ce3e1b8d99581a2d17a22fe6e899e'),
(95, 'CBHU832619', 'ETA', '2018-06-18 23:59:00', '2018-06-18 23:59:00', 'Estimated Time of Arrival for Container #: CBHU832619. Times/Dates Subject to Change...', 140, 'dc1fd8d843380cd84bcfc93b85a28b9a'),
(96, 'FCIU987424', 'ETA', '2018-06-18 23:59:00', '2018-06-18 23:59:00', 'Estimated Time of Arrival for Container #: FCIU987424. Times/Dates Subject to Change...', 141, '4b2744d82aa34b2f33066644268e858e'),
(97, 'GLDU931983', 'ETA', '2018-06-24 23:59:00', '2018-06-24 23:59:00', 'Estimated Time of Arrival for Container #: GLDU931983. Times/Dates Subject to Change...', 142, '1acebab349c27b14621a698c43bc5318'),
(98, 'Unassigned [6185511510]', 'ETA', '2018-06-25 23:59:00', '2018-06-25 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185511510]. Times/Dates Subject to Change...', 143, '9a5db81fa4c2d30e40bd479cd0acd1ea'),
(99, 'Unassigned [6185511520]', 'ETA', '2018-06-25 23:59:00', '2018-06-25 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185511520]. Times/Dates Subject to Change...', 144, '7d8fe4ff35ff458ac3f7890885b76cc2'),
(100, 'CSLU617701', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: CSLU617701. Times/Dates Subject to Change...', 145, '013c862073bf067e917e5ab0b19a2031'),
(101, 'CBHU701935', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: CBHU701935. Times/Dates Subject to Change...', 146, 'c27d9831b8aeddcabb5fdad27a95de92'),
(102, 'TCKU255801', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: TCKU255801. Times/Dates Subject to Change...', 147, 'be2cde4b497c95f02909a656992282a1'),
(103, 'TCNU909669', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: TCNU909669. Times/Dates Subject to Change...', 148, 'd5441eecf892316e6f7124efb4d3aa79'),
(104, 'TCNU507859', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: TCNU507859. Times/Dates Subject to Change...', 149, 'eb507e84dc8139375e3d3eda48d71cd3'),
(105, 'CSLU114281', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: CSLU114281. Times/Dates Subject to Change...', 150, '338183b15800421315f9fdd6a987a429'),
(106, 'CBHU552322', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: CBHU552322. Times/Dates Subject to Change...', 151, 'a0312ef3af4b84bda4be0104a32f65aa'),
(107, 'CSLU235424', 'ETA', '2018-06-26 23:59:00', '2018-06-26 23:59:00', 'Estimated Time of Arrival for Container #: CSLU235424. Times/Dates Subject to Change...', 152, 'abc13f83d7da8f395a4489890235bffb'),
(108, 'Unassigned [6182113910]', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6182113910]. Times/Dates Subject to Change...', 153, 'fe3189d443d911894967cf1c9185fdd4'),
(109, 'TCNU634231', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: TCNU634231. Times/Dates Subject to Change...', 154, 'ebe0c2134b644e15106f271ff2efeb53'),
(110, 'Unassigned [6183107820]', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183107820]. Times/Dates Subject to Change...', 155, 'ab04a34fdcaba348c06f432bca15ea98'),
(111, 'BMOU585674', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: BMOU585674. Times/Dates Subject to Change...', 156, '9c774bd18ad370aca3188fdb904f3baa'),
(112, 'CSNU646679', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: CSNU646679. Times/Dates Subject to Change...', 157, '19e5775dfb7170a8bd15992f71d2f3c8'),
(113, 'Unassigned [6183507450]', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183507450]. Times/Dates Subject to Change...', 158, '4b0db43a9b5bca35c3f3ccdc9c49b23e'),
(114, 'Unassigned [6185605500]', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185605500]. Times/Dates Subject to Change...', 159, '6b712f4faf8b459e90191394ee1abda1'),
(115, 'Unassigned [6185607860]', 'ETA', '2018-07-04 23:59:00', '2018-07-04 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185607860]. Times/Dates Subject to Change...', 160, 'a51756bcdbe398545734adce61065c98'),
(116, 'Unassigned [6183107800]', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183107800]. Times/Dates Subject to Change...', 161, 'f573e1769c585d992b60597b494a0708'),
(117, 'Unassigned [6183107810]', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183107810]. Times/Dates Subject to Change...', 162, 'b77d5a73c44703a8198c18b4f629f716'),
(118, 'Unassigned [6185603970]', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185603970]. Times/Dates Subject to Change...', 163, '8ea0c7afa899189ac055163ef778ef8a'),
(119, 'Unassigned [6190904790]', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6190904790]. Times/Dates Subject to Change...', 164, 'fc19348f729d4fb2b0db2a7f3cb7b634'),
(120, 'Unassigned [6183108290]', 'ETA', '2018-07-13 23:59:00', '2018-07-13 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183108290]. Times/Dates Subject to Change...', 165, 'f0efb6651eb736914e2024c511166a71'),
(121, 'Unassigned [6183104660]', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183104660]. Times/Dates Subject to Change...', 166, 'c2aeb6d2950ed2db4bb5e198d4010b8a'),
(122, 'Unassigned [6183108390]', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183108390]. Times/Dates Subject to Change...', 167, '265548aab556eea2f59d13838ebd51c1'),
(123, 'Unassigned [6183104650]', 'ETA', '2018-07-20 23:59:00', '2018-07-20 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183104650]. Times/Dates Subject to Change...', 168, 'a9015c8cd358218116401a6195092d87'),
(124, 'CCLU797283', 'LFD', '2018-05-29 00:00:00', '2018-05-29 23:59:00', 'Last Free Day for Container #: CCLU797283. Times/Dates Subject to Change...', 115, 'b49b452110b703e0135d1b98366919bd'),
(125, 'TCNU228429', 'LFD', '2018-05-29 00:00:00', '2018-05-29 23:59:00', 'Last Free Day for Container #: TCNU228429. Times/Dates Subject to Change...', 116, '74266297247c860129ad00c9b0dd3530'),
(126, 'UETU516083', 'LFD', '2018-05-30 00:00:00', '2018-05-30 23:59:00', 'Last Free Day for Container #: UETU516083. Times/Dates Subject to Change...', 117, '0ad2a4719bf03f7238bca721d6de0636'),
(127, 'CCLU725168', 'LFD', '2018-06-05 00:00:00', '2018-06-05 23:59:00', 'Last Free Day for Container #: CCLU725168. Times/Dates Subject to Change...', 127, '5a6e086d42e83b2f0b77baf2428e5386'),
(128, 'CBHU705070', 'LFD', '2018-05-25 00:00:00', '2018-05-25 23:59:00', 'Last Free Day for Container #: CBHU705070. Times/Dates Subject to Change...', 114, 'a7ce1a9f6f161a71cda88b3c2a1771e3'),
(129, 'CCLU769484', 'LFD', '2018-05-31 00:00:00', '2018-05-31 23:59:00', 'Last Free Day for Container #: CCLU769484. Times/Dates Subject to Change...', 119, '2b57091c42e9d9424f44064edb40a6a6'),
(130, 'BMOU455577', 'LFD', '2018-05-29 00:00:00', '2018-05-29 23:59:00', 'Last Free Day for Container #: BMOU455577. Times/Dates Subject to Change...', 118, 'c19d22e3e34af8285663027f125c6e93'),
(131, 'DFSU156558', 'LFD', '2018-05-31 00:00:00', '2018-05-31 23:59:00', 'Last Free Day for Container #: DFSU156558. Times/Dates Subject to Change...', 120, 'a414fb0aac424fa9cdf54411399d1146'),
(132, 'FSCU879069', 'LFD', '2018-05-31 00:00:00', '2018-05-31 23:59:00', 'Last Free Day for Container #: FSCU879069. Times/Dates Subject to Change...', 121, '03c739370c6c0860dc3754638fc779ee'),
(133, 'TCNU137006', 'LFD', '2018-05-31 00:00:00', '2018-05-31 23:59:00', 'Last Free Day for Container #: TCNU137006. Times/Dates Subject to Change...', 122, '992589abb162c18448e0c3566c4448ae'),
(134, 'TLLU487706', 'LFD', '2018-05-31 00:00:00', '2018-05-31 23:59:00', 'Last Free Day for Container #: TLLU487706. Times/Dates Subject to Change...', 123, 'd3247fd8db5e01ff1608119b1a2eb66a'),
(135, 'TLLU447704', 'LFD', '2018-06-01 00:00:00', '2018-06-01 23:59:00', 'Last Free Day for Container #: TLLU447704. Times/Dates Subject to Change...', 125, '00356200315a8a776497831ac05524f4'),
(136, 'TCNU557797', 'LFD', '2018-06-01 00:00:00', '2018-06-01 23:59:00', 'Last Free Day for Container #: TCNU557797. Times/Dates Subject to Change...', 126, 'e729b8ce1ea18a84cea90ff69a146b5c'),
(137, 'CSLU200428', 'LFD', '2018-06-06 00:00:00', '2018-06-06 23:59:00', 'Last Free Day for Container #: CSLU200428. Times/Dates Subject to Change...', 128, '510c0fb0862e8cd55cf80196a2a6810a'),
(138, 'CBHU568861', 'LFD', '2018-05-31 00:00:00', '2018-05-31 23:59:00', 'Last Free Day for Container #: CBHU568861. Times/Dates Subject to Change...', 124, '4cc11178c48000c69acf1c143b057e1b'),
(139, 'TCNU626781', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: TCNU626781. Times/Dates Subject to Change...', 169, '6cc3520e4b2e3df0ad2e09b5c9a97093'),
(140, 'TCNU739627', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: TCNU739627. Times/Dates Subject to Change...', 170, 'df426b845212c44c7eef845e0c3affbd'),
(141, 'Unassigned [6185628380]', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185628380]. Times/Dates Subject to Change...', 171, 'b2ac7256968d0f6ef7ecd9e7a809a400'),
(142, 'TCNU626886', 'ETA', '2018-07-13 23:59:00', '2018-07-13 23:59:00', 'Estimated Time of Arrival for Container #: TCNU626886. Times/Dates Subject to Change...', 172, '463d974b2c2c5cca79266810bd23f071'),
(143, 'TEMU759017', 'ETA', '2018-07-02 23:59:00', '2018-07-02 23:59:00', 'Estimated Time of Arrival for Container #: TEMU759017. Times/Dates Subject to Change...', 173, 'fe1f67d2adf246a9280ce4b2d6865d1a'),
(144, 'DFSU158089', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: DFSU158089. Times/Dates Subject to Change...', 174, '5973d81dff020e72aea8e176900da7a4'),
(145, 'Unassigned [6183114240]', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114240]. Times/Dates Subject to Change...', 175, '5cacab85db1e0252d3ace91ed707010c'),
(146, 'Unassigned [6183114250]', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114250]. Times/Dates Subject to Change...', 176, '09049d069ac239d702e1993ff961de39'),
(147, 'Unassigned [6183114260]', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114260]. Times/Dates Subject to Change...', 177, '302d1d1ea7237d22fa56813d31fee846'),
(148, 'Unassigned [6183114210]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114210]. Times/Dates Subject to Change...', 178, '31da824d7141b77555322a3122a0dc7e'),
(149, 'Unassigned [6183114220]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114220]. Times/Dates Subject to Change...', 179, '5bec7423f6799b01592da869a948a1f6'),
(150, 'Unassigned [6183114230]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114230]. Times/Dates Subject to Change...', 180, '3b77112b8a05f885919eecd415bbce21'),
(151, 'Unassigned [6183114200]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114200]. Times/Dates Subject to Change...', 181, 'e7a3bc7e5efee5029c7ee54eb68f9d77'),
(152, 'Unassigned [6183114380]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114380]. Times/Dates Subject to Change...', 182, '2d612d7efb097c7356db2c553af404db'),
(153, 'Unassigned [6183114390]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183114390]. Times/Dates Subject to Change...', 183, '3e998cf3b1d2ee5a46911eed1413479d'),
(154, 'TCNU644757', 'LFD', '2018-06-09 00:00:00', '2018-06-09 23:59:00', 'Last Free Day for Container #: TCNU644757. Times/Dates Subject to Change...', 131, 'c4da01c3b17dc5b915bffe308b5c21b1'),
(155, 'CXDU122177', 'LFD', '2018-06-09 00:00:00', '2018-06-09 23:59:00', 'Last Free Day for Container #: CXDU122177. Times/Dates Subject to Change...', 111, '793509c43be697e2ab92ad2126c1f370'),
(156, 'TRHU168632', 'LFD', '2018-06-09 00:00:00', '2018-06-09 23:59:00', 'Last Free Day for Container #: TRHU168632. Times/Dates Subject to Change...', 113, 'b868b5bee67691075ff04b5dd53ff1c2'),
(157, 'CBHU823499', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: CBHU823499. Times/Dates Subject to Change...', 184, 'daaaf4f7d2efe3ac4d4c7f720de2f24e'),
(158, 'Unassigned [6185637150]', 'ETA', '2018-07-14 23:59:00', '2018-07-14 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185637150]. Times/Dates Subject to Change...', 185, '906f8f27df48376bdcc984dbeea02761'),
(159, 'Unassigned [6185635620]', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185635620]. Times/Dates Subject to Change...', 186, '1a859369609f462d9422befd9113a0f5'),
(160, 'TCKU303205', 'ETA', '2018-07-09 23:59:00', '2018-07-09 23:59:00', 'Estimated Time of Arrival for Container #: TCKU303205. Times/Dates Subject to Change...', 187, '8af5816b71e49855238e0d16df39f010'),
(161, 'Unassigned [6182115600]', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6182115600]. Times/Dates Subject to Change...', 188, '69ac8d67b5731c0e5d5c939b1ff20420'),
(162, 'CCLU673627', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: CCLU673627. Times/Dates Subject to Change...', 189, '71a14319a05a64571b22b71c331a50aa'),
(163, 'GLDU753837', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: GLDU753837. Times/Dates Subject to Change...', 190, '0962b0694b06ffdadecd3733cec156e3'),
(164, 'TCNU651692', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: TCNU651692. Times/Dates Subject to Change...', 191, 'e05c94851a1951b72ce3390c096d0298'),
(165, 'DFSU632170', 'LFD', '2018-06-13 00:00:00', '2018-06-13 23:59:00', 'Last Free Day for Container #: DFSU632170. Times/Dates Subject to Change...', 129, 'd6347256befdf38fd162443df9939389'),
(166, 'FSCU872354', 'LFD', '2018-06-13 00:00:00', '2018-06-13 23:59:00', 'Last Free Day for Container #: FSCU872354. Times/Dates Subject to Change...', 130, 'cdeb7a5bfc3e594d38082b09acef42f8'),
(167, 'TCNU862477', 'LFD', '2018-06-14 00:00:00', '2018-06-14 23:59:00', 'Last Free Day for Container #: TCNU862477. Times/Dates Subject to Change...', 136, 'd1f6217161b12af5d54a8fa20af0b7bc'),
(168, 'Unassigned [6190935400]', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6190935400]. Times/Dates Subject to Change...', 192, '997560fabd7af4e91cd9f5ad882093da'),
(169, 'TCNU259060', 'LFD', '2018-06-16 00:00:00', '2018-06-16 23:59:00', 'Last Free Day for Container #: TCNU259060. Times/Dates Subject to Change...', 132, '7f8e8670f5f20ef82bd8ae5cc0668b0b'),
(170, 'SEGU443110', 'LFD', '2018-06-16 00:00:00', '2018-06-16 23:59:00', 'Last Free Day for Container #: SEGU443110. Times/Dates Subject to Change...', 133, '2a5962a590640fadbc158b15ea0c1f96'),
(171, 'CCLU689366', 'LFD', '2018-06-16 00:00:00', '2018-06-16 23:59:00', 'Last Free Day for Container #: CCLU689366. Times/Dates Subject to Change...', 134, '6044c9db8028007986fd148c4fc58bf5'),
(172, 'TRHU167517', 'ETA', '2018-07-11 23:59:00', '2018-07-11 23:59:00', 'Estimated Time of Arrival for Container #: TRHU167517. Times/Dates Subject to Change...', 193, 'cd57202e445fa05d62d5546ed86a53a2'),
(173, 'TCKU152269', 'ETA', '2018-07-11 23:59:00', '2018-07-11 23:59:00', 'Estimated Time of Arrival for Container #: TCKU152269. Times/Dates Subject to Change...', 194, '6d46c13d23a91bfd0193cef843196731'),
(174, 'FCIU996977', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FCIU996977. Times/Dates Subject to Change...', 195, 'ebd7c4cceca6034b9f2737b615d45885'),
(175, 'FCIU525434', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FCIU525434. Times/Dates Subject to Change...', 196, '476777cc8a28a688c0dbc007b2052ae2'),
(176, 'CAIU344452', 'LFD', '2018-06-17 00:00:00', '2018-06-17 23:59:00', 'Last Free Day for Container #: CAIU344452. Times/Dates Subject to Change...', 135, '67e4f7622c48ef553f7fff1ed2a666e7'),
(177, 'FSCU895722', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FSCU895722. Times/Dates Subject to Change...', 197, '73c876205e4bb102fa3e5da7a02be919'),
(178, 'FCIU960299', 'ETA', '2018-07-16 23:59:00', '2018-07-16 23:59:00', 'Estimated Time of Arrival for Container #: FCIU960299. Times/Dates Subject to Change...', 198, '89296e98ce9f99a1f1d6c0a14a41f1fe'),
(179, 'TCNU607485', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: TCNU607485. Times/Dates Subject to Change...', 199, '45efc65495d8802ce9604f9c02d50223'),
(180, 'TCNU528878', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: TCNU528878. Times/Dates Subject to Change...', 200, 'c05aea318340223617e471c2875460b1'),
(181, 'TCNU618122', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: TCNU618122. Times/Dates Subject to Change...', 201, '7d5fca6ccb0d87b4ddbe882ccb124519'),
(182, 'Unassigned [6185691600]', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185691600]. Times/Dates Subject to Change...', 202, '149c1a26d1260efce452cf2cf8f2ac6f'),
(183, 'CBHU554243', 'ETA', '2018-07-23 23:59:00', '2018-07-23 23:59:00', 'Estimated Time of Arrival for Container #: CBHU554243. Times/Dates Subject to Change...', 203, '71392c5a4b5b91f94b468e86930abb56'),
(184, 'Unassigned [6183511340]', 'ETA', '2018-07-25 23:59:00', '2018-07-25 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6183511340]. Times/Dates Subject to Change...', 204, 'dbffa574eac6f114a229bc11e9ceb9dd'),
(185, 'Unassigned [6185677760]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185677760]. Times/Dates Subject to Change...', 205, '846f7c0e6046bca0c0d9970847d807f4'),
(186, 'Unassigned [6185693500]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6185693500]. Times/Dates Subject to Change...', 206, '55cd774ab94da136d4249be979f06c1d'),
(187, 'FCIU987424', 'LFD', '2018-06-25 00:00:00', '2018-06-25 23:59:00', 'Last Free Day for Container #: FCIU987424. Times/Dates Subject to Change...', 141, '1aa8b3c1bc92b92056b6ba6e49da51d0'),
(188, 'TCNU803965', 'LFD', '2018-06-19 00:00:00', '2018-06-19 23:59:00', 'Last Free Day for Container #: TCNU803965. Times/Dates Subject to Change...', 137, '37985447e49539b2992b47093d82c908'),
(189, 'CBHU832619', 'LFD', '2018-06-26 00:00:00', '2018-06-26 23:59:00', 'Last Free Day for Container #: CBHU832619. Times/Dates Subject to Change...', 140, '14496dc2a572401719a02b715abbdd32'),
(190, 'TCNU643762', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: TCNU643762. Times/Dates Subject to Change...', 207, '6c3ab6cf558f10a094fefd6eb824bb5e'),
(191, 'Unassigned [6008532450]', 'ETA', '2018-09-04 23:59:00', '2018-09-04 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6008532450]. Times/Dates Subject to Change...', 208, 'c4eb6e473237cc389e1c40ba3e3cfae8'),
(192, 'CSLU114281', 'LFD', '2018-06-29 00:00:00', '2018-06-29 23:59:00', 'Last Free Day for Container #: CSLU114281. Times/Dates Subject to Change...', 150, '28ce54c52deab2b76767405900bd50fa'),
(193, 'CBHU552322', 'LFD', '2018-06-29 00:00:00', '2018-06-29 23:59:00', 'Last Free Day for Container #: CBHU552322. Times/Dates Subject to Change...', 151, '02d9179a671cd84a103030dc66a481cd'),
(194, 'CSLU235424', 'LFD', '2001-01-01 00:00:00', '2001-01-01 23:59:00', 'Last Free Day for Container #: CSLU235424. Times/Dates Subject to Change...', 152, '5d8db3ba83ff8e984190297d8041ab36'),
(195, 'TEMU628934', 'LFD', '2018-06-28 00:00:00', '2018-06-28 23:59:00', 'Last Free Day for Container #: TEMU628934. Times/Dates Subject to Change...', 138, '27e723788455e36651bcbb1a5dc3f2c0'),
(196, 'BMOU439963', 'LFD', '2018-06-28 00:00:00', '2018-06-28 23:59:00', 'Last Free Day for Container #: BMOU439963. Times/Dates Subject to Change...', 139, '977c2bd177776867b879319400fdb067'),
(197, 'Unassigned [6008532880]', 'ETA', '2018-09-25 23:59:00', '2018-09-25 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6008532880]. Times/Dates Subject to Change...', 209, '0666a4ffea51ba2e60a9edfc1d4205ee'),
(198, 'TEMU290594', 'ETA', '2018-07-25 23:59:00', '2018-07-25 23:59:00', 'Estimated Time of Arrival for Container #: TEMU290594. Times/Dates Subject to Change...', 210, '59403a781a8dfe804cd9114452d2e9e9'),
(199, 'DFSU233540', 'ETA', '2018-07-25 23:59:00', '2018-07-25 23:59:00', 'Estimated Time of Arrival for Container #: DFSU233540. Times/Dates Subject to Change...', 211, '5ed2b555618eb80412a45a49809177ea'),
(200, 'Unassigned [6182118250]', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6182118250]. Times/Dates Subject to Change...', 212, 'fff0d49dd7ed2c0df41a985eb4b78652'),
(201, 'CSNU673597', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: CSNU673597. Times/Dates Subject to Change...', 213, 'f36dd1af52a4af475a4177b022dcdaba'),
(202, 'GLDU931983', 'LFD', '2018-07-01 00:00:00', '2018-07-01 23:59:00', 'Last Free Day for Container #: GLDU931983. Times/Dates Subject to Change...', 142, '5f811b512440b0252440001869d90040'),
(203, 'TGHU685374', 'LFD', '2018-07-01 00:00:00', '2018-07-01 23:59:00', 'Last Free Day for Container #: TGHU685374. Times/Dates Subject to Change...', 110, 'a709bfdd5e6ea753c9f40f811a576d87'),
(204, 'TCNU909669', 'LFD', '2018-07-02 00:00:00', '2018-07-02 23:59:00', 'Last Free Day for Container #: TCNU909669. Times/Dates Subject to Change...', 148, '8a5830fcbff7a915b65eacd26c66fa24'),
(205, 'TCNU507859', 'LFD', '2018-07-01 00:00:00', '2018-07-01 23:59:00', 'Last Free Day for Container #: TCNU507859. Times/Dates Subject to Change...', 149, '5a332d11e2e52331c0b401ccfd4112ea'),
(206, 'TEMU602378', 'ETA', '2018-07-30 23:59:00', '2018-07-30 23:59:00', 'Estimated Time of Arrival for Container #: TEMU602378. Times/Dates Subject to Change...', 214, '0e30e5d5a583ecce5952828dde3e2109'),
(207, 'Unassigned [6190982750]', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6190982750]. Times/Dates Subject to Change...', 215, 'de456c5e610d4da47730443a804297be'),
(208, 'FCIU612792', 'ETA', '2018-09-04 23:59:00', '2018-09-04 23:59:00', 'Estimated Time of Arrival for Container #: FCIU612792. Times/Dates Subject to Change...', 216, '469f0a4a2a8bf2a522847e366e591379'),
(209, 'CSLU166827', 'ETA', '2018-09-04 23:59:00', '2018-09-04 23:59:00', 'Estimated Time of Arrival for Container #: CSLU166827. Times/Dates Subject to Change...', 217, '0757f6486e52b8c027b7a5309894b831'),
(210, 'CSLU617701', 'LFD', '2018-07-04 00:00:00', '2018-07-04 23:59:00', 'Last Free Day for Container #: CSLU617701. Times/Dates Subject to Change...', 145, 'ab93cf8ac1a3bc303919730d3e94a4b9'),
(211, 'CBHU701935', 'LFD', '2018-07-04 00:00:00', '2018-07-04 23:59:00', 'Last Free Day for Container #: CBHU701935. Times/Dates Subject to Change...', 146, '36552b3b09048bdbe2153cd299c9302b'),
(212, 'TCKU255801', 'LFD', '2018-07-04 00:00:00', '2018-07-04 23:59:00', 'Last Free Day for Container #: TCKU255801. Times/Dates Subject to Change...', 147, '0bb3affb93aba46bd2fd50ed311fff04'),
(213, 'Unassigned [6191643350]', 'ETA', '2018-08-13 23:59:00', '2018-08-13 23:59:00', 'Estimated Time of Arrival for Container #: Unassigned [6191643350]. Times/Dates Subject to Change...', 218, '2aa1ae7e7030cdddb390df4ed8146558'),
(214, 'TCNU626349', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: TCNU626349. Times/Dates Subject to Change...', 219, 'ad221e06432a9a58a07993c3e2a6758c'),
(215, 'TCNU943808', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: TCNU943808. Times/Dates Subject to Change...', 220, 'c832162a9f7cbe0cb2044710c3ec0d81');

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
(4, 'Jacks'),
(5, 'Spring'),
(6, 'Brake'),
(7, 'Chain'),
(8, 'Trailer Tire'),
(9, 'Spindle');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `theme_name` varchar(32) NOT NULL,
  `table_header_font` varchar(128) DEFAULT NULL,
  `table_header_font_size` int(11) DEFAULT NULL,
  `table_header_font_weight` varchar(8) DEFAULT NULL,
  `table_header_font_color` varchar(32) DEFAULT NULL,
  `table_cell_font` varchar(128) DEFAULT NULL,
  `table_cell_font_size` int(11) DEFAULT NULL,
  `table_cell_font_color` varchar(32) DEFAULT NULL,
  `table_width` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `theme_name`, `table_header_font`, `table_header_font_size`, `table_header_font_weight`, `table_header_font_color`, `table_cell_font`, `table_cell_font_size`, `table_cell_font_color`, `table_width`) VALUES
(3, '', '', 0, '500', '', 'Amaranth', 11, '', 51);

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
  `has_documents` tinyint(1) DEFAULT '0',
  `file_directory` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `status`, `po`, `product_id`, `container_number`, `bill_of_lading`, `vendor_id`, `discharge_port`, `final_destination`, `eta`, `lfd`, `pickup_number`, `truck_date`, `trucker_id`, `bl_status`, `freight`, `isf_required`, `customs`, `is_complete`, `po_boolean`, `qb_rt`, `qb_ws`, `latest_event`, `latest_event_time_and_date`, `is_active`, `requires_payment`, `container_notes`, `last_update`, `container_size`, `do`, `vendor_identifier`, `has_documents`, `file_directory`) VALUES
(109, 0, '17165', 5, 'CBHU411055', '6008525240', 4, 'Prince Rupert', 'Memphis, TN', '2018-07-12', NULL, NULL, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 1, 0, NULL, '2018-07-09 11:00:09', 20, 1, NULL, 0, NULL),
(110, 0, NULL, 2, 'TGHU685374', '6160596710', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-01', 458117, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 40, 1, NULL, 0, NULL),
(145, 0, '18063', 4, 'CSLU617701', '6182112950', 3, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-04', 730437, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 40, 1, NULL, 0, NULL),
(146, 0, '18063', 4, 'CBHU701935', '6182112950', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-01', '2018-07-04', 730437, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 40, 1, NULL, 0, NULL),
(147, 0, '18046', 6, 'TCKU255801', '6182630420', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-01', '2018-07-04', 748113, NULL, 1, 'Release', 1, 1, 1, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 20, 1, NULL, 0, NULL),
(148, 0, NULL, 2, 'TCNU909669', '6183104310', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-02', 734298, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 40, 1, NULL, 0, NULL),
(149, 0, NULL, 2, 'TCNU507859', '6183107850', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-01', 726146, NULL, 1, 'Release', 0, 1, 1, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 40, 1, NULL, 0, NULL),
(150, 0, '17093', 5, 'CSLU114281', '6008522710', 4, 'Charleston', 'Loris, SC', '2018-06-25', '2018-06-29', NULL, NULL, 1, 'Release', 1, 1, 1, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 20, 1, 'JT18LB568', 1, 'NY18-17093 CSLU114281'),
(151, 0, '18021', 5, 'CBHU552322', '6008522710', 4, 'Charleston', 'Loris, SC', '2018-06-25', '2018-06-29', NULL, NULL, 1, 'Release', 1, 1, 1, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 20, 1, NULL, 0, NULL),
(152, 3, '17133', 5, 'CSLU235424', '6008526090', 4, 'Norfolk', 'Henderson, NC', NULL, '2001-01-01', NULL, NULL, 1, 'Release', 0, 1, 1, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-07-09 11:00:05', 20, 0, 'JT18LB569', 1, 'NY18-17133 CSLU235424'),
(154, 0, 'WD18-046', 2, 'TCNU634231', '6183104300', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 98534, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-07-09 11:00:20', 40, 1, NULL, 0, NULL),
(156, 0, 'WD18-045', 2, 'BMOU585674', '6183107830', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 790794, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-07-09 11:00:27', 40, 1, NULL, 0, NULL),
(157, 0, 'WD18-044', 2, 'CSNU646679', '6183107840', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 427289, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-07-09 11:00:28', 40, 1, NULL, 0, NULL),
(169, 1, 'WD18-049', 2, 'TCNU626781', '6183107800', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-13', NULL, NULL, NULL, 1, 'Hold', 1, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:37:35', 40, 1, NULL, 0, NULL),
(170, 1, 'WD18-047', 2, 'TCNU739627', '6183107810', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-13', NULL, NULL, NULL, 1, 'Hold', 1, 1, 1, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 19:37:41', 40, 1, NULL, 0, NULL),
(172, 1, 'WD18-048', 2, 'TCNU626886', '6183108290', 11, 'Long Beach', 'Memphis, TN', '2018-07-13', NULL, NULL, NULL, 1, 'Hold', 1, 0, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:37:31', 40, 1, NULL, 0, NULL),
(173, 0, '18064', 4, 'TEMU759017', '6182113910', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 335358, NULL, 1, 'Release', 0, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:40:55', 40, 1, NULL, 0, NULL),
(174, 1, NULL, 6, 'DFSU158089', '6190904790', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-13', NULL, NULL, NULL, 1, 'Release', 1, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:37:58', 20, 1, NULL, 0, NULL),
(184, 0, 'CY18-003', 8, 'CBHU823499', '6185603970', 8, 'Prince Rupert', 'Memphis, TN', '2018-07-12', NULL, NULL, NULL, 1, 'Hold', 1, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:37:21', 40, 1, NULL, 0, NULL),
(187, 1, 'YX18061B', 3, 'TCKU303205', '6185628380', 2, 'Prince Rupert', 'Memphis, TN', '2018-07-13', NULL, NULL, NULL, 1, 'Hold', 1, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:37:55', 20, 1, NULL, 0, NULL),
(189, 1, '18-050', 2, 'CCLU673627', '6183104650', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-15', NULL, NULL, NULL, 1, 'Hold', 0, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 17:07:00', 40, 1, NULL, 0, NULL),
(190, 1, 'WD18-052', 2, 'GLDU753837', '6183104660', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-15', NULL, NULL, NULL, 1, 'Hold', 0, 1, 1, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 17:06:52', 40, 1, NULL, 0, NULL),
(191, 1, 'WD18-051', 2, 'TCNU651692', '6183108390', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-16', NULL, NULL, NULL, 1, 'Hold', 0, 1, 1, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 17:06:46', 40, 1, NULL, 0, NULL),
(193, 1, 'JX18036', 9, 'TRHU167517', '6183507450', 12, 'Prince Rupert', 'Memphis, TN', '2018-07-14', NULL, NULL, NULL, 1, 'Release', 1, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:38:08', 20, 1, NULL, 0, NULL),
(194, 1, 'JX18037', 9, 'TCKU152269', '6183507450', 12, 'Prince Rupert', 'Memphis, TN', '2018-07-14', NULL, NULL, NULL, 1, 'Release', 1, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 19:38:12', 20, 1, NULL, 0, NULL),
(195, 2, NULL, 8, 'FCIU996977', '6185635620', 10, 'Prince Rupert', 'Memphis, TN', '2018-07-18', NULL, NULL, NULL, 1, 'Hold', 0, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 17:07:23', 40, 1, NULL, 0, NULL),
(196, 2, NULL, 6, 'FCIU525434', '6190935400', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-17', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(197, 1, NULL, 4, 'FSCU895722', '6182115600', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-16', NULL, NULL, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(198, 1, NULL, 4, 'FCIU960299', '6182115600', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-16', NULL, NULL, NULL, 1, 'Release', 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(199, 2, NULL, 2, 'TCNU607485', '6183114240', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(200, 2, NULL, 2, 'TCNU528878', '6183114250', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(201, 2, NULL, 2, 'TCNU618122', '6183114260', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(203, 2, NULL, 6, 'CBHU554243', '6190942840', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(207, 2, NULL, 2, 'TCNU643762', '6183114210', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-02', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(210, 2, NULL, NULL, 'TEMU290594', '6183511340', NULL, 'Prince Rupert', 'Memphis, TN', '2018-07-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(211, 2, NULL, NULL, 'DFSU233540', '6183511340', NULL, 'Prince Rupert', 'Memphis, TN', '2018-07-25', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(213, 2, NULL, 2, 'CSNU673597', '6185677760', 9, 'Prince Rupert', 'Memphis, TN', '2018-08-06', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:39', 40, 1, NULL, 0, NULL),
(214, 2, NULL, NULL, 'TEMU602378', '6185693500', NULL, 'Prince Rupert', 'Memphis, TN', '2018-08-02', NULL, NULL, NULL, NULL, 'Hold', 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:43', 40, 1, NULL, 0, NULL),
(216, 2, NULL, 5, 'FCIU612792', '6008532450', 4, 'Charleston', 'Loris, SC', '2018-09-04', NULL, NULL, NULL, NULL, 'Hold', 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 0, NULL, 0, NULL),
(217, 2, NULL, 5, 'CSLU166827', '6008532450', 4, 'Charleston', 'Loris, SC', '2018-09-04', NULL, NULL, NULL, NULL, 'Hold', 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:07', 20, 0, NULL, 0, NULL),
(219, 2, NULL, 2, 'TCNU626349', '6183114220', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(220, 2, NULL, 2, 'TCNU943808', '6183114230', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(221, 2, NULL, 4, 'TCNU645954', '6182118250', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-02', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(222, 2, NULL, 4, 'GLDU747804', '6182118250', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-02', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(223, 2, NULL, 2, 'TCNU684054', '6183114200', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-06', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(224, 2, NULL, 6, 'CXDU124488', '6190982750', 5, 'Prince Rupert', 'Memphis, TN', '2018-08-06', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(226, 2, NULL, 3, '[6185691600]', '6185691600', 2, 'Prince Rupert', 'Memphis, TN', '2018-07-30', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(227, 2, NULL, NULL, '[6191658290]', '6191658290', NULL, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(228, 2, NULL, 2, '[6183114380]', '6183114380', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(229, 2, NULL, 2, '[6183114390]', '6183114390', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 40, 1, NULL, 0, NULL),
(230, 2, NULL, 3, '[6191643350]', '6191643350', 2, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:06', 20, 1, NULL, 0, NULL),
(231, 2, NULL, 5, '[6008532880]', '6008532880', 4, 'Charleston', 'Loris, SC', '2018-09-25', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-07-09 11:00:07', 20, 0, NULL, 0, NULL);

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
(3, 'Libra Resources', 'cargodata.libra@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-06-02 13:39:12');

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
(11, 'Tianjin Wanda Tyre Group Company Limited', 'Wanda', 'WD', 'tjwanda.com|'),
(12, 'Ruian Jianxin Machinery Manufacturing Company Limited', 'Jianxin', 'JT', '163.com|');

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
(13, 'Parts_List', '17093', 4, 'doc-568-pl-spring-17093 18021.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-17093 CSLU114281/', 'PDF', 150, '48924bf3cddc92b0b23d88fa413d02b7', 'JT18LB568', '2018-07-04 03:31:26'),
(14, 'Invoice', '17093', 4, 'doc-568-iv-spring-17093 18021.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-17093 CSLU114281/', 'PDF', 150, 'f92578d1f253dcfb8d9d2f792d418e54', 'JT18LB568', '2018-07-04 03:31:27'),
(15, 'Parts_List', '18063', 3, 'doc-570-PL-jack-17163.pdf', 'C:/xampp/htdocs/vendor_documents/UNASSOCIATED_FILES/070318/RODROCK/RR18063/PDF/', 'PDF', NULL, 'cc6d55189e48fca04ea0aacfbfe16e3c', 'JT18LB570', '2018-07-04 03:31:27'),
(16, 'Invoice', '18063', 3, 'doc-570-in-jack-17163.pdf', 'C:/xampp/htdocs/vendor_documents/UNASSOCIATED_FILES/070318/RODROCK/RR18063/PDF/', 'PDF', NULL, '75c328a5a25563b9d9b83e684728755c', 'JT18LB570', '2018-07-04 03:31:28'),
(17, 'Parts_List', '17133', 4, 'doc-569-pl-spring-17133.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-17133 CSLU235424/', 'PDF', 152, '3df1fcd1893f0979a619880cc21b7604', 'JT18LB569', '2018-07-04 03:31:28'),
(18, 'Invoice', '17133', 4, 'doc-569-iv-spring-17133.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-17133 CSLU235424/', 'PDF', 152, '7eae0e0136233abd32d1cc5f229dee14', 'JT18LB569', '2018-07-04 03:31:29');

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
  ADD KEY `file_extension` (`file_extension`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11361;
--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `datatables_states`
--
ALTER TABLE `datatables_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `truckers`
--
ALTER TABLE `truckers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vendor_documents`
--
ALTER TABLE `vendor_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
