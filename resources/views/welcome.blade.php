@extends('layouts.default')

@section('content')
<main class="py-4">
    <div class="col-md-8 col-12 mx-auto mt-md-5">
        <h1 class="text-center">SiPaten</h1>
        <form id="diagnose">
            <div class="form-group">
                <h5>Pilih gejala yang terdapat pada padi:</h5>
                <select class="diseases form-control form-control-lg" id="symptoms" name="diseases[]" multiple="multiple">
                @foreach ($symptoms as $symptom)
                    <option value="{{ $symptom->code }}">{{ $symptom->name }}</option>
                @endforeach
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-block">ANALYZE</button>
        </form>
    </div>
</main>
@endsection
