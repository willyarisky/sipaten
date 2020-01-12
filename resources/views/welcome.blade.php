@extends('layouts.default')

@section('content')
<main class="py-4">
    <div class="container mt-md-5">
        <div class="d-flex justify-content-start mb-2 align-items-center">
            <h3>SiPaten</h3>
            <span class="text-muted h5 ml-2">Sistem Pakar Pertanian</span>
        </div>
        <div class="row">
            <div class="col-md-6">
                <form id="analyze" class="bg-white py-3 px-4 border rounded shadow">
                    @csrf
                    <div class="form-group">
                        <label class="font-weight-bold">Pilih gejala yang terdapat pada padi:</label>
                        <select class="symptoms form-control form-control-lg" id="symptoms" name="symptoms[]" multiple="multiple" required>
                        @foreach ($symptoms as $symptom)
                            <option value="{{ $symptom->code }}">{{ $symptom->code }} - {{ $symptom->name }}</option>
                        @endforeach
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn-analyze">ANALISA PENYAKIT</button>
                </form>
            </div>
            <div class="col-md-6 col-12 mt-md-0 mt-3">
                <h4 class="pb-2 border-bottom">Hasil Analisa</h4>
                <div id="results"></div>
            </div>
        </div>
    </div>
</main>
@endsection