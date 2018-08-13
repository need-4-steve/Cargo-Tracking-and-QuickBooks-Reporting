-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2018 at 03:50 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

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
  `rcvd` tinyint(1) DEFAULT NULL,
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

INSERT INTO `archived_shipments` (`id`, `status`, `po`, `product_id`, `container_number`, `bill_of_lading`, `vendor_id`, `discharge_port`, `final_destination`, `eta`, `lfd`, `pickup_number`, `truck_date`, `trucker_id`, `bl_status`, `rcvd`, `freight`, `isf_required`, `customs`, `is_complete`, `po_boolean`, `qb_rt`, `qb_ws`, `latest_event`, `latest_event_time_and_date`, `is_active`, `requires_payment`, `container_notes`, `last_update`, `container_size`, `do`, `vendor_identifier`, `has_documents`, `file_directory`) VALUES
(109, '0', '17165', NULL, 'CBHU411055', '6008525240', NULL, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-12', '2018-07-15', 278334, NULL, 1, 'Release', 0, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-24 11:01:52', 20, 1, NULL, 0, NULL),
(110, '0', NULL, 2, 'TGHU685374', '6160596710', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-01', 458117, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(111, '0', 'WD18034', 2, 'CXDU122177', '6160598210', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-09', 63827, '2018-06-11 14:31:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 0, 1, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(113, '0', NULL, 6, 'TRHU168632', '6182545470', 5, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-09', 881301, '2018-06-08 14:30:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 20, 1, NULL, 0, NULL),
(129, '0', NULL, 4, 'DFSU632170', '6182110120', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-11', '2018-06-13', 949540, '2018-06-12 10:00:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(130, '0', NULL, 4, 'FSCU872354', '6182110120', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-13', 949540, '2018-06-08 14:28:00', 2, 'Release', 0, 1, 1, 1, 0, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(131, '0', 'WD18-033', 2, 'TCNU644757', '6160596700', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-07', '2018-06-09', 322425, '2018-06-07 14:29:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 1, 1, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(132, '0', 'WD18-035', 2, 'TCNU259060', '6160597320', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', NULL, '2018-06-18 08:00:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 1, NULL, '2018-06-26 11:00:04', 40, 1, NULL, 0, NULL),
(133, '0', 'WD18-036', 2, 'SEGU443110', '6160597330', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', 362401, '2018-06-14 08:17:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 1, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(134, '0', 'WD18-037', 2, 'CCLU689366', '6160597340', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-16', 15509, '2018-06-15 08:17:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 1, NULL, '2018-06-26 11:00:04', 40, 1, NULL, 0, NULL),
(135, '0', 'YX18044B', 3, 'CAIU344452', '6185488790', 2, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-13', '2018-06-17', 864059, '2018-06-15 10:00:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 0, NULL, '2018-06-26 11:00:04', 20, 1, NULL, 0, NULL),
(136, '0', NULL, 8, 'TCNU862477', '6185516940', 8, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-11', '2018-06-14', 986468, '2018-06-13 08:00:00', 2, 'Release', 0, 1, 1, 1, 1, 0, 1, 1, 'Intermodal Departure from Last Port of Discharge', NULL, 0, 0, NULL, '2018-07-03 11:00:05', 40, 1, NULL, 0, NULL),
(137, '3', 'Tire land', 8, 'TCNU803965', '6185527170', 1, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-17', '2018-06-19', 525242, NULL, 1, 'Release', 0, 1, 1, 1, 1, 1, 1, 1, 'Vessel Arrival at Last POD', NULL, 0, 1, NULL, '2018-06-27 11:00:05', 40, 1, NULL, 0, NULL),
(138, '0', 'WD18-039', 2, 'TEMU628934', '6160597350', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-25', '2018-06-28', 185011, NULL, 1, 'Release', 0, 1, 1, 0, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 40, 1, NULL, 0, NULL),
(139, '0', 'WD18-040', 2, 'BMOU439963', '6160597360', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-25', '2018-06-28', 493056, NULL, 1, 'Release', 0, 1, 1, 0, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 1, NULL, '2018-07-07 11:00:05', 40, 1, NULL, 0, NULL),
(140, '0', 'WD18-038', 2, 'CBHU832619', '6160597370', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-23', '2018-06-26', 492547, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 1, NULL, '2018-07-04 11:00:13', 40, 1, NULL, 0, NULL),
(141, '0', 'JT18062', 4, 'FCIU987424', '6182111620', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-23', '2018-06-25', 837092, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-03 11:00:05', 40, 1, NULL, 0, NULL),
(142, '0', '17121', 5, 'GLDU931983', '6008522700', 4, 'Prince Rupert', 'Memphis, Tennessee', '2018-06-27', '2018-07-01', 597831, NULL, 1, 'Release', 0, 0, 1, 0, 1, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-07-06 11:00:05', 20, 1, NULL, 0, NULL),
(145, '0', '18063', 4, 'CSLU617701', '6182112950', 3, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-04', 730437, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(146, '0', '18063', 4, 'CBHU701935', '6182112950', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-01', '2018-07-04', 730437, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(147, '0', '18046', 6, 'TCKU255801', '6182630420', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-01', '2018-07-04', 748113, NULL, 1, 'Release', 0, 1, 1, 1, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 20, 1, NULL, 0, NULL),
(148, '0', NULL, 2, 'TCNU909669', '6183104310', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-02', 734298, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(149, '0', NULL, 2, 'TCNU507859', '6183107850', 11, 'Prince Rupert', 'Memphis, TN', '2018-06-28', '2018-07-01', 726146, NULL, 1, 'Release', 0, 0, 1, 1, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(150, '0', '17093', 5, 'CSLU114281', '6008522710', 4, 'Charleston', 'Loris, SC', '2018-06-25', '2018-06-29', NULL, NULL, 1, 'Release', 0, 1, 1, 1, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 20, 1, 'JT18LB568', 1, 'NY18-17093 CSLU114281'),
(151, '0', '18021', 5, 'CBHU552322', '6008522710', 4, 'Charleston', 'Loris, SC', '2018-06-25', '2018-06-29', NULL, NULL, 1, 'Release', 0, 1, 1, 1, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 20, 1, NULL, 0, NULL),
(152, '3', '17133', 5, 'CSLU235424', '6008526090', 4, 'Norfolk', 'Henderson, NC', NULL, '2001-01-01', NULL, NULL, 1, 'Release', 0, 0, 1, 1, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 20, 0, 'JT18LB569', 1, 'NY18-17133 CSLU235424'),
(154, '0', 'WD18-046', 2, 'TCNU634231', '6183104300', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 98534, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(156, '0', 'WD18-045', 2, 'BMOU585674', '6183107830', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 790794, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(157, '0', 'WD18-044', 2, 'CSNU646679', '6183107840', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 427289, NULL, 1, 'Release', 0, 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(159, '2', NULL, 8, 'Unassigned [6185605500]', '6185605500', 8, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(160, '2', NULL, 3, 'Unassigned [6185607860]', '6185607860', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-04', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 20, 1, NULL, 0, NULL),
(169, '0', 'WD18-049', 2, 'TCNU626781', '6183107800', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', '2018-07-18', 824239, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-27 14:47:52', 40, 1, NULL, 0, NULL),
(170, '0', 'WD18-047', 2, 'TCNU739627', '6183107810', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', '2018-07-18', 769258, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-27 14:47:52', 40, 1, NULL, 0, NULL),
(172, '0', 'WD18-048', 2, 'TCNU626886', '6183108290', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-16', '2018-07-18', 434830, NULL, 1, 'Release', 0, 1, 0, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-27 14:47:52', 40, 1, NULL, 0, NULL),
(173, '0', '18064', 4, 'TEMU759017', '6182113910', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-08', NULL, 335358, NULL, 1, 'Release', 0, 0, 1, 1, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 40, 1, NULL, 0, NULL),
(174, '0', NULL, 6, 'DFSU158089', '6190904790', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-16', '2018-07-18', 579262, NULL, 1, 'Release', 0, 1, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-25 11:01:56', 20, 1, NULL, 0, NULL),
(175, '2', NULL, 2, 'Unassigned [6183114240]', '6183114240', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(176, '2', NULL, 2, 'Unassigned [6183114250]', '6183114250', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(177, '2', NULL, 2, 'Unassigned [6183114260]', '6183114260', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-23', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(178, '2', NULL, 2, 'Unassigned [6183114210]', '6183114210', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-25 11:00:18', 40, 1, NULL, 0, NULL),
(179, '2', NULL, 2, 'Unassigned [6183114220]', '6183114220', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-04 11:00:13', 40, 1, NULL, 0, NULL),
(180, '2', NULL, 2, 'Unassigned [6183114230]', '6183114230', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-04 11:00:13', 40, 1, NULL, 0, NULL),
(181, '2', NULL, 2, 'Unassigned [6183114200]', '6183114200', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 40, 1, NULL, 0, NULL),
(182, '2', NULL, 2, 'Unassigned [6183114380]', '6183114380', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 40, 1, NULL, 0, NULL),
(183, '2', NULL, 2, 'Unassigned [6183114390]', '6183114390', 11, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 40, 1, NULL, 0, NULL),
(184, '0', 'CY18-003', 8, 'CBHU823499', '6185603970', 8, 'Prince Rupert', 'Memphis, TN', '2018-07-14', '2018-07-16', 624862, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-25 11:01:56', 40, 1, NULL, 0, NULL),
(185, '2', NULL, NULL, 'Unassigned [6185637150]', '6185637150', NULL, 'Vancouver (Intended)', 'Memphis, Tennessee', '2018-07-14', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-26 11:00:04', 40, 1, NULL, 0, NULL),
(187, '0', 'YX18061B', 3, 'TCKU303205', '6185628380', 2, 'Prince Rupert', 'Memphis, TN', '2018-07-16', '2018-07-18', 420704, NULL, 1, 'Release', 0, 1, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-25 11:01:56', 20, 1, NULL, 0, NULL),
(188, '2', NULL, 4, 'Unassigned [6182115600]', '6182115600', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-16', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-18 11:00:19', 40, 1, NULL, 0, NULL),
(189, '0', 'WD18-050', 2, 'CCLU673627', '6183104650', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-22', 907488, NULL, 1, 'Release', 0, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-01 11:01:54', 40, 1, NULL, 0, NULL),
(190, '0', 'WD18-052', 2, 'GLDU753837', '6183104660', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-22', 29407, NULL, 1, 'Release', 0, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-01 11:01:54', 40, 1, NULL, 0, NULL),
(191, '0', 'WD18-051', 2, 'TCNU651692', '6183108390', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-22', 83852, NULL, 1, 'Release', 0, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-28 11:01:53', 40, 1, NULL, 0, NULL),
(193, '0', 'JX18036', 9, 'TRHU167517', '6183507450', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-18', '2018-07-20', 400526, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-27 14:47:52', 20, 1, NULL, 0, NULL),
(194, '0', 'JX18037', 9, 'TCKU152269', '6183507450', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-18', '2018-07-20', 400526, NULL, 1, 'Release', 0, 1, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-27 14:47:52', 20, 1, NULL, 0, NULL),
(195, '0', NULL, NULL, 'FCIU996977', '6185635620', NULL, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-20', 95770, NULL, 1, 'Release', 0, 0, 1, 1, 1, 0, 0, 0, 'Picked up at Final Destination for Delivery', NULL, 0, 0, NULL, '2018-08-01 11:01:54', 40, 1, NULL, 0, NULL),
(196, '0', 'XY', 6, 'FCIU525434', '6190935400', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-21', 706677, NULL, NULL, 'Release', 0, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-31 11:01:55', 20, 1, NULL, 0, NULL),
(197, '0', 'RR', 4, 'FSCU895722', '6182115600', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-21', 569008, NULL, 1, 'Release', 0, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-31 11:01:55', 40, 1, NULL, 0, NULL),
(198, '0', 'RR', 4, 'FCIU960299', '6182115600', 3, 'Prince Rupert', 'Memphis, TN', '2018-07-18', '2018-07-21', 569008, NULL, 1, 'Release', 0, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-07-31 11:01:55', 40, 1, NULL, 0, NULL),
(199, '3', 'WD18-053', 2, 'TCNU6074855', '6183114240', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-26', '2018-07-28', 576629, NULL, 1, 'Release', 1, 0, 0, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-09 11:01:54', 40, 0, NULL, 1, '/WD18-053 TCNU6074855/'),
(200, '0', 'WD', 2, 'TCNU5288788', '6183114250', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-26', '2018-07-28', 768041, NULL, 1, 'Release', NULL, 0, 0, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 0, NULL, 0, NULL),
(201, '0', 'WD', 2, 'TCNU6181222', '6183114260', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-26', '2018-07-28', 664408, NULL, 1, 'Release', NULL, 0, 0, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 0, NULL, 0, NULL),
(202, '2', NULL, 3, 'Unassigned [6185691600]', '6185691600', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 20, 1, NULL, 0, NULL),
(203, '3', 'XY18047', 6, 'CBHU5542433', '6190942840', 5, 'Prince Rupert', 'Memphis, TN', '2018-07-28', '2018-07-30', 383387, NULL, 1, 'Release', NULL, 0, 0, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 20, 1, NULL, 1, '/XY18-XY18047 CBHU5542433/'),
(204, '2', NULL, NULL, 'Unassigned [6183511340]', '6183511340', NULL, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-25', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-29 11:00:10', 20, 1, NULL, 0, NULL),
(205, '2', NULL, 2, 'Unassigned [6185677760]', '6185677760', 9, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-06-29 11:00:10', 40, 1, NULL, 0, NULL),
(206, '2', NULL, NULL, 'Unassigned [6185693500]', '6185693500', NULL, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-02 11:00:15', 40, 1, NULL, 0, NULL),
(207, '0', 'WD18-056', 2, 'TCNU6437622', '6183114210', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-01', '2018-08-03', 174203, NULL, 1, 'Release', NULL, 0, 0, 1, 1, 0, 0, 0, 'Picked up at Final Destination for Delivery', NULL, 0, 1, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(208, '2', NULL, 5, 'Unassigned [6008532450]', '6008532450', 4, 'Charleston (Intended)', 'Loris, South Carolina', '2018-09-04', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-02 11:00:15', 20, 0, NULL, 0, NULL),
(209, '2', NULL, 5, 'Unassigned [6008532880]', '6008532880', 4, 'Charleston (Intended)', 'Loris, South Carolina', '2018-09-25', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 20, 0, NULL, 0, NULL),
(210, '0', 'JT', 9, 'TEMU2905944', '6183511340', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-28', '2018-07-30', 797899, NULL, 1, 'Release', NULL, 0, 0, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 1, NULL, 0, NULL),
(211, '0', 'JT', 9, 'DFSU2335400', '6183511340', 12, 'Prince Rupert', 'Memphis, Tennessee', '2018-07-28', '2018-07-30', 797899, NULL, 1, 'Release', NULL, 0, 0, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 1, NULL, 0, NULL),
(212, '2', NULL, 4, 'Unassigned [6182118250]', '6182118250', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-07-30', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 40, 1, NULL, 0, NULL),
(213, '0', 'QQ18-003', 2, 'CSNU6735977', '6185677760', 9, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-05', NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 1, 1, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 0, 1, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(214, '0', 'WB18-001', NULL, 'TEMU6023788', '6185693500', 13, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-01', '2018-08-03', 703508, NULL, 1, 'Release', NULL, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(215, '2', NULL, 6, 'Unassigned [6190982750]', '6190982750', 5, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-05 11:00:05', 20, 1, NULL, 0, NULL),
(216, '2', 'NY', 5, 'FCIU6127922', '6008532450', 4, 'Charleston', 'Loris, South Carolina', '2018-08-21', '2001-01-01', NULL, NULL, 1, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 0, NULL, 0, NULL),
(217, '2', 'NY', 5, 'CSLU1668277', '6008532450', 4, 'Charleston', 'Loris, South Carolina', '2018-08-21', '2001-01-01', NULL, NULL, 1, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 0, NULL, 0, NULL),
(218, '2', NULL, 3, 'Unassigned [6191643350]', '6191643350', 2, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 20, 1, NULL, 0, NULL),
(219, '2', 'WD', 2, 'TCNU6263499', '6183114220', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-15', NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(220, '2', 'WD', 2, 'TCNU9438088', '6183114230', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-15', NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(221, '0', 'RR18078', 4, 'TCNU6459544', '6182118250', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-05', '2018-08-07', 281894, NULL, 1, 'Release', NULL, 0, 1, 1, 1, 0, 0, 0, 'Arrival at Last Intermodal Hub', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(222, '0', 'RR18078', 4, 'GLDU7478044', '6182118250', 3, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-05', '2018-08-07', 281894, NULL, 1, 'Release', NULL, 1, 1, 1, 1, 0, 0, 0, 'Last Deramp Under I/B', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(225, '2', NULL, NULL, 'Unassigned [6191658290]', '6191658290', NULL, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-06', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-06 19:50:25', 40, 1, NULL, 0, NULL),
(226, '2', NULL, 3, '[6185691600]', '6185691600', 2, 'Prince Rupert', 'Memphis, TN', '2018-07-30', NULL, NULL, NULL, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-24 08:55:27', 20, 1, NULL, 0, NULL),
(227, '2', NULL, NULL, '[6191658290]', '6191658290', NULL, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-24 08:56:04', 40, 1, NULL, 0, NULL),
(228, '2', NULL, 2, '[6183114380]', '6183114380', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, 'Hold', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-24 08:56:01', 40, 1, NULL, 0, NULL),
(229, '2', NULL, 2, '[6183114390]', '6183114390', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, 'Hold', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-24 08:56:01', 40, 1, NULL, 0, NULL),
(230, '2', '', 3, '[6191643350]', '6191643350', 2, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, 'Not Released', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-01 11:01:54', 20, 1, NULL, 0, NULL),
(231, '2', NULL, 5, '[6008532880]', '6008532880', 4, 'Charleston', 'Loris, SC', '2018-09-25', NULL, NULL, NULL, NULL, 'Hold', 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-24 08:56:00', 20, 0, NULL, 0, NULL),
(232, '2', 'NY', 5, 'RFCU2113111', '6008532880', 4, 'Charleston', 'Loris, South Carolina', '2018-08-28', NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 0, NULL, 0, NULL),
(233, '2', 'NY', 5, 'CSNU1352499', '6008532880', 4, 'Charleston', 'Loris, South Carolina', '2018-08-28', NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 0, NULL, 0, NULL),
(234, '2', 'WD', 2, 'TCNU5220800', '6183114380', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-15', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(235, '1', 'WD', 2, 'TCNU6347288', '6183114390', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-13', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(236, '2', 'WD', 2, 'TCNU6692055', '6183120340', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-15', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(237, '2', 'XY', 6, 'TRHU2560144', '6191000250', 5, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-15', NULL, NULL, NULL, NULL, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 1, NULL, 0, NULL),
(238, '2', 'WD', 2, 'TCNU6338366', '6183122170', 11, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-27', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(239, '2', 'WBSD', NULL, 'CXDU1049077', '6191658290', 13, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-27', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(240, '2', 'WBSD', NULL, 'TCNU8618844', '6191658290', 13, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-27', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(241, '2', 'YX', 3, 'CBHU5698211', '6191695510', 2, 'Prince Rupert', 'Memphis, Tennessee', '2018-08-27', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 1, NULL, 0, NULL),
(242, '2', NULL, 2, '[6191729550]', '6191729550', 9, 'Los Angeles', 'Memphis, TN', '2018-08-29', NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-30 11:01:54', 40, 1, NULL, 0, NULL),
(243, '2', 'WD', 2, 'TCNU6177322', '6183122140', 11, 'Los Angeles', 'Memphis, Tennessee', '2018-08-30', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(244, '3', NULL, 2, '[6183122150]', '6183122150', 11, 'Los Angeles (Intended)', 'Memphis, Tennessee', NULL, NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', '1970-01-01 01:00:00', 0, 0, NULL, '2018-07-24 11:01:52', 40, 1, NULL, 0, NULL),
(245, '3', NULL, 2, '[6183122160]', '6183122160', 11, 'Los Angeles (Intended)', 'Memphis, Tennessee', NULL, NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', '1970-01-01 01:00:00', 0, 0, NULL, '2018-07-24 11:01:52', 40, 1, NULL, 0, NULL),
(246, '2', 'WD', 2, 'TCNU6172244', '6183122150', 11, 'Los Angeles', 'Memphis, Tennessee', '2018-08-30', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(247, '2', 'WD', 2, 'TCNU5019911', '6183122160', 11, 'Los Angeles', 'Memphis, Tennessee', '2018-08-30', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(248, '2', 'NY', 5, 'CBHU3587144', '\"', 4, 'Los Angeles', 'Hewitt, Texas', '2018-08-26', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 0, NULL, 0, NULL),
(249, '2', 'NY', 5, 'CSLU1690822', '\"', 4, 'Los Angeles', 'Hewitt, Texas', '2018-08-26', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 20, 0, NULL, 0, NULL),
(250, '2', '', 4, '[6182124690]', '6182124690', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-27', NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-01 11:01:54', 40, 1, NULL, 0, NULL),
(251, '2', 'WD', 2, '[6183122120]', '6183122120', 11, 'Long Beach', 'Memphis, TN', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-07-31 11:01:55', 40, 1, NULL, 0, NULL),
(252, '2', '', 2, '[6183122130]', '6183122130', 11, 'Long Beach', 'Memphis, TN', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-02 11:01:54', 40, 1, NULL, 0, NULL),
(253, '2', 'WD', 2, '[6183122110]', '6183122110', 11, 'Long Beach', 'Memphis, TN', '2018-09-14', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 0, NULL),
(254, '2', 'QQ', 2, 'CBHU7002322', '6191729550', 9, 'Los Angeles', 'Memphis, Tennessee', '2018-08-29', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(255, '2', '', 2, '[6183127680]', '6183127680', 11, 'Long Beach', 'Memphis, TN', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', 0, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-03 11:01:54', 40, 1, NULL, 0, NULL),
(256, '2', 'WD', 2, 'TCNU6269200', '6183122120', 11, 'Long Beach (Intended)', 'Memphis, Tennessee', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(257, '2', 'RR', 4, 'TCNU8455899', '6182124690', 3, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-08-27', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(258, '2', 'JT', 9, '', '6184594010', 12, 'Prince Rupert (Intended)', 'Memphis, Tennessee', '2018-09-05', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-04 13:10:22', 20, 1, NULL, 0, NULL),
(259, '2', 'WD', 2, 'TCNU6591366', '6183122130', 11, 'Long Beach (Intended)', 'Memphis, Tennessee', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(261, '2', 'WD', 2, 'TCNU6693244', '6183127680', 11, 'Long Beach (Intended)', 'Memphis, Tennessee', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(262, '2', 'WD', 2, '[6183122100]', '6183122100', 11, 'Long Beach', 'Memphis, TN', '2018-09-14', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 0, NULL),
(263, '2', 'JT', 9, '[6184594010]', '6184594010', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-05', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 20, 1, NULL, 0, NULL),
(264, '0', 'WD18-054', 2, 'TCNU5288786', '6183114250', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-09', '2018-07-28', 768041, NULL, 1, 'Release', 1, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 1, '/WD18-054 TCNU5288786/'),
(265, '3', 'WD18-055', 2, 'TCNU6181220', '6183114260', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-26', '2018-07-28', 664408, NULL, NULL, 'Release', NULL, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 1, '/WD18-055 TCNU6181220/'),
(266, '0', 'JX18035', 9, 'DFSU2335408', '6183511340', 12, 'Prince Rupert', 'Memphis, TN', '2018-07-28', '2018-07-30', 797899, NULL, NULL, 'Release', NULL, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-07 11:01:56', 20, 1, NULL, 1, '/18-JX18035 DFSU2335408/'),
(267, '0', 'JX18034', 9, 'TEMU2905945', '6183511340', 12, 'Prince Rupert', 'Memphis, TN', '2018-07-28', '2018-07-30', 797899, NULL, NULL, 'Release', NULL, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-07 11:01:56', 20, 1, NULL, 1, '/18-JX18034 TEMU2905945/'),
(298, '2', NULL, 5, 'UETU2381377', '\"', 4, 'Norfolk', 'Henderson, North Carolina', '2018-09-18', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 0, 0, NULL, '2018-08-09 11:01:54', 20, 0, NULL, 0, NULL);

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
(215, 'TCNU943808', 'ETA', '2018-08-06 23:59:00', '2018-08-06 23:59:00', 'Estimated Time of Arrival for Container #: TCNU943808. Times/Dates Subject to Change...', 220, 'c832162a9f7cbe0cb2044710c3ec0d81'),
(216, 'CBHU411055', 'LFD', '2018-07-15 00:00:00', '2018-07-15 23:59:00', 'Last Free Day for Container #: CBHU411055. Times/Dates Subject to Change...', 109, '9a935b3a708dc2c46f881ff043383b85'),
(217, 'TCNU626781', 'LFD', '2018-07-18 00:00:00', '2018-07-18 23:59:00', 'Last Free Day for Container #: TCNU626781. Times/Dates Subject to Change...', 169, '22d6124440afe870bdc1dd379cad7682'),
(218, 'TCNU739627', 'LFD', '2018-07-18 00:00:00', '2018-07-18 23:59:00', 'Last Free Day for Container #: TCNU739627. Times/Dates Subject to Change...', 170, 'a3a2885cd71448e41416a970221356c1'),
(219, 'TCNU626886', 'LFD', '2018-07-18 00:00:00', '2018-07-18 23:59:00', 'Last Free Day for Container #: TCNU626886. Times/Dates Subject to Change...', 172, '134f246b4a1998e55a056e4b26031b96'),
(220, 'DFSU158089', 'LFD', '2018-07-18 00:00:00', '2018-07-18 23:59:00', 'Last Free Day for Container #: DFSU158089. Times/Dates Subject to Change...', 174, '171e1103c0f60a079439696cceec09dd'),
(221, 'CBHU823499', 'LFD', '2018-07-16 00:00:00', '2018-07-16 23:59:00', 'Last Free Day for Container #: CBHU823499. Times/Dates Subject to Change...', 184, 'fc2da3b8711da2d166955352953d2e8c'),
(222, 'TCKU303205', 'LFD', '2018-07-18 00:00:00', '2018-07-18 23:59:00', 'Last Free Day for Container #: TCKU303205. Times/Dates Subject to Change...', 187, '4d03a75602325caa2843de8dc36840eb'),
(223, 'CCLU673627', 'LFD', '2018-07-22 00:00:00', '2018-07-22 23:59:00', 'Last Free Day for Container #: CCLU673627. Times/Dates Subject to Change...', 189, '8cc46823fd8bd2cf1fb1bd873bc3b0e0'),
(224, 'GLDU753837', 'LFD', '2018-07-22 00:00:00', '2018-07-22 23:59:00', 'Last Free Day for Container #: GLDU753837. Times/Dates Subject to Change...', 190, '7731b6511abe3290e99de5acb1da0fe7'),
(225, 'TCNU651692', 'LFD', '2018-07-22 00:00:00', '2018-07-22 23:59:00', 'Last Free Day for Container #: TCNU651692. Times/Dates Subject to Change...', 191, 'e0dcd9c11e127e6fd1893cdf0929adc3'),
(226, 'TRHU167517', 'LFD', '2018-07-20 00:00:00', '2018-07-20 23:59:00', 'Last Free Day for Container #: TRHU167517. Times/Dates Subject to Change...', 193, '663e9f1ce124dc2e48c0a5dbfbe4f4b3'),
(227, 'TCKU152269', 'LFD', '2018-07-20 00:00:00', '2018-07-20 23:59:00', 'Last Free Day for Container #: TCKU152269. Times/Dates Subject to Change...', 194, 'f42f83b1171add0e6b775adaf2eaf541'),
(228, 'FCIU525434', 'LFD', '2018-07-21 00:00:00', '2018-07-21 23:59:00', 'Last Free Day for Container #: FCIU525434. Times/Dates Subject to Change...', 196, 'd26e3b38edb9bc79458cbe62a9f68135'),
(229, 'FSCU895722', 'LFD', '2018-07-21 00:00:00', '2018-07-21 23:59:00', 'Last Free Day for Container #: FSCU895722. Times/Dates Subject to Change...', 197, '711414c48c551598bf6c29617041f8e4'),
(230, 'FCIU960299', 'LFD', '2018-07-21 00:00:00', '2018-07-21 23:59:00', 'Last Free Day for Container #: FCIU960299. Times/Dates Subject to Change...', 198, 'ea425f00ded0c3a41e0b096c0c01f925'),
(231, 'FCIU996977', 'LFD', '2018-07-20 00:00:00', '2018-07-20 23:59:00', 'Last Free Day for Container #: FCIU996977. Times/Dates Subject to Change...', 195, '62e6441c5c0ad45cf49d0041dac45b4e'),
(232, 'TCNU607485', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU607485. Times/Dates Subject to Change...', 199, '2a4a6315e655037c4a951e3f6f3c99a1'),
(233, 'TCNU528878', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU528878. Times/Dates Subject to Change...', 200, 'cc5a434c49c0abbbea2b72ffc62e7d0f'),
(234, 'TCNU618122', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU618122. Times/Dates Subject to Change...', 201, '268a04cccadcf4f20b0bb6d001f000c7'),
(235, 'TEMU290594', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: TEMU290594. Times/Dates Subject to Change...', 210, '269af618b5e60dd4ccd958d7848f72c3'),
(236, 'DFSU233540', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: DFSU233540. Times/Dates Subject to Change...', 211, 'f4d5cea66b6214c13b90bdabb6b2f5d4'),
(237, 'CBHU554243', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: CBHU554243. Times/Dates Subject to Change...', 203, '6e360e5fef47271a49464859f5c962eb'),
(238, 'TCNU643762', 'LFD', '2018-08-03 00:00:00', '2018-08-03 23:59:00', 'Last Free Day for Container #: TCNU643762. Times/Dates Subject to Change...', 207, '995f28ebc4c50d8242e257c931d8fcc1'),
(239, 'TEMU602378', 'LFD', '2018-08-03 00:00:00', '2018-08-03 23:59:00', 'Last Free Day for Container #: TEMU602378. Times/Dates Subject to Change...', 214, 'e9f4bab08d47c1d208f27bd7f5687c9d'),
(240, 'TCNU6437622', 'LFD', '2018-08-03 00:00:00', '2018-08-03 23:59:00', 'Last Free Day for Container #: TCNU6437622. Times/Dates Subject to Change...', 207, '9dac8d72ee7d9891db71c54c931ac183'),
(241, 'TCNU6074855', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU6074855. Times/Dates Subject to Change...', 199, 'c1b6480da9626c77b77c57ed80b91fcf'),
(242, 'TCNU5288788', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU5288788. Times/Dates Subject to Change...', 200, '2dae7e8d9ac9c57724d561bece26371a'),
(243, 'TCNU6181222', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU6181222. Times/Dates Subject to Change...', 201, '5c50c10eaa1a1130ab1bef3c285e2cf3'),
(244, 'TEMU2905944', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: TEMU2905944. Times/Dates Subject to Change...', 210, '0105429e5d9ada27f0e77831a49b8317'),
(245, 'DFSU2335400', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: DFSU2335400. Times/Dates Subject to Change...', 211, '9578ae2782ccac9d6e6f09a32ffb689b'),
(246, 'TEMU6023788', 'LFD', '2018-08-03 00:00:00', '2018-08-03 23:59:00', 'Last Free Day for Container #: TEMU6023788. Times/Dates Subject to Change...', 214, '416ec37dcd26ff5d9a79b4304d21bf21'),
(247, 'CBHU5542433', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: CBHU5542433. Times/Dates Subject to Change...', 203, '48106dc23aca378b699fd7622a586ac7'),
(248, 'FCIU6127922', 'LFD', '2001-01-01 00:00:00', '2001-01-01 23:59:00', 'Last Free Day for Container #: FCIU6127922. Times/Dates Subject to Change...', 216, '99b687241c932b9ffb9cca7ddd9f2747'),
(249, 'CSLU1668277', 'LFD', '2001-01-01 00:00:00', '2001-01-01 23:59:00', 'Last Free Day for Container #: CSLU1668277. Times/Dates Subject to Change...', 217, '90663c1e6fec5c74e85e69c8bf118c3d'),
(250, 'TCNU6459544', 'LFD', '2018-08-07 00:00:00', '2018-08-07 23:59:00', 'Last Free Day for Container #: TCNU6459544. Times/Dates Subject to Change...', 221, '8c7454317a9a1dacdae59cba9bea8ee1'),
(251, 'GLDU7478044', 'LFD', '2018-08-07 00:00:00', '2018-08-07 23:59:00', 'Last Free Day for Container #: GLDU7478044. Times/Dates Subject to Change...', 222, '171467c74b98db9f5d4e5c0298576635'),
(252, 'TCNU5288786', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU5288786. Times/Dates Subject to Change...', 264, '85babaa6b248b215b88145471b3794b7'),
(253, 'TCNU6181220', 'LFD', '2018-07-28 00:00:00', '2018-07-28 23:59:00', 'Last Free Day for Container #: TCNU6181220. Times/Dates Subject to Change...', 265, 'fe5895575c8bf1042fb9d502051d3890'),
(254, 'DFSU2335408', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: DFSU2335408. Times/Dates Subject to Change...', 266, 'fe0a0a2fd16dc5a0aad9efc17f49d2e5'),
(255, 'TEMU2905945', 'LFD', '2018-07-30 00:00:00', '2018-07-30 23:59:00', 'Last Free Day for Container #: TEMU2905945. Times/Dates Subject to Change...', 267, '586494c47e10574c1d6bea466fe3c2ec'),
(256, 'TCNU6437626', 'LFD', '2018-08-03 00:00:00', '2018-08-03 23:59:00', 'Last Free Day for Container #: TCNU6437626. Times/Dates Subject to Change...', 268, '3789f4bc29da5baaa54ab865204f2432'),
(257, 'TEMU6023781', 'LFD', '2018-08-03 00:00:00', '2018-08-03 23:59:00', 'Last Free Day for Container #: TEMU6023781. Times/Dates Subject to Change...', 269, '07fc340895c7d89234afbd03674d05c2'),
(258, 'TCNU6459543', 'LFD', '2018-08-07 00:00:00', '2018-08-07 23:59:00', 'Last Free Day for Container #: TCNU6459543. Times/Dates Subject to Change...', 270, '509272df04465203fa7d8f3d17cb08a0'),
(259, 'GLDU7478040', 'LFD', '2018-08-07 00:00:00', '2018-08-07 23:59:00', 'Last Free Day for Container #: GLDU7478040. Times/Dates Subject to Change...', 271, '573c18e9d92439f7b9005ad9bade5793'),
(260, 'FCIU6127923', 'LFD', '2001-01-01 00:00:00', '2001-01-01 23:59:00', 'Last Free Day for Container #: FCIU6127923. Times/Dates Subject to Change...', 279, '45bc6f072945f53020a0d8c1cfb1010f'),
(261, 'CSLU1668276', 'LFD', '2001-01-01 00:00:00', '2001-01-01 23:59:00', 'Last Free Day for Container #: CSLU1668276. Times/Dates Subject to Change...', 280, '3bfb217e284ddad20f0cda1b60b2ee36'),
(262, 'TGBU2363084', 'ETA', '2018-09-05 23:59:00', '2018-09-05 23:59:00', 'Estimated Time of Arrival for Container #: TGBU2363084. Times/Dates Subject to Change...', 297, 'f9b56cf4b13d3881fd0868a1836fb637'),
(263, 'UETU2381377', 'ETA', '2018-09-18 23:59:00', '2018-09-18 23:59:00', 'Estimated Time of Arrival for Container #: UETU2381377. Times/Dates Subject to Change...', 298, '7c832cbbc51a15d52219e010dd09c616'),
(264, 'DFSU2893328', 'ETA', '2018-09-05 23:59:00', '2018-09-05 23:59:00', 'Estimated Time of Arrival for Container #: DFSU2893328. Times/Dates Subject to Change...', 299, '65deec84175142f2279c2e69148fb811'),
(265, 'CSLU1249773', 'ETA', '2018-09-05 23:59:00', '2018-09-05 23:59:00', 'Estimated Time of Arrival for Container #: CSLU1249773. Times/Dates Subject to Change...', 300, 'a5475ff0629c71fee50eaf1be15667ef'),
(266, '[6184596290]', 'ETA', '2018-09-11 23:59:00', '2018-09-11 23:59:00', 'Estimated Time of Arrival for Container #: [6184596290]. Times/Dates Subject to Change...', 301, '0b34037e93e66c855a3f023b9183e64b'),
(267, 'TCNU6028891', 'ETA', '2018-09-14 23:59:00', '2018-09-14 23:59:00', 'Estimated Time of Arrival for Container #: TCNU6028891. Times/Dates Subject to Change...', 302, '1e2d67f1fc63bf546c6eb1d14ebae3d0'),
(268, 'TCNU6578434', 'ETA', '2018-09-14 23:59:00', '2018-09-14 23:59:00', 'Estimated Time of Arrival for Container #: TCNU6578434. Times/Dates Subject to Change...', 303, 'b383d5db52a6037bda0920b64c9fe8ef'),
(269, '[6183129140]', 'ETA', '2018-09-20 23:59:00', '2018-09-20 23:59:00', 'Estimated Time of Arrival for Container #: [6183129140]. Times/Dates Subject to Change...', 305, '74d8d8d9107d463f5ca573733783de3a'),
(270, '[6183129150]', 'ETA', '2018-09-20 23:59:00', '2018-09-20 23:59:00', 'Estimated Time of Arrival for Container #: [6183129150]. Times/Dates Subject to Change...', 306, '999a8d782b28a416a2b9aa7a3f4971fc');

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
  `rcvd` tinyint(1) DEFAULT NULL,
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

INSERT INTO `shipments` (`id`, `status`, `po`, `product_id`, `container_number`, `bill_of_lading`, `vendor_id`, `discharge_port`, `final_destination`, `eta`, `lfd`, `pickup_number`, `truck_date`, `trucker_id`, `bl_status`, `rcvd`, `freight`, `isf_required`, `customs`, `is_complete`, `po_boolean`, `qb_rt`, `qb_ws`, `latest_event`, `latest_event_time_and_date`, `is_active`, `requires_payment`, `container_notes`, `last_update`, `container_size`, `do`, `vendor_identifier`, `has_documents`, `file_directory`) VALUES
(223, 0, 'WD18-059', 2, 'TCNU6840544', '6183114200', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-12', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(224, 0, 'JT18048', 6, 'CXDU1244888', '6190982750', 5, 'Prince Rupert', 'Memphis, TN', '2018-08-10', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-08-10 20:25:32', 20, 1, NULL, 0, NULL),
(260, 2, 'WD', 2, '[6183129160]', '6183129160', 11, 'Los Angeles', 'Memphis, TN', '2018-09-20', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(268, 3, 'WD18-056', 2, 'TCNU6437626', '6183114210', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-01', '2018-08-03', 174203, NULL, 1, 'Release', 1, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 1, '/WD18-056 TCNU6437626/'),
(269, 3, 'WB18001', 1, 'TEMU6023781', '6185693500', 14, 'Prince Rupert', 'Memphis, TN', '2018-08-01', '2018-08-03', 703508, NULL, 1, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 1, 1, NULL, '2018-08-10 20:26:25', 40, 1, NULL, 1, '/WB18-WB18001 TEMU6023781/'),
(270, 3, 'RR18078', 4, 'TCNU6459543', '6182118250', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-05', '2018-08-07', 281894, NULL, 1, 'Release', 1, 1, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 1, '/RR18-RR18078 TCNU6459543/'),
(271, 3, 'RR18078', 4, 'GLDU7478040', '6182118250', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-05', '2018-08-07', 281894, NULL, 1, 'Release', 1, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 1, '/RR18-RR18078 GLDU7478040/'),
(272, 0, 'QQ18002', 2, 'CSNU6735970', '6185677760', 9, 'Prince Rupert', 'Memphis, TN', '2018-08-10', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(273, 0, 'WD18-061', 2, 'TCNU6347287', '6183114390', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, 'Hold', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(274, 0, 'WD18-057', 2, 'TCNU6263490', '6183114220', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-12', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(275, 0, 'WD18-058', 2, 'TCNU9438082', '6183114230', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-12', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(276, 1, 'WD18-060', 2, 'TCNU5220805', '6183114380', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-14', NULL, NULL, NULL, 1, 'Hold', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(277, 1, 'WD18-062', 2, 'TCNU6692051', '6183120340', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-14', NULL, NULL, NULL, 1, 'Hold', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 1, NULL, '2018-08-10 14:05:31', 40, 1, NULL, 0, NULL),
(278, 0, 'XYJT18049', 6, 'TRHU2560148', '6191000250', 5, 'Prince Rupert', 'Memphis, TN', '2018-08-13', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-08-10 20:23:22', 20, 1, NULL, 0, NULL),
(279, 2, 'NY', 5, 'FCIU6127923', '6008532450', 4, 'Charleston', 'Loris, SC', '2018-08-20', NULL, NULL, NULL, 1, 'Release', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(280, 2, 'NY', 5, 'CSLU1668276', '6008532450', 4, 'Charleston', 'Loris, SC', '2018-08-20', NULL, NULL, NULL, NULL, 'Release', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(281, 2, 'NY', 5, 'CBHU3587146', '\"', 4, 'Los Angeles', 'Hewitt, TX', '2018-08-26', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(282, 2, 'NY', 5, 'CSLU1690829', '\"', 4, 'Los Angeles', 'Hewitt, TX', '2018-08-26', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(283, 2, 'RR', 4, 'TCNU8455892', '6182124690', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-27', NULL, NULL, NULL, NULL, 'Release', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(284, 2, 'WD', 2, 'TCNU6338367', '6183122170', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-24', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(285, 2, 'WB', 1, 'TCNU8618840', '6191658290', 13, 'Prince Rupert', 'Memphis, TN', '2018-08-24', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 20:19:41', 40, 1, NULL, 0, NULL),
(286, 2, 'WB', NULL, 'CXDU1049074', '6191658290', 13, 'Prince Rupert', 'Memphis, TN', '2018-08-24', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(287, 2, 'YX', 3, 'CBHU5698215', '6191695510', 2, 'Prince Rupert', 'Memphis, TN', '2018-08-24', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 1, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 20:19:46', 20, 1, NULL, 0, NULL),
(288, 2, 'NY', 5, 'RFCU2113110', '6008532880', 4, 'Charleston', 'Loris, SC', '2018-08-28', NULL, NULL, NULL, NULL, 'Release', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(289, 2, 'NY', 5, 'CSNU1352496', '6008532880', 4, 'Charleston', 'Loris, SC', '2018-08-28', NULL, NULL, NULL, NULL, 'Release', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded at Port of Transhipment', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(290, 2, 'QQ', 2, 'CBHU7002326', '6191729550', 9, 'Los Angeles', 'Memphis, TN', '2018-08-29', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(291, 2, 'WD', 2, 'TCNU6177323', '6183122140', 11, 'Los Angeles', 'Memphis, TN', '2018-09-01', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(292, 2, 'WD', 2, 'TCNU6172240', '6183122150', 11, 'Los Angeles', 'Memphis, TN', '2018-09-01', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(293, 2, 'WD', 2, 'TCNU5019914', '6183122160', 11, 'Los Angeles', 'Memphis, TN', '2018-09-01', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(294, 2, 'WD', 2, 'TCNU6269203', '6183122120', 11, 'Long Beach', 'Memphis, TN', '2018-09-07', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(295, 2, 'WD', 2, 'TCNU6591360', '6183122130', 11, 'Long Beach', 'Memphis, TN', '2018-09-07', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(296, 2, 'WD', 2, 'TCNU6693248', '6183127680', 11, 'Long Beach', 'Memphis, TN', '2018-09-07', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(297, 2, NULL, 5, 'TGBU2363084', '\"', 4, 'Prince Rupert', 'Memphis, TN', '2018-09-05', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 1, NULL, 0, NULL),
(299, 2, NULL, 9, 'DFSU2893328', '6184594010', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-05', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 1, NULL, 0, NULL),
(300, 2, NULL, 9, 'CSLU1249773', '6184594010', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-05', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 1, NULL, 0, NULL),
(301, 2, NULL, 9, '[6184596290]', '6184596290', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-15', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 20, 1, NULL, 0, NULL),
(302, 2, NULL, 2, 'TCNU6028891', '6183122100', 11, 'Long Beach', 'Memphis, TN', '2018-09-14', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Container Arrival at First Port of Load', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(303, 2, NULL, 2, 'TCNU6578434', '6183122110', 11, 'Long Beach', 'Memphis, TN', '2018-09-14', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(304, 3, NULL, 5, 'UETU2381377', '\"', 4, 'Norfolk', 'Henderson, NC', NULL, NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', '2018-08-07 19:00:00', 1, 0, NULL, '2018-08-10 14:05:22', 20, 0, NULL, 0, NULL),
(305, 2, NULL, 2, '[6183129140]', '6183129140', 11, 'Los Angeles', 'Memphis, TN', '2018-09-20', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL),
(306, 2, NULL, 2, '[6183129150]', '6183129150', 11, 'Los Angeles', 'Memphis, TN', '2018-09-20', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-08-10 14:05:22', 40, 1, NULL, 0, NULL);

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
(1, '', '', NULL, '@libraresources.com|'),
(2, 'Changyi Youxing Casting Company Limited', 'Youxing', 'YX', NULL),
(3, 'Guangdong Foreign Trade Import & Export Company Limited', 'Rodrock', 'RR', NULL),
(4, 'Hangzhou Skye Vehicle Parts. Co., Ltd', 'Skye', 'NY', NULL),
(5, 'Hebei Xingyue Braking Element Company Limited', 'Xingyue', 'XY', NULL),
(6, 'Intradin Huzhou Hardware Co., Ltd', 'ITI', 'LB-TK', NULL),
(7, 'Iti Company Limited', 'ITI', 'LB', NULL),
(8, 'Qingdao Crowntyre Industrial Company Limited', 'Crown', 'CR', NULL),
(9, 'Qingdao Qihang Tyre Company Limited', 'Qihang', 'QQ', NULL),
(10, 'Shandong Guofeng Rubber Plastics Company Limited', 'Guofeng', 'GF', NULL),
(11, 'Tianjin Wanda Tyre Group Company Limited', 'Wanda', 'WD', 'tjwanda.com|'),
(12, 'Ruian Jianxin Machinery Manufacturing Company Limited', 'Jianxin', 'JT', '163.com|'),
(13, 'Shandong Wanda Boto Tyre Company Limited', 'Shandong', 'WB', NULL),
(14, 'Shandong Wanda Boto Tyre Company Limited', 'BOTO', 'WB', '');

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
  `md5_hash` varchar(36) NOT NULL,
  `identifying_label` varchar(32) DEFAULT NULL,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_documents`
--

INSERT INTO `vendor_documents` (`id`, `document_type`, `po_number`, `vendor_id`, `filename`, `filepath`, `file_extension`, `shipment_id`, `md5_hash`, `identifying_label`, `creation_timestamp`) VALUES
(108, 'Document', 'JX18035', 1, '7501 5922 3 072518.pdf', '/vendor_documents/18-JX18035 DFSU2335408/', 'pdf', 266, 'd81276288d58605069a7a170d1ad63dd', 'DFSU2335408', '2018-07-30 21:33:47'),
(109, 'Document', 'JX18035', 1, 'JX18034-JX18035 ESP 5921-5922.PDF', '/vendor_documents/18-JX18035 DFSU2335408/', 'PDF', 266, 'e254ad5296c7898568effc2051d1de0c', 'DFSU2335408', '2018-07-30 21:33:47'),
(110, 'Document', 'JX18035', 1, 'JX18035-Entry Inv. 5922.pdf', '/vendor_documents/18-JX18035 DFSU2335408/', 'pdf', 266, '765a0bb6f0be32b8d534b128554d4a5c', 'DFSU2335408', '2018-07-30 21:33:47'),
(111, 'Document', 'JX18034', 1, '7501 5921 5 072518.pdf', '/vendor_documents/18-JX18034 TEMU2905945/', 'pdf', 267, 'b85a31ac65eedd005442b7b30786d95a', 'TEMU2905945', '2018-07-30 21:33:49'),
(112, 'Document', 'JX18034', 1, 'JX18034-Entry Inv. 5921.pdf', '/vendor_documents/18-JX18034 TEMU2905945/', 'pdf', 267, 'ef17c4ea05859e3e19a7b1f63dccbc9e', 'TEMU2905945', '2018-07-30 21:33:49'),
(113, 'Document', 'XY18047', 5, '7501 5882 9 072518.pdf', '/vendor_documents/XY18-XY18047 CBHU5542433/', 'pdf', 203, '8ab630ddedbdc58019bd96e4c5a9689b', 'CBHU5542433', '2018-07-30 21:33:51'),
(114, 'Document', 'XY18047', 5, 'XY18047 ESP 5882.PDF', '/vendor_documents/XY18-XY18047 CBHU5542433/', 'PDF', 203, '2e6773bbcdeb2b216e6357a40ccaf77c', 'CBHU5542433', '2018-07-30 21:33:51'),
(115, 'Document', 'XY18047', 5, 'XY18047-Entry Inv. 5882.pdf', '/vendor_documents/XY18-XY18047 CBHU5542433/', 'pdf', 203, '78e77987c906d313cf7eb7a1db0829d8', 'CBHU5542433', '2018-07-30 21:33:51'),
(116, 'Document', 'WD-18-055', 11, '7501 5759 9 072518.pdf', '/vendor_documents/WD18-055 TCNU6181220/', 'pdf', 265, 'd235beceaac6bf487cbfc58cd5c9710a', 'TCNU6181220', '2018-07-30 21:33:53'),
(117, 'Document', 'WD-18-055', 11, 'WD18-055 ESP 5759.PDF', '/vendor_documents/WD18-055 TCNU6181220/', 'PDF', 265, 'd6cae6b550866a6fa8d4d83851a5ffb5', 'TCNU6181220', '2018-07-30 21:33:53'),
(118, 'Document', 'WD-18-055', 11, 'WD18-055-Entry Inv. 5759.pdf', '/vendor_documents/WD18-055 TCNU6181220/', 'pdf', 265, '9063ee94bbaf979ec4430aee5e9af28a', 'TCNU6181220', '2018-07-30 21:33:53'),
(119, 'Document', 'WD-18-054', 11, '7501 5758 1 072518.pdf', '/vendor_documents/WD18-054 TCNU5288786/', 'pdf', 264, '643dec44965743f9b0b5e1614ca3acee', 'TCNU5288786', '2018-07-30 21:33:56'),
(120, 'Document', 'WD-18-054', 11, 'WD18-054 ESP 5758.PDF', '/vendor_documents/WD18-054 TCNU5288786/', 'PDF', 264, '30fda3bb51fe3d6722fd0813bf092bf1', 'TCNU5288786', '2018-07-30 21:33:56'),
(121, 'Document', 'WD-18-054', 11, 'WD18-054-Entry Inv. 5758.pdf', '/vendor_documents/WD18-054 TCNU5288786/', 'pdf', 264, '20328525d3743c2685f69debddf8cd08', 'TCNU5288786', '2018-07-30 21:33:56'),
(122, 'Document', 'WD-18-053', 11, '7501 5757 3 072518.pdf', '/vendor_documents/WD18-053 TCNU6074855/', 'pdf', 199, '2333cd183f481aa02043bfeb1cfd763c', 'TCNU6074855', '2018-07-30 21:33:58'),
(123, 'Document', 'WD-18-053', 11, 'WD18-053-Entry Inv. 5757.pdf', '/vendor_documents/WD18-053 TCNU6074855/', 'pdf', 199, '97357b3c5dc498b3b7b4f5df66e3fafc', 'TCNU6074855', '2018-07-30 21:33:59'),
(124, 'Document', 'WD-18-053', 11, 'WD18-053 ESP 5757.PDF', '/vendor_documents/WD18-053 TCNU6074855/', 'PDF', 199, '03ddf198eb630b86ca7ef79b278eb41e', 'TCNU6074855', '2018-07-30 21:33:59'),
(125, 'Document', 'RR18073', 3, '7501 5820 9 071618.pdf', '/vendor_documents/RR18-RR18073 FSCU8957220/', 'pdf', NULL, '8e696635b8ff5335038b0ee5cb30ec2a', 'FSCU8957220', '2018-07-30 21:34:07'),
(126, 'Document', 'RR18073', 3, '7501 5820 9 071618-1.pdf', '/vendor_documents/RR18-RR18073 FCIU9602992/', 'pdf', NULL, '8e696635b8ff5335038b0ee5cb30ec2a-1', 'FCIU9602992', '2018-07-30 21:34:07'),
(127, 'Document', 'RR18073', 3, '7501 5822 5 071618.pdf', '/vendor_documents/RR18-RR18073 FSCU8957220/', 'pdf', NULL, '4e3c947b2477f5183634f2f454f03380', 'FSCU8957220', '2018-07-30 21:34:07'),
(128, 'Document', 'RR18073', 3, '7501 5822 5 071618-1.pdf', '/vendor_documents/RR18-RR18073 FCIU9602992/', 'pdf', NULL, '4e3c947b2477f5183634f2f454f03380-1', 'FCIU9602992', '2018-07-30 21:34:07'),
(129, 'Document', 'RR18073', 3, 'RR18073-Entry Inv. 5820.pdf', '/vendor_documents/RR18-RR18073 FSCU8957220/', 'pdf', NULL, 'eadb21610fb32b1ddd7e12ce309879ed', 'FSCU8957220', '2018-07-30 21:34:07'),
(130, 'Document', 'RR18073', 3, 'RR18073-Entry Inv-1. 5820-1.pdf', '/vendor_documents/RR18-RR18073 FCIU9602992/', 'pdf', NULL, 'eadb21610fb32b1ddd7e12ce309879ed-1', 'FCIU9602992', '2018-07-30 21:34:07'),
(131, 'Document', 'RR18073', 3, 'RR18073-Entry Inv. 5822.pdf', '/vendor_documents/RR18-RR18073 FSCU8957220/', 'pdf', NULL, '1f73c621e8149a57372c3f1feb5450e7', 'FSCU8957220', '2018-07-30 21:34:07'),
(132, 'Document', 'RR18073', 3, 'RR18073-Entry Inv-1. 5822-1.pdf', '/vendor_documents/RR18-RR18073 FCIU9602992/', 'pdf', NULL, '1f73c621e8149a57372c3f1feb5450e7-1', 'FCIU9602992', '2018-07-30 21:34:07'),
(133, 'Document', 'RR18073', 3, 'RR18073-ESP #5820.PDF', '/vendor_documents/RR18-RR18073 FSCU8957220/', 'PDF', NULL, '27e2ca3ad48aa5fc99b868524ea0e059', 'FSCU8957220', '2018-07-30 21:34:07'),
(134, 'Document', 'RR18073', 3, 'RR18073-ESP #5820-1.PDF', '/vendor_documents/RR18-RR18073 FCIU9602992/', 'PDF', NULL, '27e2ca3ad48aa5fc99b868524ea0e059-1', 'FCIU9602992', '2018-07-30 21:34:07'),
(135, 'Document', 'JX18037', 1, '7501 5798 7 071318.pdf', '/vendor_documents/18-JX18037 TRHU1675179/', 'pdf', NULL, '947ede6c575e2b8d5e9dd67bbb0bec5b', 'TRHU1675179', '2018-07-30 21:34:09'),
(136, 'Document', 'JX18037', 1, 'JX18037 ESP 5798.PDF', '/vendor_documents/18-JX18037 TRHU1675179/', 'PDF', NULL, '2b2d62fb56c4fc9f33f6ed5a2d5ed23e', 'TRHU1675179', '2018-07-30 21:34:10'),
(137, 'Document', 'JX18037', 1, 'JX18037-Entry Inv. 5798.pdf', '/vendor_documents/18-JX18037 TRHU1675179/', 'pdf', NULL, 'c3bcfd38dc34c33ae261f3add1239a74', 'TRHU1675179', '2018-07-30 21:34:10'),
(138, 'Document', 'JX18036', 1, '7501 5797 9 071318.pdf', '/vendor_documents/18-JX18036 TCKU1522696/', 'pdf', NULL, 'd8a7f11907965a436c3ff8eda8211006', 'TCKU1522696', '2018-07-30 21:34:12'),
(139, 'Document', 'JX18036', 1, 'JX18036 ESP 5797.PDF', '/vendor_documents/18-JX18036 TCKU1522696/', 'PDF', NULL, '8efbfe1852c7239f68a509d6f878a2fc', 'TCKU1522696', '2018-07-30 21:34:12'),
(140, 'Document', 'JX18036', 1, 'JX18036-Entry Inv. 5797.pdf', '/vendor_documents/18-JX18036 TCKU1522696/', 'pdf', NULL, '28fc396ba69304d3646dbdc932697fe0', 'TCKU1522696', '2018-07-30 21:34:12'),
(141, 'Document', 'XY18031', 5, '7501 5796 1 071318.pdf', '/vendor_documents/XY18-XY18031 DFSU1580890/', 'pdf', NULL, '740a2f173d93840b15cd5dacd3ddc719', 'DFSU1580890', '2018-07-30 21:34:16'),
(142, 'Document', 'XY18031', 5, 'XY18031 ESP 5796.PDF', '/vendor_documents/XY18-XY18031 DFSU1580890/', 'PDF', NULL, '33ee345038266b3f77876d42733d3b78', 'DFSU1580890', '2018-07-30 21:34:16'),
(143, 'Document', 'XY18031', 5, 'XY18031-Entry Inv. 5796.pdf', '/vendor_documents/XY18-XY18031 DFSU1580890/', 'pdf', NULL, 'ded324e1d3d9fa83f456ac24f3d5fcdd', 'DFSU1580890', '2018-07-30 21:34:16'),
(144, 'Document', 'XY18051B', 5, '7501 5795 3 071318.pdf', '/vendor_documents/XY18-XY18051B TCKU3032050/', 'pdf', NULL, '33872f730fe770b60932685aac27667e', 'TCKU3032050', '2018-07-30 21:34:18'),
(145, 'Document', 'XY18051B', 5, 'XY18051B ESP 5795.PDF', '/vendor_documents/XY18-XY18051B TCKU3032050/', 'PDF', NULL, '6a06a80de7366539aac7aeb144860e56', 'TCKU3032050', '2018-07-30 21:34:18'),
(146, 'Document', 'XY18051B', 5, 'XY18051B-Entry Inv. 5795.pdf', '/vendor_documents/XY18-XY18051B TCKU3032050/', 'pdf', NULL, '72760f138edf404bcfde8b7d83011113', 'TCKU3032050', '2018-07-30 21:34:18'),
(147, 'Document', 'NY17165', 4, '7501 5794 6 071218.pdf', '/vendor_documents/NY18-NY17165 CBHU4110559/', 'pdf', NULL, 'dc825bb7401106a3e29b4efa02626206', 'CBHU4110559', '2018-07-30 21:34:21'),
(148, 'Document', 'NY17165', 4, 'NY17165-Entry Inv. 5794.pdf', '/vendor_documents/NY18-NY17165 CBHU4110559/', 'pdf', NULL, '51f3a86e679c553b26e0eeb218406871', 'CBHU4110559', '2018-07-30 21:34:21'),
(149, 'Document', 'NY17165', 4, 'NY17165-ESP 5794.PDF', '/vendor_documents/NY18-NY17165 CBHU4110559/', 'PDF', NULL, 'ee949e9882c7120e6393501abf956819', 'CBHU4110559', '2018-07-30 21:34:21'),
(150, 'Document', 'WD18-052', 11, '7501 5756 5 071318.pdf', '/vendor_documents/WD18-052 GLDU7538370/', 'pdf', NULL, '2bd38d2c9b7c769e18670867e1943439', 'GLDU7538370', '2018-07-30 21:34:23'),
(151, 'Document', 'WD18-052', 11, 'WD18-052-Entry Inv.5756.pdf', '/vendor_documents/WD18-052 GLDU7538370/', 'pdf', NULL, 'c392dc858cbee489f32a1a1548f3dea6', 'GLDU7538370', '2018-07-30 21:34:23'),
(152, 'Document', 'WD18-052', 11, 'WD18-052 ESP 5756.PDF', '/vendor_documents/WD18-052 GLDU7538370/', 'PDF', NULL, '66344984b65ecdae6cebdc391eeaf8e7', 'GLDU7538370', '2018-07-30 21:34:23'),
(153, 'Document', 'WD18-051', 11, '7501 5755 7 071318.pdf', '/vendor_documents/WD18-051 TCNU6516920/', 'pdf', NULL, 'fae7e349821d0504f1a88155972626ee', 'TCNU6516920', '2018-07-30 21:34:25'),
(154, 'Document', 'WD18-051', 11, 'WD18-051 ESP 5755.PDF', '/vendor_documents/WD18-051 TCNU6516920/', 'PDF', NULL, '8d08c2c5bd66fe2e8c44a6b3cf23b57a', 'TCNU6516920', '2018-07-30 21:34:25'),
(155, 'Document', 'WD18-051', 11, 'WD18-051-Entry Inv.5755.pdf', '/vendor_documents/WD18-051 TCNU6516920/', 'pdf', NULL, '10526908874ac45df53798694e340006', 'TCNU6516920', '2018-07-30 21:34:25'),
(156, 'Document', 'WD18-050', 11, '7501 5754 0 071418.pdf', '/vendor_documents/WD18-050 CCLU6736270/', 'pdf', NULL, '92160a3d28e24b6ec536d70e9e5d2a65', 'CCLU6736270', '2018-07-30 21:34:28'),
(157, 'Document', 'WD18-050', 11, 'WD18-050-Entry Inv.5754.pdf', '/vendor_documents/WD18-050 CCLU6736270/', 'pdf', NULL, '297f872affd44940fdef1e379ee03389', 'CCLU6736270', '2018-07-30 21:34:28'),
(158, 'Document', 'WD18-050', 11, 'WD18-050--ESP 5754.PDF', '/vendor_documents/WD18-050 CCLU6736270/', 'PDF', NULL, '935359971f64a0d59c216e3a463eda84', 'CCLU6736270', '2018-07-30 21:34:28'),
(159, 'Document', 'WD18-049', 11, '7501 5753 2 071318.pdf', '/vendor_documents/WD18-049 TCNU6267812/', 'pdf', NULL, '6a699834d601ed1f3ac459e7a6f28599', 'TCNU6267812', '2018-07-30 21:34:30'),
(160, 'Document', 'WD18-049', 11, 'WD18-049 ESP 5753.PDF', '/vendor_documents/WD18-049 TCNU6267812/', 'PDF', NULL, 'a1b84338c41f312faa50dd7b3fd3152a', 'TCNU6267812', '2018-07-30 21:34:30'),
(161, 'Document', 'WD18-049', 11, 'WD18-049-Entry Inv.5753.pdf', '/vendor_documents/WD18-049 TCNU6267812/', 'pdf', NULL, '34e6c7b45483034d4cc744b81a8890cf', 'TCNU6267812', '2018-07-30 21:34:30'),
(162, 'Document', 'WD18-048', 11, '7501 5752 4 071318.pdf', '/vendor_documents/WD18-048 TCNU7396270/', 'pdf', NULL, '3b67a34cf49794c4fa4c309466da3084', 'TCNU7396270', '2018-07-30 21:34:32'),
(163, 'Document', 'WD18-048', 11, 'WD18-048 ESP 5752.PDF', '/vendor_documents/WD18-048 TCNU7396270/', 'PDF', NULL, '534044dd5d0480e81eb5dafa6c662855', 'TCNU7396270', '2018-07-30 21:34:32'),
(164, 'Document', 'WD18-048', 11, 'WD18-048-Entry Inv.5752.pdf', '/vendor_documents/WD18-048 TCNU7396270/', 'pdf', NULL, 'e6a4312d9fdfb4409ca225786a43a8e3', 'TCNU7396270', '2018-07-30 21:34:33'),
(165, 'Document', 'WD18-047', 11, '7501 5751 6 071318.pdf', '/vendor_documents/WD18-047 TCNU6268866/', 'pdf', NULL, '657a799bb7ba3570d7c9e9e2adb2ac33', 'TCNU6268866', '2018-07-30 21:34:35'),
(166, 'Document', 'WD18-047', 11, 'WD18-047 ESP 5751.PDF', '/vendor_documents/WD18-047 TCNU6268866/', 'PDF', NULL, 'ed2823b447b6c2964fb3b9cd30086410', 'TCNU6268866', '2018-07-30 21:34:36'),
(167, 'Document', 'WD18-047', 11, 'WD18-047-Entry Inv.5751.pdf', '/vendor_documents/WD18-047 TCNU6268866/', 'pdf', NULL, '2ea24d85bdaf1e7ff193c29fa40cb414', 'TCNU6268866', '2018-07-30 21:34:36'),
(168, 'Document', 'GF18-003', 10, '7501 5744 1 071318.pdf', '/vendor_documents/GF18-003 FCIU9969777/', 'pdf', NULL, '5dd6e88b2ac489ccde149854aa167e6d', 'FCIU9969777', '2018-07-30 21:34:38'),
(169, 'Document', 'GF18-003', 10, 'GF18-003 ESP 5744.PDF', '/vendor_documents/GF18-003 FCIU9969777/', 'PDF', NULL, '565e24636f663c4c063371ddd9e48332', 'FCIU9969777', '2018-07-30 21:34:38'),
(170, 'Document', 'GF18-003', 10, 'GF18-003-Entry Inv. 5744.pdf', '/vendor_documents/GF18-003 FCIU9969777/', 'pdf', NULL, '2d446277fddb36d71fee2127d20fc08d', 'FCIU9969777', '2018-07-30 21:34:38'),
(171, 'Document', 'CY18-003', 1, '7501 5691 4 071218.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'pdf', NULL, '8229e4190fcf1832ee62ae8d5cbf7b36', 'CBHU8234990', '2018-07-30 21:34:41'),
(172, 'Document', 'CY18-003', 1, 'CY18-003-Entry Inv. 5691.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'pdf', NULL, '5c808eb937fe980fb912b08455c46021', 'CBHU8234990', '2018-07-30 21:34:41'),
(173, 'Document', 'CY18-003', 1, 'CY18-003--ESP 5691.PDF', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '85d2fb6eb529fe2d536ccf61e2c626b3', 'CBHU8234990', '2018-07-30 21:34:41'),
(174, 'Parts_List', '00000', 12, 'doc-580-pl-spindle-18034 18035.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '034b0b6e3d3ae5fbaa09adbc0723e663', 'NO_CN', '2018-07-30 21:34:43'),
(175, 'Invoice', '00000', 12, 'doc-580-iv-spindle-18034 18035.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, 'a91ff84e18fa91c900b59685c127dfee', 'NO_CN', '2018-07-30 21:34:43'),
(176, 'Parts_List', 'XY18047', 5, 'doc-579-pl-brake-18047.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '5586d398d895792b612eeedb280052ed', 'NO_CN', '2018-07-30 21:34:44'),
(177, 'Invoice', 'XY18047', 5, 'doc-579-in-brake-18047.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '86bdd6b155f9f850ed8c19fcbff5eb33', 'NO_CN', '2018-07-30 21:34:44'),
(178, 'Parts_List', 'XY18032', 5, 'doc-578-PL-brake-18032.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '4fb705c0ef1eea21bfa91d37d8a10fee', 'NO_CN', '2018-07-30 21:34:48'),
(179, 'Invoice', 'XY18032', 5, 'doc-578-in-brake-18032.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, 'd2a4b964fe2534884b2db4647432dc08', 'NO_CN', '2018-07-30 21:34:48'),
(180, 'Parts_List', 'RR18073', 3, 'doc-577-PL-JACK-18073.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '9eabb4f4d590b0c9a8f6e8ffb32a67c5', 'NO_CN', '2018-07-30 21:34:49'),
(181, 'Invoice', 'RR18073', 3, 'doc-577-in-JACK-18073.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '6b0ce354cf9bc5bb506a2b03a3593671', 'NO_CN', '2018-07-30 21:34:49'),
(182, 'Parts_List', 'XY18031', 5, 'doc-576-pl-brake-18031.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '3840f36e75847b0d32f6b38d809c34a0', 'NO_CN', '2018-07-30 21:34:50'),
(183, 'Invoice', 'XY18031', 5, 'doc-576-in-brake-18031.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '7038ab09c084c5d147aaefcb8014fd76', 'NO_CN', '2018-07-30 21:34:51'),
(184, 'Invoice', 'XY18051', 5, 'doc-575-in-drums-18051B.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '6025f441c0e5d280259199b28dc8005a', 'NO_CN', '2018-07-30 21:34:51'),
(185, 'Parts_List', 'XY18051', 5, 'doc-575-pl-drums-18051B.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '2b99bc1a7ba4568c049e12dafdd7629c', 'NO_CN', '2018-07-30 21:34:51'),
(186, 'Parts_List', '00000', 12, 'doc-574-pl-spindle-18036 18037.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '2295c73ffd28d929135b653fd0d9feb9', 'NO_CN', '2018-07-30 21:34:54'),
(187, 'Invoice', '00000', 12, 'doc-574-iv-spindle-18036 18037.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '9db14aa8c9c2bf3b16f220cf57241a0a', 'NO_CN', '2018-07-30 21:34:54'),
(188, 'Parts_List', 'NY17165', 4, 'doc-573-pl-spring-17165.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '62acc035fbd2ae3aa6ebee42744b8334', 'NO_CN', '2018-07-30 21:34:55'),
(189, 'Invoice', 'NY17165', 4, 'doc-573-iv-spring-17165.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, 'a8cf560d63004e9a1551c890ad71c502', 'NO_CN', '2018-07-30 21:34:55'),
(190, 'Parts_List', 'RR18064', 3, 'doc-572-pl-jack-18064.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, '1e3618c33a2cfe768861402099d6bcb4', 'NO_CN', '2018-07-30 21:34:56'),
(191, 'Invoice', 'RR18064', 3, 'doc-572-in-jack-18064.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, 'c71e5aaa4effb6dbf6c1171125dfaa29', 'NO_CN', '2018-07-30 21:34:56'),
(192, 'Parts_List', '00000', 3, 'doc-571-pl-brakes-18046.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, 'a79f8333199072a2d096ca7b21101d52', 'NO_CN', '2018-07-30 21:34:57'),
(193, 'Invoice', '00000', 3, 'doc-571-iv-brakes-18046.pdf', '/vendor_documents/CY18-003 CBHU8234990/', 'PDF', NULL, 'cafa904e5909c83c99062581915618b3', 'NO_CN', '2018-07-30 21:34:57'),
(194, 'Document', 'XY18046', 5, '7501 5742 5 062918.pdf', '/vendor_documents/XY18-XY18046 TCKU2558013/', 'pdf', NULL, 'a94e9de45907ee3f4a789b08046f330a', 'TCKU2558013', '2018-07-30 21:35:13'),
(195, 'Document', 'XY18046', 5, 'XY18046-Entry Inv. 5742.pdf', '/vendor_documents/XY18-XY18046 TCKU2558013/', 'pdf', NULL, 'c48e8398b2018a052ccdfc689428e84e', 'TCKU2558013', '2018-07-30 21:35:13'),
(196, 'Document', 'XY18046', 5, 'XY18046-ESP 5742.PDF', '/vendor_documents/XY18-XY18046 TCKU2558013/', 'PDF', NULL, '076efd1643cc4f5693ec0beff8c94477', 'TCKU2558013', '2018-07-30 21:35:13'),
(197, 'Document', 'WD18-045', 11, '7501 5689 8 070818.pdf', '/vendor_documents/WD18-045 BMOU5856748/', 'pdf', NULL, 'a23de1928998d7c68c22bbb4c28e41ca', 'BMOU5856748', '2018-07-30 21:35:16'),
(198, 'Document', 'WD18-045', 11, 'WD18-045-Entry Inv.5689.pdf', '/vendor_documents/WD18-045 BMOU5856748/', 'pdf', NULL, '1dfa9e8b7728c901a625336c8b13c1b7', 'BMOU5856748', '2018-07-30 21:35:16'),
(199, 'Document', 'WD18-045', 11, 'WD18-045-ESP 5689.PDF', '/vendor_documents/WD18-045 BMOU5856748/', 'PDF', NULL, '0f6bb689115dfad406155306d93c4889', 'BMOU5856748', '2018-07-30 21:35:16'),
(200, 'Document', 'RR18064', 3, '7501 5767 2 070818.pdf', '/vendor_documents/RR18-RR18064 TEMU7590178/', 'pdf', NULL, 'ba43c560cf16cd4b64838fdcfacb4545', 'TEMU7590178', '2018-07-30 21:35:20'),
(201, 'Document', 'RR18064', 3, 'RR18064-Entry Inv. 5767.pdf', '/vendor_documents/RR18-RR18064 TEMU7590178/', 'pdf', NULL, 'd79b797e37f9e161b3d1229ec702fe7d', 'TEMU7590178', '2018-07-30 21:35:20'),
(202, 'Document', 'RR18064', 3, 'RR18064-ESP 5767.PDF', '/vendor_documents/RR18-RR18064 TEMU7590178/', 'PDF', NULL, 'e3ab565bce6bb18d03db69b50ff7b814', 'TEMU7590178', '2018-07-30 21:35:20'),
(203, 'Document', 'WD18-046', 11, '7501 5688 0 070818.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'pdf', NULL, '078691020e8c48e8fb4ead4b9fde82ae', 'TCNU6342310', '2018-07-30 21:35:22'),
(204, 'Document', 'WD18-046', 11, 'WD18-046-Entry Inv.5688.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'pdf', NULL, '22ac06b1ecea95b265c2bc193d285a5a', 'TCNU6342310', '2018-07-30 21:35:22'),
(205, 'Document', 'WD18-046', 11, 'WD18-046-ESP 5688.PDF', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '26ea68b2b113c2111bd01ab875189507', 'TCNU6342310', '2018-07-30 21:35:22'),
(206, 'Parts_List', 'NY17093', 4, 'doc-568-pl-spring-17093 18021.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '48924bf3cddc92b0b23d88fa413d02b7', 'NO_CN', '2018-07-30 21:35:45'),
(207, 'Invoice', 'NY17093', 4, 'doc-568-iv-spring-17093 18021.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'f92578d1f253dcfb8d9d2f792d418e54', 'NO_CN', '2018-07-30 21:35:45'),
(208, 'Parts_List', 'RR18063', 3, 'doc-570-PL-jack-17163.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'cc6d55189e48fca04ea0aacfbfe16e3c', 'NO_CN', '2018-07-30 21:35:46'),
(209, 'Invoice', 'RR18063', 3, 'doc-570-in-jack-17163.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '75c328a5a25563b9d9b83e684728755c', 'NO_CN', '2018-07-30 21:35:46'),
(210, 'Parts_List', 'NY17133', 4, 'doc-569-pl-spring-17133.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '3df1fcd1893f0979a619880cc21b7604', 'NO_CN', '2018-07-30 21:35:47'),
(211, 'Invoice', 'NY17133', 4, 'doc-569-iv-spring-17133.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '7eae0e0136233abd32d1cc5f229dee14', 'NO_CN', '2018-07-30 21:35:47'),
(212, 'Parts_List', 'NY17160', 4, 'doc-565-pl-spring-17160.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'c2db2c226213ced86bff0e748bd12ba2', 'NO_CN', '2018-07-30 21:36:13'),
(213, 'Invoice', 'NY17160', 4, 'doc-565-iv-spring-17160.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '1c8e138fb5464857c81269006492abc5', 'NO_CN', '2018-07-30 21:36:14'),
(214, 'Invoice', '00000', 4, 'doc-564-iv-drums-18044B.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'feb61fba419e93a493fb1b6445357f63', 'NO_CN', '2018-07-30 21:36:14'),
(215, 'Parts_List', '00000', 4, 'doc-564-pl-drums-18044B.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'f97ef6399266c081debeb78ea197328f', 'NO_CN', '2018-07-30 21:36:15'),
(216, 'Invoice', '00000', 12, 'doc-563-iv-brakes-18029.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '4f67d469f12f56ebb772deac38e5982b', 'NO_CN', '2018-07-30 21:36:20'),
(217, 'Parts_List', '00000', 12, 'doc-563-pl-brakes-18029.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '8ac5c01fa078b8b88214362575d6b04f', 'NO_CN', '2018-07-30 21:36:21'),
(218, 'Parts_List', 'RR18056', 3, 'doc-562-pl-jacks-18056.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '7e1c143bce2903493c45633d61053dc1', 'NO_CN', '2018-07-30 21:36:21'),
(219, 'Invoice', 'RR18056', 3, 'doc-562-iv-jacks-18056.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'f601761baf3fb937411ed4b83c693783', 'NO_CN', '2018-07-30 21:36:22'),
(220, 'Invoice', '00000', 12, 'doc-561-iv-spindle-18008.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'f3fc83b0b12973667fce34421e1606ab', 'NO_CN', '2018-07-30 21:36:29'),
(221, 'Parts_List', '00000', 12, 'doc-561-pl-spindle-18008.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, '16fefa463e2f51772d8d4d2d45af1993', 'NO_CN', '2018-07-30 21:36:29'),
(222, 'Parts_List', '00000', 7, 'doc-560-pl-chain-17156.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'bbb3205328c384d7f7396861c7f21d4c', 'NO_CN', '2018-07-30 21:36:31'),
(223, 'Invoice', '00000', 7, 'doc-560-iv-chain-17156.pdf', '/vendor_documents/WD18-046 TCNU6342310/', 'PDF', NULL, 'c2250d84a975c68a0403c246f0054a34', 'NO_CN', '2018-07-30 21:36:31'),
(224, 'Document', 'WB18001', 13, '7501 5874 6 073018.pdf', 'C:/xampp/htdocs/vendor_documents/WB18-WB18001 TEMU6023781/', 'pdf', 269, 'e65535187e7e4dd59e8047c8cac18243', 'TEMU6023781', '2018-08-01 01:54:49'),
(225, 'Document', 'WB18001', 13, 'Invoice 5874.pdf', 'C:/xampp/htdocs/vendor_documents/WB18-WB18001 TEMU6023781/', 'pdf', 269, '966b5c4b54dada5cd691abfe958e1d2d', 'TEMU6023781', '2018-08-01 01:54:49'),
(226, 'Document', 'WB18001', 13, 'WB18001 ESP 5874.PDF', 'C:/xampp/htdocs/vendor_documents/WB18-WB18001 TEMU6023781/', 'PDF', 269, 'e0f41617a7a652fb865f9a158ea2e0a9', 'TEMU6023781', '2018-08-01 01:54:49'),
(227, 'Document', 'WD-18-056', 11, '7501 5873 8 073018.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-056 TCNU6437626/', 'pdf', 268, '438e80a93da0cd118cdb72063df746bb', 'TCNU6437626', '2018-08-01 01:54:51'),
(228, 'Document', 'WD-18-056', 11, 'Invoice 5873.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-056 TCNU6437626/', 'pdf', 268, '9c68bf50c1890c7866056d6117d77c3c', 'TCNU6437626', '2018-08-01 01:54:51'),
(229, 'Document', 'WD-18-056', 11, 'WD18-056 ESP 5873.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-056 TCNU6437626/', 'PDF', 268, '03e8f1b3195a96e3c88f9759e32fddb3', 'TCNU6437626', '2018-08-01 01:54:51'),
(230, 'Document', 'RR18078', 3, '7501 5964 5 080218.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'pdf', 270, 'b514b898ce467e6c4e36f0e1615bdd35', 'TCNU6459543', '2018-08-04 03:08:59'),
(231, 'Document', 'RR18078', 3, '7501 5964 5 080218-1.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 GLDU7478040/', 'pdf', 271, 'b514b898ce467e6c4e36f0e1615bdd35-1', 'GLDU7478040', '2018-08-04 03:08:59'),
(232, 'Document', 'RR18078', 3, '7501 5965 2 080218.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'pdf', 270, 'fe4ab11c442a04dfece73f78023555ae', 'TCNU6459543', '2018-08-04 03:08:59'),
(233, 'Document', 'RR18078', 3, '7501 5965 2 080218-1.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 GLDU7478040/', 'pdf', 271, 'fe4ab11c442a04dfece73f78023555ae-1', 'GLDU7478040', '2018-08-04 03:08:59'),
(234, 'Document', 'RR18078', 3, 'RR18078 Entry Inv. 5965.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'pdf', 270, 'e2e5c59c5f8599f3319a05609dc5a7a3', 'TCNU6459543', '2018-08-04 03:08:59'),
(235, 'Document', 'RR18078', 3, 'RR18078 Entry Inv-1. 5965-1.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 GLDU7478040/', 'pdf', 271, 'e2e5c59c5f8599f3319a05609dc5a7a3-1', 'GLDU7478040', '2018-08-04 03:08:59'),
(236, 'Document', 'RR18078', 3, 'RR18078 Entry Invoice 5964.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'pdf', 270, '4215d16e1ded7c7b75871c8dc6ff169a', 'TCNU6459543', '2018-08-04 03:08:59'),
(237, 'Document', 'RR18078', 3, 'RR18078 Entry Invoice 5964-1.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 GLDU7478040/', 'pdf', 271, '4215d16e1ded7c7b75871c8dc6ff169a-1', 'GLDU7478040', '2018-08-04 03:08:59'),
(238, 'Document', 'RR18078', 3, 'RR18078 ESP 5964-5965.PDF', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'PDF', 270, '412ebb89910c0bd1665983c4df68f647', 'TCNU6459543', '2018-08-04 03:08:59'),
(239, 'Document', 'RR18078', 3, 'RR18078 ESP 5964-5965-1.PDF', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 GLDU7478040/', 'PDF', 271, '412ebb89910c0bd1665983c4df68f647-1', 'GLDU7478040', '2018-08-04 03:08:59');

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
(11, 12, 9),
(12, 14, 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vendor_documents`
--
ALTER TABLE `vendor_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
