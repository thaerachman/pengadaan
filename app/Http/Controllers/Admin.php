<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


//import lib session
use Illuminate\Support\Facades\Session;

//import lib JWT
use \Firebase\JWT\JWT;

//import lib Response
use Illuminate\Response;

//import lib validasi
use Illuminate\Support\Facades\Validator;

//import fungsi encrypt
use Illuminate\Contracts\Encryption\DecryptException;

//import model admin
use App\M_Admin;

class Admin extends Controller
{
    //
    public function index(){
    	return view('admin.login');
    }



    public function loginAdmin(Request $request){
$this->validate($request,
    		[
    			'email' => 'required',
    			'password' => 'required'
    		]
    	);

$cek = M_Admin::where('email',$request->email)->count();
$adm = M_Admin::where('email',$request->email)->get();

if($cek > 0){
	foreach ($adm as $ad) {
		if(decrypt($ad->password) == $request->password){
			$key = env ('APP_KEY');
			$data = array(
				"id_admin" => $ad->id_admin,
			);

			$jwt = JWT::encode($data,$key);

			M_Admin::where('id_admin',$ad->id_admin)->update([
				"token" =>$jwt,
			]);
			Session::put('token',$jwt);

		//	echo "kamu berhasil login";
			return redirect('/pengajuan')->with('berhasil',"Selamat Datang Kembali");
		}else{
			return redirect('/masukAdmin')->with('gagal','Password anda salah');
		}
	}
}else{
	return redirect('/masukAdmin')->with('gagal','email tidak terdaftar');
    }
}

public function keluarAdmin(){
	$token = Session::get('token');
	if(M_Admin::where('token',$token)->update(
		[
			'token' => 'keluar',
		]
	)){
		Session::put('token',"");
		return redirect('/masukAdmin')->with('gagal','Anda Sudah Logout, silahkan login kembali');
	}else{

		}
	}

			public function listAdmin(){
			//validasi token
			$token = Session::get('token');

			//variable pembanding token
			$tokenDb = M_Admin::where('token',$token)->count();

			if($tokenDb > 0){
				$data['adm'] = M_Admin::where('token',$token)->first();
				$data['admin'] = M_Admin::where('status','1')->paginate(15);
				//print_r($data);
				return view('admin.list',$data);

			}else{
				return redirect('/masukAdmin')->with('gagal','Anda sudah logout, silahkan login Kembali');
			}
}

	public function tambahAdmin(request $request)
	{
		$this->validate($request,
    		[
    			'nama' => 'required',
    			'email' => 'required',
    			'alamat' => 'required',
    			'password' => 'required'
    		]
    	);

		$token = Session::get('token');
		$tokenDb = M_Admin::where('token',$token)->count();
		if($tokenDb > 0) {
			if(M_Admin::create([
    		"nama" => $request->nama,
    		"email" => $request->email,
    		"alamat" => $request->alamat,
    		"password" =>encrypt($request->password)	
    	]
    	)){
    		return redirect('/listAdmin')->with('berhasil','Data berhasil disimpan');
    	}else{
    		return redirect('/listAdmin')->with('gagal','Data gagal disimpan');

    	}

		}else{
		return redirect('/masukAdmin')->with('gagal','Anda sudah logout, silahkan login Kembali');
		}

    	
	}

	public function ubahAdmin(request $request)
	{
		$this->validate($request,
    		[
    			'u_nama' => 'required',
    			'u_email' => 'required',
    			'u_alamat' => 'required',
    			
    		]
    	);

		$token = Session::get('token');
		$tokenDb = M_Admin::where('token',$token)->count();
		if($tokenDb > 0) {
			if(M_Admin::where("id_admin",$request->id_admin)->update([
    		"nama" => $request->u_nama,
    		"email" => $request->u_email,
    		"alamat" => $request->u_alamat,	
    	]
    	)){
    		return redirect('/listAdmin')->with('berhasil','Data berhasil disimpan');
    	}else{
    		return redirect('/listAdmin')->with('gagal','Data gagal disimpan');

    	}

		}else{
		return redirect('/masukAdmin')->with('gagal','Anda sudah logout, silahkan login Kembali');
		}

    	
	}

	public function hapusAdmin($id)
	{
		// $this->validate($request,
  //   		[
  //   			'u_nama' => 'required',
  //   			'u_email' => 'required',
  //   			'u_alamat' => 'required',
    			
  //   		]
  //   	);

		$token = Session::get('token');
		$tokenDb = M_Admin::where('token',$token)->count();
		if($tokenDb > 0) {
			if(M_Admin::where("id_admin",$id)->delete()){
    		return redirect('/listAdmin')->with('berhasil','Data berhasil dihapus');
    	}else{
    		return redirect('/listAdmin')->with('gagal','Data gagal dihapus');

    	}

		}else{
		return redirect('/masukAdmin')->with('gagal','Anda sudah logout, silahkan login Kembali');
		}

    	
	}

	public function ubahPassword(Request $request){
        $token = Session::get('token');
        $tokenDb = M_Admin::where('token',$token)->count();

        if($tokenDb > 0){
            $key = env('APP_KEY');
            $sup = M_Admin::where('token',$token)->first();

        $decode = JWT::decode($token,$key, array('HS256'));
        $decode_array = (array) $decode;

        if(decrypt($sup->password) == $request->passwordlama){
            if(M_Admin::where('id_admin',$decode_array['id_admin'])->update(
                    [
                        "password" => encrypt($request->password)
                    ]
                )){
                    return redirect('/masukAdmin')->with('gagal','Password Berhasil diupdate');
                }else{
                return redirect('/pengajuan')->with('gagal','Password Gagal diupdate');    
                }

        }else{
             return redirect('/pengajuan')->with('gagal','Password Gagal diupdate, Password lama tidak sama');
        }

                
            }else{
                return redirect('/masukAdmin')->with('gagal','Anda sudah logout, silahkan login Kembali ');
            }
    }
}
