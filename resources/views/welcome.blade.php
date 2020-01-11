@extends('layouts.default')

@section('content')
<main class="py-4">
    <div class="col-md-8 col-12 mx-auto mt-md-5">
        <h1 class="text-center">SiPaten</h1>
        <form id="diagnose">
            @csrf
            <div class="form-group">
                <h5>Pilih gejala yang terdapat pada padi:</h5>
                <select class="diseases form-control form-control-lg" id="symptoms" name="symptoms[]" multiple="multiple">
                @foreach ($symptoms as $symptom)
                    <option value="{{ $symptom->code }}">{{ $symptom->code }} - {{ $symptom->name }}</option>
                @endforeach
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn-analyze">ANALYZE</button>
        </form>
    </div>
</main>
@endsection
@section('script')
<script>
    $('#diagnose').submit(function(e) {
        e.preventDefault();

        $.ajax({
            url: '/analyze',
            type: 'POST',
            dataType: 'json',
            data: $(this).serialize(),
            beforeSend: function() {
                $('#btn-analyze').prop('disabled', true);
            }
        })
        .done(function() {
            console.log("success");
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            $('#btn-analyze').prop('disabled', false);
        });
    });
</script>
@endsection