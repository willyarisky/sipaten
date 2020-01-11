<?php

namespace App\Http\Controllers;

use App\Symptom;
use App\Disease;
use Illuminate\Http\Request;
use DB;

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

    public function analyze(Request $request) {
        $disease = Disease::whereHas('symptoms', function($query) use ($request) {
            $query->whereIn("code_symptoms", $request->symptoms);
        })->pluck("code");

        $probability = [];
        foreach ($disease as $key => $value) {
            $probability[$value] = Disease::getProbability($value, $request->symptoms);
        }

        $bayes = [];

        foreach ($probability as $disease => $symptoms) {
            foreach ($symptoms as $symptom => $symptom_probabilty) {
                $bayes[$disease][$symptom] = Disease::getBayes($symptom, $symptom_probabilty);
            }
        }

        foreach ($bayes as $disease => $symptoms) {
            $result_bayes[$disease] = array_sum($symptoms) * 100;
        }

        dd($result_bayes);
    }
}
