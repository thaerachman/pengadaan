CREATE TABLE `tbl_admin` (
  `id_admin` INT(11) NOT NULL,
  `nama` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `alamat` TEXT NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `status` INT(11) NOT NULL ,
  `token` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL  ,
  `updated_at` TIMESTAMP NOT NULL ,
  ) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `nama`, `email`, `alamat`, `password`, `status`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Admin123', 'admin@gmail.com', 'Jl. Alamat', 'eyJpdiI6Im8yUWQxeUk1UkFlU2oxb21OcWpHQ3c9PSIsInZhbHVlIjoiTjNvcmNHdUJVRUs4cmxnVE5nSWdQUT09IiwibWFjIjoiZDc4YmIwNjE1Yzg0OWUyNjlmYTcxYjcyZTQ1YmY4ODgzMmM4ZDg0MzgyNzExNjljOTdlMWI2MmI4YjlkODkwZCJ9', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9hZG1pbiI6MX0.HfAyhivE5rM4EWlCHN8wJCfbafkq9Tnia1YYZE2DalU', '2021-08-01 20:40:50', '2021-08-22 07:39:42'),
(2, 'agus2', 'agus@gmail.com', 'jl. karawang', 'eyJpdiI6IktJUlArS2dQM2hScUwzWk9iNkNJQ2c9PSIsInZhbHVlIjoiOEZMcXl1Z1ljUDNnZ1I1TzRLeEREUT09IiwibWFjIjoiZjg5MzQ0NDAzMjNkYWIzMjUwYTExM2FjNzJjMDYxMzdmODdkMTQ1MmY4YjM4ZTM5OWYxOTMwZjM3YzRlOTFhZCJ9', 1, 'keluar', '2021-08-03 20:23:50', '2021-08-08 20:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_laporan`
--

CREATE TABLE `tbl_laporan` (
  `id_laporan` INT(11) NOT NULL,
  `id_pengajuan` INT(11) NOT NULL,
  `id_suplier` INT(11) NOT NULL,
  `laporan` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL  ,
  `updated_at` TIMESTAMP NOT NULL  
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_laporan`
--

INSERT INTO `tbl_laporan` (`id_laporan`, `id_pengajuan`, `id_suplier`, `laporan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'public/proposal/zTrt9gMPaRaOsLYyOq6Bz966dbk5Q6v8geeKmmGO.pdf', '2021-08-11 10:32:38', '2021-08-11 10:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengadaan`
--

CREATE TABLE `tbl_pengadaan` (
  `id_pengadaan` INT(11) NOT NULL,
  `nama_pengadaan` VARCHAR(100) NOT NULL,
  `deskripsi` TEXT NOT NULL,
  `gambar` TEXT NOT NULL,
  `anggaran` DOUBLE NOT NULL,
  `status` INT(11) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL  ,
  `updated_at` TIMESTAMP NOT NULL  
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pengadaan`
--

INSERT INTO `tbl_pengadaan` (`id_pengadaan`, `nama_pengadaan`, `deskripsi`, `gambar`, `anggaran`, `status`, `created_at`, `updated_at`) VALUES
(4, 'kardus coklat', 'kardus', 'public/gambar/cT6z0Ip1HsHg9FKJeMRrss8UpQvalUrzNX3CzjK4.jpg', 500000, 1, '2021-08-08 08:21:12', '2021-08-09 06:41:14'),
(5, 'kardus1', 'https://cf.shopee.co.id/file/874fd474b43fec1467faf4aef70bc149', 'public/gambar/SXBYR1rxOzrePcdk9svxPxlA7WpAM0zVGHZ8bHbO.jpg', 500000, 1, '2021-08-08 08:23:31', '2021-08-09 01:18:44'),
(6, 'kursi', 'https://www.monotaro.id/s024060301.html?gclid=CjwKCAjwpMOIBhBAEiwAy5M6YMRyj8sh1-geOZf1y_MMxBQwKfn4tzy93otW4Jgb7uaMTtcs1JOaXxoCxGsQAvD_BwE', 'public/gambar/dp7wJVaCpP7dZyey2vG98wMblKilskdGBIEIdHOm.jpg', 500000, 1, '2021-08-09 06:57:26', '2021-08-09 06:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan`
--

CREATE TABLE `tbl_pengajuan` (
  `id_pengajuan` INT(11) NOT NULL,
  `id_suplier` INT(11) NOT NULL,
  `id_pengadaan` INT(11) NOT NULL,
  `anggaran` DOUBLE NOT NULL,
  `proposal` TEXT NOT NULL,
  `status` INT(11) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL  ,
  `updated_at` TIMESTAMP NOT NULL  
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pengajuan`
--

INSERT INTO `tbl_pengajuan` (`id_pengajuan`, `id_suplier`, `id_pengadaan`, `anggaran`, `proposal`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 400000, 'public/proposal/qyuskpKLVO7BxuX7HmkWriazz0Cjk1CZOPlGdNnc.pdf', 3, '2021-08-11 01:27:38', '2021-08-11 20:48:05'),
(2, 1, 6, 500000, 'public/proposal/whVxgrZuXWhCghypFQnzaCrAQSXBO34o07jtkOBf.pdf', 2, '2021-08-11 09:58:25', '2021-08-11 09:58:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suplier`
--

CREATE TABLE `tbl_suplier` (
  `id_suplier` INT(11) NOT NULL,
  `nama_usaha` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `alamat` TEXT NOT NULL,
  `no_npwp` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `status` INT(11) DEFAULT 0,
  `token` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL  ,
  `updated_at` TIMESTAMP NULL  
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_suplier`
--

INSERT INTO `tbl_suplier` (`id_suplier`, `nama_usaha`, `email`, `alamat`, `no_npwp`, `password`, `status`, `token`, `created_at`, `updated_at`) VALUES
(1, 'tes', 'tes@gmail.com', 'asd', '123', 'eyJpdiI6ImU3bGw4WG5Rdkw3MGxzdmhIQzdXTGc9PSIsInZhbHVlIjoiN2M1enZIditTRmwwZVVGXC9PY05FZkE9PSIsIm1hYyI6IjcxMjYyMzBkOWZjMTJmMjY0MDE1MzhkZmY5OTczNTY1OWI2NTA5ZmYyNWM3MzI4YTk3YjM0OTc0ZmU3NmNlNGYifQ==', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9zdXBsaWVyIjoxfQ.mYxG37-1tYqqBGQ3MD6e6ro6XgEgrQMJHikgtEouKW4', '2021-07-27 20:36:03', '2021-08-20 09:35:55'),
(2, 'tes1', 'tes1@gmail.com', 'jakarta', '9898', 'eyJpdiI6Im1HMVhPUnptVTk0bDVPTFczdys3dWc9PSIsInZhbHVlIjoiQzFZSjdKUWdUQkpkVHJYeEsrOHZ2dz09IiwibWFjIjoiYmRkNTE2OWNhMDk0ZjljYjA3YmJjYTlhNDgzMDRkYjk3NWRjMTExODJiNzc0ZWExZmM2NjRhMTExMmZkNGQ3MSJ9', 1, 'keluar', '2021-07-28 08:47:40', '2021-08-18 15:58:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `tbl_pengadaan`
--
ALTER TABLE `tbl_pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`);

--
-- Indexes for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indexes for table `tbl_suplier`
--
ALTER TABLE `tbl_suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  MODIFY `id_laporan` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_pengadaan`
--
ALTER TABLE `tbl_pengadaan`
  MODIFY `id_pengadaan` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  MODIFY `id_pengajuan` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_suplier`
--
ALTER TABLE `tbl_suplier`
  MODIFY `id_suplier` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;