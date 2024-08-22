<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Menu;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Response;
use App\Http\Resources\MenuCollection;

class MenuController extends Controller
{
    public function test()
    {
        try {
            $data = ['test_api' => 'dummy data'];
            Log::info('test API called successfully', ['data' => $data]);
            return response()->json($data, Response::HTTP_OK);
        } catch (\Exception $e) {
            Log::error('Error in test API', ['error' => $e]);
            return response()->json(['error' => $e], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function testWithData()
    {
        try {
            $data = Menu::get();
            Log::info('testWithData API called successfully', ['data' => $data]);
            return response()->json(new MenuCollection($data), Response::HTTP_OK);
        } catch (\Exception $e) {
            Log::error('Error in testWithData API', ['error' => $e]);
            return response()->json(['error' => $e], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
