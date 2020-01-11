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
}
