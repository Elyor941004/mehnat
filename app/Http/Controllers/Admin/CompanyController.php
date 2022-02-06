<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CompanyRequest;
use App\Http\Requests\UpdateCompanyRequest;
use App\Models\Company;
use Illuminate\Support\Facades\DB;

class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $model = Company::all();
        return response($model, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        return view('Admin.Company.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CompanyRequest $request)
    {
        $model = new Company();
        $model->name = $request->name;
        $model->leader = $request->leader;
        $model->adress = $request->adress;
        $model->email = $request->email;
        $model->website = $request->website;
        $model->phone = $request->phone;
        $model->save();
        $basket = [
        'name' => $request->name,
        'leader' => $request->leader,
        'adress' => $request->adress,
        'email' => $request->email,
        'website' => $request->website,
        'phone' => $request->phone
        ];
        return response($basket, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $model = Company::find($id);
        $response = [$model->name, $model];
        return response($response, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('Admin.Company.update');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCompanyRequest $request, $id)
    {
        $model = Company::find($id);
        $model->name = $request->name;
        $model->leader = $request->leader;
        $model->adress = $request->adress;
        $model->email = $request->email;
        $model->website = $request->website;
        $model->phone = $request->phone;
        $model->save();
        $basket = [
            'name' => $request->name,
            'leader' => $request->leader,
            'adress' => $request->adress,
            'email' => $request->email,
            'website' => $request->website,
            'phone' => $request->phone
        ];
        return response($basket, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $model = Company::find($id);
        $model->delete();
        return response($model, 200);
    }
}
