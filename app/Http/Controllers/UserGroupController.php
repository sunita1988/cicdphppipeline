<?php

// app/Http/Controllers/UserGroupController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserGroup;
use Exception;

class UserGroupController extends Controller
{
    public function index()
    {
        try {
            $userGroups = UserGroup::all();

            if ($userGroups->isEmpty()) {
                return response()->json(['message' => 'No user groups found'], 404);
            }

            return response()->json($userGroups);
        } catch (Exception $e) {
            return response()->json(['error' => 'Failed to retrieve user groups', 'details' => $e->getMessage()], 500);
        }
    }
}

