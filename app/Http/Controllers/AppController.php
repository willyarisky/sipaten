<?php

namespace App\Http\Controllers;

use App\Symptom;
use Illuminate\Http\Request;

class AppController extends Controller
{
    /**
     * Show the index of app
     */
    public function index()
    {
        $symptoms = Symptom::get();
        
        return view('welcome', compact('symptoms'));
    }
}
