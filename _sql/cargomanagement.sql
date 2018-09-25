-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2018 at 07:12 AM
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
(223, '3', 'WD18-059', 2, 'TCNU6840544', '6183114200', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-12', '2018-08-14', 737081, '2018-08-15 07:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-24 11:01:54', 40, 1, 'NA', 1, '/WD18-059 TCNU6840544/'),
(224, '3', 'XY18048', 6, 'CXDU1244888', '6190982750', 5, 'Prince Rupert', 'Memphis, TN', '2018-08-10', '2018-08-13', 320818, '2018-08-13 14:00:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 1, 'Picked up at Final Destination for Delivery', NULL, 0, 0, NULL, '2018-08-27 11:01:53', 20, 1, 'NA', 1, '/XY18-XY18048 CXDU1244888/'),
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
(260, '2', 'WD', 2, '[6183129160]', '6183129160', 11, 'Los Angeles', 'Memphis, TN', '2018-09-27', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-08 11:01:53', 40, 1, NULL, 0, NULL),
(261, '2', 'WD', 2, 'TCNU6693244', '6183127680', 11, 'Long Beach (Intended)', 'Memphis, Tennessee', '2018-09-07', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Full Container Received by Carrier at Origin', NULL, 0, 0, NULL, '2018-08-06 14:38:05', 40, 1, NULL, 0, NULL),
(262, '2', 'WD', 2, '[6183122100]', '6183122100', 11, 'Long Beach', 'Memphis, TN', '2018-09-14', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 0, NULL),
(263, '2', 'JT', 9, '[6184594010]', '6184594010', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-05', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 20, 1, NULL, 0, NULL),
(264, '0', 'WD18-054', 2, 'TCNU5288786', '6183114250', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-09', '2018-07-28', 768041, NULL, 1, 'Release', 1, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 1, '/WD18-054 TCNU5288786/'),
(265, '3', 'WD18-055', 2, 'TCNU6181220', '6183114260', 11, 'Prince Rupert', 'Memphis, TN', '2018-07-26', '2018-07-28', 664408, NULL, NULL, 'Release', NULL, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-08 11:01:53', 40, 1, NULL, 1, '/WD18-055 TCNU6181220/'),
(266, '0', 'JX18035', 9, 'DFSU2335408', '6183511340', 12, 'Prince Rupert', 'Memphis, TN', '2018-07-28', '2018-07-30', 797899, NULL, NULL, 'Release', NULL, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-07 11:01:56', 20, 1, NULL, 1, '/18-JX18035 DFSU2335408/'),
(267, '0', 'JX18034', 9, 'TEMU2905945', '6183511340', 12, 'Prince Rupert', 'Memphis, TN', '2018-07-28', '2018-07-30', 797899, NULL, NULL, 'Release', NULL, 0, 1, 0, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-07 11:01:56', 20, 1, NULL, 1, '/18-JX18034 TEMU2905945/'),
(268, '3', 'WD18-056', 2, 'TCNU6437626', '6183114210', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-01', '2018-08-03', 174203, NULL, 1, 'Release', 1, 0, 1, 0, 1, 1, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-16 11:01:54', 40, 1, NULL, 1, '/WD18-056 TCNU6437626/'),
(269, '3', 'WB18001', 1, 'TEMU6023781', '6185693500', 14, 'Prince Rupert', 'Memphis, TN', '2018-08-01', '2018-08-03', 703508, NULL, 1, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-11 11:01:53', 40, 1, NULL, 1, '/WB18-WB18001 TEMU6023781/'),
(270, '3', 'RR18078', 4, 'TCNU6459543', '6182118250', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-05', '2018-08-07', 281894, NULL, 1, 'Release', 1, 1, 1, 1, 1, 1, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-17 11:01:53', 40, 1, 'JT18LB581', 1, '/RR18-RR18078 TCNU6459543/'),
(271, '3', 'RR18078', 4, 'GLDU7478040', '6182118250', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-05', '2018-08-07', 281894, NULL, 1, 'Release', 1, 0, 1, 1, 1, 1, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-17 11:01:53', 40, 1, 'JT18LB581', 1, '/RR18-RR18078 GLDU7478040/'),
(272, '0', 'QQ18002', 2, 'CSNU6735970', '6185677760', 9, 'Prince Rupert', 'Memphis, TN', '2018-09-12', '2018-08-13', 471805, '2018-08-13 08:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-09-12 11:01:53', 40, 1, NULL, 0, NULL),
(273, '3', 'WD18-061', 2, 'TCNU6347287', '6183114390', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-14', '2018-08-16', 713722, '2018-08-16 08:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-24 11:01:54', 40, 1, NULL, 0, NULL),
(274, '3', 'WD18-057', 2, 'TCNU6263490', '6183114220', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-12', '2018-08-14', 554879, '2018-08-14 10:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-22 11:01:53', 40, 1, 'NA', 1, '/WD18-057 TCNU6263490/'),
(275, '3', 'WD18-058', 2, 'TCNU9438082', '6183114230', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-12', '2018-08-14', 431550, '2018-08-14 07:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-23 11:01:53', 40, 1, 'NA', 1, '/WD18-058 TCNU9438082/'),
(276, '3', 'WD18-060', 2, 'TCNU5220805', '6183114380', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-16', '2018-08-18', 349667, '2018-08-17 08:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-28 11:01:54', 40, 1, 'NA', 1, '/WD18-060 TCNU5220805/'),
(277, '3', 'WD18-062', 2, 'TCNU6692051', '6183120340', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-16', '2018-08-18', 758408, '2018-08-17 07:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-08-25 11:01:54', 40, 1, 'NA', 1, '/WD18-062 TCNU6692051/'),
(278, '3', 'XY18049', 6, 'TRHU2560148', '6191000250', 5, 'Prince Rupert', 'Memphis, TN', '2018-08-14', '2018-08-16', 149423, '2018-08-15 10:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-23 11:01:53', 20, 1, 'NA', 1, '/XY18-XY18049 TRHU2560148/'),
(279, '3', 'NYJT18027', 5, 'FCIU6127923', '6008532450', 4, 'Charleston', 'Loris, SC', NULL, NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-31 11:01:53', 20, 1, NULL, 0, NULL),
(280, '3', 'NY18038', 5, 'CSLU1668276', '6008532450', 4, 'Charleston', 'Loris, SC', NULL, NULL, NULL, NULL, 1, 'Release', NULL, 0, 1, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-08-31 11:01:53', 20, 1, 'NA', 1, '/NY18-NY18027 CSLU1668276/'),
(281, '3', 'NYJT170147', 5, 'CBHU3587146', '\"', 4, 'Los Angeles', 'Hewitt, TX', '2018-09-04', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 0, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-09-13 11:01:52', 20, 1, NULL, 0, NULL),
(282, '3', 'NYJT17200', 5, 'CSLU1690829', '\"', 4, 'Los Angeles', 'Hewitt, TX', '2018-09-04', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 0, 1, 1, 0, 0, 0, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-09-13 11:01:52', 20, 1, 'NA', 1, '/18-ST3081NY17147 CSLU1690829/'),
(283, '3', 'RR', 4, 'TCNU8455892', '6182124690', 3, 'Prince Rupert', 'Memphis, TN', '2018-08-28', '2018-08-31', 932876, NULL, 1, 'Release', 1, 1, 1, 0, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-09-07 11:01:53', 40, 1, NULL, 0, NULL),
(284, '3', 'WD18-063', 2, 'TCNU6338367', '6183122170', 11, 'Prince Rupert', 'Memphis, TN', '2018-08-26', '2018-08-28', 593756, '2018-08-28 10:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-09-06 11:01:53', 40, 1, 'NA', 1, '/WD18-063 TCNU6338367/'),
(285, '3', 'WBBOTO18-2', NULL, 'TCNU8618840', '6191658290', 13, 'Prince Rupert', 'Memphis, TN', '2018-08-25', '2018-08-28', 287736, '2018-08-27 10:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-09-05 11:01:53', 40, 1, 'NA', 1, '/BOTO18-2 TCNU8618840/'),
(286, '3', 'WBBOTO18-3', NULL, 'CXDU1049074', '6191658290', 13, 'Prince Rupert', 'Memphis, TN', '2018-08-26', '2018-08-28', 287736, '2018-08-28 08:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-09-05 11:01:53', 40, 1, 'NA', 1, '/BOTO18-3 CXDU1049074/'),
(287, '3', 'YXXY18061B', 3, 'CBHU5698215', '6191695510', 2, 'Prince Rupert', 'Memphis, TN', '2018-08-25', '2018-08-27', 852845, '2018-08-27 14:00:00', 2, 'Release', NULL, 1, 1, 0, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-09-05 11:01:53', 20, 1, 'NA', 1, '/XY18-XY18061B CBHU5698215/'),
(288, '3', 'NYJT17122', 5, 'RFCU2113110', '6008532880', 4, 'Charleston', 'Loris, SC', '2018-08-27', NULL, NULL, NULL, 1, 'Release', 1, 0, 0, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-09-14 11:01:53', 20, 1, NULL, 0, NULL),
(289, '3', 'NYJT17123', 5, 'CSNU1352496', '6008532880', 4, 'Charleston', 'Loris, SC', '2018-08-27', NULL, NULL, NULL, 1, 'Release', 1, 0, 0, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 0, NULL, '2018-09-14 11:01:53', 20, 1, NULL, 0, NULL),
(291, '3', 'WD18-064', 2, 'TCNU6177323', '6183122140', 11, 'Los Angeles', 'Memphis, TN', '2018-09-08', '2018-09-11', 5333921, '2018-09-10 12:00:00', 2, 'Release', 1, 1, 0, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-09-18 11:01:54', 40, 1, 'NA', 1, '/WD18-064 TCNU6177323/'),
(292, '3', 'WD18-065', 2, 'TCNU6172240', '6183122150', 11, 'Los Angeles', 'Memphis, TN', '2018-09-08', '2018-09-11', 5333920, '2018-09-11 08:00:00', 2, 'Release', 1, 1, 0, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 0, 1, NULL, '2018-09-20 11:01:53', 40, 1, 'NA', 1, '/WD18-065 TCNU6172240/'),
(298, '2', NULL, 5, 'UETU2381377', '\"', 4, 'Norfolk', 'Henderson, North Carolina', '2018-09-18', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 0, 0, NULL, '2018-08-09 11:01:54', 20, 0, NULL, 0, NULL),
(301, '2', NULL, 9, '[6184596290]', '6184596290', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-15', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-16 11:01:54', 20, 1, NULL, 0, NULL),
(305, '2', NULL, 2, '[6183129140]', '6183129140', 11, 'Los Angeles', 'Memphis, TN', '2018-09-20', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-14 11:01:54', 40, 1, NULL, 0, NULL),
(306, '2', NULL, 2, '[6183129150]', '6183129150', 11, 'Los Angeles', 'Memphis, TN', '2018-09-20', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-14 11:01:54', 40, 1, NULL, 0, NULL),
(307, '2', NULL, 5, '[6008538410]', '6008538410', 4, 'Long Beach (Intended)', 'Memphis, Tennessee', '2018-10-10', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-03 11:01:55', 20, 1, NULL, 0, NULL),
(308, '2', NULL, 9, '[6184599460]', '6184599460', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-19', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-24 11:01:54', 20, 1, NULL, 0, NULL),
(313, '2', NULL, 2, '[6183129130]', '6183129130', 11, 'Los Angeles', 'Memphis, TN', '2018-09-27', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-18 11:01:53', 40, 1, NULL, 0, NULL),
(315, '2', NULL, 5, '[6190636290]', '6190636290', 4, 'Long Beach', 'Memphis, TN', '2018-09-26', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-29 11:01:53', 20, 1, NULL, 0, NULL),
(317, '2', NULL, 2, '[6183129100]', '6183129100', 11, 'Long Beach', 'Memphis, TN', '2018-10-06', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-31 11:01:53', 40, 1, NULL, 0, NULL),
(318, '2', NULL, 2, '[6183129880]', '6183129880', 11, 'Long Beach', 'Memphis, TN', '2018-10-06', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-31 11:01:53', 40, 1, NULL, 0, NULL),
(319, '2', NULL, 2, '[6183129890]', '6183129890', 11, 'Long Beach', 'Memphis, TN', '2018-10-06', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-31 11:01:53', 40, 1, NULL, 0, NULL),
(320, '2', NULL, 6, '[6194216700]', '6194216700', 5, 'Long Beach', 'Memphis, TN', '2018-10-06', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-08-29 11:01:53', 20, 1, NULL, 0, NULL),
(328, '2', NULL, 2, '[6194283900]', '6194283900', 11, 'Los Angeles', 'Memphis, TN', '2018-10-18', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-07 11:01:53', 40, 1, NULL, 0, NULL),
(329, '2', NULL, 2, '[6194283910]', '6194283910', 11, 'Los Angeles', 'Memphis, TN', '2018-10-18', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-07 11:01:53', 40, 1, NULL, 0, NULL),
(330, '2', NULL, 2, '[6194283920]', '6194283920', 11, 'Los Angeles', 'Memphis, TN', '2018-10-18', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-07 11:01:53', 40, 1, NULL, 0, NULL),
(332, '2', NULL, 5, '[6008538910]', '6008538910', 4, 'Long Beach', 'Memphis, TN', '2018-10-24', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-14 11:01:53', 20, 1, NULL, 0, NULL),
(336, '2', NULL, 2, '[6194298600]', '6194298600', 11, 'Los Angeles', 'Memphis, TN', '2018-10-31', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-12 11:01:53', 40, 1, NULL, 0, NULL),
(337, '2', NULL, 2, '[6194298610]', '6194298610', 11, 'Los Angeles', 'Memphis, TN', '2018-10-31', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-12 11:01:53', 40, 1, NULL, 0, NULL),
(338, '2', NULL, 2, '[6194298620]', '6194298620', 11, 'Los Angeles', 'Memphis, TN', '2018-10-31', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-12 11:01:53', 40, 1, NULL, 0, NULL),
(343, '2', NULL, 2, '[6183135200]', '6183135200', 11, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-17 11:01:54', 40, 1, NULL, 0, NULL),
(344, '2', NULL, 2, '[6183135210]', '6183135210', 11, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-17 11:01:54', 40, 1, NULL, 0, NULL),
(345, '2', NULL, 2, '[6183138590]', '6183138590', 11, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-17 11:01:54', 40, 1, NULL, 0, NULL),
(347, '2', NULL, 6, '[6194279170]', '6194279170', 5, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 0, 0, NULL, '2018-09-18 11:01:54', 20, 1, NULL, 0, NULL);

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
(270, '[6183129150]', 'ETA', '2018-09-20 23:59:00', '2018-09-20 23:59:00', 'Estimated Time of Arrival for Container #: [6183129150]. Times/Dates Subject to Change...', 306, '999a8d782b28a416a2b9aa7a3f4971fc'),
(271, 'CSNU6735970', 'LFD', '2018-08-13 00:00:00', '2018-08-13 23:59:00', 'Last Free Day for Container #: CSNU6735970. Times/Dates Subject to Change...', 272, '67494a899aa8d4a434efebd0961ee188'),
(272, 'CXDU1244888', 'LFD', '2018-08-13 00:00:00', '2018-08-13 23:59:00', 'Last Free Day for Container #: CXDU1244888. Times/Dates Subject to Change...', 224, '79d1a4c821202ca3162890b0a11b3718'),
(273, 'TCNU6840544', 'LFD', '2018-08-14 00:00:00', '2018-08-14 23:59:00', 'Last Free Day for Container #: TCNU6840544. Times/Dates Subject to Change...', 223, 'b955da0b0b8bcc4b057822c8fb128005'),
(274, 'TCNU6263490', 'LFD', '2018-08-14 00:00:00', '2018-08-14 23:59:00', 'Last Free Day for Container #: TCNU6263490. Times/Dates Subject to Change...', 274, 'f8ae6f4a4d7f39dc8487a736a98da126'),
(275, 'TCNU9438082', 'LFD', '2018-08-14 00:00:00', '2018-08-14 23:59:00', 'Last Free Day for Container #: TCNU9438082. Times/Dates Subject to Change...', 275, '9c46a5df85e3f82dc808939903d9dc98'),
(276, '[6184599460]', 'ETA', '2018-09-19 23:59:00', '2018-09-19 23:59:00', 'Estimated Time of Arrival for Container #: [6184599460]. Times/Dates Subject to Change...', 308, 'd81be7d3a5a69aa775cbe6c4ee6cad31'),
(277, 'SEGU6469268', 'ETA', '2018-09-20 23:59:00', '2018-09-20 23:59:00', 'Estimated Time of Arrival for Container #: SEGU6469268. Times/Dates Subject to Change...', 309, '4a12e456218eb12270712238e9f8f762'),
(278, 'TCNU8455402', 'ETA', '2018-09-20 23:59:00', '2018-09-20 23:59:00', 'Estimated Time of Arrival for Container #: TCNU8455402. Times/Dates Subject to Change...', 310, '142ffb86f618fe913a650eaf84d5f302'),
(279, 'TCNU6347287', 'LFD', '2018-08-16 00:00:00', '2018-08-16 23:59:00', 'Last Free Day for Container #: TCNU6347287. Times/Dates Subject to Change...', 273, '9116582093e4b900e91203a8ab326cc8'),
(280, 'TRHU2560148', 'LFD', '2018-08-16 00:00:00', '2018-08-16 23:59:00', 'Last Free Day for Container #: TRHU2560148. Times/Dates Subject to Change...', 278, '7cd51959e6926f134ab26f73ec604863'),
(281, 'UETU2304513', 'ETA', '2018-09-15 23:59:00', '2018-09-15 23:59:00', 'Estimated Time of Arrival for Container #: UETU2304513. Times/Dates Subject to Change...', 311, 'd0e2028430f3132f2f389aa70e8a0b6e'),
(282, 'TEMU4695560', 'ETA', '2018-09-15 23:59:00', '2018-09-15 23:59:00', 'Estimated Time of Arrival for Container #: TEMU4695560. Times/Dates Subject to Change...', 312, 'd3e1b89a6ad089987485a0db36129208'),
(283, '[6183129130]', 'ETA', '2018-09-27 23:59:00', '2018-09-27 23:59:00', 'Estimated Time of Arrival for Container #: [6183129130]. Times/Dates Subject to Change...', 313, '832b2c9e932ac92656f8cde822daf1bf'),
(284, 'TCNU5220805', 'LFD', '2018-08-18 00:00:00', '2018-08-18 23:59:00', 'Last Free Day for Container #: TCNU5220805. Times/Dates Subject to Change...', 276, '57b547ee4667e084be74fa86aede9454'),
(285, 'TCNU6692051', 'LFD', '2018-08-18 00:00:00', '2018-08-18 23:59:00', 'Last Free Day for Container #: TCNU6692051. Times/Dates Subject to Change...', 277, 'cbcd31a4394d3600f42f68182e5aa4a1'),
(286, 'TCNU3649046', 'ETA', '2018-09-27 23:59:00', '2018-09-27 23:59:00', 'Estimated Time of Arrival for Container #: TCNU3649046. Times/Dates Subject to Change...', 314, '2acf00612cab5487ee6b07bdf7aca703'),
(287, '[6190636290]', 'ETA', '2018-09-26 23:59:00', '2018-09-26 23:59:00', 'Estimated Time of Arrival for Container #: [6190636290]. Times/Dates Subject to Change...', 315, '923ee11251aebf681b73c7dbccb94f71'),
(288, '[6182132570]', 'ETA', '2018-09-26 23:59:00', '2018-09-26 23:59:00', 'Estimated Time of Arrival for Container #: [6182132570]. Times/Dates Subject to Change...', 316, 'ed126959c37f3d803da9abaaf19dc409'),
(289, '[6183129100]', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: [6183129100]. Times/Dates Subject to Change...', 317, 'bc4e7edca7112f6056d30f19df6a345a'),
(290, '[6183129880]', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: [6183129880]. Times/Dates Subject to Change...', 318, '0d4630225f3e1352e4124fed548dc72e'),
(291, '[6183129890]', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: [6183129890]. Times/Dates Subject to Change...', 319, 'd06b0f0264682d1cae4ae2b07939ab61'),
(292, '[6194216700]', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: [6194216700]. Times/Dates Subject to Change...', 320, '86f9c0768cc34fd3f00c59b4aaf13008'),
(293, 'TEMU3574158', 'ETA', '2018-09-19 23:59:00', '2018-09-19 23:59:00', 'Estimated Time of Arrival for Container #: TEMU3574158. Times/Dates Subject to Change...', 321, '7ddc647b8931c9325c84eed206411032'),
(294, 'TCNU8618840', 'LFD', '2018-08-28 00:00:00', '2018-08-28 23:59:00', 'Last Free Day for Container #: TCNU8618840. Times/Dates Subject to Change...', 285, 'c07eb05a4541ecc8fbf909e33a82b241'),
(295, 'CXDU1049074', 'LFD', '2018-08-28 00:00:00', '2018-08-28 23:59:00', 'Last Free Day for Container #: CXDU1049074. Times/Dates Subject to Change...', 286, '83709cee6260b57ec671f23924f77b6d'),
(296, 'CBHU5698215', 'LFD', '2018-08-27 00:00:00', '2018-08-27 23:59:00', 'Last Free Day for Container #: CBHU5698215. Times/Dates Subject to Change...', 287, 'b3b7920d3fb370783bc2ac7cc85dad20'),
(297, 'TCNU6338367', 'LFD', '2018-08-28 00:00:00', '2018-08-28 23:59:00', 'Last Free Day for Container #: TCNU6338367. Times/Dates Subject to Change...', 284, 'ab0c97ada0ec96ec8e8ce4974ded0424'),
(298, 'CBHU3991986', 'ETA', '2018-09-26 23:59:00', '2018-09-26 23:59:00', 'Estimated Time of Arrival for Container #: CBHU3991986. Times/Dates Subject to Change...', 322, 'ec33af7d5f35a94203739eb8b1f4893f'),
(299, 'TCKU3501964', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: TCKU3501964. Times/Dates Subject to Change...', 323, 'd705fdc4ee40ac4c7b0c94781bd7c20c'),
(300, 'TCNU8455892', 'LFD', '2018-08-31 00:00:00', '2018-08-31 23:59:00', 'Last Free Day for Container #: TCNU8455892. Times/Dates Subject to Change...', 283, 'a2127f63245fc466e0915f1498f9c522'),
(301, 'BMOU4541279', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: BMOU4541279. Times/Dates Subject to Change...', 324, '1158de18e8ebc3527075fe7bf7fb6a3b'),
(302, 'CCLU7885529', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: CCLU7885529. Times/Dates Subject to Change...', 325, 'a700ba2ca23d4bdcda35b5892b1c5afa'),
(303, 'CCLU7462316', 'ETA', '2018-10-06 23:59:00', '2018-10-06 23:59:00', 'Estimated Time of Arrival for Container #: CCLU7462316. Times/Dates Subject to Change...', 326, '8041e88c99ea4f438fd05fcab1e0fd89'),
(304, 'FCIU4818227', 'ETA', '2018-10-10 23:59:00', '2018-10-10 23:59:00', 'Estimated Time of Arrival for Container #: FCIU4818227. Times/Dates Subject to Change...', 327, '54af6db991e73f801afdfcb6623eaea2'),
(305, '[6194283900]', 'ETA', '2018-10-18 23:59:00', '2018-10-18 23:59:00', 'Estimated Time of Arrival for Container #: [6194283900]. Times/Dates Subject to Change...', 328, '83fa532e5b932d66063dd65012832d17'),
(306, '[6194283910]', 'ETA', '2018-10-18 23:59:00', '2018-10-18 23:59:00', 'Estimated Time of Arrival for Container #: [6194283910]. Times/Dates Subject to Change...', 329, 'e402e96aa350e9ccf7a19ccd06bb4218'),
(307, '[6194283920]', 'ETA', '2018-10-18 23:59:00', '2018-10-18 23:59:00', 'Estimated Time of Arrival for Container #: [6194283920]. Times/Dates Subject to Change...', 330, 'b6283bf2b5fd39411bbc252f60589a91'),
(308, '[6008539010]', 'ETA', '2018-10-23 23:59:00', '2018-10-23 23:59:00', 'Estimated Time of Arrival for Container #: [6008539010]. Times/Dates Subject to Change...', 331, '1ea1ac24057817dc915e2ed7867a4fd9'),
(309, '[6008538910]', 'ETA', '2018-10-24 23:59:00', '2018-10-24 23:59:00', 'Estimated Time of Arrival for Container #: [6008538910]. Times/Dates Subject to Change...', 332, '233b775d066b723029a705158c334994'),
(310, 'OOCU7804070', 'ETA', '2018-10-18 23:59:00', '2018-10-18 23:59:00', 'Estimated Time of Arrival for Container #: OOCU7804070. Times/Dates Subject to Change...', 333, 'eced63e1e5d18a37b4e9c22280faf237'),
(311, 'OOCU7803860', 'ETA', '2018-10-18 23:59:00', '2018-10-18 23:59:00', 'Estimated Time of Arrival for Container #: OOCU7803860. Times/Dates Subject to Change...', 334, 'ddaa8c3566a80d1d4669c1ef98766f9d'),
(312, 'OOCU7807063', 'ETA', '2018-10-18 23:59:00', '2018-10-18 23:59:00', 'Estimated Time of Arrival for Container #: OOCU7807063. Times/Dates Subject to Change...', 335, 'bf426621cb04540b0592949158e1f5cf');
INSERT INTO `calendar_events` (`ID`, `title`, `event_type`, `start`, `end`, `description`, `shipment_id`, `md5_container_number_and_date`) VALUES
(313, 'TCNU6177323', 'LFD', '2018-09-11 00:00:00', '2018-09-11 23:59:00', 'Last Free Day for Container #: TCNU6177323. Times/Dates Subject to Change...', 291, '3a1e9a8e1607340ea19f37883ce61933'),
(314, 'TCNU6172240', 'LFD', '2018-09-11 00:00:00', '2018-09-11 23:59:00', 'Last Free Day for Container #: TCNU6172240. Times/Dates Subject to Change...', 292, '7eed8cc788f976158d45e793aa9a7fef'),
(315, 'TCNU5019914', 'LFD', '2018-09-11 00:00:00', '2018-09-11 23:59:00', 'Last Free Day for Container #: TCNU5019914. Times/Dates Subject to Change...', 293, '945ad0584350cf184e7d98b9b551e117'),
(316, '[6194298600]', 'ETA', '2018-10-31 23:59:00', '2018-10-31 23:59:00', 'Estimated Time of Arrival for Container #: [6194298600]. Times/Dates Subject to Change...', 336, '62ca47ccfc611b7c0e7f92ff8c2cfaf6'),
(317, '[6194298610]', 'ETA', '2018-10-31 23:59:00', '2018-10-31 23:59:00', 'Estimated Time of Arrival for Container #: [6194298610]. Times/Dates Subject to Change...', 337, '5ba799daf29a7dbc23a382ed3f3fc6a6'),
(318, '[6194298620]', 'ETA', '2018-10-31 23:59:00', '2018-10-31 23:59:00', 'Estimated Time of Arrival for Container #: [6194298620]. Times/Dates Subject to Change...', 338, 'c94b17bb60fe91fd0ceaa80c05519406'),
(319, 'CSNU6486899', 'ETA', '2018-10-31 23:59:00', '2018-10-31 23:59:00', 'Estimated Time of Arrival for Container #: CSNU6486899. Times/Dates Subject to Change...', 339, 'adfc76eb0782aeef60da49ea065b8c2c'),
(320, 'UETU5313416', 'ETA', '2018-10-31 23:59:00', '2018-10-31 23:59:00', 'Estimated Time of Arrival for Container #: UETU5313416. Times/Dates Subject to Change...', 340, '8a1696bca1ff69662f5a012040f05dce'),
(321, 'FCIU9704546', 'ETA', '2018-10-31 23:59:00', '2018-10-31 23:59:00', 'Estimated Time of Arrival for Container #: FCIU9704546. Times/Dates Subject to Change...', 341, 'cc8fdc69b3094493499585eed7659691'),
(322, 'CSLU2032458', 'ETA', '2018-10-24 23:59:00', '2018-10-24 23:59:00', 'Estimated Time of Arrival for Container #: CSLU2032458. Times/Dates Subject to Change...', 342, '77e95294e934ccee0a757c97a5214803'),
(323, '[6183135200]', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: [6183135200]. Times/Dates Subject to Change...', 343, '644325dc190317e0f84d559f36a32e90'),
(324, '[6183135210]', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: [6183135210]. Times/Dates Subject to Change...', 344, '9254119fd5ca68f37e7640a3168f2558'),
(325, '[6183138590]', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: [6183138590]. Times/Dates Subject to Change...', 345, 'e708bfd8796ac53d30c4bbeb60591763'),
(326, 'CBHU5513712', 'ETA', '2018-10-24 23:59:00', '2018-10-24 23:59:00', 'Estimated Time of Arrival for Container #: CBHU5513712. Times/Dates Subject to Change...', 346, 'e032214a1910f17c3e2de3d0909eb12b'),
(327, '[6194279170]', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: [6194279170]. Times/Dates Subject to Change...', 347, '2ba64f1b55331063f7b95784a590f61b'),
(328, 'DFSU2893328', 'LFD', '2018-09-17 00:00:00', '2018-09-17 23:59:00', 'Last Free Day for Container #: DFSU2893328. Times/Dates Subject to Change...', 299, '93e4ef02ae69a71ee7b2ecdeb0697139'),
(329, 'CSLU1249773', 'LFD', '2018-09-17 00:00:00', '2018-09-17 23:59:00', 'Last Free Day for Container #: CSLU1249773. Times/Dates Subject to Change...', 300, 'e1d74ae1726fbd42298500c6528a2509'),
(330, 'TCNU6269203', 'LFD', '2018-09-18 00:00:00', '2018-09-18 23:59:00', 'Last Free Day for Container #: TCNU6269203. Times/Dates Subject to Change...', 294, '5242d8bcedca315b28ff401752609a53'),
(331, 'TCNU6591360', 'LFD', '2018-09-18 00:00:00', '2018-09-18 23:59:00', 'Last Free Day for Container #: TCNU6591360. Times/Dates Subject to Change...', 295, 'b386f37db11ecf1dbc9cc810a4173d7c'),
(332, 'TCNU6693248', 'LFD', '2018-09-18 00:00:00', '2018-09-18 23:59:00', 'Last Free Day for Container #: TCNU6693248. Times/Dates Subject to Change...', 296, 'd2f44e5069e7517ef41654bf14d29d0d'),
(333, 'CBHU8195425', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: CBHU8195425. Times/Dates Subject to Change...', 348, '82ca5161c404bbeb8dd12124dc3c462c'),
(334, 'GESU6912345', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: GESU6912345. Times/Dates Subject to Change...', 349, '26a94a70c02ddcfc6096e32ac77be544'),
(335, 'TGHU6870685', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: TGHU6870685. Times/Dates Subject to Change...', 350, '90d402923a5818af8c90f548413774c1'),
(336, 'TEMU2871953', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: TEMU2871953. Times/Dates Subject to Change...', 351, 'dd77bc6dff54cdac3331a89dbbd8cdcd'),
(337, 'TRHU2729074', 'ETA', '2018-10-25 23:59:00', '2018-10-25 23:59:00', 'Estimated Time of Arrival for Container #: TRHU2729074. Times/Dates Subject to Change...', 352, 'cfe1d963252d3720def2b517c9ada087'),
(338, 'UETU2304513', 'LFD', '2018-09-19 00:00:00', '2018-09-19 23:59:00', 'Last Free Day for Container #: UETU2304513. Times/Dates Subject to Change...', 311, '9d492611059dab8e9fae91e99bbee001'),
(339, 'TEMU4695560', 'LFD', '2018-09-19 00:00:00', '2018-09-19 23:59:00', 'Last Free Day for Container #: TEMU4695560. Times/Dates Subject to Change...', 312, 'f2f8ea13efc4cf4f71538e143c22a79a'),
(340, 'CBHU7002326', 'LFD', '2018-09-21 00:00:00', '2018-09-21 23:59:00', 'Last Free Day for Container #: CBHU7002326. Times/Dates Subject to Change...', 290, '5cf186026d595e7ada1ccbd4a030bde2');

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
(290, 0, 'QQ', 2, 'CBHU7002326', '6191729550', 9, 'Los Angeles', 'Memphis, TN', '2018-08-29', '2018-09-21', NULL, NULL, 1, 'Hold', NULL, 0, 0, 1, 0, 0, 0, 0, 'Intermodal Departure from Last Port of Discharge', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(293, 3, 'WD18-066', 2, 'TCNU5019914', '6183122160', 11, 'Los Angeles', 'Memphis, TN', '2018-09-08', '2018-09-11', 5333916, '2018-09-11 11:00:00', 2, 'Release', 1, 1, 0, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 1, 1, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-066 TCNU5019914/'),
(294, 3, 'WD18-067', 2, 'TCNU6269203', '6183122120', 11, 'Long Beach', 'Memphis, TN', '2018-09-15', '2018-09-18', 6190509, '2018-09-17 11:06:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 1, 1, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-067 TCNU6269203/'),
(295, 3, 'WD18-068', 2, 'TCNU6591360', '6183122130', 11, 'Long Beach', 'Memphis, TN', '2018-09-15', '2018-09-18', 6190483, '2018-09-18 07:00:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 1, 'Picked up at Final Destination for Delivery', NULL, 1, 1, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-068 TCNU6591360/'),
(296, 3, 'WD18-069', 2, 'TCNU6693248', '6183127680', 11, 'Long Beach', 'Memphis, TN', '2018-09-15', '2018-09-18', 6190482, '2018-09-18 10:00:00', 2, 'Release', 1, 1, 1, 1, 0, 1, 1, 1, 'Picked up at Final Destination for Delivery', NULL, 1, 1, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-069 TCNU6693248/'),
(297, 3, 'NY17158', 5, 'TGBU2363084', '\"', 4, 'Prince Rupert', 'Memphis, TN', '2018-09-09', NULL, NULL, '2018-09-14 12:00:00', 2, 'Not Released', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, 'JT18LB590', 1, '/NY18-NY17158 TGBU2363084/'),
(299, 3, 'JTJX18049', 9, 'DFSU2893328', '6184594010', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-14', '2018-09-17', 473255, '2018-09-17 12:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, 'NA', 1, '/18-JX18049 DFSU2893328/'),
(300, 3, 'JTJX18049', 9, 'CSLU1249773', '6184594010', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-14', '2018-09-17', 473255, '2018-09-17 12:00:00', 2, 'Release', 1, 1, 1, 1, 1, 1, 1, 1, 'Empty Container Returned to Carrier at Destination', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, 'NA', 1, '/18-JX18049 CSLU1249773/'),
(302, 3, 'WD18-70', 2, 'TCNU6028891', '6183122100', 11, 'Long Beach', 'Memphis, TN', '2018-09-19', NULL, 6841665, '2018-09-21 07:00:00', 2, 'Release', NULL, 1, 1, 1, 0, 1, 0, 1, 'Arrival at Last Intermodal Hub', NULL, 1, 1, NULL, '2018-09-20 15:49:28', 40, 1, 'NA', 1, '/WD18-70 TCNU6028891/'),
(303, 0, 'WD18-71', 2, 'TCNU6578434', '6183122110', 11, 'Long Beach', 'Memphis, TN', '2018-09-19', NULL, 6841660, '2018-09-21 07:00:00', 2, 'Release', NULL, 1, 1, 1, 0, 1, 0, 1, 'Arrival at Last Intermodal Hub', NULL, 1, 1, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-71 TCNU6578434/'),
(304, 1, NULL, 5, 'UETU2381377', '\"', 4, 'Norfolk', 'Henderson, NC', '2018-09-27', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 1, 0, 0, 1, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 0, NULL, 0, NULL),
(309, 1, 'WD18-72', 2, 'SEGU6469268', '6183129140', 11, 'Los Angeles', 'Memphis, TN', '2018-09-24', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged from Vessel at Last Port of Discharge', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-72 SEGU6469268/'),
(310, 1, 'WD18-73', 2, 'TCNU8455402', '6183129150', 11, 'Los Angeles', 'Memphis, TN', '2018-09-24', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Intermodal Departure from Last Port of Discharge', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-73 TCNU8455402/'),
(311, 3, 'JTJX18057', 9, 'UETU2304513', '6184596290', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-17', '2018-09-19', 821458, '2018-09-19 13:00:00', 2, 'Release', 1, 1, 1, 0, 0, 1, 1, 1, 'Picked up at Final Destination for Delivery', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, 'NA', 1, '/18-JX18057 UETU2304513/'),
(312, 3, 'JTJX18057', 9, 'TEMU4695560', '6184596290', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-17', '2018-09-19', 821458, '2018-09-19 14:00:00', 2, 'Release', 1, 1, 1, 0, 0, 1, 1, 1, 'Picked up at Final Destination for Delivery', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, 'NA', 1, '/18-JX18057 TEMU4695560/'),
(314, 2, 'WD18-074', 2, 'TCNU3649046', '6183129130', 11, 'Los Angeles', 'Memphis, TN', '2018-09-29', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, 'NA', 1, '/WD18-074 TCNU3649046/'),
(316, 2, NULL, 4, '[6182132570]', '6182132570', 3, 'Prince Rupert', 'Memphis, TN', '2018-09-28', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 1, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(321, 0, 'JTJX18059', 9, 'TEMU3574158', '6184599460', 12, 'Prince Rupert', 'Memphis, TN', '2018-09-21', NULL, NULL, NULL, 1, 'Release', NULL, 1, 1, 1, 0, 0, 0, 0, 'First Loaded on Rail Under I/B', NULL, 1, 0, NULL, '2018-09-20 13:15:07', 20, 1, NULL, 0, NULL),
(322, 2, NULL, 5, 'CBHU3991986', '6190636290', 4, 'Long Beach', 'Memphis, TN', '2018-10-01', NULL, NULL, NULL, 1, 'Release', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at First POL', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL),
(323, 2, NULL, 6, 'TCKU3501964', '6194216700', 5, 'Los Angeles', 'Memphis, TN', '2018-10-05', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL),
(324, 2, NULL, 2, 'BMOU4541279', '6183129100', 11, 'Los Angeles', 'Memphis, TN', '2018-10-05', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(325, 2, NULL, 2, 'CCLU7885529', '6183129880', 11, 'Los Angeles', 'Memphis, TN', '2018-10-05', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(326, 2, NULL, 2, 'CCLU7462316', '6183129890', 11, 'Los Angeles', 'Memphis, TN', '2018-10-05', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Vessel Departure at Transshipment Port', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(327, 0, NULL, 5, 'FCIU4818227', '6008538410', 4, 'Long Beach', 'Memphis, TN', NULL, NULL, NULL, NULL, NULL, 'Release', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL),
(331, 2, NULL, 5, '[6008539010]', '6008539010', 4, 'Charleston', 'Loris, SC', '2018-10-23', NULL, NULL, NULL, 1, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'No event received', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 0, NULL, 0, NULL),
(333, 2, NULL, 2, 'OOCU7804070', '6194283900', 11, 'Los Angeles', 'Memphis, TN', '2018-10-19', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(334, 2, NULL, 2, 'OOCU7803860', '6194283910', 11, 'Los Angeles', 'Memphis, TN', '2018-10-19', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(335, 2, NULL, 2, 'OOCU7807063', '6194283920', 11, 'Los Angeles', 'Memphis, TN', '2018-10-19', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Discharged at Port of Transhipment', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(339, 2, NULL, 2, 'CSNU6486899', '6194298600', 11, 'Los Angeles', 'Memphis, TN', '2018-10-31', NULL, NULL, NULL, 1, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded on Board at First Port of Load', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(340, 2, NULL, 2, 'UETU5313416', '6194298610', 11, 'Los Angeles', 'Memphis, TN', '2018-10-31', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded on Board at First Port of Load', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(341, 2, NULL, 2, 'FCIU9704546', '6194298620', 11, 'Los Angeles', 'Memphis, TN', '2018-10-31', NULL, NULL, NULL, NULL, 'Hold', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded on Board at First Port of Load', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(342, 2, NULL, 5, 'CSLU2032458', '6008538910', 4, 'Long Beach', 'Memphis, TN', '2018-10-24', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded on Board at First Port of Load', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL),
(346, 2, NULL, 5, 'CBHU5513712', '6008538910', 4, 'Long Beach', 'Memphis, TN', '2018-10-24', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Loaded on Board at First Port of Load', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL),
(348, 2, NULL, 2, 'CBHU8195425', '6183135200', 11, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(349, 2, NULL, 2, 'GESU6912345', '6183135210', 11, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(350, 2, NULL, 2, 'TGHU6870685', '6183138590', 11, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 40, 1, NULL, 0, NULL),
(351, 2, NULL, 6, 'TEMU2871953', '6194279170', 5, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL),
(352, 2, NULL, 6, 'TRHU2729074', '6194279170', 5, 'Los Angeles', 'Memphis, TN', '2018-10-25', NULL, NULL, NULL, NULL, 'Not Released', NULL, 0, 0, 0, 0, 0, 0, 0, 'Empty Container Picked Up', NULL, 1, 0, NULL, '2018-09-20 13:15:01', 20, 1, NULL, 0, NULL);

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
(6, 'Intradin Huzhou Hardware Co., Ltd', 'ITI', 'TK', ''),
(7, 'Iti Company Limited', 'ITI', 'TKI', ''),
(8, 'Qingdao Crowntyre Industrial Company Limited', 'Crown', 'CR', NULL),
(9, 'Qingdao Qihang Tyre Company Limited', 'Qihang', 'QQ', NULL),
(10, 'Shandong Guofeng Rubber Plastics Company Limited', 'Guofeng', 'GF', NULL),
(11, 'Tianjin Wanda Tyre Group Company Limited', 'Wanda', 'WD', 'tjwanda.com|'),
(12, 'Ruian Jianxin Machinery Manufacturing Company Limited', 'Jianxin', 'JT', '163.com|'),
(13, 'Shandong Wanda Boto Tyre Company Limited', 'BOTO', 'WB', '');

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
(239, 'Document', 'RR18078', 3, 'RR18078 ESP 5964-5965-1.PDF', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 GLDU7478040/', 'PDF', 271, '412ebb89910c0bd1665983c4df68f647-1', 'GLDU7478040', '2018-08-04 03:08:59'),
(240, 'Parts_List', 'XY18049', 5, 'doc-583-pl-brake-18049.pdf', 'C:/xampp/htdocs/vendor_documents/XY-XY18049 NO_CN/', 'PDF', NULL, '8a86d8904c9f215be87c992a10a2f5df', 'NO_CN', '2018-08-11 21:03:30'),
(241, 'Invoice', 'XY18049', 5, 'doc-583-in-brake-18049.pdf', 'C:/xampp/htdocs/vendor_documents/XY-XY18049 NO_CN/', 'PDF', NULL, 'aeb9f93c3b2a11c9dc80d6e81979effd', 'NO_CN', '2018-08-11 21:03:31'),
(242, 'Parts_List', 'XY18048', 5, 'doc-582-pl-brake-18048.pdf', 'C:/xampp/htdocs/vendor_documents/XY-XY18048 NO_CN/', 'PDF', NULL, 'b12b3be47c42cebe13a211ae4bb4c464', 'NO_CN', '2018-08-11 21:03:32'),
(243, 'Invoice', 'XY18048', 5, 'doc-582-in-brake-18048.pdf', 'C:/xampp/htdocs/vendor_documents/XY-XY18048 NO_CN/', 'PDF', NULL, '90a90c546600078b88262e018275fc10', 'NO_CN', '2018-08-11 21:03:34'),
(244, 'Parts_List', 'RR18078', 3, 'doc-581-pl-JACK-18078.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'PDF', 270, '19ceef8274f2b0584c45274e92cee092', 'TCNU6459543', '2018-08-11 21:03:37'),
(245, 'Invoice', 'RR18078', 3, 'doc-581-in-JACK-18078.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-RR18078 TCNU6459543/', 'PDF', 270, 'da7d1fed378293a30acfeba579d14fd0', 'TCNU6459543', '2018-08-11 21:03:38'),
(246, 'pdf', 'WD18-069', 1, 'DRAFT BOL 6183127680 for LB18-069.pdf', 'C:/xampp/htdocs/vendor_documents/118-WD18-069 NO_CN/', 'pdf', NULL, '1360f7252272b0c9a7e81cf30f6e40a5', 'NO_CN', '2018-08-13 20:43:54'),
(247, 'xls', 'WD18-067', 1, 'LB18-067.xls', 'C:/xampp/htdocs/vendor_documents/118-WD18-067 NO_CN/', 'xls', NULL, '0eb75b0e2f9a889b4c04b2fb2cb91e4c', 'NO_CN', '2018-08-13 20:43:54'),
(248, 'xls', 'WD18-068', 1, 'LB18-068.xls', 'C:/xampp/htdocs/vendor_documents/118-WD18-068 NO_CN/', 'xls', NULL, 'f7467662e9415df62ea6690c10545ac0', 'NO_CN', '2018-08-13 20:43:54'),
(249, 'xls', 'WD18-069', 1, 'LB18-069.xls', 'C:/xampp/htdocs/vendor_documents/118-WD18-069 NO_CN/', 'xls', NULL, '09dc10ef490fa169b1351405bda44db3', 'NO_CN', '2018-08-13 20:43:54'),
(250, 'pdf', 'WD18-067', 1, 'DRAFT BOL 6183122120 FOR LB18-067.pdf', 'C:/xampp/htdocs/vendor_documents/118-WD18-067 NO_CN/', 'pdf', NULL, '12173cadf55bb505b9b34873e16f7f3d', 'NO_CN', '2018-08-13 20:43:54'),
(251, 'pdf', 'WD18-068', 1, 'DRAFT BOL 6183122130 for LB18-068.pdf', 'C:/xampp/htdocs/vendor_documents/118-WD18-068 NO_CN/', 'pdf', NULL, '3e607827049ab341fa3c008192296400', 'NO_CN', '2018-08-13 20:43:54'),
(252, 'xls', 'WD18-071', 1, 'LB18-071.xls', 'C:/xampp/htdocs/vendor_documents/118-WD18-071 NO_CN/', 'xls', NULL, '8fd721303d5a45aad666c4a144d4b119', 'NO_CN', '2018-08-13 20:43:55'),
(253, 'Document', 'WD18-058', 11, '7501 5877 9 081018.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-058 TCNU9438082/', 'pdf', 275, 'cc3f3b8c1293f726ca65401cdd882336', 'TCNU9438082', '2018-08-14 04:03:45'),
(254, 'Document', 'WD18-058', 11, 'WD18-058 Entry Inv 5877.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-058 TCNU9438082/', 'pdf', 275, '8e5f941a440fdcfde4fcfafb5e522b5b', 'TCNU9438082', '2018-08-14 04:03:45'),
(255, 'Document', 'WD18-058', 11, 'WD18-058 ESP 5877.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-058 TCNU9438082/', 'PDF', 275, '6909e695a18a609f284569622afab2b9', 'TCNU9438082', '2018-08-14 04:03:45'),
(256, 'Document', 'WD18-059', 11, '7501 5875 3 081018.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-059 TCNU6840544/', 'pdf', 223, '57177bcbce09af77885b93c25a1a4913', 'TCNU6840544', '2018-08-14 04:03:47'),
(257, 'Document', 'WD18-059', 11, 'WD18-058 Entry Inv 5875.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-059 TCNU6840544/', 'pdf', 223, '478449d1d449d2b0e408ed79f4c93427', 'TCNU6840544', '2018-08-14 04:03:47'),
(258, 'Document', 'WD18-059', 11, 'WD18-059 ESP 5875.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-059 TCNU6840544/', 'PDF', 223, '1675f974926964736691b4c2adda841f', 'TCNU6840544', '2018-08-14 04:03:47'),
(259, 'Document', 'WD18-057', 11, '7501 5876 1 081018.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-057 TCNU6263490/', 'pdf', 274, '0f78b94015c55e9c2afbf1a085e8ddf9', 'TCNU6263490', '2018-08-14 04:03:47'),
(260, 'Document', 'WD18-057', 11, 'WD18-057 ESP 5876.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-057 TCNU6263490/', 'PDF', 274, 'c949642ec9a093ed883760ba7fa7581b', 'TCNU6263490', '2018-08-14 04:03:48'),
(261, 'Document', 'WD18-057', 11, 'WD18-058 Entry Inv 5876.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-057 TCNU6263490/', 'pdf', 274, '81eb5abeb505bb72001c4c6af8f2d0f1', 'TCNU6263490', '2018-08-14 04:03:48'),
(262, 'Document', 'XY18048', 5, '7501 5978 5 080918.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18048 CXDU1244888/', 'pdf', 224, 'b63e9e0d6dbb1720c2517c3ca2146953', 'CXDU1244888', '2018-08-14 04:03:50'),
(263, 'Document', 'XY18048', 5, 'XY18048 Entry Inv. 5978.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18048 CXDU1244888/', 'pdf', 224, 'cff280ace4b76bcd8ebe55f8c46cf164', 'CXDU1244888', '2018-08-14 04:03:50'),
(264, 'Document', 'XY18048', 5, 'XY18048 ESP 5978.PDF', 'C:/xampp/htdocs/vendor_documents/XY18-XY18048 CXDU1244888/', 'PDF', 224, '88d6746a2095a9dfdb9ea1c051128eb4', 'CXDU1244888', '2018-08-14 04:03:50'),
(265, 'Document', 'WD18-060', 11, '7501 5878 7 081318.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-060 TCNU5220805/', 'pdf', 276, '19169547faabcdc9605f0b349a942be1', 'TCNU5220805', '2018-08-15 01:45:32'),
(266, 'Document', 'WD18-060', 11, 'WD18-060 Entry Inv. 5878.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-060 TCNU5220805/', 'pdf', 276, '631ba0572865dae065dd92b406893f12', 'TCNU5220805', '2018-08-15 01:45:32'),
(267, 'Document', 'WD18-060', 11, 'WD18-060 ESP 5878.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-060 TCNU5220805/', 'PDF', 276, 'd0cd7c0a58a63803c869b9d8e3e2ae99', 'TCNU5220805', '2018-08-15 01:45:32'),
(268, 'Document', 'XY18049', 5, '7501 6044 5 081318.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18049 TRHU2560148/', 'pdf', 278, 'c734ba2758ee7d88c65f75db3f3b466b', 'TRHU2560148', '2018-08-15 01:45:34'),
(269, 'Document', 'XY18049', 5, 'XY18049 Entry Inv. 6044.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18049 TRHU2560148/', 'pdf', 278, 'b4fd75a7f3bf1db8f5c7461022bf6a59', 'TRHU2560148', '2018-08-15 01:45:34'),
(270, 'Document', 'XY18049', 5, 'XY18049 ESP 6044.PDF', 'C:/xampp/htdocs/vendor_documents/XY18-XY18049 TRHU2560148/', 'PDF', 278, 'f321cff2d4353f0cc1a0a59ad4d28dba', 'TRHU2560148', '2018-08-15 01:45:34'),
(271, 'Document', 'WD18-062', 11, '7501 6063 5 081418.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-062 TCNU6692051/', 'pdf', 277, '48fe9c18a8f379c96682a695b8b34638', 'TCNU6692051', '2018-08-16 02:49:09'),
(272, 'Document', 'WD18-062', 11, 'WD18-062 - ESP 6063.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-062 TCNU6692051/', 'PDF', 277, 'd4484a54f8c1dc007605dd26f4b6be8e', 'TCNU6692051', '2018-08-16 02:49:09'),
(273, 'Document', 'WD18-062', 11, 'WD18-062-Entry Inv. 6063.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-062 TCNU6692051/', 'pdf', 277, '3e7dc35b48ddfa5f0c1ffd935291869a', 'TCNU6692051', '2018-08-16 02:49:09'),
(274, 'Document', 'NY18027', 4, '7501 6084 1 081718.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18027 CSLU1668276/', 'pdf', 280, '15c556f69e674b1663d3a32a8095fc04', 'CSLU1668276', '2018-08-20 19:24:35'),
(275, 'Document', 'NY18027', 4, 'NY18027- ESP 6084.PDF', 'C:/xampp/htdocs/vendor_documents/NY18-NY18027 CSLU1668276/', 'PDF', 280, 'de1fc4a5b21a6c1d3e0e908a09997e92', 'CSLU1668276', '2018-08-20 19:24:35'),
(276, 'Document', 'NY18027', 4, 'NY18027-Entry Inv. 6084.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18027 CSLU1668276/', 'pdf', 280, '03288b7591149eb03f2a226043562d78', 'CSLU1668276', '2018-08-20 19:24:35'),
(277, 'Document', 'ST3081NY17147', 1, '7501 6095 7 081718.pdf', 'C:/xampp/htdocs/vendor_documents/18-ST3081NY17147 CSLU1690829/', 'pdf', 282, 'db42fefcea4fd146e9fe01443a5fdc37', 'CSLU1690829', '2018-08-22 01:16:30'),
(278, 'Document', 'ST3081NY17147', 1, 'NY17147- ESP 6095.PDF', 'C:/xampp/htdocs/vendor_documents/18-ST3081NY17147 CSLU1690829/', 'PDF', 282, '80350cbaa674d6d41430483a16f19eed', 'CSLU1690829', '2018-08-22 01:16:30'),
(279, 'Document', 'ST3081NY17147', 1, 'NY17147-Entry Inv. 6095.pdf', 'C:/xampp/htdocs/vendor_documents/18-ST3081NY17147 CSLU1690829/', 'pdf', 282, '44f135dd7802499828abc480ace43d66', 'CSLU1690829', '2018-08-22 01:16:30'),
(280, 'Document', 'BOTO18-3', 1, '7501 6154 2 082418.pdf', 'C:/xampp/htdocs/vendor_documents/BOTO18-3 CXDU1049074/', 'pdf', 286, '6606423bb0c274af6c689d9e9972580c', 'CXDU1049074', '2018-08-26 22:08:03'),
(281, 'Document', 'BOTO18-3', 1, 'BOTO18-3 Entry Inv. 6154.pdf', 'C:/xampp/htdocs/vendor_documents/BOTO18-3 CXDU1049074/', 'pdf', 286, '903983a0b8743bbdb4ac6d8cbb575fe5', 'CXDU1049074', '2018-08-26 22:08:03'),
(282, 'Document', 'BOTO18-3', 1, 'BOTO18-13 ESP 6152-6154.PDF', 'C:/xampp/htdocs/vendor_documents/BOTO18-3 CXDU1049074/', 'PDF', 286, '7b302f08bd99bdb220ae3a1c36b033b7', 'CXDU1049074', '2018-08-26 22:08:03'),
(283, 'Document', 'WD18-064', 11, '7501 6155 9 082418.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-064 TCNU6177323/', 'pdf', 291, '28ae1996bf98fc31568be1b640abfbf9', 'TCNU6177323', '2018-08-26 22:08:05'),
(284, 'Document', 'WD18-064', 11, 'WD18-064 Entry Inv. 6155.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-064 TCNU6177323/', 'pdf', 291, 'a29fc847f5dc6879cece32f903c7ecec', 'TCNU6177323', '2018-08-26 22:08:05'),
(285, 'Document', 'WD18-064', 11, 'WD18-064 ESP 6155.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-064 TCNU6177323/', 'PDF', 291, '6a6604d149b2dc9832afcda422a5d1ce', 'TCNU6177323', '2018-08-26 22:08:05'),
(286, 'Document', 'WD18-065', 11, '7501 6156 7 082418.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-065 TCNU6172240/', 'pdf', 292, '327f95b04db58caa6c208b1a4c5ff98b', 'TCNU6172240', '2018-08-28 20:59:35'),
(287, 'Document', 'WD18-065', 11, 'WD18-065  ESP 6156.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-065 TCNU6172240/', 'PDF', 292, 'bbb3692055aa69410bc4590d2da5b4d6', 'TCNU6172240', '2018-08-28 20:59:36'),
(288, 'Document', 'WD18-065', 11, 'WD18-065 Entry Inv. 6156.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-065 TCNU6172240/', 'pdf', 292, '345688abefda8c72e69dae9aed436127', 'TCNU6172240', '2018-08-28 20:59:36'),
(289, 'Document', 'WD18-066', 11, '7501 6157 5 082418.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-066 TCNU5019914/', 'pdf', 293, '053b20e2a77d1ab5d7ed225aee267996', 'TCNU5019914', '2018-08-28 20:59:37'),
(290, 'Document', 'WD18-066', 11, 'WD18-066  ESP 6157.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-066 TCNU5019914/', 'PDF', 293, '21200d0927f964b632b2d531eb90f3a8', 'TCNU5019914', '2018-08-28 20:59:37'),
(291, 'Document', 'WD18-066', 11, 'WD18-066 Entry Inv. 6157.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-066 TCNU5019914/', 'pdf', 293, '8195bc6060b3b51e3a32d20da5d529a6', 'TCNU5019914', '2018-08-28 20:59:37'),
(292, 'Document', 'XY18061B', 5, '7501 6151 8 082318.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18061B CBHU5698215/', 'pdf', 287, '6127de4a65aa2f09f78cd1b686e57e94', 'CBHU5698215', '2018-08-28 20:59:39'),
(293, 'Document', 'XY18061B', 5, 'XY18061B ESP 6151.PDF', 'C:/xampp/htdocs/vendor_documents/XY18-XY18061B CBHU5698215/', 'PDF', 287, '3241f363932d163f35c81968445ac900', 'CBHU5698215', '2018-08-28 20:59:39'),
(294, 'Document', 'XY18061B', 5, 'XY18061B-Entry Inv. 6151.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18061B CBHU5698215/', 'pdf', 287, '3654f638c9d22df7a5d196fdd51f6872', 'CBHU5698215', '2018-08-28 20:59:39'),
(295, 'Document', 'BOTO18-2', 1, '7501 6152 6 082318.pdf', 'C:/xampp/htdocs/vendor_documents/BOTO18-2 TCNU8618840/', 'pdf', 285, 'e3394907152d686c412151714c89a7a6', 'TCNU8618840', '2018-08-28 20:59:40'),
(296, 'Document', 'BOTO18-2', 1, 'BOTO18-2 Entry Inv. 6152.pdf', 'C:/xampp/htdocs/vendor_documents/BOTO18-2 TCNU8618840/', 'pdf', 285, '73cee93a65ca2b1e9e22ecf0efe8b8ca', 'TCNU8618840', '2018-08-28 20:59:40'),
(297, 'Document', 'WD18-063', 11, '7501 6160 9 082418.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-063 TCNU6338367/', 'pdf', 284, '41838b60b1e7558fb59701e56f73424b', 'TCNU6338367', '2018-08-28 20:59:41'),
(298, 'Document', 'WD18-063', 11, 'WD18-063  ESP 6160.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-063 TCNU6338367/', 'PDF', 284, '431c1754f64ca5b00da3a9987ea18260', 'TCNU6338367', '2018-08-28 20:59:41'),
(299, 'Document', 'WD18-063', 11, 'WD18-063-Entry Inv. 6160.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-063 TCNU6338367/', 'pdf', 284, '6ea7e39446b714dabe51589d2fc872f1', 'TCNU6338367', '2018-08-28 20:59:41'),
(300, 'Document', 'WD18-069', 11, '7501 6227 6 083018.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-069 TCNU6693248/', 'pdf', 296, '4e8e171ab7ff8aacccc390b71ff691e9', 'TCNU6693248', '2018-08-31 20:05:53'),
(301, 'Document', 'WD18-069', 11, 'WD18-069 Entry Inv. 6227.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-069 TCNU6693248/', 'pdf', 296, '6b5c05694300889369da0d34b05c7a5c', 'TCNU6693248', '2018-08-31 20:05:53'),
(302, 'Document', 'WD18-069', 11, 'WD18-069 ESP 6227.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-069 TCNU6693248/', 'PDF', 296, '6314dd938e8ae5450dd4bf0e00665a1e', 'TCNU6693248', '2018-08-31 20:05:53'),
(303, 'Document', 'WD18-068', 11, '7501 6224 3 083018.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-068 TCNU6591360/', 'pdf', 295, '91a417b543cdde3f9a8b87ef0c289f41', 'TCNU6591360', '2018-08-31 20:05:54'),
(304, 'Document', 'WD18-068', 11, 'WD18-068 Entry Inv. 6224.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-068 TCNU6591360/', 'pdf', 295, '5ccf0078b3c3a7b27b1a5d5b449b96da', 'TCNU6591360', '2018-08-31 20:05:54'),
(305, 'Document', 'WD18-068', 11, 'WD18-068 ESP 6224.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-068 TCNU6591360/', 'PDF', 295, 'b6d0e8062e5276a338990a0a5a7a4636', 'TCNU6591360', '2018-08-31 20:05:54'),
(306, 'Document', 'WD18-067', 11, '7501 6223 5 082918.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-067 TCNU6269203/', 'pdf', 294, 'd305de6c85314623942a9802153b651a', 'TCNU6269203', '2018-08-31 20:05:55'),
(307, 'Document', 'WD18-067', 11, 'WD18-067 Entry Inv. 6223.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-067 TCNU6269203/', 'pdf', 294, '529e9b5a4f73d2429185f55921fa37e7', 'TCNU6269203', '2018-08-31 20:05:55'),
(308, 'Document', 'WD18-067', 11, 'WD18-067 ESP 6223.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-067 TCNU6269203/', 'PDF', 294, 'db3ea0a04713a904c4199bcd8669c5dc', 'TCNU6269203', '2018-08-31 20:05:55'),
(309, 'Document', 'WD18-70', 11, '7501 6319 1 090718.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-70 TCNU6028891/', 'pdf', 302, 'ca02c8a02435c4d43c4ee1b824fec809', 'TCNU6028891', '2018-09-08 03:37:58'),
(310, 'Document', 'WD18-70', 11, 'WD18-70 Entry Inv. 6319.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-70 TCNU6028891/', 'pdf', 302, 'fdb30f61882da1fd296d6691d908540a', 'TCNU6028891', '2018-09-08 03:37:58'),
(311, 'Document', 'WD18-70', 11, 'WD18-70 ESP 6319.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-70 TCNU6028891/', 'PDF', 302, 'd08dd739e4a1d13caf995c599c9010f3', 'TCNU6028891', '2018-09-08 03:37:58'),
(312, 'Document', 'WD18-71', 11, '7501 6338 1 090718.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-71 TCNU6578434/', 'pdf', 303, 'de7ff889700fcc6dec492f7ba3ceefd2', 'TCNU6578434', '2018-09-08 03:37:59'),
(313, 'Document', 'WD18-71', 11, 'WD18-71 Entry Inv. 6338.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-71 TCNU6578434/', 'pdf', 303, 'cf99b8b55733dfff6e1aae65e20ff263', 'TCNU6578434', '2018-09-08 03:37:59'),
(314, 'Document', 'WD18-71', 11, 'WD18-71 ESP 6338.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-71 TCNU6578434/', 'PDF', 303, '8fcab69774702b9ec925302b3524adb5', 'TCNU6578434', '2018-09-08 03:37:59'),
(315, 'Document', 'JX18049', 1, '7501 6373 8 091018.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 DFSU2893328/', 'pdf', 299, '60aa977d1f2a54dfe398d55a60b3256d', 'DFSU2893328', '2018-09-13 04:11:33'),
(316, 'Document', 'JX18049', 1, '7501 6373 8 091018-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 CSLU1249773/', 'pdf', 300, '60aa977d1f2a54dfe398d55a60b3256d-1', 'CSLU1249773', '2018-09-13 04:11:33'),
(317, 'Document', 'JX18049', 1, '7501 6374 6 091018.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 DFSU2893328/', 'pdf', 299, '2e883b4c8a8dfc439989e0f11d539ac2', 'DFSU2893328', '2018-09-13 04:11:33'),
(318, 'Document', 'JX18049', 1, '7501 6374 6 091018-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 CSLU1249773/', 'pdf', 300, '2e883b4c8a8dfc439989e0f11d539ac2-1', 'CSLU1249773', '2018-09-13 04:11:33'),
(319, 'Document', 'JX18049', 1, 'JX18049 -50 ESP 6373 -6374.PDF', 'C:/xampp/htdocs/vendor_documents/18-JX18049 DFSU2893328/', 'PDF', 299, '27c825d6dea29f879d162fc529c80f98', 'DFSU2893328', '2018-09-13 04:11:33'),
(320, 'Document', 'JX18049', 1, 'JX18049 -50 ESP 6373 -6374-1.PDF', 'C:/xampp/htdocs/vendor_documents/18-JX18049 CSLU1249773/', 'PDF', 300, '27c825d6dea29f879d162fc529c80f98-1', 'CSLU1249773', '2018-09-13 04:11:33'),
(321, 'Document', 'JX18049', 1, 'JX18049 Entry Inv. 6373.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 DFSU2893328/', 'pdf', 299, 'da4d0713cb6adda796f395e46df4ec59', 'DFSU2893328', '2018-09-13 04:11:33'),
(322, 'Document', 'JX18049', 1, 'JX18049 Entry Inv-1. 6373-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 CSLU1249773/', 'pdf', 300, 'da4d0713cb6adda796f395e46df4ec59-1', 'CSLU1249773', '2018-09-13 04:11:33'),
(323, 'Document', 'JX18049', 1, 'JX18050 Entry Inv.6374.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 DFSU2893328/', 'pdf', 299, '2c726ed08d779fe4afac475fd65403a6', 'DFSU2893328', '2018-09-13 04:11:33'),
(324, 'Document', 'JX18049', 1, 'JX18050 Entry Inv-1.6374-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18049 CSLU1249773/', 'pdf', 300, '2c726ed08d779fe4afac475fd65403a6-1', 'CSLU1249773', '2018-09-13 04:11:33'),
(325, 'Document', 'GD8080', 1, '7501 6375 3 091018.pdf', 'C:/xampp/htdocs/vendor_documents/18-GD8080 FSCU6960538/', 'pdf', NULL, '5eab41a576d290534e4e1ea230d0823e', 'FSCU6960538', '2018-09-13 04:11:34'),
(326, 'Document', 'GD8080', 1, 'LB8080 Entry Inv. 6375.PDF', 'C:/xampp/htdocs/vendor_documents/18-GD8080 FSCU6960538/', 'PDF', NULL, 'caaaa2ec1ba1368d1fe75dbc63639a2e', 'FSCU6960538', '2018-09-13 04:11:34'),
(327, 'Document', 'GD8080', 1, 'LB8080 ESP 6375.PDF', 'C:/xampp/htdocs/vendor_documents/18-GD8080 FSCU6960538/', 'PDF', NULL, '74378ece0a32f4a8484a3a365d453685', 'FSCU6960538', '2018-09-13 04:11:34'),
(328, 'Parts_List', '00000', 2, 'doc-594-PL-drum-18089B.pdf', 'C:/xampp/htdocs/vendor_documents/YX18-00000 NO_CN/', 'PDF', NULL, '9c872931f9ba2c50026a783be508a9f2', 'NO_CN', '2018-09-13 20:29:25'),
(329, 'Invoice', '00000', 2, 'doc-594-in-drum-18089B.pdf', 'C:/xampp/htdocs/vendor_documents/YX18-00000 NO_CN/', 'PDF', NULL, 'c676039695e43de4e45c1056340bb4b7', 'NO_CN', '2018-09-13 20:29:25'),
(330, 'Parts_List', 'NY18013', 4, 'doc-593-pl-spring-18013.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18013 NO_CN/', 'PDF', NULL, 'd42145a1797180b3ba63801547d8367f', 'NO_CN', '2018-09-13 20:29:26'),
(331, 'Invoice', 'NY18013', 4, 'doc-593-in-spring-18013.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18013 NO_CN/', 'PDF', NULL, 'b8538c6f4103eeb736355d2afe1ab6bc', 'NO_CN', '2018-09-13 20:29:26'),
(332, 'Parts_List', '00000', 4, 'doc-592-pl-ap kits-18060.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-00000 NO_CN/', 'PDF', NULL, '12177b62c74323c1cdfb40e491c1507e', 'NO_CN', '2018-09-13 20:29:27'),
(333, 'Invoice', '00000', 4, 'doc-592-iv-ap kits-18060.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-00000 NO_CN/', 'PDF', NULL, 'e7a1b726e417d2a8554b3e807d3fec02', 'NO_CN', '2018-09-13 20:29:27'),
(334, 'Parts_List', '00000', 12, 'doc-591-pl-spindle-18049 18050.pdf', 'C:/xampp/htdocs/vendor_documents/JT18-00000 NO_CN/', 'PDF', NULL, '603689dabd6537578517483ab01c8988', 'NO_CN', '2018-09-13 20:29:30'),
(335, 'Invoice', '00000', 12, 'doc-591-iv-spindle-18049 18050.pdf', 'C:/xampp/htdocs/vendor_documents/JT18-00000 NO_CN/', 'PDF', NULL, '71c3592a4fa5b3491968345440a4f382', 'NO_CN', '2018-09-13 20:29:30'),
(336, 'Parts_List', 'NY17158', 4, 'doc-590-pl-spring-17158.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY17158 TGBU2363084/', 'PDF', 297, 'a7e8a2bdb6c0f3d791a493b734e0eab4', 'TGBU2363084', '2018-09-13 20:29:31'),
(337, 'Invoice', 'NY17158', 4, 'doc-590-in-spring-17158.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY17158 TGBU2363084/', 'PDF', 297, '576557957c0e05038c903185f1775f55', 'TGBU2363084', '2018-09-13 20:29:31'),
(338, 'Invoice', '00000', 3, 'doc-589-in-JACK-18080.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-00000 NO_CN/', 'PDF', NULL, 'd70e82e3eb6f7e6e8d65c58869fc33e2', 'NO_CN', '2018-09-13 20:29:32'),
(339, 'Parts_List', '00000', 3, 'doc-589-pl-JACK-18080.pdf', 'C:/xampp/htdocs/vendor_documents/RR18-00000 NO_CN/', 'PDF', NULL, '6224c078542ff2ad32fa69b82948f8a5', 'NO_CN', '2018-09-13 20:29:32'),
(340, 'Document', 'WD18-73', 11, '7501 6404 1 091218.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-73 TCNU8455402/', 'pdf', 310, 'ecb74bfcce4afd633ec8c068d3256344', 'TCNU8455402', '2018-09-16 22:39:25'),
(341, 'Document', 'WD18-73', 11, 'WD18-073-Entry Inv. 6404.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-73 TCNU8455402/', 'pdf', 310, '92fb5df7b5f03c43ba2ac38aebee887c', 'TCNU8455402', '2018-09-16 22:39:25'),
(342, 'Document', 'WD18-73', 11, 'WD18-73 ESP 6404.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-73 TCNU8455402/', 'PDF', 310, 'ac24a1ac714a6d30b1bed0754e25f5b4', 'TCNU8455402', '2018-09-16 22:39:25'),
(343, 'Document', 'WD18-72', 11, '7501 6402 5 091218.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-72 SEGU6469268/', 'pdf', 309, '8a690091879dbd3fa28c97519ca542e1', 'SEGU6469268', '2018-09-16 22:39:26'),
(344, 'Document', 'WD18-72', 11, 'WD18-072 Entry Inv. 6402.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-72 SEGU6469268/', 'pdf', 309, '05863324ab35929d36e949e58179bb54', 'SEGU6469268', '2018-09-16 22:39:26'),
(345, 'Document', 'WD18-72', 11, 'WD18-72 ESP 6402.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-72 SEGU6469268/', 'PDF', 309, 'd34d83f29c2b2748eac4fc1ce98e4b17', 'SEGU6469268', '2018-09-16 22:39:26'),
(346, 'Document', 'WD18-074', 11, '7501 6441 3 091618.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-074 TCNU3649046/', 'pdf', 314, '03bfec5bc840b0b3d2b5604dc71d783e', 'TCNU3649046', '2018-09-18 20:28:46'),
(347, 'Document', 'WD18-074', 11, 'WD18-074 ESP 6441.PDF', 'C:/xampp/htdocs/vendor_documents/WD18-074 TCNU3649046/', 'PDF', 314, 'c1a8d5bd95add690370b509b7b3e2869', 'TCNU3649046', '2018-09-18 20:28:46'),
(348, 'Document', 'WD18-074', 11, 'WD18-074-Entry Inv.6441.pdf', 'C:/xampp/htdocs/vendor_documents/WD18-074 TCNU3649046/', 'pdf', 314, '69afc33ba2e0b694ad8ec024e5ab5414', 'TCNU3649046', '2018-09-18 20:28:46'),
(349, 'Document', 'XY18089B', 5, '7501 6428 0 091518.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18089B CMAU0483270/', 'pdf', NULL, '67dd4b722e020d27bb7e5671d043689c', 'CMAU0483270', '2018-09-18 20:28:47'),
(350, 'Document', 'XY18089B', 5, 'XY18089B ESP 6428.PDF', 'C:/xampp/htdocs/vendor_documents/XY18-XY18089B CMAU0483270/', 'PDF', NULL, '9efc1c1f5b85e8a920b92975b4f24c87', 'CMAU0483270', '2018-09-18 20:28:47'),
(351, 'Document', 'XY18089B', 5, 'XY18089B-Entry Inv. 6428.pdf', 'C:/xampp/htdocs/vendor_documents/XY18-XY18089B CMAU0483270/', 'pdf', NULL, 'd7b77bd0fedc922359a8074fb1230051', 'CMAU0483270', '2018-09-18 20:28:47'),
(352, 'Document', 'FP18060', 1, '7501 6427 2 091418.pdf', 'C:/xampp/htdocs/vendor_documents/18-FP18060 FXLU1693159/', 'pdf', NULL, 'bd7985d5299b4c2050f926c9a9d2197c', 'FXLU1693159', '2018-09-18 20:28:48'),
(353, 'Document', 'FP18060', 1, 'FP18060 Entry Inv. 6427.pdf', 'C:/xampp/htdocs/vendor_documents/18-FP18060 FXLU1693159/', 'pdf', NULL, '3b28297445efcbaaaa35fa1bc1e598e2', 'FXLU1693159', '2018-09-18 20:28:48'),
(354, 'Document', 'FP18060', 1, 'FP18060 ESP 6427.PDF', 'C:/xampp/htdocs/vendor_documents/18-FP18060 FXLU1693159/', 'PDF', NULL, '208dbad9fa25d27e03f42dc8f08c02db', 'FXLU1693159', '2018-09-18 20:28:49'),
(355, 'Document', 'JX18057', 1, '7501 6425 6 091618.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 TEMU4695560/', 'pdf', 312, '3fab3439a4dd6a55c2c4fadba8a2f189', 'TEMU4695560', '2018-09-18 20:28:50'),
(356, 'Document', 'JX18057', 1, '7501 6425 6 091618-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 UETU2304513/', 'pdf', 311, '3fab3439a4dd6a55c2c4fadba8a2f189-1', 'UETU2304513', '2018-09-18 20:28:50'),
(357, 'Document', 'JX18057', 1, '7501 6426 4 091618.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 TEMU4695560/', 'pdf', 312, 'c5029e1a234ae1d9ee942498ff9652b0', 'TEMU4695560', '2018-09-18 20:28:50'),
(358, 'Document', 'JX18057', 1, '7501 6426 4 091618-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 UETU2304513/', 'pdf', 311, 'c5029e1a234ae1d9ee942498ff9652b0-1', 'UETU2304513', '2018-09-18 20:28:50');
INSERT INTO `vendor_documents` (`id`, `document_type`, `po_number`, `vendor_id`, `filename`, `filepath`, `file_extension`, `shipment_id`, `md5_hash`, `identifying_label`, `creation_timestamp`) VALUES
(359, 'Document', 'JX18057', 1, 'JX18057 Entry Inv.6425.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 TEMU4695560/', 'pdf', 312, 'b17eac9c4537b289537953a99dfac0c3', 'TEMU4695560', '2018-09-18 20:28:50'),
(360, 'Document', 'JX18057', 1, 'JX18057 Entry Inv-1.6425-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 UETU2304513/', 'pdf', 311, 'b17eac9c4537b289537953a99dfac0c3-1', 'UETU2304513', '2018-09-18 20:28:50'),
(361, 'Document', 'JX18057', 1, 'JX18057- JX18058 ESP 6425-6426.PDF', 'C:/xampp/htdocs/vendor_documents/18-JX18057 TEMU4695560/', 'PDF', 312, '925cb22e2e11927aec1a0f7924e26d4c', 'TEMU4695560', '2018-09-18 20:28:50'),
(362, 'Document', 'JX18057', 1, 'JX18057- JX18058 ESP 6425-6426-1.PDF', 'C:/xampp/htdocs/vendor_documents/18-JX18057 UETU2304513/', 'PDF', 311, '925cb22e2e11927aec1a0f7924e26d4c-1', 'UETU2304513', '2018-09-18 20:28:50'),
(363, 'Document', 'JX18057', 1, 'JX18058 Entry Inv.6426.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 TEMU4695560/', 'pdf', 312, '6760a5db805d1b4f679c0b4a0384f562', 'TEMU4695560', '2018-09-18 20:28:50'),
(364, 'Document', 'JX18057', 1, 'JX18058 Entry Inv-1.6426-1.pdf', 'C:/xampp/htdocs/vendor_documents/18-JX18057 UETU2304513/', 'pdf', 311, '6760a5db805d1b4f679c0b4a0384f562-1', 'UETU2304513', '2018-09-18 20:28:50'),
(365, 'Parts_List', 'NY18010', 4, 'doc-598-pl-spring-18010.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18010 NO_CN/', 'PDF', NULL, 'ea9cd87188ba4a66f0121bac97ff7de8', 'NO_CN', '2018-09-20 20:15:11'),
(366, 'Invoice', 'NY18010', 4, 'doc-598-iv-spring-18010.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18010 NO_CN/', 'PDF', NULL, 'd614cd1c83bdb108c86f65d7eefc51ee', 'NO_CN', '2018-09-20 20:15:11'),
(367, 'Invoice', 'NY18065', 4, 'doc-597-iv-spring-18065.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18065 NO_CN/', 'PDF', NULL, '10646090afbc7ab83da43476153bc4e5', 'NO_CN', '2018-09-20 20:15:11'),
(368, 'Parts_List', 'NY18065', 4, 'doc-597-pl-spring-18065.pdf', 'C:/xampp/htdocs/vendor_documents/NY18-NY18065 NO_CN/', 'PDF', NULL, 'afc878b7a3625092e456dfc4923443f8', 'NO_CN', '2018-09-20 20:15:12'),
(369, 'Parts_List', '00000', 12, 'doc-596-pl-spindle-18059.pdf', 'C:/xampp/htdocs/vendor_documents/JT18-00000 NO_CN/', 'PDF', NULL, '22cdd7cbdac0252ee005830e419c8782', 'NO_CN', '2018-09-20 20:15:12'),
(370, 'Invoice', '00000', 12, 'doc-596-iv-spindle-18059.pdf', 'C:/xampp/htdocs/vendor_documents/JT18-00000 NO_CN/', 'PDF', NULL, 'c0546285f5501ac4d1bd81885a9aa6ef', 'NO_CN', '2018-09-20 20:15:13');

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
(12, 15, 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_documents`
--
ALTER TABLE `vendor_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT for table `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
