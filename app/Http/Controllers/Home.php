<?php
// Nama file Controller diawali huruf kapital
namespace App\Http\Controllers;

use Illuminate\Http\Request;

//import lib session
use Illuminate\Support\Facades\Session;

// import model suplier
use App\M_Suplier;

// import model pengadaan
use App\M_Pengadaan;

class Home extends Controller
{
    // function index
    public function index (){

        $key = env('APP_KEY');

    	$token = Session::get('token');

    	$tokenDb = M_Suplier::where('token',$token)->count();

    	if($tokenDb > 0 ){
    		$data['token']=$token;
    	}else{
    		$data['token'] = "kosong";
    	}

        $data['pengadaan'] = M_Pengadaan::where('status','1')->paginate(15);


    	//menampilkan kalimat didalam tanda petik
    	//echo "fungsi index Home";

    	//memanggil view didalam root folder view
    	//return view('home');

    	//memanggil view didalam subfolder view
    	return view('utama.home',$data); //memanggil view didalam subfolder view
    }
}
