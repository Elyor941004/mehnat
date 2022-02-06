<?php

namespace App\Http\Requests;

use App\Models\Company;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\DB;

class UpdateEmployeeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'passport'=>'required',
            'surname'=>'required|string',
            'name'=>'required|string',
            'patronymic'=>'required|string',
            'position'=>'required|string',
            'phone'=>'required|string',
            'adress'=>'required|string',
            'company_id'=>'required|integer'
        ];
    }
    public function messages()
    {
        return[
            'passport.required'=>'Пасспорт серия имя надо заполнит',
            'surname.required'=>'Фамилия компанию надо заполнит',
            'name.required'=>'Имя надо заполнит',
            'patronymic.required'=>'Отчество надо заполнит',
            'position.required'=>'Должность надо заполнит',
            'phone.required'=>'Телефон номер надо заполнит',
            'adress.required'=>'Адресс надо заполнит',
            'company_id.required'=>'Компания надо вибрат'
        ];
    }
}
