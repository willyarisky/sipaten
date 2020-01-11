<?php

namespace App\Http\Controllers;

use App\Symptom;
use App\Disease;
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

    /**
     * Analyze the disease from given symptoms
     * @param array $request
     * @return array $result_bayes
     */
    public function analyze(Request $request) {
        // get diseases from selected symptoms
        $diseases = Disease::whereHas('symptoms', function($query) use ($request) {
                        $query->whereIn("code_symptoms", $request->symptoms);
                    })->pluck("code");

        // Get disease probabilities according to given data of symptoms
        $probabilities = Disease::getProbabilities($diseases, $request);

        // get all bayes according to data probabilities and diseases of data
        $bayes = Disease::getBayes($probabilities, $diseases);

        // get total bayes
        foreach ($bayes as $diseases => $symptoms_cal) {
            $disease = Disease::byCode($diseases);

            $data[] = [
                'code' => $disease->code,
                'name' => $disease->name,
                'solution' => $disease->solutions()->first(),
                'bayes' => array_sum($symptoms_cal) * 100
            ];
        }

        // sort the data from highest to lowest
        usort($data, function($a, $b) {
            return $a['bayes'] < $b['bayes'];
        });

        return $data;
    }
}
