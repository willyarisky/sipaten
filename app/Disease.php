<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

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
}
