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

    public static function probability() {
        $disease = self::count();

        return (1 / $disease);
    }

    /**
     * Get probability
     */
    public static function getProbability($disease, $symptoms) {
        $probability = [];

        foreach ($symptoms as $key => $value) {
            $chek = DB::select(
                "SELECT * FROM symptoms a
                LEFT JOIN mapping_symptoms b ON a.`code` = b.code_symptoms
                WHERE b.code_diseases = ? AND b.code_symptoms = ?",
                [$disease, $value]
            );

            if (! empty($chek)) {
                $probability[$value] = 0.5;
            } else {
                $probability[$value] = 0;
            }
        }

        return $probability;
    } 

    /**
     * Get bayes
     */
    public static function getBayes($symptomp, $symptomp_value) {
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
}
