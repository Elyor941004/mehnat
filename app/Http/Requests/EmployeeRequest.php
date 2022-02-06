<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmployeeRequest extends FormRequest
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
        $id = $this->route('employer');
        return [
            'passport'=>'required|unique:employee,passport,'.$id,
            'surname'=>'required|string',
            'name'=>'required|string',
            'patronymic'=>'required|string',
            'position'=>'required|string',
            'phone'=>'required|string',
            'adress'=>'required|string',
        ];
    }
    public function messages()
    {
        return[
            'passport.required'=>'Пасспорт серия имя надо заполнит',
            'passport.unique'=>'Пасспорт серия уже есть ',
            'surname.required'=>'Фамилия компанию надо заполнит',
            'name.required'=>'Имя надо заполнит',
            'patronymic.required'=>'Отчество надо заполнит',
            'position.required'=>'Должность надо заполнит',
            'phone.required'=>'Телефон номер надо заполнит',
            'adress.required'=>'Адресс надо заполнит',
        ];
    }
}
