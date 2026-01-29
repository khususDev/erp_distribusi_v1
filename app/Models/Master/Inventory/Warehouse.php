<?php

namespace App\Models\Master\Inventory;

use App\Models\Master\Organization\Location;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    use HasFactory;

    public function location()
    {
        return $this->belongsTo(Location::class);
    }

    public function storageLocations()
    {
        return $this->hasMany(Storage::class);
    }
}
