@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card">
        <div class="card-header">Diseases</div>

        <div class="card-body p-0">
            <table class="table mb-0">
                <thead class="thead-light">
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Symptoms</th>
                        <th>Solutions</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $disease)
                        <tr>
                            <td>{{ $disease->code }}</td>
                            <td>{{ $disease->name }}</td>
                            <td>{{ $disease->symptoms()->get()->count() }}</td>
                            <td>{{ $disease->solutions()->get()->count() }}</td>
                            <td></td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="mt-2 d-flex justify-content-end">
        {{ $data->links() }}
    </div>
</div>
@endsection