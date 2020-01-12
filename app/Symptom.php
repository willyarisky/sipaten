<?php

namespace App;

use App\Disease;
use Illuminate\Database\Eloquent\Model;

class Symptom extends Model
{
    protected $primaryKey = 'code';
    public $incrementing = false;

    public static function probability() {
        $symptom = self::count();
        $disease = Disease::count();

        return $disease / $symptom;
    }

    /**
     * Get Diseases
     */
    public function diseases()
    {
        return $this->belongsToMany('App\Disease', 'mapping_symptoms', 'code_symptoms', 'code_diseases' );
    }
}
