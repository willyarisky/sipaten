<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Disease extends Model
{
    protected $primaryKey = 'code';
    public $incrementing = false;
    
    /**
     * Get Symptoms
     */
    public function symptoms()
    {
        return $this->belongsToMany('App\Symptom', 'mapping_symptoms', 'code_diseases', 'code_symptoms' );
    }

    /**
     * Get solutions
     */
    public function solutions()
    {
        return $this->belongsToMany('App\Solution', 'mapping_solutions', 'code_diseases', 'code_solutions' );
    }

    /**
     * Get solution
     */
    public function solution()
    {
        return $this->solutions()->first();
    }

    /**
     * Calculate the probability
     */
    public static function probability() {
        $disease = self::count();

        return (1 / $disease);
    }

    /**
     * Get by code
     */
    public static function byCode($code) {
        return self::where('code', $code)->first();
    }

    /**
     * Get probability
     * @param array $symptomps
     * @param string $disease
     * @return array $probability
     */
    public static function getProbability($disease, $symptoms) {
        $probability = [];

        foreach ($symptoms as $key => $value) {
            $check = DB::select(
                "SELECT * FROM symptoms a
                LEFT JOIN mapping_symptoms b ON a.`code` = b.code_symptoms
                WHERE b.code_diseases = ? AND b.code_symptoms = ?",
                [$disease, $value]
            );

            if (!empty($check)) {
                $probability[$value] = Symptom::probability();
            } else {
                $probability[$value] = 0;
            }
        }

        return $probability;
    }

    /**
     * Get all probabilities
     * @param array $symptomps
     * @param array $request
     * @return array $probability
     */
    public static function getProbabilities($disease, $request)
    {
        foreach ($disease as $key => $value) {
            $probabilities[$value] = self::getProbability($value, $request->symptoms);
        }

        return $probabilities;
    }

    /**
     * Bayes of symptom
     */
    public static function bayes($symptomp, $symptomp_value) 
    {
        $diseases = self::get()->pluck("code");

        $first_num  = $symptomp_value * self::probability();

        $tmp = DB::select(
            "SELECT * FROM diseases a 
            LEFT JOIN mapping_symptoms b ON a.`code` = b.code_diseases
            WHERE b.code_symptoms = ?",
            [$symptomp]
        );
        
        $second_num = (($symptomp_value  * self::probability()) * count($tmp));
        
        if ($second_num > 0) {
            return $first_num / $second_num;
        } else {
            return 0;
        }
    }

    /**
     * Get all bayes
     */
    public static function getBayes($probabilities, $diseases)
    {
        // get bayes numbers
        foreach ($probabilities as $diseases => $symptoms) {
            foreach ($symptoms as $symptom => $symptom_probabilty) {
                $bayes[$diseases][$symptom] = Disease::bayes($symptom, $symptom_probabilty);
            }
        }

        return $bayes;
    }
}
