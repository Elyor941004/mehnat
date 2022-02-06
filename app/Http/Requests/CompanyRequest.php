<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CompanyRequest extends FormRequest
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
            'name'=>'required|string',
            'leader'=>'required|string',
            'adress'=>'required|string',
            'email'=>'required|string|unique:Company,email',
            'website'=>'required|string',
            'phone'=>'required|string'
        ];
    }
    public function messages()
    {
        return[
        'name.required'=>'Компания имя надо заполнит',
        'leader.required'=>'директор компанию надо заполнит',
        'adress.required'=>'Компания адресь надо заполнит',
        'email.required'=>'емаил компанию надо заполнит',
        'website.required'=>'Компания вебсайт надо заполнит',
        'phone.required'=>'Компания телефон номер надо заполнит',
        'email.unique'=>'Компания емаил уже есть надо другой емаил',
            ];
    }
}
