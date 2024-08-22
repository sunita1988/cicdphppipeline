<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserGroup extends Model
{
    // Specify the table name
    protected $table = 'user_group';

    // Specify the primary key if it's not 'id'
    protected $primaryKey = 'id';

    // Disable timestamps if your table doesn't have created_at and updated_at columns
    public $timestamps = false;

    // Define the fields that can be mass-assigned
    protected $fillable = [
        'user_group_name',
        'active',
    ];
}
