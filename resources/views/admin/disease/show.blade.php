@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="mb-0">{{ $disease->name }} <span class="text-muted">{{ $disease->code }}</span></h4>
                    <a href="{{ route('admin.dashboard') }}" class="btn btn-sm btn-primary">Back</a>
                </div>
                <div class="card-body">
                    <label class="text-muted font-weight-bold">Solution:</label>
                    <p class="mb-0">
                        {{ $disease->solutions()->first()->solutions }}
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <h4 class="mb-0">Symptoms</h4>
                    <a href="" class="btn btn-sm btn-primary">+ Add Symptom</a>
                </div>
                <div class="card-body p-0">
                    <table class="table mb-0">
                        <tbody>
                            @foreach ($disease->symptoms as $symptom)
                            <tr>
                                <th class="text-muted">{{ $symptom->code }}</th>
                                <td>{{ $symptom->name }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection