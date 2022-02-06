<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\EmployeeRequest;
use App\Http\Requests\UpdateEmployeeRequest;
use App\Models\Employee;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $model = Employee::all();
        return response($model, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
//
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EmployeeRequest $request)
    {
        $models = DB::table('company')->select('id')->get();
        foreach ($models as $model) {
            $company_id[]=$model->id;
        }
        $model = new Employee();
        $model->passport = $request->passport;
        $model->surname = $request->surname;
        $model->name = $request->name;
        $model->patronymic = $request->patronymic;
        $model->position = $request->position;
        $model->phone = $request->phone;
        $model->adress = $request->adress;
        if (in_array($request->company_id, $company_id)) {
            $model->company_id = $request->company_id;
            $model->save();
        }else{
            return response('Компания не сушествует');
        }
        $basket = [
            'passport' => $request->passport,
            'surname' => $request->surname,
            'name' => $request->name,
            'patronymic' => $request->patronymic,
            'position' => $request->position,
            'phone' => $request->phone,
            'adress' => $request->adress,
            'company_id' => $request->company_id
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
        $model = Employee::find($id);
        return response($model, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateEmployeeRequest $request, $id)
    {
        $models = DB::table('Company')->select('id')->get();
        foreach ($models as $model){
            $company_id[]=$model->id;
        }
        $model = Employee::find($id);
        $model->passport = $request->passport;
        $model->surname = $request->surname;
        $model->name = $request->name;
        $model->patronymic = $request->patronymic;
        $model->position = $request->position;
        $model->phone = $request->phone;
        $model->adress = $request->adress;
        if (in_array($request->company_id, $company_id)) {
            $model->company_id = $request->company_id;
            $model->save();
        }else{
            return response('Компания не сушествует');
        }
        $basket = [
            'passport' => $request->passport,
            'surname' => $request->surname,
            'name' => $request->name,
            'patronymic' => $request->patronymic,
            'position' => $request->position,
            'phone' => $request->phone,
            'adress' => $request->adress,
            'company' => $request->company_id
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
        $model = Employee::find($id);
        $model->delete();
        return response($model, 200);
    }
}
