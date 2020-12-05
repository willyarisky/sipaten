-- -------------------------------------------------------------
-- TablePlus 3.12.0(355)
--
-- https://tableplus.com/
--
-- Database: sipaten
-- Generation Time: 2020-12-05 14:27:55.9780
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `diseases`;
CREATE TABLE `diseases` (
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `mapping_solutions`;
CREATE TABLE `mapping_solutions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_diseases` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_solutions` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `mapping_symptoms`;
CREATE TABLE `mapping_symptoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_diseases` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_symptoms` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `solutions`;
CREATE TABLE `solutions` (
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `solutions` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `symptoms`;
CREATE TABLE `symptoms` (
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `diseases` (`code`, `name`) VALUES
('P01', 'Hawar Daun'),
('P02', 'Kerdil'),
('P03', 'Tungro'),
('P04', 'Leaf Streak'),
('P05', 'Bercak Coklat'),
('P06', 'WBC'),
('P07', 'Blast'),
('P08', 'Penggerek Batang'),
('P09', 'Wereng Hijau'),
('P10', 'busuk batang'),
('P11', 'Hama putih '),
('P12', 'Tikus'),
('P13', 'Kepik Hijau'),
('P14', 'Walang Sangit'),
('P15', 'Hama Burung'),
('P16', 'Fusarium'),
('P17', 'Busuk Pelepah Daun'),
('P18', 'Noda/Api Palsu'),
('P19', 'Kerdil rumput'),
('P20', 'Hoja Blanka'),
('P21', 'Stackburn'),
('P22', 'Kembang Api'),
('P23', 'Garis merah'),
('P24', 'Bakanae (Jamur)'),
('P25', 'Coretan daun Bakteri');

INSERT INTO `mapping_solutions` (`id`, `code_diseases`, `code_solutions`) VALUES
('7', 'P01', 'S01'),
('8', 'P02', 'S02'),
('9', 'P03', 'S03'),
('10', 'P04', 'S04'),
('11', 'P05', 'S10'),
('12', 'P06', 'S11'),
('13', 'P07', 'S20'),
('14', 'P08', 'S25'),
('15', 'P09', 'S24'),
('16', 'P10', 'S05'),
('17', 'P11', 'S06'),
('18', 'P12', 'S07'),
('19', 'P13', 'S08'),
('20', 'P14', 'S09'),
('21', 'P15', 'S12'),
('22', 'P16', 'S13'),
('23', 'P17', 'S14'),
('24', 'P18', 'S15'),
('25', 'P19', 'S16'),
('26', 'P20', 'S17'),
('27', 'P21', 'S18'),
('28', 'P22', 'S19'),
('29', 'P23', 'S21'),
('30', 'P24', 'S22'),
('31', 'P25', 'S23');

INSERT INTO `mapping_symptoms` (`id`, `code_diseases`, `code_symptoms`) VALUES
('2', 'P01', 'G01'),
('3', 'P01', 'G02'),
('4', 'P02', 'G05'),
('5', 'P02', 'G06'),
('6', 'P02', 'G08'),
('7', 'P02', 'G10'),
('8', 'P03', 'G07'),
('9', 'P03', 'G09'),
('10', 'P03', 'G11'),
('11', 'P03', 'G12'),
('12', 'P03', 'G13'),
('13', 'P04', 'G01'),
('14', 'P04', 'G03'),
('15', 'P05', 'G37'),
('16', 'P06', 'G09'),
('17', 'P06', 'G13'),
('18', 'P06', 'G21'),
('19', 'P07', 'G49'),
('20', 'P08', 'G50'),
('21', 'P09', 'G49'),
('22', 'P10', 'G28'),
('23', 'P11', 'G29'),
('24', 'P12', 'G30'),
('25', 'P13', 'G31'),
('26', 'P14', 'G32'),
('27', 'P14', 'G33'),
('28', 'P15', 'G35'),
('29', 'P16', 'G36'),
('30', 'P17', 'G38'),
('31', 'P17', 'G39'),
('32', 'P18', 'G40'),
('33', 'P19', 'G41'),
('34', 'P19', 'G42'),
('35', 'P20', 'G43'),
('36', 'P21', 'G44'),
('37', 'P21', 'G45'),
('38', 'P22', 'G46'),
('39', 'P22', 'G47'),
('40', 'P23', 'G36'),
('41', 'P24', 'G37'),
('42', 'P24', 'G38'),
('43', 'P25', 'G39');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
('1', '2014_10_12_000000_create_users_table', '1'),
('2', '2014_10_12_100000_create_password_resets_table', '1'),
('3', '2019_08_19_000000_create_failed_jobs_table', '1');

INSERT INTO `solutions` (`code`, `solutions`) VALUES
('S01', 'menanam varitas tahan diseases seperti IR36, IR46, Cisadane, Cipunegara; menghindari luka mekanis, sanitasi lingkungan, pengendalian kimia dengan bakterisida Stablex WP.'),
('S02', 'sulit dilakukan, usaha pencegahan dilakukan dengan memusnahkan tanaman yang terserang.'),
('S03', 'menanam padi tahan wereng seperti Kelara, IR52, IR36, IR48, IR54, IR46, IR42 (A.W, Imam; 2005: 30).'),
('S04', 'menanam varitas unggul, menghindari luka mekanis, pergiliran varitas dan bakterisida Stablex 10 WP.'),
('S05', 'pengeringan petakan dan biarkan tanah hingga retak sebelum di aliri lagi'),
('S06', 'Harus pintar pintar mengatur perairan, pemilihan bibit yang kurang sesuai atau tidak tepat dan harus ,membuang satu persatu agar tumbuh yang daun yang baru'),
('S07', 'Mencapurkan oli dengan racun tikus dan diletakan di genangan air sekitaran sawah untuk menjebak tikus, cara prakis menggunakan NAT ( Natural Aromatic)'),
('S08', 'Memusnakan telur-telur hama keping dan dengan menyemprotkan tanaman padi dengan pestisida jenis BVR dan Pestona'),
('S09', 'Mengunakan air sabun  yang di semprotkan dia area mana saja yang dicurigai sebagai tempat bersarangnya'),
('S10', 'Pemupukan berimbang'),
('S11', 'penggunaan insektisida, penggunaan varietas tahan,tanam padi secara serentak, perangkap lampu.'),
('S12', 'pengusiran dengan membuat ajir warna merah disekitar sawah atau dengan menggantngkan tali2 yang dgantungi plastik/kaleng untuk membuat suara'),
('S13', 'merenggangkan jarak tanam, mencelupkan benih + POC NASA dan disebari GLIO di lahan'),
('S14', 'menanam padi tahan diseases, pemberian GLIO pada saat pembentukan anakan.'),
('S15', 'memusnahkan malai yang sakit menyemprotkan fungisida pada malai sakit'),
('S16', 'Waktu tanam harus disesuaikan dengan pola    fluktuasi populasi wereng hijau yang sering terjadi pada bulan-      bulan   tertentu.'),
('S17', 'menanam saat populasi vektor rendah sangat efektif mengurangi insiden diseases'),
('S18', 'perlakuan benih dengan air panas atau dengan fungisida'),
('S19', 'penggunaan benih yang sehat atau perlakuan benih dengan air hangat'),
('S20', 'Gunakan varietas tahan sesuai dengan sebaran ras yang ada di daerah setempat.Gunakan benih sehat.Hidarkan penggunaan pupuk nitrogen diatas dosis anjuran.'),
('S21', 'Terapkan nitrogen berdasarkan persyaratan tanaman aktual. Pastikan tingkat penyemaian yang optimal dan jarak tanam yang lebih luas juga tampaknya mengurangi diseases. Pastikan drainase terputus-putus selama inisiasi malai.'),
('S22', 'Gunakan benih bersih untuk meminimalkan terjadinya diseases. Gunakan air garam untuk memisahkan benih yang terinfeksi dan ringan selama berendam. Gunakan fungisida sebagai perawatan benih'),
('S23', 'Gunakan jumlah nutrisi tanaman yang seimbang, terutama nitrogen. Keringkan lahan selama banjir parah. Keringkan lahan selama periode bera untuk membunuh bakteri di tanah dan residu tanaman.'),
('S24', 'Pengendalian dengan cara penyemprotan insektisida yang dianjurkan berbahan aktif, seperti BPMC, Buprofezin, Etofenproks, Imidakloprid, Karbofuran, MIPC atau Tiametoksam'),
('S25', 'Pergiliran tanaman dengan tanaman bukan padi sehingga dapat memutus siklus hidup hama.');

INSERT INTO `symptoms` (`code`, `name`) VALUES
('G01', 'Menyerang daun titik tumbuh'),
('G02', 'Terdapat garis-garis diantara tulang daun'),
('G03', 'Terdapat garis basah berwarna merah kekuningan pada helai daun sehingga daun seperti terbakar'),
('G04', 'Bercak tersebar merata pada permukaan daun'),
('G05', 'Daun menjadi pendek, sempit, berwarna hijau kekuning-kuningan'),
('G06', 'Batang pendek'),
('G07', 'Pertumbuhan tanaman kurang sempurna'),
('G08', 'Buku-buku pendek'),
('G09', 'Daun kuning hingga kecoklatan'),
('G10', 'Anakan banyak tetapi kecil'),
('G11', 'Jumlah tunas berkurang'),
('G12', 'Pembungaan tertunda'),
('G13', 'Malai kecil dan tidak berisi'),
('G14', 'Anakan berkurang atau sedikit'),
('G15', 'Daun berubah menjadi kuning sampai kuning oranye'),
('G16', 'Akar tanaman lebih sedikit'),
('G17', 'Anakan bertambah banyak'),
('G18', 'Daun berwarna kuning pucat'),
('G19', 'Bercak pada pelepah daun bagian bawah'),
('G20', 'Daun berwarna abu-abu kehijauan'),
('G21', 'Malai tanaman kering atau mati'),
('G22', 'Daun bercak warna hijau pucat'),
('G23', 'Terdapat bercak pada tepi daun'),
('G24', 'Tanaman mudah dicabut dari anakan'),
('G25', 'Adanya bekas lubang pada pelepah daun dan batang'),
('G26', 'Terdapat telur pada pelepah daun dan tulang daun'),
('G27', 'Tampak seperti rumput'),
('G28', 'Bercak berwarna kehitaman serta bentuk nya tidak teratur pada sisi luar pelapah daun dan secara taha'),
('G29', 'Daun yang berwana hijau berubah menjadi bercak bercak putih panjang sejajar dengan tulang daun'),
('G30', 'Batang  terputus dan tumbang'),
('G31', 'Mengalami bekas tusukan, terdapat noda bercak bekas hisapan dari hama keping'),
('G32', 'Menyerang tanaman yang masih muda, Kulitas buah yang terserang hama menjadi tidak bagus, serperti ke'),
('G33', 'Menyerang daun padi dan terdabat bercak-bercakdan bintik bintik hitam pada daun'),
('G34', 'Bercak berwarna coklat, berbentuk oval sampai bulat'),
('G35', 'menyerang tanaman pada fase masak susu sampai padi panen'),
('G36', 'menyerang malai dan biji muda menjadi kecoklatan, daun terkulai, akar membusuk.'),
('G37', 'Bercak berwara coklat, berbentuk oval sampai bulat'),
('G38', 'menyerang daun dan pelepah daun pada tanaman yang telah membentuk anakan.'),
('G39', 'Menyebabkan jumlah dan mutu gabah menurun.'),
('G40', 'malai dan buah padi dipenuhi spora'),
('G41', 'Daunnya sempit, pendek, kaku, hijau pucat dan kadang-kadang mempunyai bercak seperti karat. '),
('G42', ' Tanaman masih dapat membantuk malai tetapi jumlah biji sangat sedikit dan berukuran kecil '),
('G43', 'terdapat garis garis klorotik/kuning pada daun.  Pada beberapa kasus helaian daun menjadi putih'),
('G44', 'pada daun terjadi bercak oval 3-10 mm'),
('G45', 'bulir yang terinfeksi berbercak coklat dengan tepi lebih gelap'),
('G46', 'symptoms tidak akan tampak sampai fase bunting'),
('G47', 'biji-biji hampa terekat satu sama lain, tegak,kaku seperti mumi'),
('G48', 'muncul sebagai lesi atau bintik-bintik putih ke abu-abu, dengan batas hijau gelap. Lesi yang lebih t'),
('G49', 'tanaman menjadi kerdil atau kecil, malai yang dihasilkan berkurang dan daun berubah menjadi kuning s'),
('G50', 'pucuk batang padi menjadi kering kekuningan serta mudah dicabut.');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('1', 'Willy Arisky', 'admin@test.app', NULL, '$2y$10$1S3AIJdk8/d9T5sPA9PlJuzh6HZkirNz0gyhqtT3z4lmTKhyPd54.', NULL, '2020-01-05 03:39:09', '2020-01-05 03:39:09');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;