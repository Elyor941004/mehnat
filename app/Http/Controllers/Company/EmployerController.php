<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Http\Requests\EmployeeRequest;
use App\Models\Employee;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class EmployerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $model = Employee::where('company_id', Auth::user()->company_id)->get();
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
        $model = new Employee();
        $model->passport = $request->passport;
        $model->surname = $request->surname;
        $model->name = $request->name;
        $model->patronymic = $request->patronymic;
        $model->position = $request->position;
        $model->phone = $request->phone;
        $model->adress = $request->adress;
        $model->company_id = Auth::user()->company_id;
        $model->save();
        $basket = [
            'passport' => $request->passport,
            'surname' => $request->surname,
            'name' => $request->name,
            'patronymic' => $request->patronymic,
            'position' => $request->position,
            'phone' => $request->phone,
            'adress' => $request->adress,
            'company_id' => Auth::user()->company_id
        ];
        return response($model, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $model = Employee::where(['company_id'=> Auth::user()->company_id, 'id'=>$id])->firstOrFail();
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
    public function update(EmployeeRequest $request, $id)
    {
        $model = Employee::where(['company_id'=> Auth::user()->company_id, 'id'=>$id])->firstOrFail();
        $model->passport = $request->passport;
        $model->surname = $request->surname;
        $model->name = $request->name;
        $model->patronymic = $request->patronymic;
        $model->position = $request->position;
        $model->phone = $request->phone;
        $model->adress = $request->adress;
        $model->company_id = Auth::user()->company_id;
        $model->update();
        return response($model, 200);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $model = Employee::where(['company_id'=> Auth::user()->company_id, 'id'=>$id])->firstOrFail();
        $model->delete();
        return response($model, 200);
    }
}
