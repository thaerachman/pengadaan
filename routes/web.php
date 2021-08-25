<?php

// Route::get('/', function () {
//    return view('welcome');
//});

//route index
Route::get('/','Home@index');

// route registrasi
Route::get('/registrasi','Registrasi@index');

//route simpan data regis
Route::post('/regis','Registrasi@regis');

//route halaman login sup
Route::get('/login','Suplier@login');

//route halaman login sup
Route::post('/masukSuplier','Suplier@masukSuplier');

//route halaman logout sup
Route::get('/suplierKeluar','Suplier@suplierKeluar');

//route halaman Masuk admin
Route::get('/masukAdmin','Admin@index');

//route generate admin awal saat develop
//Route::get('/adminGenerate','Admin@adminGenerate');

//route halaman login admin
Route::post('/loginAdmin','Admin@loginAdmin');

//route halaman login admin
Route::get('/pengajuan','Pengajuan@pengajuan');

//route logout admin
Route::get('/keluarAdmin','Admin@keluarAdmin');

//route listadmin
Route::get('/listAdmin','Admin@listAdmin');

//route tambah admin
Route::post('/tambahAdmin','Admin@tambahAdmin');

//route tambah admin
 Route::post('/ubahAdmin','Admin@ubahAdmin');

//route hapus admin
Route::get('/hapusAdmin/{id}','Admin@hapusAdmin');

ROute::get('/listPengadaan','Pengadaan@index');

Route::post('/tambahPengadaan','Pengadaan@tambahPengadaan');

Route::get('/hapusGambar/{id}','Pengadaan@hapusGambar');

Route::post('/uploadGambar','Pengadaan@uploadGambar');

Route::get('/hapusPengadaan/{id}','Pengadaan@hapusPengadaan');
Route::post('/ubahPengadaan','Pengadaan@ubahPengadaan');

Route::get('/listSuplier','Pengadaan@listSuplier');

Route::post('/tambahPengajuan','Pengajuan@tambahPengajuan');

Route::post('/uploadGambar','Pengadaan@uploadGambar');

Route::get('/terimaPengajuan/{id}','Pengajuan@terimaPengajuan');
Route::get('/tolakPengajuan/{id}','Pengajuan@tolakPengajuan');
Route::get('/riwayatku','Pengajuan@riwayatku');

Route::post('/tambahLaporan','Pengajuan@tambahLaporan');
Route::get('/laporan','Pengajuan@laporan');

Route::get('/selesaiPengajuan/{id}','Pengajuan@selesaiPengajuan');

Route::get('/pengajuanselesai','Pengajuan@pengajuanselesai');

Route::get('/tolakLaporan/{id}','Pengajuan@tolakLaporan');


Route::get('/listSup','Suplier@listSup');

Route::get('/nonAktif/{id}','Suplier@nonAktif');
Route::get('/aktif/{id}','Suplier@aktif');

Route::post('/ubahPasswordSup','Suplier@ubahPassword');
Route::post('/ubahPasswordAdm','Admin@ubahPassword');