<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Symptom extends Model
{
    protected $primaryKey = 'code';
    public $incrementing = false;
}
